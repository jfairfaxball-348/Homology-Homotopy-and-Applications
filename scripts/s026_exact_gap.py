"""Exact rational proof dHI >= 1/145603 by no-event margin (not equality)."""
from fractions import Fraction
import json
E=Fraction(1,18200);d=Fraction(1,145603)
# q0: sqrt(1-E/2)+2d < 1
q0=(1-2*d)**2 > 1-E/2 and (1-2*d)>0
# q1: sqrt(1+E/2)+2d < sqrt(1+E)
# positive L=E/2-(2d)^2; L > 4d sqrt(1+E/2)
L=E/2-(2*d)**2
q1=L>0 and L**2>(4*d)**2*(1+E/2)
# heights remain 0 or 1 at all q, q+delta, q+2delta
ht=2*d<Fraction(1,2)
assert q0 and q1 and ht
print(json.dumps(dict(epsilon=str(E),enhanced_bound=str(d),old_bound='1/582400',lower_event_q0=q0,lower_event_q1=q1,height=ht,all='ARITHMETIC_PASS_ONLY'),sort_keys=True))
