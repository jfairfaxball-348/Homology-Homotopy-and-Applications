#!/usr/bin/env python3
"""Finite exact stage-index check ONLY; cannot certify Toda or derived arrow mapping spaces."""
from fractions import Fraction as F

def ylevel(t):
    return 'empty' if t < 0 else 'point'

def level(t):
    if t < 0: return 'empty'
    if t >= 4: return 'point'
    return int(t)

for eps in (F(1), F(5,4), F(1499,1000), F(3,2), F(2)):
    t0,t1=F(0),F(1)
    assert (level(t0),level(t1))==(0,1)
    dest=(level(t0+2*eps), level(t1+2*eps))
    mid=(ylevel(t0+eps),ylevel(t1+eps))
    assert mid==('point','point')
    if F(1)<=eps<F(3,2): assert dest==(2,3)
    print(f'eps={eps} source=(0,1) Yshift={mid} X2shift={dest}')
# Indeterminacy quotient of nonzero Toda element: pi_5(S^3)=Z/2,
# supplied original LS2023 Prop3.12 certifies nonzero bracket; this DOES NOT COMPUTE it.
print('PASS exact floor/stage test; homotopy/Toda assertion SOURCE-DEPENDENT, NOT COMPUTED')
