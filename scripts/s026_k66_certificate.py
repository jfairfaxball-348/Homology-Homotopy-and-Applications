#!/usr/bin/env python3
"""Exact necessary-and-sufficient induced K6,6 census for both high poset graphs.
No K6,6 implies NO obstruction from this particular Maehara route, NOT R5 feasible.
Python 3.10+ stdlib; uses the same frozen s020 tetra via AST.
"""
import ast,json
from pathlib import Path
from itertools import combinations
s=ast.parse(Path(__file__).with_name('s020_certificate.py').read_text())
raw=next(ast.literal_eval(t.value) for t in s.body if isinstance(t,ast.Assign) and
         any(isinstance(v,ast.Name) and v.id=='TETRA' for v in t.targets))
K=[tuple(r.split()) for r in raw.strip().splitlines()]
F=sorted({c for t in K for k in range(1,5) for c in combinations(t,k)},key=lambda x:(len(x),x))
Q=sorted({c for k in range(1,4) for c in combinations('abcd',k)},key=lambda x:(len(x),x))
V=[('s',x) for x in F]+[('t',x) for x in Q]; n=len(V);assert n==182
def inc(x,y):return set(x)<=set(y)
def g(x):return tuple(sorted({'d' if v[0]=='d' else 'abc'[int(v[1])] for v in x}))
def h(x):return tuple(sorted({v[0] for v in x}))
def run(label,fn):
    less=[[False]*n for _ in range(n)]
    for i,(a,x) in enumerate(V):
        for j,(b,y) in enumerate(V):
            less[i][j]=i!=j and ((len(x)<len(y) and inc(x,y)) if a==b
                                  else a=='s' and b=='t' and inc(fn(x),y))
    upp=[{j for j in range(n) if less[i][j]} for i in range(n)]
    def width(S):
        S=sorted(S); mate={}
        def aug(i,seen):
            for j in S:
                if not less[i][j] or j in seen:continue
                seen.add(j)
                if j not in mate or aug(mate[j],seen):mate[j]=i;return True
            return False
        return len(S)-sum(aug(i,set()) for i in S)
    # Any 6+6 comparability biclique has six lower, six upper antichain
    # vertices; every lower pair has an upper common neighborhood of width >=6.
    potential=[set() for _ in range(n)]; screened=0
    for a in range(n):
        for b in range(a+1,n):
            if less[a][b] or less[b][a]:continue
            up=upp[a]&upp[b]
            if len(up)<6:continue
            screened+=1
            if width(up)>=6:potential[a].add(b);potential[b].add(a)
    witness=[]; tested=0
    def clique(chosen,candidates):
        nonlocal tested
        if len(chosen)==6:
            tested+=1
            common=set.intersection(*(upp[v] for v in chosen))
            if width(common)>=6:witness.append(chosen)
            return
        if witness or len(chosen)+len(candidates)<6:return
        for k,v in enumerate(candidates):
            if witness:return
            clique(chosen+(v,),[z for z in candidates[k+1:] if z in potential[v]])
    clique((),list(range(n)))
    ans=dict(graph=label,screened_pairs=screened,potential_pair_edges=sum(map(len,potential))//2,
             tested_candidate_6sets=tested,has_induced_K66=bool(witness))
    print(json.dumps(ans,sort_keys=True));assert not witness
run('null_g',g);run('hopf_f1',h)
print('S026_EXACT_NO_INDUCED_K66_PASS (NOT R5 UNSAT)')
