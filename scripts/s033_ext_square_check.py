#!/usr/bin/env python3
"""Independent finite low-cell arithmetic check; not a test of all homotopy groups."""
from math import gcd
import json
from sympy import Matrix, ZZ
from sympy.matrices.normalforms import smith_normal_form
out = []
for n in [2,3,4,6]:
 for a in range(n):
  # C4=Z -> C3=Z^2: vector (a,n), C2 has zero outgoing d3.
  d4 = Matrix([[a],[n]])
  D = smith_normal_form(d4, domain=ZZ)
  invariant = abs(int(D[0,0]))
  assert invariant == gcd(a,n)
  # F_p on degree-three chain is nonzero iff coefficient mod p is nonzero.
  out.append({'n':n,'class':a,'h3_cone_rank':1,'h3_cone_torsion':invariant,'F2_h3_edge_nonzero':(a%2)==1})
assert out[0]['h3_cone_torsion']==2 and out[1]['h3_cone_torsion']==1
print(json.dumps({'tests':len(out),'n2_classes':[x for x in out if x['n']==2], 'all_smith_gcd_checks':'PASS','scope':'integer cone differential only; topology is separately proved'},sort_keys=True))
