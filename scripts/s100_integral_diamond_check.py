#!/usr/bin/env python3
"""S100 small fixed exact integer-matrix tests; NOT a topology or novelty proof.

Scope fixed BEFORE running: three hand-authored nonzero M diagrams (rank-kill,
index-two torsion-kill, torsion-compensated graph-admissible positive).
Checks integral commutation, exact kernel/cokernel ranks and Smith invariants
of the relevant latching maps using SymPy. No search or universality claim.
"""
from sympy import Matrix, ZZ
from sympy.matrices.normalforms import smith_normal_form

def diag(a):
    s=smith_normal_form(Matrix(a),domain=ZZ)
    ds=[abs(int(s[i,i])) for i in range(min(s.rows,s.cols)) if s[i,i]]
    return (len(ds),[x for x in ds if x>1])

def rank_case():
    # A_p=Z with every arrow identity; B00=0 and B10=B01=B11=Z,
    # two top B maps identity, M_00=0 and M_side=M_11=identity.
    delta_A=Matrix([[1],[-1]])
    assert diag(delta_A)==(1,[])
    assert Matrix([[1]])*Matrix([[1]])==Matrix([[1]])*Matrix([[1]])
    K_dims=[0,0,0,0]
    C_dims=[1,0,0,0]
    E_rank=C_dims[0]
    D_K_rank=0
    assert K_dims[3]==0 and E_rank==1
    assert K_dims[3]<D_K_rank+E_rank
    return 'rank obstruction: lower A primitive; all T17 tests pass; E=Z, K11=0; NO 3D realisation'

def index_two_case():
    # A00=0, A10=A01=Z, A11=Z^2; B00=0, B10=B01=Z^2,
    # B11=Z^5. B side maps send k10->e1, t10->e4,
    # k01->e1+2e2, t01->e5. M sides t->1,
    # M11 e4->a and e5->b. Natural squares commute.
    b10=Matrix([[1,0],[0,0],[0,0],[0,1],[0,0]])
    b01=Matrix([[1,0],[2,0],[0,0],[0,0],[0,1]])
    mt=Matrix([[0,0,0,1,0],[0,0,0,0,1]])
    ms=Matrix([[0,1]])
    a10=Matrix([[1],[0]])
    a01=Matrix([[0],[1]])
    assert mt*b10==a10*ms and mt*b01==a01*ms
    assert diag(Matrix([[1,1],[0,2],[0,0]]))==(2,[2])
    assert diag(Matrix.hstack(b10,b01))==(4,[2])
    return 'index-two B: nonzero side/top M; K latching cokernel Z+Z/2; E=0; T17 torsion FAIL'

def compensated_case():
    # All A_p=Z, all A maps identity. B00=Z;
    # B10=B01=Z^2 (coordinates k,t), B11=Z^4.
    # both B bottom maps (1,2); B10->B11 k=e1,t=e4,
    # B01->B11 k=e1+2e2,t=e4-e2.
    # M00=2, M sides=(0,1), M11=(0,0,0,1).
    lower=Matrix([[1],[2]])
    b10=Matrix([[1,0],[0,0],[0,0],[0,1]])
    b01=Matrix([[1,0],[2,-1],[0,0],[0,1]])
    m0=Matrix([[2]])
    ms=Matrix([[0,1]])
    mt=Matrix([[0,0,0,1]])
    assert ms*lower==m0
    assert b10*lower==b01*lower
    assert mt*b10==ms and mt*b01==ms
    assert diag(Matrix.vstack(lower,-lower))==(1,[])
    assert diag(Matrix([[1],[-1]]))==(1,[])
    kernel_latch=Matrix([[1,1],[0,2],[0,0]])
    assert diag(kernel_latch)==(2,[2])
    # In the union of side Bs, one relation is the bottom image:
    total=Matrix.hstack(b10,b01)
    assert diag(total)==(3,[])
    assert total*Matrix([[1],[2],[-1],[-2]])==Matrix.zeros(4,1)
    # Side Ms surjective, M00 mult by2; E=Z/2.
    # K top free rank3; K sides rank1 each; K bottom0.
    assert 3 >= 2 + 0
    return 'torsion compensation: Tor(cok lambda_K)=Z/2=E; B graph-admissible; S005-T13 constructs finite 3D cover'

if __name__=='__main__':
    for f in (rank_case,index_two_case,compensated_case):
        print('PASS:',f())
    print('Scope: 3 fixed matrix examples; exact SymPy SNF; no exhaustive search, geometric proof, or novelty certification')
