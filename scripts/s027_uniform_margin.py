#!/usr/bin/env python3
"""S027: exact rational, finite test instances of the uniform radius/height margin.
The all-N proof is in sessions/S027/MATHEMATICS.md; these tests do not
construct simplicial approximations or certify integral AW products.
"""
from fractions import Fraction
import json


def check(N):
    assert N >= 5
    eps = Fraction(1, 100 * N)
    delta = eps / 16
    shift = 2 * delta
    # sqrt(1-eps/2)+shift < 1 (squaring with positive factors)
    low = (1 - shift) > 0 and (1 - shift)**2 > 1 - eps / 2
    # sqrt(1+eps/2)+shift < sqrt(1+eps)
    L = eps / 2 - shift**2
    upper = L > 0 and L**2 > (2 * shift)**2 * (1 + eps / 2)
    height = 2 * delta < Fraction(1, 2)
    gram = (N - 1) * eps < 1
    assert low and upper and height and gram
    return dict(N=N,epsilon=str(eps),delta=str(delta),lower=low,upper=upper,height=height,gram=gram)


for N in (5, 14, 182, 500, 2500):
    print(json.dumps(check(N), sort_keys=True))
print('S027_EXACT_RATIONAL_SAMPLE_MARGINS_PASS (symbolic proof separate)')
