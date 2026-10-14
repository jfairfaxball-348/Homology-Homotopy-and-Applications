from fractions import Fraction
from math import floor
from hashlib import sha256

# Scope declared before execution: four rational epsilons and all discrete cut
# representatives plus midpoints on the 1/(12s) sample mesh within [0,5).
# This is NOT an exhaustive search for GRID K or a topology certificate.
for ep in (Fraction(5,4), Fraction(4,3), Fraction(7,5), Fraction(3,2)):
    delta=2*ep
    r,s=delta.numerator,delta.denominator
    L=5*s
    forced=tuple(k for k in range(L) if k+r<L)
    for a in range(120*s):
        t=Fraction(a,24*s)
        assert floor(s*(t+delta)) == floor(s*t)+r
    assert len(forced)==max(0,L-r)
    print(f'epsilon={ep}; delta={delta}; L={L}; r={r}; nontrivial constant constraints={len(forced)}; sampled shift PASS')
