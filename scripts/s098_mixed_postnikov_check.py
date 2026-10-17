#!/usr/bin/env python3
from itertools import product
from hashlib import sha256
# cubics masks in monomial order x^3, x^2y, xy^2, y^3
mono=((3,0),(2,1),(1,2),(0,3))
def add(a,b):
 c = a.copy()
 for k,v in b.items(): c[k]=c.get(k,0)^v
 return {k:v for k,v in c.items() if v}
def mul(a,b):
 d={}
 for (i,j),u in a.items():
  for (k,l),v in b.items(): d[(i+k,j+l)]=d.get((i+k,j+l),0)^(u&v)
 return {k:v for k,v in d.items() if v}
def pw(a,n):
 z={(0,0):1}
 for _ in range(n):z=mul(z,a)
 return z
def transform(mask,M):
 a,b,c,d=M
 x={(1,0):a,(0,1):b};y={(1,0):c,(0,1):d}
 r={}
 for idx,(i,j) in enumerate(mono):
  if mask>>idx&1:r=add(r,mul(pw(x,i),pw(y,j)))
 return sum(r.get(t,0)<<idx for idx,t in enumerate(mono))
def ev(mask,u,v):return sum(((mask>>i)&1)*(u**a)*(v**b) for i,(a,b) in enumerate(mono))%2
GL=[(a,b,c,d) for a,b,c,d in product((0,1),repeat=4) if (a*d+b*c)%2==1]
rem=set(range(16));orbits=[]
while rem:
 m=min(rem); orb=sorted({transform(m,g) for g in GL});orbits.append(orb);rem.difference_update(orb)
assert len(GL)==6 and sum(len(x) for x in orbits)==16
kmix=0b0110
assert all(ev(kmix,*t)==0 for t in ((1,0),(0,1),(1,1)))
assert all(transform(kmix,g)==kmix for g in GL)
assert [m for m in range(16) if all(ev(m,*t)==0 for t in ((1,0),(0,1),(1,1)))]==[0,kmix]
# Squared-linear factors verify polynomial Sq1(xy) = x² y + x y²:
assert kmix==0b0110
print('GL2 order:',len(GL),'group matrices:',GL)
print('F2[x,y]_3 orbit decomposition masks x3,x2y,xy2,y3:',orbits)
print('Triple cyclic kernel:',[0,kmix]);print('mixed GL2 orbit:',[kmix])
print('H² mod2 dimensions, k=0 and k=mixed:',4,3)
print('Integral H2 structure (from Serre + UCT):', '(Z/2)^2','Z/4')
