#!/usr/bin/env python3
"""S094 finite Fp[t]/t^p chain top-cell unit and lens nonsquare witnesses.
Checks algebra only, NOT CW attachment topology, HI metric or original-paper novelty.
Finite complete polynomial coefficient verification for declared small primes.
"""
from math import comb
for p in (5, 13, 17, 29):
    squares = { (i*i) % p for i in range(1, p) }
    assert (p-1) in squares
    q = next(i for i in range(2,p) if i not in squares)
    # g=1+t; U_q=(g^q-1)/(g-1)=sum_{j<q}(1+t)^j mod t^p
    u = [0]*p
    for j in range(q):
        for i in range(j+1):
            u[i]=(u[i]+comb(j,i)) % p
    assert u[0] == q % p and u[0]!=0
    inv=[0]*p
    inv[0]=pow(u[0], -1, p)
    for i in range(1,p):
        inv[i]=(-inv[0]*sum(u[j]*inv[i-j] for j in range(1,i+1)))%p
    prod=[sum(u[j]*inv[i-j] for j in range(i+1))%p for i in range(p)]
    assert prod == [1]+[0]*(p-1)
    assert q not in squares
    print(f"p={p}: nonsquare q={q}; unit U_q(0)={u[0]}; inverse coefficients verified in B")
print("PASS: 4 primes; exact bounded local ring algebra and quadratic residue tests ONLY")
