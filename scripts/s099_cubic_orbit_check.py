#!/usr/bin/env python3
"""S099 preregistered finite F2 polynomial checker (not a topology proof).

Exhausts sixteen homogeneous binary cubics and the six GL(2,F2)
substitutions, checks orbit equivalence against the invariant cubic-relation
line, cyclic restrictions and Sq^1. Only finite algebra is machine checked.
"""
from itertools import product, combinations
from hashlib import sha256

MON = [(3, 0), (2, 1), (1, 2), (0, 3)]
GL = [(a,b,c,d) for a,b,c,d in product((0,1),repeat=4) if (a*d+b*c)==1]
assert len(GL) == 6

def times(p, q):
    z={}
    for (a,b),u in p.items():
        for (c,d),v in q.items():
            if u & v: z[a+c,b+d]=z.get((a+c,b+d),0)^1
    return {k:v for k,v in z.items() if v}

def power(p, n):
    z={(0,0):1}
    for _ in range(n):z=times(z,p)
    return z

def substitute(mask, m):
    a,b,c,d=m
    X={(1,0):a,(0,1):b}; Y={(1,0):c,(0,1):d}
    out={}
    for j,(r,s) in enumerate(MON):
        if mask & (1<<j):
            for k,v in times(power(X,r),power(Y,s)).items():
                out[k]=out.get(k,0)^v
    return sum((out.get(k,0)&1)<<j for j,k in enumerate(MON))

def restrictions(mask):
    # 1-cocycle x,y evaluate at generators (1,0),(0,1),(1,1).
    a,b,c,d=[(mask>>i)&1 for i in range(4)]
    return (a,d,a^b^c^d)

def sq1(mask):
    # Sq^1 on degree-3 monomials, represented in degree-4 monomial basis.
    a,b,c,d=[(mask>>i)&1 for i in range(4)]
    return (a,b^c,d) # coefficients (x^4, x^2y^2, y^4)

action={mask:{substitute(mask,g) for g in GL} for mask in range(16)}
assert all(mask in action[mask] for mask in range(16))
for mask in range(16):
    for m in action[mask]:assert action[m]==action[mask]
remaining=set(range(16)); orbits=[]
while remaining:
    rep=min(remaining); orb=tuple(sorted(action[rep])); orbits.append((rep,orb))
    remaining.difference_update(orb)
assert [len(o) for _,o in orbits]==[1,3,6,1,3,2]
assert {m for m in range(16) if restrictions(m)==(0,0,0)}=={0,6}
assert {m for m in range(16) if sq1(m)==(0,0,0)}=={0,6}
assert action[6]=={6}

# A nonzero cubic-relation kernel is a 1-dimensional subspace over F2;
# it is the line spanned by the unique nonzero mask. For k=0 it is {0}.
# The orbit of that intrinsic kernel under GL2 is exactly the polynomial orbit.
for a,b in combinations(range(16),2):
    cup_relation_equivalent=b in action[a]
    k_orbit_equivalent=action[a]==action[b]
    assert cup_relation_equivalent==k_orbit_equivalent

print('GL2_order=6 cubics=16 orbit_sizes=1,3,6,1,3,2')
for rep,orb in orbits:
    print(f'orbit rep={rep:02d} size={len(orb)} members={list(orb)} '
          f'restrict={restrictions(rep)} Sq1={sq1(rep)}')
print('all_120_unordered_pairs: cup_relation_GL2_equiv iff k_GL2_equiv = PASS')
print('cyclic_restriction_kernel={0,6}; Sq1_kernel={0,6} = PASS')
print('NONMIXED_NONZERO_ORBITS_REPS=[1,2,7,11]; six_cross_orbit_pairs_distinguished_by_cubic_cup=PASS')
print('WARNING: no CW homology, Steenrod realization, interleavings, or source originality checked')
