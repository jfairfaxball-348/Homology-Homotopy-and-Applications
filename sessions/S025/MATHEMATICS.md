# S025 mathematics — T57: a quantitative persistent-homotopy obstruction from a mixed Hopf cofiber

## Data, exact scope and borrowed facts

Let K be Madahar–Sarkaria's 12-vertex 36-facet triangulation of S³, Q=∂Δ³, f1:K→Q the classical simplicial Hopf map with Hopf invariant -1, and g:K→Q the S023 recolouring whose entire image lies in the disc Q\\int(abc). For each h=g,f1 take the tagged face-poset mapping-cylinder comparability graph on 168+14=182 vertices; high edges are precisely comparable pairs, and short edges are precisely inclusion pairs in Bminus. The S021/S023 Euclidean Gram argument produces an honest cloud X_h in R^181 with squared pair distances 1-epsilon on short edges, 1 on high-only edges, 1+epsilon otherwise, epsilon=1/18200; heights 0 on Bplus source faces and 1 otherwise.

This is a TWO-parameter functor F_h: (R²,≤)→Top formed by the flag Rips complex on vertices of height≤t and pairwise Euclidean distance≤r. Write
r0=√(1−epsilon/2), r1=√(1+epsilon/2), t0=1/2,t1=3/2.
At q00=(r0,t0), q10=(r1,t0), q01=(r0,t1), q11=(r1,t1) the four spaces form the classical mixed square Bminus/Bplus and the full cylinder. From S021 T47/48 and S023 T51, the *derived* total homotopy cofiber of this square for g is (S²∨S⁴)∨(∨14 S¹), and for f1 is CP²∨(∨14 S¹), up to homotopy. In the integral cohomology ring of the first, x²=0 for its H² generator; in the second x²=±y≠0 in H⁴. This cup-square difference depends on the original, previously checked Hopf invariant, not a new chain-level cup computation.

S021/S023 also prove that over ALL radius×height strata the pointwise integral graded cohomology-ring persistence functors agree (contravariantly), likewise componentwise homotopy-group diagrams, including π0 components and transition maps. Those are INHERITED results, not newly machine-checked full π_j values here.

## Definition of distance (avoid a hidden one-parameter assumption)

For diagrams indexed by (R²,≤), define translation T_delta(r,t)=(r+delta,t+delta), delta≥0. Strict delta-interleaving consists of natural transformations a:F→G∘T_delta and b:G→F∘T_delta such that the composites are the canonical structure maps to T_2delta. A delta-*homotopy*-interleaving allows first replacing F,G by diagrams weakly equivalent to them through zigzags of objectwise weak homotopy equivalences, then taking a strict delta-interleaving of the replacements. The distance is the infimum of admissible deltas. This is the explicit multiparameter analogue of Blumberg–Lesnick's 2017 standard homotopy-interleaving formalism, not a claim that they published T57.

## T57 (PROGRAMME_PROVED internally; no novelty conclusion)

**Theorem.** The two fixed Euclidean 181-dimensional radius–height Rips bifiltrations F_g and F_f1 have identical full pointwise integral cohomology-ring diagrams and componentwise homotopy-group diagrams (as established in S021/S023), yet in the defined homotopy-interleaving metric
d_HI(F_g,F_f1) ≥ epsilon/32 = 1/582400 > 0.
The conclusion remains true for any rescaling (r,t)↦(lambda r,lambda t), scaling the gap by lambda>0 when spatial positions and heights are both scaled by lambda.

**Proof.** All off-diagonal squared distances belong to S={1−epsilon,1,1+epsilon}. Each of the two selected radius squares r_i² lies at least epsilon/2 from every member of S. Put eta=epsilon/32. For 0≤s≤2eta=epsilon/16 and either selected r_i<2, we have
0≤(r_i+s)²−r_i²=2r_i s+s² < 4(epsilon/16)+(epsilon/16)² = epsilon/4+epsilon²/256 < epsilon/2.
Thus shifting any of the four corners by 0,delta, or 2delta in BOTH coordinates for 0≤delta≤eta crosses NO pair-distance event; the corresponding height shift is ≤epsilon/16<1/2, so crosses no height 0/1 event either. At all four corners and their shifts, for each h the filtered complex is literally the identical simplicial complex, and within the four-corner square the transition maps are the identical inclusions.

Suppose the diagrams had a delta-homotopy-interleaving for delta≤eta. Choose weakly equivalent replacements F' and G' with a strict delta-interleaving. On each of the four corners q, the structure map F'(q)→F'(q+2delta) is a weak equivalence: this follows from the natural zigzags of objectwise weak equivalences to F and the just-established fact F(q)=F(q+2delta). Since the interleaving composite a_q followed by b_{q+delta} equals that weak equivalence, the two-out-of-three property makes a_q:F'(q)→G'(q+delta) a weak equivalence. By naturality these four a_q form a strict morphism of square diagrams, objectwise weak equivalences. Shifted G'(q+delta) is in turn weakly equivalent as a square to G(q), via the natural zigzags and the no-event G(q)=G(q+delta). Consequently the two original four-corner square diagrams are linked by a zigzag of objectwise weak equivalences in Top^[1]^2.

The *derived* total homotopy cofiber is invariant under such zigzags (homotopy-colimit invariance), so the cofibers would have isomorphic integral cohomology rings. That is impossible: the square of an H² generator vanishes for g and is a generator of H⁴ for f1. This contradiction forbids all delta≤eta and gives the stated lower bound. For scalar lambda>0, reparameterization by (r,t)↦(lambda r,lambda t) sends any purported delta interleaving into a delta/lambda interleaving of the original, proving the scaling statement. QED.

**Important boundaries.** This proof does NOT compare the two point-cloud metrics via Gromov–Hausdorff distance; it is a lower bound on the *space-valued* diagram distance. It does not prove no R5 realization of the exact graph. The topological difference is inherited from the classical Hopf cup square; S025's addition is the explicit finite quantitative interleaving deduction, not an original generalized cofiber theorem. Weak equivalences of diagrams cannot be replaced by unrelated per-corner isomorphisms: the zigzag must be NATURAL. The argument uses full coherent square diagrams, not merely a commutative square in Ho(Top).

## Mathematical attack A: strict five-dimensional graph geometry

The 182-point all-pair comparability matrices were reconstructed *independently* in local Python from the original 36 source tetra: g 1572 and f1 1524 high edges, 644 identical short edges, 16471 unordered pairs each, exact SHA256 8cce6022... and ca062fba..., respectively. S024's corrected maximum induced K_(1,m) maxima g32/f1 30 remain below the published 5D kissing *lower* bound40; no 5D impossibility follows. A fresh seven-column neighbourhood-shattering search was tried as a potential unit-ball VC-dimensional obstruction. Its greedy/random heuristic found at most four shattered columns and local 7-column pattern counts61/128(g) and65/128(f1), not an exhaustive calculation. In general unit-radius balls in R5 cannot shatter 7 points because membership signs arise from affine forms in dimension5; however FAILURE to find a shattered septuple proves nothing and no actual septuple was certified. Thus not R5 UNSAT. No 5D algebraic/rational coordinates satisfying all 16471 inequalities for either graph were found or claimed. Dimensions≤4 remain rigorously excluded by S023 stars/Musin; dimension 181 possible by the rational Gram certificate; dimension5 OPEN.

## Fronts A and C

For A, no source-first general succinct nonprincipal interval k≥1 complexity algorithm or unconditional hardness lower bound with bit-size accounting is established. For C, no new primitive all-arrows, all-composites, simultaneously Q/all-Fp compatible globally coherent [0,2]^2/^3 integral grid splitting theorem or counterexample is established. Earlier finite-grid T28/29 proofs and FoCM2025/S010/S018 remain the baseline.

## Publication-priority stance

Blumberg–Lesnick 2017 define homotopy-interleavings; Lanari–Scoccola 2023 prove persistent Whitehead/rectification; Mémoli–Stefanou–Zhou 2024 study stable cup persistence, while Madahar–Sarkaria 2000 and Munson–Volić 2015 predate our classical Hopf and cofiber ingredients. These are major originality collisions, although none was verified to state exactly the above finite R181 quantitative full-ring+all-π counterexample. The absence of an exact found match does not certify originality. HHA suitability and a genuinely nonroutine application remain UNPROVED. No G2/Lean/Palomar/manuscript/submission.
