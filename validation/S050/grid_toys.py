#!/usr/bin/env python3
"""S050 pre-registered finite toy test: every id/zero arrow assignment on interval diagrams.
Scope: L=10,r=5, 2^9 assignments; L=15,r=8, 2^14 assignments.
All nonterminal vertices are pointed [0,1], terminal vertex is a point.
Internal arrows are identity or constant zero; both are weak equivalences.
Checker A folds arrow functions on exact sample inputs {0,1}.
Checker B uses independent bit-interval (any zero arrow => composite zero).
This cannot test the fixed sphere weak-equivalence zigzag or dHI.
"""
from itertools import product
from fractions import Fraction
from math import gcd


def folded_is_zero(bits, j, r):
    vals=[0,1]
    for h in range(j,j+r):
        vals=[0 for v in vals] if bits[h] else vals[:]
    return vals==[0,0]


def mask_is_zero(bits,j,r):
    return bool(sum(bits[j:j+r]))


def solve(L,r,primary):
    count=0
    examples={j:None for j in range(L-r) if j not in primary}
    for bits in product((0,1),repeat=L-1):
        zero=[folded_is_zero(bits,j,r) for j in range(L-r)]
        assert zero==[mask_is_zero(bits,j,r) for j in range(L-r)]
        if all(zero[j] for j in primary):
            count+=1
            for j in examples:
                if not zero[j] and examples[j] is None:
                    examples[j]=[i for i,v in enumerate(bits) if v]
    return count, examples

n5,e5=solve(10,5,(0,2,4))
assert e5[1] is not None and e5[3] is not None
print('GRID5 toy assignments satisfying j0,j2,j4:',n5)
print('GRID5 primary equations not sufficient; j1 witness zero-arrow indices:',e5[1])
print('GRID5 primary equations not sufficient; j3 witness zero-arrow indices:',e5[3])

n8,e8=solve(15,8,(0,3,6))
assert all(v is not None for v in e8.values())
print('GRID8 toy assignments satisfying j0,j3,j6:',n8)
for j in sorted(e8):
    print('GRID8 primary equations not sufficient; j%s witness zeros:'%j,e8[j])

for s in range(1,17):
    for r in range(2*s+1,3*s):
        if gcd(r,s)!=1:continue
        L=5*s
        for i in range(3):
            start=i*s
            end=start+r
            mid=(i+2)*s
            assert start<L-r and mid<end<(i+3)*s<=L
        print('grid tail triple:',r,s,'tail',r-2*s,'within stage length',s)
print('PASS two independent finite toy checkers; rational tail indexing for s<=16.')
