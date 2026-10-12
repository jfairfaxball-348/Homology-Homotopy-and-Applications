# S010-T27 — Polynomial arithmetic decision with an explicitly listed interval family

Internal derivation of a CLASSICAL finite-generator algorithm; not a solution of unrestricted LLO Problem1 and not claimed novel. The 2023/2024 primary literature already develops endomorphism-algebra relative resolutions and minimal covers.

## Input and exact result

Let P be a finite poset with N vertices and its cover relation given. Let k be a field with exact arithmetic and equality/zero tests at unit cost. Let X1,…,Xm be a DISTINCT explicitly listed family of nonempty convex connected thin interval modules, containing all principal upsets. Each support and 0/identity edge matrices are given; invalid/nonconvex/disconnected supports must be rejected. Let M be a diagram with d=sum_x dim M(x), given by vertex bases and edge matrices. This is expanded finite-poset input, not a compressed infinite R^n presentation or an implicit exponential interval universe.

One can decide relative X-projective dimension ≤1 using polynomially many field operations in N,m,d and the explicit matrices, by the following procedure. A deliberately loose bound is O((N+m+d+1)^22) arithmetic operations and polynomial storage. No rational bit-complexity claim, fast/scalable implementation or empirical benchmark is made.

## Top quotient for arbitrary W

Compute Hi(W)=Hom(Xi,W) by solving the edge naturality equations W_e f_x=f_y(Xi)_e. End(Xi)=k: an endomorphism has one scalar per supported vertex, and connectedness forces them equal. Distinct supports give pairwise nonisomorphic indecomposables. Put

Ri(W)=sum_{j≠i} span{f∘h : f∈Hom(Xj,W), h∈Hom(Xi,Xj)},
bi(W)=dim Hi(W)/Ri(W).

Compute bases and representatives fij for these quotient spaces by Gaussian elimination. Define PW=direct_sum_i Xi^{bi(W)} and cW:PW→W with components fij.

### Why this is a minimal relative cover

Let G=⊕Xi and A=End(G). The off-diagonal Hom blocks form rad A and A/rad A≅k^m. Here is the needed proof, avoiding an algorithmic radical black box. Any round trip Xi→Xj→Xi for i≠j is zero: if it were a nonzero scalar identity, Xi would split off Xj, which is indecomposable, contradicting distinctness. Products therefore cannot create nonzero diagonal terms from off-diagonal ones. More generally a nonzero composite path cannot repeat a summand index: the intervening nonzero endomorphism would make that summand split off its immediate distinct neighbour. Thus this off-diagonal ideal has m-th power zero. The diagonal quotient is k^m semisimple, so the ideal is exactly rad A.

Hom(G,W) is a right A-module by precomposition. Its i-th top is exactly Hi/Ri. The map Hom(G,PW)→Hom(G,W) hits a basis of this semisimple top. Its cokernel C satisfies C=C rad A and hence C=C(rad A)^m=0. Thus cW is surjective on Hom(Xi,-) for all i. Since representables are included, it is also pointwise surjective: Hom(k[↑x],W)=W(x). It is X-admissible.

The top of Hom(G,PW) has precisely bi copies at i, so its top map is an isomorphism. If cW u=cW for u∈End(PW), then Hom(G,u) acts as identity on top, and is invertible by finite-dimensional Nakayama (surjectivity on top implies surjective, hence bijective). Hom(G,-) is fully faithful on add(G): maps between sums of Xi are exactly their Hom matrices. Its inverse therefore comes from an inverse of u. This is right minimality.

Consequently W∈add(X) iff cW is an isomorphism. The reverse direction is immediate. If W∈add(X), the X-epimorphism cW splits since W is X-projective; a nonzero kernel summand would contradict right minimality. Equivalently the projective cover of the already-projective Hom(G,W) is an isomorphism. This covers zero W and duplicate-removal before computing tops.

## Length-one algorithm and correctness

1. Construct cM:PM→M by the top procedure. Compute K=ker cM pointwise, and restrict M's edge matrices to these kernel bases to obtain its exact diagram.
2. Construct cK:PK→K by the same procedure.
3. Answer YES iff dim PK(x)=dim K(x) for every x. Since cK is already pointwise onto, equal dimensions make it an isomorphism. On YES return 0→K→PM→M→0 with the isomorphism PK≅K.

S009 relative Schanuel proves pd_X M≤1 iff the kernel of ANY X-projective X-epimorphism to M lies in add(X). Apply to cM. Hence the algorithm's test is both necessary and sufficient, including pd0 and zero module. Merely matching arbitrary dimension vectors would be invalid: dimensions work here only AFTER proving this particular cK is an epimorphism. The sequence is Hom(Xi,-)-exact, not just pointwise exact.

## Polynomial size and cost

Write S=N+m+d+1. Initially dim Hom(Xi,M)≤d, dim Hom(Xi,Xj)≤N. Thus sum_i bi(M)≤md and total dimension PM≤Nmd≤S^3; K has total dimension w≤S^3. For an arbitrary W of total size w, naturality systems have ≤w unknowns per Xi and ≤N^2 w equations. Pairwise Xi→Xj systems have ≤N unknowns and ≤N^3 equations. Gaussian elimination computes these in polynomial arithmetic cost.

The Ri(W) spanning family has ≤m N w columns for each i, represented in ≤w coordinates; compositions involve at most polynomially many matrix entries on ≤N vertices. A crude direct enumeration/elimination bound is O(S^10(w+1)^4) for all Hom systems, products, quotients and cover/kernel matrix operations together (it dominates m^2 precomputation and rectangular elimination). At w≤S^3 this is O(S^22); the same O(S^22) is a safe envelope including support validity, duplicate removal, restrictions and bookkeeping. PK has total dimension ≤Nmw≤S^5, so explicit storage stays polynomial. This is an elementary arithmetic bound, no optimisation claimed.

If the whole interval family is implicit, m may be exponential in N. If k=Q, intermediate bit sizes require an additional bit analysis. If M is compressed by a sparse free presentation or a multifiltration, expanding it and an interval family may dominate the input. Therefore this does NOT settle Problem1 as printed for an arbitrary fixed infinite interval collection with compressed finitely presented input. It completes S009's black-box membership reduction only in the declared expanded/listed finite model.

## Priority decision

The endomorphism algebra route is explicitly discussed in Asashiba–Escolar–Nakashima–Yoshiwaki (2023), §3, and in Chachólski et al., Koszul Complexes… (published 2024), introduction and Theorem5.14 minimal-cover correspondence for thin families. The exact top quotient above is standard finite-dimensional projective-cover algebra. The generous complexity bound is an internal bookkeeping derivation, not proof of new priority. Route B is CLASSICAL/PRIOR-ART COLLISION; it is useful baseline mathematics, not the paper candidate.
