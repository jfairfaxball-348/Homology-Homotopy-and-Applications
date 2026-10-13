#!/usr/bin/env python3
"""S029 finite checks; NOT a proof of the universal theorem.
Independent construction of recursive/closed supports, all-pair Smith tests of
unimodularly conjugated examples, death and slab rank diagnostics, and a
sharp counterexample if composite purity is deleted.
"""
from itertools import product, combinations
from math import prod
import json, hashlib
import sympy as S
from sympy.matrices.normalforms import smith_normal_form
from sympy.polys.domains import ZZ


def points(n): return list(product(range(3), repeat=n))
def leq(x,y): return all(a<=b for a,b in zip(x,y))
def supports_recursive(n):
    P=points(n)
    if n==1:
        return {frozenset((a,) for a in range(i,j+1)) for i in range(3) for j in range(i,3)}
    ans={frozenset(x for x in P if leq(u,x)) for u in P}
    ans.update(frozenset(x for x in P if leq(x,v)) for v in P)
    for dim in range(n):
        for support in supports_recursive(n-1):
            ans.add(frozenset(x for x in P if x[:dim]+x[dim+1:] in support))
    return ans

def supports_closed(n):
    P=points(n)
    ans={frozenset(x for x in P if leq(u,x)) for u in P}
    ans.update(frozenset(x for x in P if leq(x,v)) for v in P)
    ans.update(frozenset(x for x in P if x[i]==1) for i in range(n))
    return ans

def rank_mod(A,p):
    a=[[int(A[i,j])%p for j in range(A.cols)] for i in range(A.rows)]
    r=0
    for col in range(A.cols):
        pivot=next((i for i in range(r,A.rows) if a[i][col]),None)
        if pivot is None: continue
        a[r],a[pivot]=a[pivot],a[r]
        inv=pow(a[r][col],-1,p)
        a[r]=[(z*inv)%p for z in a[r]]
        for i in range(A.rows):
            if i!=r and a[i][col]:
                factor=a[i][col]
                a[i]=[(a[i][j]-factor*a[r][j])%p for j in range(A.cols)]
        r+=1
        if r==A.rows: break
    return r

def unimod(r,seed):
    A=S.eye(r)
    for j in range(r*3):
        if r<2: break
        a=(seed+2*j)%r; b=(seed+2*j+1)%r
        if a==b: b=(b+1)%r
        E=S.eye(r); E[a,b]=(-1 if j%2 else 1)*(1+(seed+j)%3)
        A=E*A
    return A

def chosen(n):
    up=[(1,)+tuple(0 for _ in range(n-1)),(0,)*n,(2,)*n]
    down=[tuple(1 for _ in range(n)),tuple(0 for _ in range(n))]
    arr=[('U',u,frozenset(x for x in points(n) if leq(u,x))) for u in up]
    arr += [('D',v,frozenset(x for x in points(n) if leq(x,v))) for v in down]
    arr += [('S',i,frozenset(x for x in points(n) if x[i]==1)) for i in range(n)]
    return arr

def example(n):
    P=points(n); blocks=chosen(n)
    active={x:[j for j,(_,_,su) in enumerate(blocks) if x in su] for x in P}
    U={x:unimod(len(active[x]),3+sum((i+1)*x[i] for i in range(n))) for x in P}
    Ui={x:U[x].inv() for x in P}
    def mapxy(x,y):
        if not leq(x,y): raise ValueError('incomparable')
        canon=S.zeros(len(active[y]),len(active[x])); pos={k:i for i,k in enumerate(active[y])}
        for j,k in enumerate(active[x]):
            if k in pos: canon[pos[k],j]=1
        return U[y]*canon*Ui[x]
    pairs=[(x,y) for x in P for y in P if leq(x,y)]
    snf_bad=[]; comp_bad=[]; minrank=10**6
    for x,y in pairs:
        mat=mapxy(x,y)
        dia=smith_normal_form(mat,domain=ZZ)
        if any(abs(int(dia[i,i]))!=1 for i in range(min(dia.rows,dia.cols)) if dia[i,i]!=0):snf_bad.append((x,y))
        minrank=min(minrank,min(mat.rows,mat.cols))
        for p in (2,3,5,7):
            if rank_mod(mat,p)!=mat.rank():comp_bad.append((x,y,p))
    # Coherence: all composable triples, not only primitive edges.
    triple_bad=sum(mapxy(y,z)*mapxy(x,y)!=mapxy(x,z) for x in P for y in P for z in P if leq(x,y) and leq(y,z))
    bottom=(0,)*n; top=(2,)*n
    field_d={v:sum(1 for typ,w,_ in blocks if typ=='D' and w==v) for v in P if v!=top}
    mobius_bad=[]
    for v in P:
        r=int(mapxy(bottom,v).rank())
        pred=sum(d for w,d in field_d.items() if leq(v,w))+(1 if ('U',bottom,frozenset(x for x in P if leq(bottom,x))) in blocks else 0)
        if r!=pred: mobius_bad.append(v)
    # For every downset v, basepoint joint-kernel image has rank exactly d_v.
    death_bad=[]; death_data=[]
    for v in P:
        if v==top:continue
        axes=[]
        for j in range(n):
            if v[j]<2:
                a=[0]*n; a[j]=v[j]+1; axes.append(tuple(a))
        T=S.zeros(sum(mapxy(bottom,a).rows for a in axes), len(active[bottom]))
        row=0
        for a in axes:
            f=mapxy(bottom,a)
            T[row:row+f.rows,:]=f;row+=f.rows
        L=S.Matrix.hstack(*T.nullspace()) if T.nullspace() else S.zeros(T.cols,0)
        A=mapxy(bottom,v)*L
        rank=A.rank()
        expected=field_d[v]
        death_data.append((v,rank,expected,len(T.nullspace())))
        if rank!=expected:death_bad.append(v)
    return {'n':n,'points':len(P),'blocks_in_test':len(blocks),'comparable_pairs_snf':len(pairs),
            'coherence_triples':sum(1 for x in P for y in P for z in P if leq(x,y) and leq(y,z)),
            'snf_bad':snf_bad,'field_rank_bad':comp_bad,'triple_bad':triple_bad,
            'mobius_bad':mobius_bad,'death_bad':death_bad,'death_ranks':death_data}


def main():
    out={'supports':{},'examples':{}}
    for n in (1,2,3,4):
        a=supports_recursive(n); b=supports_closed(n)
        out['supports'][str(n)]={'recursive':len(a),'closed':len(b),'identical':a==b,'expected':2*3**n-1+n}
        assert a==b and len(a)==2*3**n-1+n
    for n in (2,3):
        v=example(n);out['examples'][str(n)]=v
        assert not (v['snf_bad'] or v['field_rank_bad'] or v['triple_bad'] or v['mobius_bad'] or v['death_bad'])
    A=S.Matrix([[1],[0]]); B=S.Matrix([[2,1]])
    assert abs(int(smith_normal_form(A,domain=ZZ)[0,0]))==1
    assert abs(int(smith_normal_form(B,domain=ZZ)[0,0]))==1
    assert B*A==S.Matrix([[2]])
    out['edge_only_counterexample']={'A':[[1],[0]],'B':[[2,1]],'composite':[[2]],
     'edge_unit_smith':True,'composite_nonunit_smith':2,
     'rank_composite_Q':1,'rank_composite_F2':0,'field_interval_decomposable_all_fields':True}
    payload=json.dumps(out,sort_keys=True,indent=2)
    print(payload)
    print('JSON_SHA256='+hashlib.sha256(payload.encode()).hexdigest())

if __name__=='__main__':main()
