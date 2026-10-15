#!/usr/bin/env python3
"""S052 bounded point-set I^3 saturation plus I^4 negative-control; NOT a sphere GRID existence test.
Two independent tests: explicit 3-bit compositions and interval covering.
Python 3 standard library; no external packages.
"""
from itertools import product

def build(r,s):
    assert 2*s < r < 3*s
    L=5*s
    zeros=[{r-1}, {s-1,s+r-1}, {2*s-1,2*s+r-1}]
    if 2*r-1 <= L-2:
        zeros[0].add(2*r-1)
    return L,zeros

def direct(r,s):
    L,zeros=build(r,s)
    # binary indicator of a factor coordinate; true represents point 1.
    def comp(a,b,t,c):
        for e in range(a,b):
            if c<3 and e in zeros[c]:t=0
        return t
    assert all(comp(j,j+r,1,c)==0 for j in range(L-r) for c in range(3))
    # Fourth untouched I factor witnesses that no length-r equation is forced.
    assert all(comp(j,j+r,1,3)==1 for j in range(L-r))
    for i in range(3):
        src=i*s; mid=(i+2)*s; dest=i*s+r
        assert comp(src,mid,1,i)==1, (r,s,i,'lost image')
        assert comp(mid,dest,1,i)==0, (r,s,i,'no collision')
        assert comp(src,dest,1,i)==0
    return L,zeros

def independent(r,s):
    L,zeros=build(r,s)
    for c in range(3):
        for j in range(L-r):
            assert len(zeros[c].intersection(range(j,j+r)))>0, (r,s,c,j)
    for i in range(3):
        assert not zeros[i].intersection(range(i*s,(i+2)*s))
        assert zeros[i].intersection(range((i+2)*s,i*s+r))
    return True

SAMPLES=[(5,2),(8,3),(7,3),(9,4),(10,4),(11,4),(12,5),(13,5),(21,8),(31,12)]
for r,s in SAMPLES:
    L,zeros=direct(r,s)
    assert independent(r,s)
    print(f'(r,s)=({r},{s}) L={L} windows={L-r} zero_edges={sorted(map(sorted, zeros))}: PASS')
print(f'PASS: {len(SAMPLES)} finite combinatorial instances, two independent checkers; untouched fourth-coordinate nonzero controls. No original-sphere GRID existence checked.')
