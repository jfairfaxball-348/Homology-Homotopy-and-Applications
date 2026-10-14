"""Finite adversarial check of the 1D left Kan image of intervals under grid floor.
Scope: P=0..15, A=(0,3,7,11,15), all 136 ambient intervals;
explicit quotient-colimit relations, not an interval rounding formula.
This is a finite algebra diagnostic, NOT a proof for infinite grids or complexity.
"""
from itertools import combinations_with_replacement
P=range(16); A=(0,3,7,11,15)
floor={p:max(i for i,a in enumerate(A) if a<=p) for p in P}

def rank_gf2(rows):
    pivots={}
    for v in rows:
        while v:
            k=v.bit_length()-1
            if k in pivots: v^=pivots[k]
            else: pivots[k]=v;break
    return len(pivots)

def colimit_data(lo,hi,j):
    domain=[p for p in P if floor[p]<=j]
    support=[p for p in domain if lo<=p<=hi]
    basis={p:i for i,p in enumerate(support)}
    relations=[]
    for p in support:
        for q in domain:
            if p<q:
                r=1<<basis[p]
                if q in basis:r^=1<<basis[q]
                relations.append(r)
    dim=len(support)-rank_gf2(relations)
    return dim

cases=0
for lo in P:
    for hi in range(lo,16):
        vals=[colimit_data(lo,hi,j) for j in range(len(A))]
        assert all(v in (0,1) for v in vals), (lo,hi,vals)
        seen=False;ended=False
        for v in vals:
            if v and ended: raise AssertionError((lo,hi,vals))
            if v: seen=True
            elif seen: ended=True
        cases+=1
print('PASS 1D left Kan rectangular support; explicit GF(2) colimit; intervals',cases,'critical levels',len(A))
print('Product of two such left Kan calculations is a rectangle because colimits over products commute with field tensor product.')
print('BOUNDARY [1,5]:', [colimit_data(1,5,j) for j in range(len(A))])
print('BOUNDARY [1,6]:', [colimit_data(1,6,j) for j in range(len(A))])
print('BOUNDARY [1,7]:', [colimit_data(1,7,j) for j in range(len(A))])
