#!/usr/bin/env python3
"""S026: exact F2 Alexander-Whitney audit of D/U total cofibers.
D is the order complex of the 182-node mapping cylinder. U=sd(K) plus
14 isolated target vertices; inclusions are cofibrations, so D/U models
its derived total cofiber. This is NOT an integral-cup or R5 proof.
Run: python scripts/s026_cofiber_aw.py (Python 3.10+, stdlib).
"""
import ast, hashlib, json
from pathlib import Path
from itertools import combinations
src=ast.parse(Path(__file__).with_name('s020_certificate.py').read_text())
raw=next(ast.literal_eval(x.value) for x in src.body if isinstance(x,ast.Assign)
         and any(isinstance(v,ast.Name) and v.id=='TETRA' for v in x.targets))
K=[tuple(z.split()) for z in raw.strip().splitlines()]
F=sorted({c for t in K for k in range(1,5) for c in combinations(t,k)},key=lambda x:(len(x),x))
Q=sorted({c for k in range(1,4) for c in combinations('abcd',k)},key=lambda x:(len(x),x))
V=[('s',x) for x in F]+[('t',x) for x in Q]
n=len(V);ns=len(F);assert (len(K),ns,len(Q),n)==(36,168,14,182)
B={c for t in K if 'a0' not in t for k in range(1,5) for c in combinations(t,k)}
def incl(a,b):return set(a)<=set(b)
def null(s):return tuple(sorted({'d' if z[0]=='d' else 'abc'[int(z[1])] for z in s}))
def hopf(s):return tuple(sorted({z[0] for z in s}))
def check(name,f,expect_edge,expect_sha,expect_cliques):
    le=[[False]*n for _ in range(n)]
    for i,(a,x) in enumerate(V):
        for j,(b,y) in enumerate(V):
            le[i][j]=(i!=j and ((len(x)<len(y) and incl(x,y)) if a==b
                                     else (a=='s' and b=='t' and incl(f(x),y))))
    assert all(not le[i][j] for i in range(n) for j in range(i+1))
    short=set();high=set()
    for i in range(n):
        for j in range(i+1,n):
            if le[i][j]:high.add((i,j))
            if i<ns and j<ns and V[i][1] in B and V[j][1] in B and le[i][j]:short.add((i,j))
    serial='\n'.join(','.join('0' if i==j else ('S' if (min(i,j),max(i,j)) in short
             else 'M' if (min(i,j),max(i,j)) in high else 'L') for j in range(n)) for i in range(n))+'\n'
    digest=hashlib.sha256(serial.encode()).hexdigest()
    assert (len(high),len(short),digest)==(expect_edge,644,expect_sha)
    up=[[j for j in range(i+1,n) if le[i][j]] for i in range(n)]
    chains=[[(i,) for i in range(n)]]
    while True:
        nxt=[x+(j,) for x in chains[-1] for j in up[x[-1]]]
        if not nxt:break
        chains.append(nxt)
    assert [len(c) for c in chains]==expect_cliques
    E=[s for s in chains[1] if s[-1]<ns];T=[s for s in chains[2] if s[-1]<ns]
    eidx={x:i for i,x in enumerate(E)}
    targetflag=(('a',),('a','b'),('a','b','c'))
    def a(t):return int(tuple(f(V[i][1]) if V[i][0]=='s' else V[i][1] for i in t)==targetflag)
    # Solve d c = a on the full source order complex, by independent bitset elimination.
    piv={}
    for v,w,x in T:
        row=(1<<eidx[v,w])^(1<<eidx[v,x])^(1<<eidx[w,x]);rhs=a((v,w,x))
        while row:
            k=row.bit_length()-1
            if k in piv:rr,bb=piv[k];row^=rr;rhs^=bb
            else:piv[k]=(row,rhs);break
        else:assert rhs==0
    coeff=0
    for k in sorted(piv):
        rr,bb=piv[k]
        if ((rr&coeff).bit_count()&1)!=bb:coeff|=1<<k
    C={edge for edge,i in eidx.items() if (coeff>>i)&1}
    def w(t):
        x,y,z=t
        return a(t)^int((x,y) in C)^int((x,z) in C)^int((y,z) in C)
    assert all(w(t)==0 for t in T)
    assert all(not(w(t[1:])^w((t[0],t[2],t[3]))^w((t[0],t[1],t[3]))^w(t[:3])) for t in chains[3])
    R3=[t for t in chains[3] if t[-1]>=ns];R4=[t for t in chains[4] if t[-1]>=ns]
    cofaces={s:0 for s in R3}; cup=0
    for j,t in enumerate(R4):
        cup|=(w(t[:3])&w(t[2:]))<<j
        for k in range(5):
            face=t[:k]+t[k+1:]
            if face in cofaces:cofaces[face]^=1<<j
    basis={}
    for v in cofaces.values():
        while v:
            k=v.bit_length()-1
            if k in basis:v^=basis[k]
            else:basis[k]=v;break
    rem=cup
    while rem and rem.bit_length()-1 in basis:rem^=basis[rem.bit_length()-1]
    # The sum z of ALL R4 simplices is an explicit relative cycle exactly
    # when every relative 3-face has an even number of 4-cofaces.
    all_cycle=all(v.bit_count()%2==0 for v in cofaces.values())
    out=dict(map=name,vertices=n,edges=len(high),short=len(short),graph_sha256=digest,
             fvector=[len(c) for c in chains],R3=len(R3),R4=len(R4),
             source_primitive_support=len(C),d3_rank=len(basis),
             cup_cochain_support=cup.bit_count(),cup_nonzero=bool(rem),
             all_R4_cycle=all_cycle,AW_pairing=(cup.bit_count()%2 if all_cycle else None))
    print(json.dumps(out,sort_keys=True))
    return out
G=check('g',null,1572,'8cce60227b889db047c72e1bb73aaff6b27448d58097e8ebeaed58286c7d0a23',[182,1572,4434,5418,2916,540])
H=check('f1',hopf,1524,'ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351',[182,1524,3936,4032,1440])
assert not G['cup_nonzero'] and H['cup_nonzero'] and H['all_R4_cycle'] and H['AW_pairing']==1
print('S026_EXACT_F2_TOTAL_COFIBER_AW_PASS')
