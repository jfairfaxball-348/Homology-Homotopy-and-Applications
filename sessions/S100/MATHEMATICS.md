# S100 MATHEMATICS — missing free-rank obstruction, sharp 3-to-4 jump and torsion compensation

**Scope.** INTERNAL written mathematical proof, not formal certification, independent specialist review or journal novelty. Use exactly the S006 admissible strict meet-exact dimension-≤3 three-cover data: P={00<10<11,00<01<11}, degree-pure U1 with H2=A free and no other reduced homology, triple T with H1=B free only, contractible U2,U3 and pair overlaps, connected named spaces, M:B=>A actual natural integral Cech–MV d2. Let K_p=ker M_p, C_p=coker M_p, delta_G=(G00->G10,-G00->G01), D_K=coker delta_K and lambda_K:D_K->K11. Named complete X diagrams and all meet identities are literal CW inclusions. No mixed-grade membership equality assumed.

## T242 — necessary FULL FREE-RANK addition to the S006 T17 obstruction

**Theorem (necessary, every admissible total-dimensional-three cover):** delta_A must be split injective (S005 T12); delta_K is split injective, lambda_K is injective (S006 T17); and with E=ker(delta_C:C00->C10+ C01) there is an exact sequence
```
0 -> E -> coker(lambda_K) -> Q -> 0,   Q free abelian,
```
where Q=K11/H3(F), F=X10 union_(X00) X01, and every group is finite-generated. Consequently coker(lambda_K) is abstractly isomorphic to E plus a free summand, and
```
rank K11 >= rank D_K + rank E.
```
In particular, the torsion-isomorphism Tor(coker lambda_K)=Tor(E) from T17 does NOT by itself imply this inequality. Conversely, for *abstract finitely generated abelian groups only*, torsion agreement together with that rank inequality is equivalent to an abstract decomposition coker(lambda_K) ~= E plus free Z^q. This converse is **NOT a geometric cover existence theorem**.

**Proof.** S006 spectral-sequence naturality gives H3(X_p)=K_p, H2(X_p)=C_p, H1(X_p)=0. MV for the literal complete-space pushout F yields
```
0 -> D_K -> H3(F) -> E -> 0.
```
All spaces F,X11 have cellular dimension ≤3. Since C4(X11)=0 and C3(F) is a coordinate-direct-summand of C3(X11), inclusion H3(F)->H3(X11)=K11 is injective with torsion-free cokernel Q (S006 top-cell saturation lemma). The composite D_K->H3(F)->K11 is lambda_K. Quotient first by D_K gives the displayed exact sequence using the third-isomorphism theorem. Q is finitely generated free and hence projective, so this exact sequence splits abstractly. On free ranks, rank K11 = rank D_K + rank E + rank Q. The all-M named U1 argument proves delta_A split inject independently. For the converse as groups, the classification of finitely generated abelian groups decomposes both torsion groups with identical invariant factors and free ranks; this supplies *an abstract splitting*, without furnishing a CW diagram. QED.

## T243 — SMALL NONZERO-M COUNTEREXAMPLE to old necessary-test sufficiency

For each p, A_p=Z and *every A structure map is identity*. Let B00=0, B10=B01=B11=Z; B10->B11=B01->B11=identity, all maps out of B00 zero. Set M00=0:0->Z and M10=M01=M11=identity Z->Z. All four naturality squares commute. A's bottom delta_A:Z->Z² is (1,-1), primitive/split. K=0 at every grade. Thus all lower K arrows, delta_K and lambda_K:0->0 are trivially split/injective; their cokernel torsion is zero. But C00=Z, C10=C01=C11=0, so E=ker(Z->0+0)=Z, whose torsion is also zero. **Every enumerated S006 T17 necessity and delta_A passes**. New rank inequality demands 0>=0+1, false.

Independent topological contradiction: if a 3D admissible cover existed, MV for F=X10∪_(X00)X01, since H3 of all three individual spaces is zero, would give H3(F)~=H2(X00)=Z. Top-dimensional inclusion H3(F)->H3(X11)=0 must be injective. Contradiction. This is an impossibility theorem for every cover satisfying the original literal assumptions, not a failure of a search algorithm.

**Sharp dimension four, explicit admissible construction.** Define T00=point, T10 and T01 as two distinct based circles with only the basepoint in common. Let T11 be the finite mapping cylinder of h:S1 wedge S1 -> S1 which sends each circular summand by degree +1 to the same target circle. Both T sides embed as the input wedge circles, T10∩T01=T00, while T11 deformation retracts to S1 and the two upper H1 maps are both +1. Every T has reduced H1=B and no other reduced positive homology; T11 is 2D. Take all Y_p=S² literally the same CW subcomplex, giving A_p=Z and every A map identity with Y10∩Y01=Y00. Let p11:T11->S1 be the mapping-cylinder retraction and p10,p01 its restrictions. Its unreduced suspension (with the common suspension basepoint segment collapsed) gives compatible based maps f_p:Sigma T_p->S²; f00 is null on the common interval, and f10,f01,f11 have degree +1 on H2. Therefore the natural f_* is exactly M. Define S_p=Sigma T_p=C_u T_p union_Tp C_v T_p, P_p=C_u T_p, Q_p=C_v T_p, and W_p=C_w S_p. Form
```
U1,p = mapping cylinder(f_p),  U2,p=C_w P_p,  U3,p=C_w Q_p,
X_p=U1,p union_(S_p) W_p .
```
With separate labelled cylinder/cone interiors and globally fixed tips, U1∩U2=P, U1∩U3=Q, U2∩U3=C_w T, triple intersection=T; pair intersections and U2,U3 are cones and contractible. U1 retracts to S² and hence has exactly the prescribed reduced H2. Literal side intersections at 11 equal 00, since the only side common input is T00 and the Y core is common at all grades; no extra mixed-cell equality is asserted. All constructions are finite CW; at the top S11 has dimension 3, cylinders/cones have dimension at most 4. The Čech double-complex/cofiber transgression is the f_* just specified, with global orientation selected for + signs. Thus an admissible total-4D cover exists, and no total-3D cover exists. The *minimum dimension is exactly four for these data*. This recycles standard mapping-cylinder and cone mechanics; HHA novelty is not asserted.

## T244 — INDEX-TWO nonprimitive B with M nonzero on BOTH sides and top (T17 torsion failure)

A00=0, A10=A01=Z, A11=Z². Upper A maps inject into first and second standard coordinates. B00=0, B10=B01=Z² with basis (k,t); B11=Z^5 with standard basis e1...e5. Side-to-top B maps:
```
B10: k->e1, t->e4;   B01: k->e1+2e2, t->e5.
```
M10=M01=(0,1) to Z; M11(e4)=first basis of A11, M11(e5)=second, and M11(e1,e2,e3)=0. M00=0, all maps commute. K00=0, K10=K01=Z<k>, K11=Z<e1,e2,e3>. Lambda_K sends the two independent side generators to e1 and e1+2e2; coker lambda_K=Z/2 plus Z<e3>. C00=C10=C01=C11=0, hence E=0. Thus Tor(coker lambda_K)=Z/2 but Tor(E)=0: T17 itself forbids three-dimensional realisation. The B-side amalgam has index-two defect in its saturation (plus free top summand); it is *not* a counterexample to S006.

## T245 — TORSION COMPENSATION positive nonzero-M construction under S005 T13

All A_p=Z and all A arrows identity. Let B00=Z<b>, B10=B01=Z<k>+Z<t>, B11=Z<e1,e2,e3,e4>. Both bottom B maps send b -> k+2t. Top B maps are
```
10: k->e1, t->e4;  01: k->e1+2e2, t->e4-e2.
```
They coincide on b: e1+2e4 on both sides. Set M00(b)=2, M10(k)=M01(k)=0, M10(t)=M01(t)=1, M11(e4)=1 and M11(e1,e2,e3)=0. Naturality holds on each generator. K00=0, K10=K01=Z<k>, K11=Z<e1,e2,e3>. The K amalgam maps two generators to e1 and e1+2e2, so its cokernel is Z/2 plus Z<e3>; **lambda_K is NOT primitive**. But C00=Z/2 and both C sides vanish, so E=Z/2. New rank/torsion conditions correctly ALLOW the example.

More strongly, B is *graph-admissible*: bottom vectors (1,2) are primitive, delta_B=(1,2,-1,-2) is primitive, and the image of the four B side generators in B11 equals the primitive rank-three lattice Z<e1,e2,e4>. Its unique relation is exactly delta_B(b), so lambda_B:D_B ->B11 is a split injection (free complement e3). Delta_A=(1,-1) is primitive. Therefore the **already proved INTERNAL explicit S005 T13 construction** supplies a literal finite 3-dimensional admissible cover with this genuinely nonzero M and index-two K defect. This is not a fresh independent rederivation of every S005 CW cell; the new contribution is an exact boundary example.

## T246 — independent fixed matrix verification

Exactly three preregistered examples were checked with Python 3 + SymPy 1.14.0 exact Smith normal forms and integral matrix products, not enumerated over an unbounded space. The stdout is validation/s100_integral_diamond_stdout.txt; local tested script SHA256 60a724b445a7a0289a69a4c6c04416d6d52db940d41a335cb0930ed02171a077; stdout SHA256 27d16b503e5a0d9f5949b466528362d966b384055ef8c2da5a8959a3fbe8d523. These hashes identify the local executed copy; compare committed GitHub script bytes independently before asserting exact-source repeatability. The arithmetic does not certify the cover construction, the general theorem, or originality.

## Research verdict

A is decisively answered NEGATIVELY as stated: T17 + delta_A **cannot** be a sufficient criterion. A missing rank obstruction is now explicit and quantitatively sharp on a finite nonzero-M datum with exact total dimension 4. A balanced nonprimitive kernel example nevertheless IS admitted by the original graph-B construction, so forbidding any index-two kernel top-lattice is also false. This is classical MV and CW assembly and supplies **NO independent HHA-significant theorem**. B's genuinely coupled secondary route was only prefiltered against S096/S099 and pre-existing 2019–2026 literature, NOT declared universally impossible; no new actual B example was constructed. G2 NOT PASSED; no Top^R interleaving-distance claim or original Xu result alteration.
