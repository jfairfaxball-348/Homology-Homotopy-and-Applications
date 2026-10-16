"""Exact preregistered 30-path diagnostic; not a proof of the metric theorem."""
import json, sys
from itertools import product
# A path is its increasing vertex list. Empty path at i is (i,).
paths=[]
for i in range(5):
 def extend(p):
  paths.append(p)
  for j in range(p[-1]+1,min(5,p[-1]+4)):
   extend(p+(j,))
 extend((i,))
paths.sort(key=lambda p:(p[0],p[-1],len(p),p))
def deg(p): return len(p)-1-(p[-1]-p[0])
def diff(p):
 s=set()
 for k in range(len(p)-1):
  for j in range(p[k]+1,p[k+1]):
   q=p[:k+1]+(j,)+p[k+1:]
   if q in s:s.remove(q)
   else:s.add(q)
 return s
assert len(paths)==len(set(paths))==30
for p in paths:
 s=set()
 for q in diff(p):s.symmetric_difference_update(diff(q))
 assert not s
end={d:[p for p in paths if p[0]==0 and p[-1]==4 and deg(p)==d] for d in (-3,-2,-1,0)}
c={(0,1,4),(0,2,4),(0,3,4)}
assert len(end[-2])==3 and not end[-3]
s=set()
for p in c:s.symmetric_difference_update(diff(p))
assert not s
cycles=[]
for bits in product((0,1),repeat=3):
 s=set()
 for bit,p in zip(bits,end[-2]):
  if bit:s.symmetric_difference_update(diff(p))
 if not s:cycles.append(bits)
assert cycles==[(0,0,0),(1,1,1)]
for span in (2,3):
 for i in range(5-span):
  gs=[p for p in paths if p[0]==i and p[-1]==i+span and deg(p)==1-span]
  assert gs==[(i,i+span)] and diff(gs[0])
print(json.dumps({'python':sys.version.split()[0],'basis':len(paths),'degree_dimensions':{str(d):sum(deg(p)==d for p in paths) for d in (0,-1,-2)},'endpoint_basis':{str(d):v for d,v in end.items()},'endpoint_d_minus2_columns':[[int(q in diff(p)) for q in end[-1]] for p in end[-2]],'endpoint_kernel':cycles,'checks':'d^2 all 30; c closed nonboundary; primary/secondary uniqueness PASS'},indent=2))
