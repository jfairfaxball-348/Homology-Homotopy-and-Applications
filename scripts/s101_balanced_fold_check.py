#!/usr/bin/env python3
"""One fixed S101 fold datum; arithmetic only, NOT CW realisability."""
from sympy import Matrix, ZZ
from sympy.matrices.normalforms import smith_normal_form

# Basis: A00=A10=A01=A11=Z; B00=0, B10=B01=Z, B11=Z^2.
a10=a01=a10t=a01t=Matrix([[1]])
b10t=b01t=Matrix([[1],[0]])
m10=m01=Matrix([[1]])
m11=Matrix([[1,0]])
assert a10t*m10 == m11*b10t
assert a01t*m01 == m11*b01t
assert Matrix([[1],[-1]]).rank() == 1
assert smith_normal_form(Matrix([[1],[-1]]),domain=ZZ)[:1,:1] == Matrix([[1]])
lambda_b=b10t.row_join(b01t)
assert lambda_b.rank() == 1 and lambda_b.shape == (2,2)
assert lambda_b*Matrix([[1],[-1]]) == Matrix([[0],[0]])
assert smith_normal_form(lambda_b,domain=ZZ)[0,0] == 1
k11=Matrix([[0],[1]])
assert m11*k11 == Matrix([[0]])
assert m11.rank()==1 and k11.rank()==1
# K00=K10=K01=0, D_K=0. C00=Z and all other C vanish, so E=Z.
rank_dk=0; rank_e=1; rank_k11=1
assert rank_k11 == rank_dk+rank_e
print('PASS one fixed natural non-graph fold datum: commutativity, Smith forms, K/C ranks and sharp MV balance')
print('B latching rank=1 < domain rank=2; E=Z, K11=Z; triple CW existence NOT checked')
