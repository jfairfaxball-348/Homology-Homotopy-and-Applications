#!/usr/bin/env python3
"""S092 bounded exhaustive B=F2[t]/t^2 arithmetic, NOT a proof of topology or novelty."""
from itertools import product

def mul(a,b):
    return ((a&1)*(b&1)) | (((((a&1)*(b>>1))^((a>>1)*(b&1)))&1)<<1)
t=2
assert mul(t,t)==0
three=[(u,v) for u,v in product(range(4),repeat=2)
       if mul(t,u)==t and (mul(u,t)^mul(t,v))==t and mul(v,t)==t]
two=[u for u in range(4) if mul(t,u)==t and mul(u,t)==t]
assert three==[]
assert two==[1,3]
def mm(a,b):
    return tuple(tuple(sum(a[i][k]*b[k][j] for k in range(2))%2 for j in range(2)) for i in range(2))
def add(a,b):
    return tuple(tuple(a[i][j]^b[i][j] for j in range(2)) for i in range(2))
T=((0,0),(1,0))
mats=[((a,b),(c,d)) for a,b,c,d in product(range(2),repeat=4)]
field=[(h0,h1) for h0 in mats for h1 in mats
       if mm(T,h0)==T and add(mm(h0,T),mm(T,h1))==T and mm(h1,T)==T]
assert len(field)==8
print("PASS: B-homotopies 3term=0; 2term=2; field-homotopies 3term=8")
