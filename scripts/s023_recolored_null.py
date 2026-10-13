#!/usr/bin/env python3
"""S023 exact 182-vertex recoloured null Hopf face-poset cylinder audit.
Python >=3.10 stdlib; reads frozen 36 tetra from unchanged corrected S021 source.
Not a d=5 realization proof or machine validation of homotopy/cup products.
"""
import ast,hashlib,json
from pathlib import Path
from itertools import combinations
t=ast.parse(Path(__file__).with_name('s020_certificate.py').read_text())
K=None
for n in t.body:
    if isinstance(n,ast.Assign) and any(isinstance(z,ast.Name) and z.id=='TETRA' for z in n.targets):
        K=tuple(tuple(sorted(row.split())) for row in ast.literal_eval(n.value).strip().splitlines())
assert K is not None and len(K)==36 and len(set(K))==36
F={tuple(c) for T in K for k in range(1,5) for c in combinations(T,k)}
src=tuple(sorted(F,key=lambda z:(len(z),z)))
Q=tuple(sorted((q for k in range(1,4) for q in combinations('abcd',k)),key=lambda z:(len(z),z)))
nodes=tuple(('s',z) for z in src)+tuple(('t',z) for z in Q)
assert (len(src),len(Q),len(nodes))==(168,14,182)
assert [sum(len(z)==k for z in F) for k in range(1,5)]==[12,48,72,36]
Bminus={tuple(c) for T in K if 'a0' not in T for k in range(1,5) for c in combinations(T,k)}
assert len(Bminus)==117
def f0(z):return tuple(sorted({'d' if v[0]=='d' else 'abc'[int(v[1])] for v in z}))
def f1(z):return tuple(sorted({v[0] for v in z}))
def le(a,b):return set(a).issubset(b)
for f in [f0,f1]:
    assert all(1<=len(f(T))<=3 for T in K)
    assert all(le(f(a),f(b)) for a in F for b in F if len(a)<len(b) and le(a,b))
assert all(set(f0(T))!={'a','b','c'} for T in K)
def classes(f):
    high=set();short=set()
    for i,(s,x) in enumerate(nodes):
        for j in range(i+1,len(nodes)):
            u,y=nodes[j]
            hit=le(x,y) or le(y,x) if s==u else le(f(x),y)
            if hit:high.add((i,j))
            if s==u=='s' and x in Bminus and y in Bminus and (le(x,y) or le(y,x)):
                short.add((i,j))
    assert short<=high and len(short)==644
    r=[]
    for i in range(len(nodes)):
        r.append(','.join('0' if i==j else ('S' if (min(i,j),max(i,j)) in short else
                         ('M' if (min(i,j),max(i,j)) in high else 'L')) for j in range(len(nodes))))
    return high,short,hashlib.sha256(('\n'.join(r)+'\n').encode()).hexdigest()
def width(S):
    # Exact finite Dilworth width = size minus max matching of strict inclusions.
    adj=[[j for j,v in enumerate(S) if len(u)<len(v) and le(u,v)] for u in S]
    mate=[-1]*len(S)
    def augment(i,seen):
        for j in adj[i]:
            if j in seen:continue
            seen.add(j)
            if mate[j]<0 or augment(mate[j],seen):mate[j]=i;return True
        return False
    return len(S)-sum(augment(i,set()) for i in range(len(S)))
R=[]
for name,f in [('null_recoloured',f0),('original_hopf',f1)]:
    high,short,dig=classes(f)
    W={''.join(tau):width([z for z in src if le(f(z),tau)])
       for k in range(1,4) for tau in combinations('abcd',k)}
    T={''.join(tau):sum(le(f(z),tau) for z in src if len(z)==3)
       for tau in combinations('abcd',3)}
    assert all(W[k]==v for k,v in T.items())
    R.append({'map':name,'upper_edges':len(high),'short_edges':len(short),'sha256':dig,
              'target_source_antichain_widths':W,'triangle_facets':T})
assert R[0]['upper_edges']==1572 and R[1]['upper_edges']==1524
assert R[0]['sha256']=='8cce60227b889db047c72e1bb73aaff6b27448d58097e8ebeaed58286c7d0a23'
assert R[1]['sha256']=='ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351'
assert R[0]['triangle_facets']=={'abc':27,'abd':31,'acd':31,'bcd':31}
assert R[1]['triangle_facets']=={'abc':27,'abd':27,'acd':27,'bcd':27}
print(json.dumps(R,indent=2,sort_keys=True))
