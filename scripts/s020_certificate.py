"""S020 historical replay CORRECTED IN S021: the former mode0 lex-first-letter
source image was NOT constant and failed poset transitivity. Old null digest
138695... is INVALID as a null-map witness. Python >=3.10; stdlib only.
36 tetrahedra: Madahar--Sarkaria via Draganov's MathOverflow list.
"""
import hashlib, json
from itertools import combinations
from collections import Counter, defaultdict
from fractions import Fraction

TETRA="""
a0 a1 b1 c1
a0 a1 b1 d2
a0 a1 c1 d2
a0 a2 b0 c2
a0 a2 b0 d1
a0 a2 c2 d1
a0 b0 b1 c1
a0 b0 b1 d1
a0 b0 c0 c1
a0 b0 c0 c2
a0 b1 d0 d1
a0 b1 d0 d2
a0 c0 c1 d2
a0 c0 c2 d2
a0 c2 d0 d1
a0 c2 d0 d2
a1 a2 b1 c1
a1 a2 b1 d2
a1 a2 c1 d2
a2 b0 b2 c2
a2 b0 b2 d2
a2 b0 d1 d2
a2 b1 b2 c2
a2 b1 b2 d2
a2 b1 c1 c2
a2 c1 c2 d1
a2 c1 d1 d2
b0 b1 c1 d1
b0 b2 c2 d2
b0 c0 c1 d2
b0 c0 c2 d2
b0 c1 d1 d2
b1 b2 c2 d2
b1 c1 c2 d1
b1 c2 d0 d1
b1 c2 d0 d2"""
K=tuple(tuple(sorted(s.split())) for s in TETRA.strip().splitlines())
V=tuple(sorted({x for t in K for x in t}))
assert len(K)==36 and len(V)==12 and len(set(K))==36

def allfaces(facets):
    return set(tuple(c) for f in facets for k in range(1,len(f)+1) for c in combinations(f,k))
F=allfaces(K)
face_n=tuple(sorted(F,key=lambda x:(len(x),x)))
Bplus=allfaces([t for t in K if "a0" in t])
Bminus=allfaces([t for t in K if "a0" not in t])
A=Bplus&Bminus
assert (len(F),len(Bplus),len(Bminus),len(A))==(168,101,117,50)
assert Bplus|Bminus==F
assert set(Counter(c for t in K for c in combinations(t,3)).values())=={2}
assert sum((-1)**(len(f)-1) for f in F)==0
assert sum((-1)**(len(f)-1) for f in A)==2

def connected(nodes,edges):
    adj={v:set() for v in nodes}
    for x,y in edges: adj[x].add(y);adj[y].add(x)
    seen={next(iter(nodes))};todo=list(seen)
    while todo:
        for v in adj[todo.pop()]-seen:seen.add(v);todo.append(v)
    return len(seen)==len(nodes)
for v in V:
    link={tuple(x for x in f if x!=v) for f in F if v in f and len(f)>1}
    vs={f[0] for f in link if len(f)==1}
    es=[f for f in link if len(f)==2]
    ts=[f for f in link if len(f)==3]
    assert connected(vs,es) and len(vs)-len(es)+len(ts)==2
    assert set(Counter(e for t in ts for e in combinations(t,2)).values())=={2}
rem=set(Bminus);collapses=0
while len(rem)>1:
    pair=None
    for sigma in sorted(rem,key=lambda s:(-len(s),s)):
        ups=[t for t in rem if len(t)==len(sigma)+1 and set(sigma)<set(t)]
        if len(ups)!=1:continue
        tau=ups[0]
        if any(len(t)>len(tau) and set(tau)<set(t) for t in rem):continue
        pair=(sigma,tau);break
    if pair is None:break
    rem.difference_update(pair);collapses+=1
assert len(rem)==1 and collapses==58

def rank2(rows):
    piv={}
    for x in rows:
        while x:
            p=x.bit_length()-1
            if p in piv:x^=piv[p]
            else:piv[p]=x;break
    return len(piv)
ranks=[]
for k in range(1,4):
    lo=sorted(f for f in F if len(f)==k)
    hi=sorted(f for f in F if len(f)==k+1)
    ids={f:i for i,f in enumerate(lo)}
    ranks.append(rank2([sum(1<<ids[g] for g in combinations(s,k)) for s in hi]))
assert ranks==[11,37,35]

cochain=dict((tuple(x.split()),v) for x,v in [
    ("a0 a2",1),("a0 b0",1),("a0 d1",1),("a2 c2",-1),
    ("b0 b1",-1),("b1 c1",1),("b1 d1",1),
    ("c1 c2",-1),("c2 d1",1),("d0 d1",1)])
def sign(xs):return (-1)**sum(xs[i]>xs[j] for i in range(len(xs)) for j in range(i+1,len(xs)))
def beta(t):
    f=[x[0] for x in t]
    return sign(f) if set(f)=={"a","b","c"} else 0
for f in F:
    if len(f)==3:
        assert cochain.get(f[1:],0)-cochain.get((f[0],f[2]),0)+cochain.get(f[:2],0)==beta(f)
faces2=defaultdict(list)
for i,t in enumerate(K):
    for k in range(4):faces2[t[:k]+t[k+1:]].append((i,(-1)**k))
ori={0:1};todo=[0]
while todo:
    i=todo.pop()
    for k in range(4):
        for j,s in faces2[K[i][:k]+K[i][k+1:]]:
            if j==i:continue
            new=-ori[i]*(-1)**k*s
            if j in ori:assert ori[j]==new
            else:ori[j]=new;todo.append(j)
assert len(ori)==36
assert all(sum(ori[i]*s for i,s in a)==0 for a in faces2.values())
H=sum(ori[i]*cochain.get(t[:2],0)*beta(t[1:]) for i,t in enumerate(K))
assert abs(H)==1

T=tuple(sorted((t for k in range(1,4) for t in combinations("abcd",k)),key=lambda s:(len(s),s)))
nodes=tuple(("s",f) for f in face_n)+tuple(("t",f) for f in T)
N=len(nodes);assert N==182
eps=Fraction(1,100*N)
L={i for i,(side,f) in enumerate(nodes) if side=="s" and f in Bplus}
def issub(a,b):return set(a).issubset(b)
def graph(mode):
    high=set();short=set()
    for i,(a,x) in enumerate(nodes):
        for j in range(i+1,N):
            b,y=nodes[j]
            if a==b:edge=issub(x,y) or issub(y,x)
            else:
                source=x if a=="s" else y
                target=y if b=="t" else x
                fimage=('a',) if mode==0 else tuple(sorted({v[0] for v in source}))
                edge=issub(fimage,target)
            if edge:high.add((i,j))
            if a==b=="s" and x in Bminus and y in Bminus and (issub(x,y) or issub(y,x)):
                short.add((i,j))
    assert short<=high
    return high,short
def comps(nodeset,edges):
    adj={v:set() for v in nodeset}
    for i,j in edges:
        if i in adj and j in adj:adj[i].add(j);adj[j].add(i)
    done=set();size=[]
    for i in nodeset:
        if i in done:continue
        done.add(i);q=[i];n=0
        while q:
            n+=1
            for j in adj[q.pop()]-done:done.add(j);q.append(j)
        size.append(n)
    return sorted(size,reverse=True)
results=[]
for mode in (0,1):
    high,short=graph(mode)
    assert comps(set(range(N)),short)==[117]+[1]*65
    assert comps(L,short)==[50]+[1]*51
    assert comps(L,high)==[101]
    assert comps(set(range(N)),high)==[182]
    rows=[]
    for i in range(N):
        rows.append(",".join("0" if i==j else ("S" if (min(i,j),max(i,j)) in short else
                      ("M" if (min(i,j),max(i,j)) in high else "L")) for j in range(N)))
    digest=hashlib.sha256(("\n".join(rows)+"\n").encode()).hexdigest()
    assert high!=short and len(high)<N*(N-1)//2
    results.append({"kind":mode,"high_edges":len(high),"short_edges":len(short),"classes_sha256":digest})
# D²_ij=1-eps on S, 1 on M, 1+eps on L, zero diagonal.
# Centered Gram G=-1/2 J D² J, J=I-11ᵀ/N, is positive on 1⊥:
# ||D²-(11ᵀ-I)||₂ <= N eps=1/100, hence G >=99/200 on 1⊥.
print(json.dumps({"source_fvector":[12,48,72,36],"GF2_boundary_ranks":ranks,
 "all_vertex_links_are_S2":True,"Bminus_collapse_pairs":collapses,
 "ball_face_counts":[101,117,50],"hopf_invariant":H,
 "vertices":N,"dimension":N-1,"epsilon":str(eps),
 "cofiber_extra_H1_rank":14,"gram_min_eigenvalue_lower_bound":"99/200",
 "two_clouds":results},indent=2,sort_keys=True))

# S021 correction: exact independent-reconstruction expected distance-class hashes.
assert results[0]['classes_sha256']=='65deabfaed606db2d756b38569de169bef073e32c388a774fe23de6d20e66741'
assert results[1]['classes_sha256']=='ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351'
