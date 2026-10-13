#!/usr/bin/env python3
"""S030 finite exact mixed witnesses, not a universal theorem checker."""
from itertools import product
from hashlib import sha256
import json
import sympy as s
from sympy.matrices.normalforms import smith_normal_form
from sympy.polys.domains import ZZ

def le(x,y):return all(a<=b for a,b in zip(x,y))
def pts(m,n):return list(product(range(m),repeat=n))
def supports(m,n):
 p=pts(m,n); su={frozenset(x for x in p if le(u,x)) for u in p}; su|={frozenset(x for x in p if le(x,v)) for v in p}
 for i in range(n):
  for a in range(1,m-1):
   for b in range(a,m-1):su.add(frozenset(x for x in p if a<=x[i]<=b))
 return su

def main():
 res={}
 for m,n in [(3,2),(4,2),(4,3),(5,2)]:
  p=pts(m,n); top=(m-1,)*n; base=(0,)*n; sup=supports(m,n); expected=2*m**n-1+n*(m-2)*(m-1)//2
  assert len(sup)==expected
  blocks=[('U',tuple((i+j)%m for i in range(n)),None) for j in range(2)]
  blocks=[('U',u,frozenset(x for x in p if le(u,x))) for _,u,_ in blocks]
  blocks += [('U',base,frozenset(p)),('D',tuple(1 for _ in range(n)),frozenset(x for x in p if le(x,tuple(1 for _ in range(n)))))]
  for i in range(n):
   for a in range(1,m-1):
    for b in range(a,m-1):blocks.append(('B',(i,a,b),frozenset(x for x in p if a<=x[i]<=b)))
  active={x:[j for j,v in enumerate(blocks) if x in v[2]] for x in p}
  change={};inv={}
  for x in p:
   r=len(active[x]); E=s.eye(r)
   for j in range(r-1):E[j,j+1]=(-1)**(j+sum(x)) * (1+(j+sum(x))%3)
   change[x]=E;inv[x]=E.inv()
  def mapxy(x,y):
   ix={t:j for j,t in enumerate(active[y])}; a=s.zeros(len(active[y]),len(active[x]))
   for j,t in enumerate(active[x]):
    if t in ix: a[ix[t],j]=1
   return change[y]*a*inv[x]
  for i in range(n):
   F={}
   for c in range(0,m):
    for d in range(c,m):
     e=tuple(c if j==i else 0 for j in range(n));h=tuple(d if j==i else m-1 for j in range(n))
     F[c,d]=int(mapxy(e,h).rank())-int(mapxy(e,top).rank())
   for a in range(1,m-1):
    for b in range(a,m-1):
     inferred=F[a,b]-F[a-1,b]-F[a,b+1]+F[a-1,b+1]
     observed=sum(typ=='B' and inf==(i,a,b) for typ,inf,_ in blocks)
     assert inferred==observed, (m,n,i,a,b,inferred,observed)
  bad=[]
  for x in p:
   for y in p:
    if le(x,y):
     A=mapxy(x,y); D=smith_normal_form(A,domain=ZZ)
     if any(abs(int(D[j,j]))!=1 for j in range(min(D.rows,D.cols)) if D[j,j]!=0):bad.append((x,y))
  assert not bad
  res[f'{m}x{n}']={'vertices':len(p),'supports':len(sup),'mixed_blocks':len(blocks),'comparable_pairs':sum(le(x,y) for x in p for y in p),'interval_inversions':n*(m-1)*(m-2)//2,'all_smith_unit':True}
 out=json.dumps(res,sort_keys=True,indent=2);print(out);print('SHA256_OUTPUT='+sha256(out.encode()).hexdigest())
if __name__=='__main__':main()
