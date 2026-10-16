#!/usr/bin/env python3
"""S085 independent finite test, NOT proof of all choices, all real diagrams, or novelty."""
import json, hashlib
def test(N,limit=70):
 mask=(1<<N)-1
 def mul(a,b):
  z=0
  while b:
   if b&1:z^=a
   b>>=1;a<<=1
  return z&mask
 def d(n):return 0 if n<1 else (2 if n%2 else 1<<(N-1))
 def f(m,n):
  if n<1:return 0
  if m==1:return 1 if n%2 else 1<<(N-2)
  if not 2<=m<N:raise ValueError(m)
  return 0 if n%2 else 1<<(N-1-m)
 for m in range(1,N):
  for n in range(2,limit+1):
   lhs=mul(d(n-1),f(m,n))^mul(f(m,n-1),d(n))
   rhs=0
   for a in range(1,m):rhs^=mul(f(m-a,n-1),f(a,n))
   assert lhs==rhs,(N,m,n)
 for n in range(2,limit+1):
  w=0
  for a in range(1,N):w^=mul(f(N-a,n-1),f(a,n))
  assert w==1,(N,n)
 return {"N":N,"degrees_tested":[2,limit],"identities":(N-1)*(limit-1),"terminal_reduces_to_unit":True,"proof_scope":"FINITE_DIAGNOSTIC_ONLY"}
if __name__=="__main__":
 report=json.dumps([test(N) for N in (4,5,6,8,12)],sort_keys=True)
 print(report)
 print("sha256:",hashlib.sha256(report.encode()).hexdigest())
