"""Bounded symbolic certificate, not a topological GRID search.
Scope preregistration: (L,r)=(10,5),(15,8); every individual
window relation checked independently using interval id/zero arrows.
Checker A: explicit function composition on the two-point test set {0,1}.
Checker B: boolean window hitting test. K_L is literal point.
"""
import hashlib
for L,r in ((10,5),(15,8)):
    m=L-r
    for target in range(m):
        zeros={i for i in range(L-1) if not (target <= i < target+r)}
        satisfied=[]
        for j in range(m):
            u=[0,1]
            for edge in range(j,j+r):
                if edge in zeros:
                    u=[0,0]
            checkA=(u==[0,0])
            checkB=bool(zeros.intersection(range(j,j+r)))
            assert checkA==checkB
            satisfied.append(checkA)
        assert satisfied==[j!=target for j in range(m)]
    print(f'L={L} r={r} independent={m} test_cases={m*m} status=PASS')
print('All bounded toy checks passed; no sphere/topology WE existence was tested.')
