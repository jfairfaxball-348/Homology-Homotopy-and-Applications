#!/usr/bin/env python3
"""S022 exact Gegenbauer 5D spherical-code obstruction; stdlib only."""
from fractions import Fraction as Q
from math import comb

# Coefficients in ascending powers, exact rational polynomial arithmetic.
def add(a,b):
    return [((a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0)) for i in range(max(len(a),len(b)))]
def scale(a,v): return [x*v for x in a]
def mul(a,b):
    c=[Q(0)]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c

p=[Q(1)]
for factor in ([1,1],[Q(1,2),1],[Q(1,2),1],[0,1],[0,1],[Q(-1,2),1]):
    p=mul(p, factor)
assert p==[0,0,Q(-1,8),Q(-3,8),Q(1,4),Q(3,2),Q(1)]

lam=Q(3,2)
C=[[Q(1)],[Q(0),2*lam]]
for n in range(1,6):
    # (n+1) C_{n+1} = 2(n+lambda) t C_n -(n+2lambda-1) C_{n-1}
    nextC=scale(add([Q(0)]+scale(C[n],2*(n+lam)),scale(C[n-1],-(n+2*lam-1))),Q(1,n+1))
    C.append(nextC)
cs=[]
remaining=p[:]
for k in range(6,-1,-1):
    lead=remaining[k] if k<len(remaining) else Q(0)
    coeff=lead/C[k][k]
    cs.insert(0,coeff)
    remaining=add(remaining,scale(C[k],-coeff))
assert all(x==0 for x in remaining)
assert cs==[Q(37,840),Q(11,168),Q(131,1980),Q(87,1540),Q(146,4095),Q(4,231),Q(16,3003)]
assert all(c>=0 for c in cs) and cs[0]>0
f1=sum(p)
assert f1==Q(9,4)
print('Gegenbauer dimension 5 coefficients:',[str(c) for c in cs])
print('f(1):',f1,'f0:',cs[0], 'bound:',f1/cs[0], 'floor:',(f1/cs[0]).numerator//(f1/cs[0]).denominator)
print('Induced star: source 72 triangles, high target singleton {a} adjacent to each, pairwise nonedges (from corrected S021 source graph).')
print('Consequence: 72 > 51 so no exact graph Euclidean R^d, d<=5.')
