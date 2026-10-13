#!/usr/bin/env python3
"""S025: exact ARITHMETIC ONLY for the two-parameter homotopy gap.
It does NOT validate the Hopf invariant/cofiber or prove journal originality.
"""
from fractions import Fraction as Q
import json
N=182
eps=Q(1,100*N)
eta=eps/32
assert eps==Q(1,18200) and eta==Q(1,582400)
classes=(1-eps,Q(1),1+eps)
rad_sq=(1-eps/2,1+eps/2)
assert min(abs(v-r) for v in classes for r in rad_sq)==eps/2
worst=8*eta+4*eta*eta
assert worst<eps/2
assert 2*eta<Q(1,2)
assert N*(N-1)//2==16471
print(json.dumps({'n':N,'num_pairs':16471,'epsilon':str(eps),
 'delta_lower_bound':str(eta),'max_square_radius_shift_bound':str(worst),
 'minimum_squared_threshold_gap':str(eps/2),
 'height_two_delta':str(2*eta),'claims':'ARITHMETIC_PASS_ONLY',
 'topology':'depends on previously proved S020-S023 classical Hopf and total-cofiber theory'},indent=2))
