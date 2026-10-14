#!/usr/bin/env python3
from fractions import Fraction as Q
import hashlib
es=[Q(x,4) for x in range(0,9)]
def stage(t):
    return -1 if t<0 else min(4,int(t))
lines=[]
for e in es:
    hits=[]
    for i in range(4):
        for k in range(8):
            t=Q(i,1)+Q(k,8)
            j=stage(t+2*e)
            if j<4:
                hits.append((i,j))
    lengths=sorted(set(j-i for i,j in hits))
    lines.append(f"epsilon={e}: nonterminal edges={sorted(set(hits))}; lengths={lengths}")
report="\n".join(lines)+"\n"
print(report,end="")
print("SHA256",hashlib.sha256(report.encode()).hexdigest())
