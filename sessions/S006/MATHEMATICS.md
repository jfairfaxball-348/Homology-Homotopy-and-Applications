# S006 mathematical dossier — exact zero-d2 iff and universal top-degree torsion balance

Status: INTERNAL HUMAN-READABLE PROOFS, not Lean, not external novelty-certified. T16–T17 extend S005 without inserting an illegitimate cross-grade component-membership equation.

## Setup and cover assumptions
Let P={00,10,01,11} with 10 and 01 incomparable. A,B are arbitrary commuting finite-rank free-Z group squares; M:B⇒A is any natural transformation. An admissible realization means finite based connected CW subcomplexes of total dimension at most 3 with X_p=U1,p∪U2,p∪U3,p, all named grades meet-exact, U2,p,U3,p and all pairwise overlaps contractible, T_p=U1,p∩U2,p∩U3,p connected and reduced H1(T_p)=B_p only, U1,p reduced H2(U1,p)=A_p only, natural integral Cech–Mayer–Vietoris d2=M. No synchrony of U_i,p∩U_j,q for p<q is assumed. For a diagram G set delta_G=(g_10,-g_01):G00→G10⊕G01. When delta_G injective, D_G=coker(delta_G) and lambda_G:D_G→G11 is the canonical amalgam induced by commuting upper maps.

## Lemma L1: top-dimensional CW inclusion is a primitive injection
If L⊂K are CW subcomplexes and dim K≤n, the induced H_n(L;Z)→H_n(K;Z) is injective with torsion-free quotient. Indeed B_n(K)=B_n(L)=0. H_n(K) consists of n-cycles in the free cellular C_n(K); similarly H_n(L)=H_n(K)∩C_n(L). Since C_n(L) is the direct summand spanned by a subset of K's n-cells, H_n(K)/H_n(L) embeds into C_n(K)/C_n(L), a free abelian group. This is S003-T6, used for the TOTAL X spaces, not for mixed overlaps.

## Lemma L2: functorial cover homology in degrees 2 and 3
The reduced Cech/MV spectral sequence of each specified three-cover has E1 nonzero only at (0,2)=A_p and (2,1)=B_p (and the connected H0 row which is the acyclic 2-simplex). The unique potentially nonzero differential is d2=M_p. Its 2-column filtration yields natural integral isomorphisms
H3(X_p;Z)=K_p:=ker M_p,    H2(X_p;Z)=C_p:=coker M_p,
and all other reduced groups vanish. There is no hidden extension in either total degree, since exactly one graded piece survives each. Naturality is for inclusions of the complete X_p and natural M, and does not require equality of differently labelled cross-grade intersections.

## Lemma L3: latching union of complete spaces
Put F=X10∪X01 inside X11, with X10∩X01=X00 as a literal CW subcomplex. Apply integral Mayer–Vietoris to these three complete spaces. Since each X_p is at most three-dimensional and F also at most 3D, H4(F)=0. Hence delta_K:K00→K10⊕K01 is injective, and MV supplies a short exact sequence
0→D_K=coker delta_K → H3(F) → E:=ker(delta_C:C00→C10⊕C01)→0.   (*)
By L1, H3(F) includes primitively in H3(X11)=K11. In particular H3(F) is free, D_K embeds in that free group and is free; thus delta_K is SPLIT INJECTIVE (not just injective). Its map D_K→K11 in this inclusion is exactly lambda_K by MV naturality, hence lambda_K is injective.

Let Q=K11/H3(F). L1 gives Q free. Quotienting H3(F) by D_K and using (*) gives
0→E→coker(lambda_K)→Q→0.   (**)
As Q is free, this sequence splits (noncanonically). Therefore Tor(coker lambda_K)≅Tor(E), as finite torsion abelian groups. Even when E is not free, no false general B graph necessity is inferred. If C00 is torsion-free then E⊂C00 is torsion-free, so lambda_K has torsion-free cokernel and is primitive. More generally torsion-free ker delta_C suffices. NOTE: the inclusion of D_K in H3(F) need not be primitive if E has torsion: the theorem asserts no stronger statement.

## S006-T17: universal kernel latching/torsion theorem
For EVERY admissible total-3D meet-exact cover and EVERY integral natural M as above:
(a) lower arrows K00→K10 and K00→K01 are split injections by L1 on X00⊂X10 and X00⊂X01;
(b) delta_K is a split injection;
(c) lambda_K:D_K→K11 is injective;
(d) Tor(coker lambda_K)≅Tor(ker delta_C). In particular, if C00 is torsion-free, lambda_K is a split injection and the whole kernel square K is graph-admissible.
Proof: L1–L3. This is strictly stronger than S005's rejected U2-component mixed-grade argument, and does not imply that original B (rather than kernel B→A) is graph-admissible for nonzero M.

## S006-T16: COMPLETE 3D iff for identically zero transgression
Under the setup, now assume M_p=0 at all four grades. Then K=B and C=A as natural diagrams. The following are equivalent:
(i) an admissible strict meet-exact dimension≤3 three-cover realises A,B and M=0;
(ii) delta_A:A00→A10⊕A01 is split injective, BOTH bottom B maps are split injective, and lambda_B:(B10⊕B01)/delta_B B00→B11 is a split injection (the S004-T8 graph-admissible condition).

Necessity: S005-T12/T13 show delta_A must split inject irrespective of B,M. T17 applied with K=B,C=A shows both B lower maps and delta_B split inject. Because delta_A injective, E=ker delta_A=0 in (*), hence H3(F)=D_B and (**) says coker lambda_B=Q free. Therefore lambda_B is primitive and injective. No equality concerning U2,p∩P_q was invoked. Sufficiency: the explicit finite CW construction S005-T13 works for every B graph-admissible, every joint-primitive A, and every natural M, in particular M=0. Its actual dimension≤3 and all named literal meets are part of the inherited detailed construction. This proves the stated equivalence for ALL zero-transgression diagrams, including B and A zero ranks and nonsplit individual A maps.

## Concrete demanded test, settled negatively with no extra hypotheses
Take A_p=0 and M_p=0 throughout, B00=0, B10=B01=Z, B11=Z², upper B columns u=(1,0), v=(1,2). Here F=X10∪X01 has H3(F)=Z², and the inclusion H3(F)→H3(X11)=Z² is the matrix [u v] with determinant 2. L1 forces primitive image, contrary to index two. Thus NO such total-3D strict cover exists, EVEN IF triple intersections at grade 11 are two-dimensional mapping-cylinder spaces and even with anticipatory cross-component cells. The obstruction is global to X, not mixed incidence. If A has nonzero primitive joint lower maps but M=0, the same B remains impossible.

## Integral adversarial edge cases
- A bottom ×2 and ×3 (joint primitive), B graph-admissible, M=0: T16 predicts existence, despite nonsplit individual lower A. S005-T13 provides it. A top maps ×3 and ×2 commute.
- A bottom ×2 and ×4 (joint nonprimitive), B=0, M=0: T16 forbids existence by S005-T12 torsion in H2(U1 lower union).
- B bottom maps zero from B00=Z to B10=B01=0, all A=0,M=0: lambda not even defined as injection because delta_B has kernel; T17's required delta_B injectivity fails, forbidding 3D.
- Rank B00=0, both sides 0 and B11 arbitrary: graph admissible and delta_B=0→0 split, so T16 allows top generator births; no fake positivity assumption.
- For nonzero M, T17 constrains K=ker M, not B itself. Even an index-two lambda_K is only ruled out when ker delta_C has no torsion. If nonzero torsion exists, (**) demands matching torsion but DOES NOT construct a cover.
- Signs: delta_G=(g10,-g01), upper lambda sends [x,y] to top10(x)+top01(y); orientations change a unimodular sign only and do not affect primitive index.

## Independently checked S005-T13 dependencies
T12: if L⊂K, dim K≤3, H3(K)=0, H2(K) free, the LES H3(K,L)↪H2(L)→H2(K) and freeness of H3(K,L) imply H2(L) torsionfree; no false H2-inclusion injectivity. H3(L)=0 via top-degree injectivity. In A construction, V=Y10∪Y01 has H3=0 and H2=D_A free. The top wedge E11 and 3-cell attaching maps x_i−lambda_A(x_i) have relative H2 incidence [I;−lambda_A], injective, so H3(Y11)=0 and H2(Y11)=A11, EVEN if lambda_A is zero or nonprimitive. This is not a 4D mapping cylinder. All 2-sphere representatives are available by pi2≈H2 for simply connected V∨E11; relative cellular approximation fixes already-defined suspended generators. The earlier cone/cylinder construction uses a one-dimensional graph T, so cone P and Q are 2D, and cone over P and Q and mapping cylinder of the 2D suspension are 3D. For triple T dimension2 with nonprimitive B, this construction would instead create 4D pieces, and must NOT be advertised as a 3D sufficiency proof. No counterexample to the exact S005 restricted assertion was found in these symbolic checks.

## Limits / priority
T16 is a significant closure of the particular zero-M mathematical subproblem, NOT a complete all-M all-B three-dimensional criterion. T17 is a necessary obstruction only. Both derive from elementary integral MV, top-degree cellular saturation and S005 explicit CW construction. No independent original-publication equivalence proof, HHA consequence, named externally open problem, Lean or Palomar certificate. Do NOT call it a historic breakthrough or new publishable result.
