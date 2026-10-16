# S073 MATHEMATICS — literal fourfold convention gate and finite defining-system test

**Verdict: NO named spectral separation proof and NO new HHA-ready theorem.** The specified Xu→Kochman→BBG all-defining-systems identification is still UNPROVED. No counterexample to the actual equality of those three brackets was found. What *is* proved below is an exact finite, complete two-valued fourfold test exposing a non-injective shortcut through only primary choices, together with a point-set cone/cube adjunction. Neither is claimed original.

## 1. Precisely fixed inputs, two separate types

Let X denote the 2-local five-term sphere-spectrum chain
S^68_(2) --2--> S^68_(2) --sigma^2--> S^54_(2) --sigma^2--> S^40_(2) --2--> S^40_(2).
Here sigma^2 has stable degree 14. Consecutive pairs are zero in the *stable homotopy category*. The complete Baues–Blanc–Gondhali (BBG) bracket B4(X) of Def.4.31 is a subset of [Sigma^2 S^68,S^40]_(2)=pi_30^S_(2). Xu, GT20 (2016), §5 p1620, explicitly writes theta_4 = <2,sigma^2,sigma^2,2> and zero indeterminacy in his **classical** convention. The distinction between that classical complete set, Kochman's Def.2.2.1 and B4 is the missing lemma; equal sphere stems and same face counts do NOT supply it.

## 2. S073-T192 (PROVED): an exact full fourfold countermodel to “the three primary fillers determine the value”

Work over k=F_2. Let A=Lambda_k(x,z), the four-dimensional unital graded-commutative differential graded algebra
A^0=k·1, A^1=k·x ⊕ k·z, A^2=k·xz, A^j=0 otherwise;
x^2=z^2=0, xz=zx≠0, d=0; |x|=|z|=1.
Take ordered length-four cohomology classes (a_1,a_2,a_3,a_4)=(x,0,0,x), all in H^1(A).

Choose the same **three primary fillers** u_02=u_13=u_24=0 (degree one) in both defining systems, so their equations du_02=a_1a_2, du_13=a_2a_3, du_24=a_3a_4 hold. In the first defining system take secondary u_03=u_14=0. In the second take u_03=z, u_14=0. The secondary equations
du_03=a_1u_13+u_02a_3=0 and
du_14=a_2u_24+u_13a_4=0
hold in both systems, because d=0 and the primary fillers vanish. The final cochain, with all signs + over F_2, is
a_1 u_14 + u_02 u_24 + u_03 a_4.
It equals 0 for the first and zx=xz≠0 for the second. Both are cocycles. Since H^2(A)=F_2·xz has precisely two elements, the **complete ordinary fourfold Massey set** is exactly
< x,0,0,x >_4 = { 0, xz } ⊂ H^2(A).
No other outcome is possible. BBG 2016 Prop.4.35 explicitly identifies its higher Toda bracket in a DGA with this usual higher Massey product: the same set therefore occurs in BBG's DGA-enriched setting. This is an explicit finite, four-dimensional algebraic counterexample to any assertion that a tuple of primary nullhomotopies alone determines a selected terminal fourfold value, even for a fixed ordered word. It is **NOT** a counterexample to the Xu/Kochman/BBG equivalence for the stable-sphere word: Xu asserts zero indeterminacy in his convention, whereas this toy example has two values.

Every part of this calculation is deductive (four basis elements and two displayed defining systems); no exhaustive external computation or unpublished code is represented as having run.

## 3. S073-T193 (PROVED, elementary): the conditional point-set cone/cube adjunction

For compactly generated pointed spaces A,B and an unpointed compact Hausdorff k-cube I^k (with disjoint basepoint), the compact-open k-space exponential law gives a natural homeomorphism
Map_*(I^k_+ ∧ A,B) ≅ Map(I^k,Map_*(A,B)).
For every inclusion of a cubical face J→I^k this homeomorphism commutes *on the nose* with restriction. Consequently any finite iterated pullback **defined by exactly the same chosen cubical face equations** is carried isomorphically to the corresponding space of smashed-cube extension maps. The proof is explicit: send F(t∧a) to (t↦(a↦F(t∧a))); its inverse evaluates, and restriction on J commutes by evaluation. In a simplicially enriched model, the analogous internal-hom identity uses (Delta^1)^k.

**Limit decisive here:** Kochman Def.2.2.1 uses coordinate-free stable sphere suspensions, sequential reduced cones, quotient faces and a colimit over representations; BBG Fig.2.19 uses a particular cubical 3-corner and subsequently DK-invariant model categories. T193 only compares literal *identically prescribed* cube conditions. It does not construct maps between Kochman's stabilized, all-representatives homotopy pullbacks and BBG's derived full defining-system space, let alone prove their fibres weakly equivalent. Claiming T193 finishes the requested source identification would be a type error. Kochman's own introductory discussion (printed p13) expressly distinguishes several older higher-bracket conventions and says equality with one named alternative is unclear; this is not evidence of BBG disagreement, but it defeats any rule that all conventions agree automatically.

## 4. Attempted explicit five-object comparison: map, remaining failed check

The only honest candidate has three stages:
(1) stabilize the sphere representatives of 2,sigma^2,sigma^2,2 to cofibrant-fibrant spectra in a specified simplicial stable model;
(2) levelwise evaluate/adjoint Kochman's G_02,G_13,G_24 along cones and G_03,G_14 along iterated cones, with strict compatibility at **all** boundary faces, to BBG paths H_02,H_13,H_24 and two 2-cubes H_03,H_14;
(3) identify Kochman's terminal sphere quotient with BBG's ∂I^3/S^2 assembly by an oriented degree ±1 map, *after* taking the homotopy fibre over every permitted representative and the full indeterminacy.

Stage (2) is NOT proved: neither a continuous map on full **stabilized derived choice spaces** nor surjectivity on π_0 of their 2nd-order fibres has been produced. Stage (3) is NOT proved: no source-exact boundary orientation and naturality under all Quillen representatives. A selected system's boundary degree is not enough; T192 demonstrates this failure mode with a fully finite model. The original Kochman Ch2 Thm.2.2.3 compares his *own* composition/smash versions; it does not claim comparison with BBG or every Xu convention.

A separate Adams/tower calculation of B4(X) was also attempted at the logical level: Xu supplies pi_30^S_(2)≈Z/2 and classical singleton theta_4; the BBG complete value is not calculable from that fact without the missing comparison. pi_29^S_(2) vanishing, used in the earlier derived IHC lane, likewise is a separate source-dependent input and is **not re-proved**. Thus one cannot infer 0∉B4(X) by the dimension of the target group. **No spectral numerical inequality is promoted.**

## 5. Original Top^R owner paper and gates

S072-T191 remains the conditional (if 0∉B4 then d_HI≥5/4) spectrum-valued obstruction against ALL WHOLE weak-equivalence replacements on BOTH lanes. In S073 the antecedent for the named word was NOT established. The original integral ordinary **unpointed Top^R** five-sphere (2,theta_4,theta_4,2) strict HI>IHC theorem was NOT proved, and the spectral θ4 candidate is NOT OWNER-SELECTED. No independent referee certifies T192/T193, and neither a classical general Massey mechanism nor an elementary adjunction has HHA originality. G1 named strict theorem OPEN; G2 FAIL_TO_CLEAR; G3 Lean NOT_STARTED. No Lean build, Palomar, paper, arXiv/HHA submission or third-party contact.

## 6. Formalisation design only

Possible future proof dependencies: exact simplicial model/category and stable Quillen mapping-space comparison → derived homotopy pullbacks for three primary and two secondary fillers → all-representative comparison and terminal S^2 degree ±1 → BBG θ4 nonzero → derived two-shift IHC (including the pi29/coherence point) → absolute spectrum HI>IHC → HHA primary-source novelty gate → explicit owner change if applicable. The toy four-dimensional DGA proof can serve as a *negative* Lean unit test in a later separately authorised session; it is not itself a reason to formalise/publish this project now.
