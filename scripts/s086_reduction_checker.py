#!/usr/bin/env python3
"""Finite diagnostics, NOT proof of all choices, arbitrary real diagrams or originality."""
import hashlib,json,sys
def mul(a,b,n):
    bits=0
    mask=(1<<n)-1
    while b:
        i=(b&-b).bit_length()-1
        bits ^= a<<i
        b &= b-1
    return bits&mask
def f(n,m,degree):
    if degree < 1:return 0
    if m==1:return 1 if degree%2 else 1<<(n-2)
    return 0 if degree%2 else 1<<(n-1-m)
def d(n,degree):
    if degree<1:return 0
    return 1<<1 if degree%2 else 1<<(n-1)
def derivative(n,m,degree):
    return mul(d(n,degree-1),f(n,m,degree),n)^mul(f(n,m,degree-1),d(n,degree),n)
def compose(n,m1,m2,degree):
    return mul(f(n,m1,degree-1),f(n,m2,degree),n)
out=[]
for n in (4,5,6,8,12,16):
    check=0
    for m in range(2,n):
        for degree in range(2,65):
            lhs=derivative(n,m,degree)
            rhs=0
            for a in range(1,m):rhs ^= compose(n,m-a,a,degree)
            assert lhs==rhs,(n,m,degree,lhs,rhs)
            check+=1
    w=0
    for r in range(1,n): w^=compose(n,n-r,r,2)
    assert w==1, (n,w)
    reduced=[]
    for power in range(1,n-1):
        mask=(1<<power)-1
        assert all(compose(n,1,1,degree)&mask==0 for degree in range(2,65))
        assert f(n,1,1)&mask==1
        reduced.append(power)
    out.append(dict(N=n,checked_defining_equations=check,terminal_W_degree2=w,strict_reduction_modulus_powers=reduced))
report={'scope':'selected canonical f_m, degrees 2..64; quotient x^2 mod t^m; all-choice and real models NOT checked','results':out,'python':sys.version.split()[0]}
raw=json.dumps(report,sort_keys=True,separators=(',',':')).encode()
print(json.dumps(report,indent=2))
print('JSON_SHA256',hashlib.sha256(raw).hexdigest())
print('SCRIPT_SHA256',hashlib.sha256(open(__file__,'rb').read()).hexdigest())
