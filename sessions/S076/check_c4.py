#!/usr/bin/env python3
"""Finite GF2[t]/t4 C4-jet checks. These DO NOT certify an infinite homotopy theorem."""
def mul(a,b):
    z=0
    for j in range(4):
        if b>>j & 1: z^=a<<j
    return z&15
def d(n): return (2 if n%2 else 8) if n>=1 else 0
def D(f,n): return mul(d(n-1),f.get(n,0))^mul(f.get(n-1,0),d(n))
def prod(f,g,n): return mul(f.get(n-1,0),g.get(n,0))
N=40
x={n:(1 if n%2 else 4) for n in range(1,N+1)}
h={n:(0 if n%2 else 2) for n in range(1,N+1)}
z={n:(0 if n%2 else 1) for n in range(1,N+1)}
for n in range(2,N+1):
    assert D(x,n)==0 and prod(x,x,n)==4
    assert D(h,n)==prod(x,x,n)
    assert D(z,n)==prod(x,h,n)^prod(h,x,n)
    assert prod(x,z,n)^prod(h,h,n)^prod(z,x,n)==1
print("EXPLICIT_40_DEGREES: PASS")
jets=[(a1,a2) for a1 in range(16) for a2 in range(16)
      if a1&1 and mul(2,a2)^mul(a1,8)==0]
assert len(jets)==16 and all(a2&7==4 for a1,a2 in jets)
print("ADJACENT_JETS: PASS 16")
prim=0
for a1,a2 in jets:
 for b1,b2 in jets:
  rhs=mul(b1,a2)
  found=0
  for h1 in range(16):
   for h2 in range(16):
    if mul(2,h2)^mul(h1,8)==rhs:
     found+=1; prim+=1
     assert h2&3==2
  assert found
assert prim==8192
print("PRIMARY_ALL_CHOICES: PASS",prim)
sec=0
for a1,a2 in jets:
 for b1,b2 in jets:
  rhs=mul(b1,a2)
  for h1 in range(16):
   for h2 in range(16):
    if mul(2,h2)^mul(h1,8)!=rhs:continue
    for j1 in range(16):
     rhs2=mul(b1,h2)^mul(j1,a2)
     assert rhs2&3==2
     for k2 in range(16):
      if any(mul(2,k2)^mul(k1,8)==rhs2 for k1 in range(16)):
       sec+=1
       assert k2&1
assert sec==524288
print("SECONDARY_ALL_CHOICES: PASS",sec)
print("TERMINAL_INVARIANT: PASS; finite jets only, NOT metric proof")
