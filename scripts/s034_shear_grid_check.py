#!/usr/bin/env python3
"""S034 exact finite binary shear-grid parity, distinct potential construction.
Finite combinatorics ONLY: not Postnikov proof or a new mathematical invariant.
Pre-registered scope: 3x3 vertices, twelve oriented nearest-neighbour edges,
four faces, enumerate exactly 2**12 labels, independently 2**8 potentials.
"""
import itertools, json
v=lambda i,j: 3*i+j
edges=[]
for i in range(3):
 for j in range(3):
  if i<2: edges.append((v(i,j),v(i+1,j)))
  if j<2: edges.append((v(i,j),v(i,j+1)))
lookup={e:i for i,e in enumerate(edges)}
faces=[]
for i in range(2):
 for j in range(2):
  a,b,c,d=v(i,j),v(i+1,j),v(i,j+1),v(i+1,j+1)
  faces.append(tuple(lookup[e] for e in ((a,b),(b,d),(a,c),(c,d))))
closed=set()
for assignment in range(1<<12):
 if all(sum((assignment>>e)&1 for e in face)%2==0 for face in faces):
  closed.add(assignment)
from_potentials=set()
for assignment in range(1<<8):
 potentials=(0,)+tuple((assignment>>k)&1 for k in range(8))
 pattern=sum((potentials[u]^potentials[w])<<k for k,(u,w) in enumerate(edges))
 from_potentials.add(pattern)
assert len(edges)==12 and len(faces)==4
assert len(closed)==len(from_potentials)==256 and closed==from_potentials
print(json.dumps(dict(vertices=9,edges=12,faces=4,assignments=4096,
  closed=len(closed),potentials=256,unique_potential_patterns=len(from_potentials),
  exact_set_agreement=True),sort_keys=True))
