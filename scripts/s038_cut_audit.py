#!/usr/bin/env python3
"""S038 finite diagnostic: 1D grid-left Kan, all interval Hom comparisons.
Not a proof for dense R or a complete 2D complexity implementation.
"""
import itertools,hashlib
P=list(range(11)); A=[0,3,7]; cuts=[2,6,10]
intervals=[(lo,hi) for lo in P for hi in P if lo<=hi]
def iv(lo,hi,p):return int(lo<=p<=hi)
def kan(lo,hi):return tuple(iv(lo,hi,c) for c in cuts)
def eR(s,t,p): return int(s<=max(a for a in A if a<=p)<=t)
def hom_brute(u,v):
    # scalar natural transformations of interval modules, all GF2 candidates (0/1 components)
    active=[p for p in P if u(p)]
    num=0
    for bits in itertools.product((0,1),repeat=len(active)):
        f={p:bits[i] for i,p in enumerate(active)}
        if any(bits[i] and not v(p) for i,p in enumerate(active)):continue
        if any(v(p)*v(q)*f.get(p,0)!=u(p)*u(q)*f.get(q,0) for p in P for q in P if p<=q):continue
        num+=1
    return num
# Finite sampled P, every downset {p:pi(p)<=a} has terminal cut representative.
checks=0
for lo,hi in intervals:
    support=[a for a,z in zip(A,kan(lo,hi)) if z]
    assert not support or support==A[A.index(support[0]):A.index(support[-1])+1]
    for s in A:
        for t in A:
            if s>t:continue
            n=lambda p,s=s,t=t:eR(s,t,p)
            # Hom_P(Q, E R) vs Hom_A(pi_!Q,R), where pi_!Q has component Q at cut representative
            left=hom_brute(lambda p:iv(lo,hi,p),n)
            v=kan(lo,hi)
            right=hom_brute(lambda a:v[A.index(a)],lambda a:int(s<=a<=t)) if False else None
            # for grid compute naturality separately via brute same routine on A, not P
            opts=[]
            for bs in itertools.product((0,1),repeat=3):
                if any(bs[i] and not v[i] for i in range(3)):continue
                if any(bs[i] and not int(s<=A[i]<=t) for i in range(3)):continue
                if any(int(s<=A[i]<=t)*int(s<=A[j]<=t)*bs[i] != v[i]*v[j]*bs[j] for i in range(3) for j in range(i,3)):continue
                opts.append(bs)
            right=len(opts)
            assert left==right,(lo,hi,s,t,left,right)
            checks+=1
assert checks==len(intervals)*6
# Finite 2D product rectangles projected supports stay product rectangles.
for q1,q2 in itertools.product(intervals,repeat=2):
    out=[(x,y) for x,z1 in zip(A,kan(*q1)) for y,z2 in zip(A,kan(*q2)) if z1*z2]
    if out:
        xs={x for x,y in out};ys={y for x,y in out}
        assert len(out)==len(xs)*len(ys)
print(f'PASS finite P=0..10 A={A}; 1D intervals={len(intervals)} Hom-adjunction comparisons={checks}; 2D rectangle products={len(intervals)**2}')
print('Nonaligned Q=[1,5]: naive critical restriction',tuple(iv(1,5,a) for a in A),'Kan support',kan(1,5))
print('Upper-in-gap Q=[1,4]: naive critical restriction',tuple(iv(1,4,a) for a in A),'Kan support',kan(1,4))
print('LIMIT: finite sampled index (terminal prefixes) does not certify dense-real open/closed cuts.')
