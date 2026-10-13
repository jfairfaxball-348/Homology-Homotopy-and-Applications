#!/usr/bin/env python3
"""Construct explicit K2, f2 and integer relative AW certificates. Stdlib only.
Run from any directory; writes sessions/S028/certificates. Checker is separate.
"""
import ast, json, hashlib
from pathlib import Path
from itertools import combinations, permutations
from collections import defaultdict
from fractions import Fraction

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'sessions/S028/certificates'
OUT.mkdir(parents=True,exist_ok=True)
tree=ast.parse((ROOT/'scripts/s020_certificate.py').read_text())
raw=next(ast.literal_eval(s.value) for s in tree.body if isinstance(s,ast.Assign)
         and any(isinstance(v,ast.Name) and v.id=='TETRA' for v in s.targets))
old=sorted(tuple(sorted(t.split())) for t in raw.strip().splitlines())
cut=('a0','a1','b1','c1')
oldc={tuple(e.split()):v for e,v in [('a0 a2',1),('a0 b0',1),('a0 d1',1),
 ('a2 c2',-1),('b0 b1',-1),('b1 c1',1),('b1 d1',1),('c1 c2',-1),
 ('c2 d1',1),('d0 d1',1)]}
def sg(t):return (-1)**sum(t[i]>t[j] for i in range(len(t)) for j in range(i+1,len(t)))
def faces(ts):return {s for t in ts for k in range(1,len(t)+1) for s in combinations(t,k)}
maps=[]
for copy in (0,1):
    rename={v:v+('_L' if copy==0 else '_R') for t in old for v in t}
    for v in cut:rename[v]=v+'_L'
    if copy:rename['a0'],rename['a1']=rename['a1'],rename['a0']
    maps.append(rename)
K=sorted({tuple(sorted(m[v] for v in t)) for m in maps for t in old if t!=cut})
F=sorted(faces(K),key=lambda s:(len(s),s))
assert len(K)==70 and len({v for t in K for v in t})==20
# Transport the old integral primitive, gauge-align it on the gluing facet.
cs=[]
for m in maps:
    cs.append({tuple(sorted(m[v] for v in e)):sg(tuple(m[v] for v in e))*oldc.get(e,0)
               for e in faces(old) if len(e)==2})
shared=sorted(maps[0][v] for v in cut)
pot={v:cs[0].get((shared[0],v),0)-cs[1].get((shared[0],v),0) for v in shared[1:]}
pot[shared[0]]=0
for e in cs[1]:cs[1][e]+=pot.get(e[1],0)-pot.get(e[0],0)
c={}
for cc in cs:
    for e,v in cc.items():
        if e in c:assert c[e]==v
        c[e]=v
def beta(t):
    image=[v[0] for v in t]
    return sg(image) if set(image)==set('abc') else 0
for t in F:
    if len(t)==3:assert c[t[1:]]-c[(t[0],t[2])]+c[t[:2]]==beta(t)
# Coherent orientation determined by triangle incidence, not Hopf additivity.
inc=defaultdict(list)
for i,t in enumerate(K):
    for j in range(4):inc[t[:j]+t[j+1:]].append((i,(-1)**j))
assert all(len(x)==2 for x in inc.values())
ori={0:1};todo=[0]
while todo:
    i=todo.pop();t=K[i]
    for k in range(4):
        for j,s in inc[t[:k]+t[k+1:]]:
            if j==i:continue
            z=-ori[i]*(-1)**k*s
            if j in ori:assert ori[j]==z
            else:ori[j]=z;todo.append(j)
assert len(ori)==70
source_pair=sum(ori[i]*c[t[:2]]*beta(t[1:]) for i,t in enumerate(K))
assert abs(source_pair)==2
# Fix orientation so source Hopf diagnostic is +2. Final cofiber sign separate.
if source_pair<0:ori={i:-v for i,v in ori.items()}
Q=sorted((s for k in (1,2,3) for s in combinations('abcd',k)),key=lambda s:(len(s),s))
ns=len(F);V=[['s',list(s)] for s in F]+[['t',list(s)] for s in Q];N=len(V)
fi={s:i for i,s in enumerate(F)};qi={s:ns+i for i,s in enumerate(Q)}
# Canonical barycentric source fundamental cycle with integer signs.
zsource={}
for i,t in enumerate(K):
    for p in permutations(t):
        chain=tuple(fi[tuple(sorted(p[:k]))] for k in (1,2,3,4))
        zsource[chain]=ori[i]*sg(p)
vertex=F[0][0]
Bplus=faces([t for t in K if vertex in t]);Bminus=faces([t for t in K if vertex not in t])
remaining=set(Bminus);collapses=[]
while len(remaining)>1:
    pair=None
    for s in sorted(remaining,key=lambda s:(-len(s),s)):
        up=[t for t in remaining if len(t)==len(s)+1 and set(s)<set(t)]
        if len(up)==1 and not any(set(up[0])<set(t) for t in remaining):
            pair=(s,up[0]);break
    assert pair is not None
    remaining.difference_update(pair);collapses.append(pair)
(OUT/'ball_collapse.json').write_text(json.dumps(dict(vertex=vertex,pairs=collapses,
    remaining=sorted(remaining)),sort_keys=True,separators=(',',':'))+'\n')
short={(i,j) for i,x in enumerate(F) for j,y in enumerate(F) if i<j and x in Bminus and y in Bminus and set(x)<set(y)}
heights=[int(not(side=='s' and tuple(x) in Bplus)) for side,x in V]
common=dict(facets=K,vertex_map={v:v[0] for t in K for v in t},
 source_primitive=[[list(e),v] for e,v in sorted(c.items()) if v],
 source_fundamental=[[list(K[i]),v] for i,v in sorted(ori.items())],vertices=V,
 short_edges=[list(e) for e in sorted(short)],heights=heights,N=N,
 epsilon_denominator=100*N,gram_formula='G=-J D2 J/2; J=I-11^T/N',
 distance_formula='D2: diagonal0, S=1-1/(100N), M=1, L=1+1/(100N)')
(OUT/'common.json').write_text(json.dumps(common,sort_keys=True,separators=(',',':'))+'\n')
for name in ('f0','f2'):
    def image(x):return ('a',) if name=='f0' else tuple(sorted({v[0] for v in x}))
    upper=[[] for _ in range(N)]
    for i,(side,x) in enumerate(V):
        for j,(tag,y) in enumerate(V):
            if i>=j:continue
            if (side==tag and set(x)<set(y)) or (side=='s' and tag=='t' and set(image(x))<=set(y)):
                upper[i].append(j)
    chains=[[(i,) for i in range(N)]]
    while True:
        nxt=[s+(j,) for s in chains[-1] for j in upper[s[-1]]]
        if not nxt:break
        chains.append(nxt)
    high={(i,j) for i in range(N) for j in upper[i]}
    classes='\n'.join(','.join('0' if i==j else 'S' if (min(i,j),max(i,j)) in short else
                      'M' if (min(i,j),max(i,j)) in high else 'L' for j in range(N)) for i in range(N))+'\n'
    (OUT/(name+'_distance_classes.csv')).write_text(classes)
    # Full rational Gram tables: D2 numerators use denominator100N.
    d=[[0 if i==j else 100*N+(-1 if (min(i,j),max(i,j)) in short else
         0 if (min(i,j),max(i,j)) in high else 1) for j in range(N)] for i in range(N)]
    sums=[sum(row) for row in d];total=sum(sums)
    gram=[[-(N*N*d[i][j]-N*sums[i]-N*sums[j]+total) for j in range(N)] for i in range(N)]
    (OUT/(name+'_gram.json')).write_text(json.dumps(dict(denominator=200*N**3,
         numerators=gram,rank=N-1,
         positive_on_ones_perp_lower=str(Fraction(1,2)-
            Fraction(N-1,200*N))),sort_keys=True,separators=(',',':'))+'\n')
    # Last-vertex pullback of target abc cocycle on sd(Q), compatible with colors.
    def alpha(t):
        vals=[max(image(V[i][1]) if i<ns else V[i][1]) for i in t]
        return sg(vals) if set(vals)==set('abc') else 0
    def primitive(e):
        if e[-1]>=ns or name=='f0':return 0
        vs=tuple(max(V[i][1]) for i in e)
        if vs[0]==vs[1]:return 0
        return sg(vs)*c[tuple(sorted(vs))]
    def w(t):return alpha(t)-primitive(t[1:])+primitive((t[0],t[2]))-primitive(t[:2])
    W={t:w(t) for t in chains[2] if w(t)}
    assert all(sum((-1)**k*W.get(t[:k]+t[k+1:],0) for k in range(4))==0 for t in chains[3])
    assert all(t[-1]>=ns for t in W)
    # Prism id -> jr on the source. Retain only nondegenerate 4-chains.
    Z=defaultdict(int)
    for t,coeff in zsource.items():
        rt=tuple(qi[image(V[i][1])] for i in t)
        for k in range(4):
            s=t[:k+1]+rt[k:]
            if len(set(s))==5:Z[s]+=coeff*(-1)**k
    Z={s:v for s,v in Z.items() if v}
    assert set(Z)<=set(chains[4])
    bd=defaultdict(int)
    for t,v in Z.items():
        for k in range(5):bd[t[:k]+t[k+1:]]+=v*(-1)**k
    assert {t:v for t,v in bd.items() if v}=={t:-v for t,v in zsource.items()}
    pairing=sum(v*W.get(t[:3],0)*W.get(t[2:],0) for t,v in Z.items())
    assert (pairing==0 if name=='f0' else abs(pairing)==2)
    # Reverse relative cycle if needed to make the integral coefficient positive.
    if pairing<0:Z={s:-v for s,v in Z.items()};pairing=-pairing
    cert=dict(map=name,chains=chains,w=[[s,v] for s,v in sorted(W.items())],
              z4=[[s,v] for s,v in sorted(Z.items())],pairing=pairing,
              class_sha256=hashlib.sha256(classes.encode()).hexdigest())
    (OUT/(name+'.json')).write_text(json.dumps(cert,sort_keys=True,separators=(',',':'))+'\n')
    print(json.dumps(dict(map=name,N=N,source_fvector=[sum(len(f)==k for f in F) for k in (1,2,3,4)],
         cylinder_fvector=[len(x) for x in chains],short_edges=len(short),high_edges=len(high),
         w_support=len(W),z4_support=len(Z),integral_pairing=pairing,class_sha256=cert['class_sha256']),sort_keys=True))
print('S028_INTEGER_CONSTRUCTION_PASS')
