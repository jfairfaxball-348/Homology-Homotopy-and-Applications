#!/usr/bin/env python3
"""S024: full induced-star widths for both frozen 182-node Hopf cylinders.
Python >=3.10 stdlib, proof certificate of finite poset matching only.
GitHub static governance does not run this scientific script.
"""
import ast,hashlib,json
from pathlib import Path
from itertools import combinations
from collections import Counter
script=ast.parse(Path(__file__).with_name("s020_certificate.py").read_text())
TETRA=None
for stmt in script.body:
    if isinstance(stmt,ast.Assign) and any(isinstance(v,ast.Name) and v.id=="TETRA" for v in stmt.targets):
        TETRA=ast.literal_eval(stmt.value)
assert TETRA
facets=[tuple(sorted(x.split())) for x in TETRA.strip().splitlines()]
F=tuple(sorted({tuple(s) for x in facets for k in range(1,5) for s in combinations(x,k)},key=lambda z:(len(z),z)))
Q=tuple(sorted((x for k in range(1,4) for x in combinations("abcd",k)),key=lambda z:(len(z),z)))
N=len(F)+len(Q)
assert len(facets)==36 and (len(F),len(Q),N)==(168,14,182)
shortfaces={tuple(s) for x in facets if "a0" not in x for k in range(1,5) for s in combinations(x,k)}
nodes=[("s",x) for x in F]+[("t",x) for x in Q]
def subset(a,b):return set(a)<=set(b)
def map_g(face):return tuple(sorted({"d" if v[0]=="d" else "abc"[int(v[1])] for v in face}))
def map_f(face):return tuple(sorted({v[0] for v in face}))
def less(i,j,fn):
    u,x=nodes[i];v,y=nodes[j]
    if u==v:return len(x)<len(y) and subset(x,y)
    return u=="s" and v=="t" and subset(fn(x),y)
def maximum_antichain(S,fn):
    """Dilworth bipartite matching plus independent alternating-path witness."""
    S=sorted(S)
    adj={i:[j for j in S if less(i,j,fn)] for i in S}
    right={};left={}
    def augment(i,seen):
        for j in adj[i]:
            if j in seen:continue
            seen.add(j)
            if j not in right or augment(right[j],seen):
                right[j]=i;left[i]=j;return True
        return False
    for i in S:augment(i,set())
    ZL={i for i in S if i not in left}; ZR=set();stack=list(ZL)
    while stack:
        i=stack.pop()
        for j in adj[i]:
            if j in ZR:continue
            ZR.add(j)
            if j in right and right[j] not in ZL:
                ZL.add(right[j]);stack.append(right[j])
    anti=[i for i in S if i in ZL and i not in ZR]
    assert len(anti)==len(S)-len(right)
    assert all(not less(i,j,fn) and not less(j,i,fn) for i,j in combinations(anti,2))
    return len(anti),len(right),anti
def run(label,fn,expected_edges,expected_digest,expected_star,expected_hist):
    assert all(len(fn(x))<=3 for x in facets)
    E=set()
    for i in range(N):
        for j in range(i+1,N):
            if less(i,j,fn) or less(j,i,fn):E.add((i,j))
    ES={(i,j) for i in range(len(F)) for j in range(i+1,len(F))
        if F[i] in shortfaces and F[j] in shortfaces
        and (subset(F[i],F[j]) or subset(F[j],F[i]))}
    assert len(E)==expected_edges and len(ES)==644 and ES<=E
    ser="\n".join(",".join("0" if i==j else ("S" if (min(i,j),max(i,j)) in ES else
         ("M" if (min(i,j),max(i,j)) in E else "L")) for j in range(N)) for i in range(N))+"\n"
    assert hashlib.sha256(ser.encode()).hexdigest()==expected_digest
    answer=[]
    for v in range(N):
        down={u for u in range(N) if less(u,v,fn)}
        up={u for u in range(N) if less(v,u,fn)}
        a,ma,wa=maximum_antichain(down,fn)
        b,mb,wb=maximum_antichain(up,fn)
        w=max(a,b)
        answer.append((w,v,wa if a>=b else wb))
    hist=dict(sorted(Counter(a[0] for a in answer).items()))
    assert hist==expected_hist and max(z[0] for z in answer)==expected_star
    m=max(z[0] for z in answer)
    v=min(z[1] for z in answer if z[0]==m)
    witness=next(z[2] for z in answer if z[1]==v)
    assert all(tuple(sorted((v,z))) in E for z in witness)
    assert all(tuple(sorted((i,j))) not in E for i,j in combinations(witness,2))
    return {"graph":label,"nodes":N,"edges":len(E),"short":len(ES),"digest":expected_digest,
            "max_induced_star":m,"center":str(nodes[v]),"histogram":hist,
            "witness":[str(nodes[z]) for z in witness]}
if __name__=="__main__":
    out=[
      run("g",map_g,1572,"8cce60227b889db047c72e1bb73aaff6b27448d58097e8ebeaed58286c7d0a23",32,
          {3:85,5:18,6:48,7:9,9:3,10:1,12:6,19:1,21:3,24:3,27:1,28:1,32:3}),
      run("f1",map_f,1524,"ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351",30,
          {3:76,5:12,6:60,7:12,10:4,12:6,19:1,22:3,25:3,28:1,30:4})
    ]
    print(json.dumps(out,indent=2,sort_keys=True))
