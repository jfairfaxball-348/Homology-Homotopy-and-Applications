from fractions import Fraction
from math import floor,gcd
from hashlib import sha256
# Finite (not topology) checks: grid transfer δ=5/2 to 8/3 and
# cofinal rational sequence m=1..8; independently verify tabulated types.
def stage(j,s): return min(5,j//s)
# All C_j in target grid must factor through an endpoint five-step constant.
A=[]
for j in range(7):
 a=(2*j)//3; b=(2*(j+8))//3
 assert b-a>=5 and 0<=a<5
 assert stage(j,3)==stage(a,2)
 assert stage(j+8,3)==stage(b,2)
 A.append((j,a,b,b-a,stage(j,3),stage(j+8,3)))
print('endpoint-to-4/3 transfer:',A)
for m in range(1,9):
 r,s=10*m+1,4*m
 assert gcd(r,s)==1
 eps=Fraction(r,2*s)
 assert eps==Fraction(5,4)+Fraction(1,8*m)
 assert 5*s-r==10*m-1
 types={}
 for j in range(5*s-r):
  pair=(stage(j,s),stage(j+r,s));types[pair]=types.get(pair,0)+1
 assert set(types)=={(0,2),(0,3),(1,3),(1,4),(2,4)}
 print('m',m,'eps',eps,'L',5*s,'r',r,'constraints',5*s-r,'types',sorted(types.items()))
# Test stage pattern from explicit rational samples for δ in (5/2,3)
for delta in (Fraction(251,100),Fraction(8,3),Fraction(14,5),Fraction(299,100)):
 typ=set()
 for j in range(2000):
  t=Fraction(j,500)
  if t>=5-delta:break
  typ.add((int(t),int(t+delta)))
 assert typ=={(0,2),(0,3),(1,3),(1,4),(2,4)}
 print('delta',delta,'types',sorted(typ))
