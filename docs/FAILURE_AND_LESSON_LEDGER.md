# Failure and lesson ledger

| ID | Date | Type | Obstruction, counterexample or lesson | Action |
|---|---|---|---|---|
| GAP-0001 | 2026-10-12 | research | No selected exact result after S001 | S002 scored 12; provisional C02 does not resolve novelty |
| GAP-0002 | 2026-10-12 | sources | Direct publisher author pages and full issue listing returned 403 | Rely on marked excerpts/DOI metadata, recheck before submission |
| GAP-0003 | 2026-10-12 | formal | No Lean toolkit for spectral sequence / mapping cone checked | Future feasibility audit, no fake build |
| GAP-0004 | 2026-10-12 | novelty | C01 one-cardinality result T4 is a spectral-sequence degeneration of known MVSS | Do not use as flagship |
| GAP-0005 | 2026-10-12 | false generalization | Local homology groups and acyclic pair intersections do not determine total-space homology: T2 with d=0/1/2 has fixed local groups and radically different union groups | Track d₂ attaching maps, not just E1 ranks |
| GAP-0006 | 2026-10-12 | novelty | C02 static filtered realisation uses standard mapping cone and may be fully known as a consequence | Primary full-paper audit in S003, seek rigid obstruction beyond existing work |
| GAP-0007 | 2026-10-12 | geometry | Finite CW model proved; explicit *simultaneous* simplicial subdivision and exact mathlib geometric realisation unverified | Do not claim actual triangulation certificate |
| GAP-0008 | 2026-10-12 | scope | Non-split injections and incomparable indices are outside T3; naive adapted bases impossible | Attempt geometric replacement/coherence or counterexample S003 |
| GAP-0009 | 2026-10-12 | novelty | Carlsson–Zomorodian 2007 original Theorem 2 already gives all finite field-valued multiparameter persistence realization; generic realization is not a novel HHA flagship. | Focus on explicitly integral, constrained three-cover d2 geometry and prove nonstandard result. |
| GAP-0010 | 2026-10-12 | false restriction | S002 split injectivity unnecessary for finite chains: arbitrary transitions can be realized via mapping-cylinder extension; dimension grows with t. | T5 proved; do not automatically claim 3D or originality. |
| GAP-0011 | 2026-10-12 | geometry | Top-dimensional subcomplex homology is necessarily split-injective; hence graph triple intersection cannot encode nonsplit B transitions. | T6; examine tight dimension bounds. |
| GAP-0012 | 2026-10-12 | two parameter | Cellwise one-critical graph bifiltration cannot realize certain valid free abelian diamonds (T7); removing meet-exactness allows same diagram, so this is not an unrestricted obstruction. | Require explicit geometric hypotheses, seek torsion-sensitive sharp criterion. |
| GAP-0013 | 2026-10-12 | source/proof | Full original Torras Casas/Pennig proofs were not reliably available in this session. | Keep Stage-2 off; obtain verified complete primary text before any priority claim. |
| GAP-0014 | 2026-10-12 | false rank sufficiency | Individually primitive B upper columns e1,e1+2e2 span nonprimitive index-two lattice although rank bound holds. | T8 exact combined primitive iff for graphs. |
| GAP-0015 | 2026-10-12 | dimension escape | A 2D meet-exact triple with bottom circle independently filled by two side disks makes H2(V)=Z, forbidding an H2-free 2D top triple. | T10; a 3-cell repairs, no total-3D impossibility. |
| GAP-0016 | 2026-10-12 | positive geometry | Upper A nonsplit or zero maps do not force dimension≥4 if lower A split and B graph-admissible; T11 builds literal total-3D strict square. | Test larger class, including nonprimitive B. |
| GAP-0017 | 2026-10-12 | originality | Precise restricted T8–T11 conclusions may follow classical CW/MV tools; HHA-worthy significance has not been demonstrated. | G2 closed; adversarial primary proof comparison or pivot S005. |

- **S005-F1:** Individual primitive/split bottom A was unnecessarily strong in T11; the actual obstruction for degree-pure total 3D is primitive **combined** δ_A, proved by MV H3/kernel and torsion saturation of H2 of the latching union. Separate lower ×2 and ×3 arrows are allowed.
- **S005-F2:** Joint injectivity δ_A alone is insufficient: δ=(2,−4) gives Z/2 torsion in H2 of U1 lower union, impossible in 3D H3-free/H2-free-top.
- **S005-F3:** A mapping cylinder built on a 3D top A latching union adds 4D cells; replace it by 2-sphere generators and 3-cell relations x_i−λ_A(x_i) with identity coefficients.
- **S005-F4:** Proposed unconditional B upper primitive obstruction incorrectly assumes U2,p∩P_q=P_p for p<q; mixed-grade delayed cover membership violates that inference while preserving each named per-grade meet. No general nonprimitive B verdict.
- **S005-F5:** Technical CW iff alone may not meet HHA significance or novelty threshold. Source proof-level comparison and a serious reserve candidate required before first novelty gate.

- **S006-F1 CLOSED IN ZERO-M SLICE:** S005's rejected component-wise mixed-grade obstruction is unnecessary for zero transgression: examine full X square and primitive inclusion H3(X10∪X01)↪H3(X11). Determinant-two λ_B impossible for A=M=0.
- **S006-F2 GENERAL LIMIT:** For arbitrary M, top H3 controls K=ker M, not B; ker delta_C may have torsion, making an upper λ_K nonprimitive consistently with necessary MV. Never assert all B graph-admissible absent M=0 or stronger hypotheses.
- **S006-F3 PRIORITY KILL:** Internally sharp CW dimension-three integer lattice criterion is not evidence of an original HHA-quality application. Retire C03 as paper flagship; inspect original HHA 2025 section-complex paper and final 2026 open-complex discrete Morse publication before fixing new theorem.
- **S006-F4 PROOF ACCOUNTING:** Torsion balance Tor(coker λ_K)=Tor(ker δ_C) follows from a free quotient K11/H3(F); an inclusion D_K→H3(F) need not be primitive if ker δ_C has torsion.

- **S007-F1 PRIOR ART KILL:** VHT original Proposition 3.11 proves the subdivision bound on collapse, and Example 3.12 nonzero d2; never recycle either as a new theorem.
- **S007-F2 INTEGRAL EXTENSION:** Even identical maps on homology do not determine integral cofiber H2: explicit Moore-wedge f0/f1 yields (Z/2)² vs Z/4; full chain relations recorded. This is a standard cofiber witness and DOES NOT prove a section-complex height counterexample.
- **S007-F3 MISSING GEOMETRY:** A proposed cone-prism homotopy pushout has not been independently identified with actual S_h section spaces/filtration; no shortcut from abutment equivalence to same E2 pages.
- **S007-F4 MORSE COLLISION:** Ordinary acyclic edge matching crossing birth times fails filtered naturality; equal-birth sufficient reductions known since Mischaikow–Nanda 2013.
- **S007-F5 HHA 2026 PID COLLISION:** Integer ×2 torsion immediately obstructs integral interval decomposition despite fieldwise interval decomposability, too elementary for new HHA flagship.

- **S008-F1 CLOSED EXISTENTIALLY:** S007 assumed cofiber but had no actual height. Finite poset collage C_g and exact mixed-arrow NE_g, with explicit deformation retract, genuinely furnish height spectral sequence E1/E∞ integral witness; finite face-map enumeration still missing.
- **S008-F2 GEOMETRY DETAIL:** Original simplicial section spaces are mapping spaces over Δ¹ and include all square natural transformations; naive S[0,1]=P without checking mixed arrows is false literally. E_g and its retract supply corrected strict statement.
- **S008-F3 DEGENERATE HEIGHTS:** Two levels do NOT make all Sh_p for p≥2 empty; horizontal NONDEGENERATE sections vanish after normalization. Avoid incorrect collapse argument.
- **S008-F4 ORIGINALITY:** Collage nerve derived homotopy pushout and classical Z/4 extension are familiar technology, despite geometric result new to THIS programme. No novelty-gate promotion.
- **S008-F5 C07 PROOF COLLISION:** 2013 original Theorem4.3 and Prop4.4 filtered acyclic Morse chain equivalence closes generic filtered proposal.
- **S008-F6 FIELDWISE INTEGRAL BLINDNESS:** M2 vs M4 all-field n-cube reductions agree, integral structures differ. Classical integer exponent cannot be read from fields alone; not a new multipersistence breakthrough.


**S008 supplement:** raw repeated-height sections cannot be deleted as chain degeneracies. Primitive individual maps do not ensure primitive joint images. On a diamond primitive arrows plus all-field middle exactness DO force blocks; do not seek a counterexample there. Relative pair maps require a deleted-stratum/properness check before claiming BM inclusion naturality. Concurrent work must be preserved and reconciled before a remote write.

- **S009:** Triple line arrangements e1,e2,e1+e2 already violate rational full-cube H1 exactness; cannot be presented as all-field primitive counterexample. Primitive individual arrows + integral face H1 can conceal p-torsion in top-face cokernel, caught by UCT H0 Tor (known S008 diamond). The severe unproved move is removing top-injectivity from T25; Schanuel k=1 criterion is classical and lacks efficiency.

## S010 corrections and failed shortcuts
Indexed publisher snippets cannot be labelled direct statement inspection (five source grades repaired). Kernel reduction requires UCT at Htop and vanishing preceding homology, with edge purity for one-dimensional slices. An arbitrary integer death injection does not split; the full saturated terminal kernel has an explicit natural retraction. Field complements use FIELD Krull–Schmidt only. Longer-grid middle band has no bottom lift, so Boolean proof does not automatically glue. Explicit interval count/expanded dimensions enter T27 complexity; classical end-ring algorithms do not solve compressed source Problem1.

## S011 corrections and proof/priority risks
- **S011-F1 GENERALISATION:** S010 n3 common-top Venn lattice argument cannot simply be assumed for n>=4. Replace it with canonical finite-poset latching colimits and integral fieldwise purity: T29. A sum of incoming vertex modules double-counts overlaps and is NOT the latching colimit.
- **S011-F2 SOURCE-BLOCK DEFINITION:** A mixed birth/death rectangular interval is not automatically an LLO block on a Boolean cube. Definition3 recursion yields precisely principal ↑u and ↓v, full counted once; verify every k-face not just squares for n>3.
- **S011-F3 EDGE PURITY:** A generating edge ×2 (constant remaining axes) can split over every field, so primitive generating cokernels cannot be dropped from T28. Q plus finitely many primes also cannot certify integrality.
- **S011-F4 GRID FAIL:** Induced band {1}×{0,1,2}² has zero global bottom and nonzero terminal death at (1,2,2), a genuine all-precondition failure of the global-bottom lift. It does NOT refute the unknown general-grid integral decomposition.
- **S011-F5 PRIORITY:** Finite-poset projective/latching splitting closely resembles 1981 work and 2026 projective persistence proofs. Do not present internal T28/T29 as externally new; HHA2026 journal-final PDF was 403.


## S012 failure/priority controls
- **S012-F1 STANDARD T29:** fieldwise poset representable descent is canonical finite Reedy-projective/latching saturation and 1981 projective-poset literature predates it; do not launch a paper on T29 alone. Full 1981 proof inaccessible: exact text-equivalence UNKNOWN.
- **S012-F2 DERIVED CLASSICAL:** punctured Boolean cube cellular derived colimit (T32) is a Roos/bar construction specialisation; BK spectral sequence (T33) already exists. Sparse E2 does NOT imply d_{n-1}=0 for n>=3; could conceal torsion/extensions.
- **S012-F3 MIXED BAND:** on 3x3 in 2D as well as 3D, bottom-zero true middle band has nonzero local death kernel; local slice lifts do not provide natural commuting complements in an arbitrary mixed module. No false counterexample declaration.
- **S012-F4 PROVENANCE:** full 1981 paper and HHA2026 final proof remain inaccessible. Original selected 2026 preprints inspected but not comprehensive theorem comparison. No first-novelty certification or HHA flagship.

## S013 logical and topological boundary lessons
- **S013-F1 TRANSgression IMPOSSIBLE UNDER STRICT FULL CUBE:** the apparent S012 d_(n-1) is forced zero by naturality to the terminal full cube and integral top-latching injectivity. The S012 statement 'sparse E2 alone does not force collapse' remains TRUE, but adding the actual full-cube T28 hypothesis does. Do not recycle potential nonzero d2 as a candidate under those precise hypotheses.
- **S013-F2 ABSOLUTE COMPARISON STILL VARIES:** even an E2-collapsing free BK spectral sequence does NOT fix the map hocolim(P)->X_top. T35 yields all integer degrees with identical entire homology persistence modules.
- **S013-F3 STRICT EXTENSION MATTERS:** a punctured-only diagram can have a nonzero d2 with the same shape of homology blocks but fail to extend to a strict top carrying split-injective top homology. A formal algebraic extension of the homology diagrams is not a compatible topological extension of the actual maps.
- **S013-F4 MIXED GRID STILL OPEN:** raw Ext^1/field comparison without canonical integral filtration does not construct simultaneous natural idempotents. No all-hypotheses integer counterexample; retain full quantifiers.
- **S013-F5 PRIORITY STILL KILLS HEADLINE:** T34 is straightforward naturality once T32/T33 and latching known; T35 uses CW ball gluing and sphere degree. Neither is certified novel or of adequate HHA significance. Final journal LLO paper and 1981 six-page proof remain inaccessible.

## S014 boundaries and negative gates
- **S014-F1 HOPF PRIOR ART:** A strong topological *example* is not automatic HHA-original mathematics. T36 depends on classical π3(S2)=Z, Hopf cofiber cup products, mapping cylinders and barycentric subdivision; no priority clearance or nontrivial new geometric restriction.
- **S014-F2 FLAG != RIPS:** Every finite complex becomes flag after barycentric subdivision, but does NOT automatically become a filtration of Rips complexes for a single metric/scale or meet a quantitative critical-simplex bound. The finite flag claim is proved, the metric version NOT.
- **S014-F3 ALGEBRAIC SOURCE TARGET:** Original LLO Problem1 asks relative-X resolution length k. Substituting ordinary principal-upset pd silently changes the problem; for bottom simple n vs relative block pd0.
- **S014-F4 MIXED GRID:** A true induced middle band is not a counterexample to integral LLO block decomposition, and all-prime separate bases do not provide a coherent integral splitting. No complete proof/counterexample.
- **S014-F5 ACCESS:** Original 1981 JPAA full proof inaccessible; DISTINCT Bielefeld LNM scan is Anubis-blocked; final 2026 HHA LLO proof unavailable. Recent original 2025 SoCG can kill easy algorithm novelty but not solve original k≥1 problem.



## S015 hard priority/geometry corrections
- A polynomial relative k1 decision on a fixed expanded finite grid is NOT the unrestricted LLO Problem1 (free presentations/R^n arbitrary intervals). S010 T27 had already provided polynomial k1 with a **listed finite** interval family; T37 only specialises to polynomially enumerable LLO blocks and Koszul k0. Strong arithmetic evidence, weak originality.
- A fixed finite metric flag-to-Rips construction with **three** independent vertex functions cannot be misrepresented as a genuine Rips-radius plus one-function two-parameter filtration. B3 has order dimension 3, though this alone is no geometric impossibility theorem for unrelated 2D models.
- An isolated integral middle band already splits integrally and is not an all-hypotheses counterexample. No finite search or machine certificate claimed.
- Original HHA2026 final and Höppner–Lenzing 1981 JPAA primary proofs remain uninspected (DOI retrieval failure/403); different 1981 LNM scan Anubis-blocked. Source silence never priority evidence.

## S016
- Missing **prebirth sentinel** can give a false relative-block equivalence: 2×2 death simple extends by zero to bounded real rectangle [0,1)², whose mixed birth/death square has H1(Koszul)=k. Correct finite→R construction CLAMPS left tail to sentinel, so finite death blocks remain real death blocks.
- Pointwise-exact extension alone does not preserve relative X-admissibility; explicit Lan_π of EVERY real birth/death/induced block and adjunction is required. Reverse dimension bound uses Schanuel induction, not unsupported exactness of arbitrary restricted R sequences.
- True radius plus ONE scalar height can already have nontrivial mixed cofibres for 3 points, but elementary union cycles and suspensions are not a novel persistent-homotopy stability theorem; 4-point union is a graph, NOT automatically flag-filled.
- Primitive individual integer arrows/all-field decomposition are insufficient evidence without global natural idempotents on mixed 3x3; no candidate verified.

## S017 mathematics/priority correction
- T41: on sentinel-hyperface-zero diagrams every nonbirth LLO block admits no nonzero natural map into module; ordinary free covers are relative-admissible. Thus relative all-block pd=ordinary free pd all n,k. Do not market S016-T39 all-block fp Problem1 reduction as original.
- The entire coordinate-zero hyperfaces must vanish, not merely bottom. On 3×3 (1,1)-singleton pd=2, but after omitting sentinel the 2×2 restriction is death-block pd=0.
- Maximal-radius one-height Rips D simplex makes canonical mixed cofiber a suspension, cup-square zero. Higher π*/stable operations not claimed absent. Need noncontractible top for Hopf cup.
- Existing LLO §1.2 + Botnan–Oppermann–Oudot 2024/25 published -infinity Kan/rank-exact grid proofs are severe direct technique collisions; no priority guarantee.
- The mixed [0,2]²/[0,2]³ all-prime Smith/natural-idempotent issue remains UNRESOLVED; one middle induced band is not a counterexample.

## S018 mathematical and novelty corrections
- **S018-F1 RECTANGLES != BLOCKS:** fp zero-sentinel W=[0,1)^n is itself a relative rectangle projective with Hom(W,W) nonzero; ordinary free pd=n. S017-T41 cannot be recycled to eliminate all nonbirth rectangle Hom.
- **S018-F2 KAN AND SCHANUEL:** real arbitrary-boundary rectangle Lan_pi must be computed over entire initial rays, including top unbounded tail. Real X-relative epi cannot be justified by pointwise epi only. Reverse pd induction uses one chosen pulled-back admissible cover and relative Schanuel, NOT arbitrary resolution restriction.
- **S018-F3 PRIORITY:** all-rectangle fixed-n,k algorithm composes established 2024 LLO Kan, 2025 FoCM rank-exact hook finite-resolution/transport and S010-T27 explicit-family algorithm. No novelty/HHA-scale homotopy application certified, so no G2.
- **S018-F4 OPEN:** no noncontractible-top Euclidean single-height Hopf comparison, no all-hypotheses mixed integer 3x3 global idempotent theorem/counterexample; do not invent numerical tests/checker results.

## S019 lessons — no phantom numerical certificate
- True Euclidean radius/ONE-height Rips with top D≃S² avoids S017-T42 top simplex/suspension no-go. Mixed Hopf cofiber can distinguish diagrams where every separate homology/π-group persistence map agrees.
- Low/low A0 is equatorial S² PLUS isolated positive-ball interior vertices; these isolates are essential to B∩C=A0, π0 and map comparisons. Outside-K vertices add S¹ wedge summands to cofiber only.
- Relative barycentric subdivision of simplicial Hopf mapping cylinder creates FLAG top and FULL induced subcomplexes B_+,K; generic subdivision may not. A three-length Euclidean Gram is positive for d=N−1 but no actual N or concrete coordinate lists or independent checker have been produced.
- Exponential upsets binomial(2m,m) is NOT a complexity lower bound; middle integral induced bands are already split. Original SoCG2026 treats HOMOTOPY TYPES, richer than π-group diagrams; keyword absence is not proof of novelty.

## S020 hostile boundaries
- **S020-F1:** S019 existential Hopf approximation was not enumerated. Fix: 12-vertex 36-facet published Hopf map + finite face-poset mapping cylinder. Credit original source; do NOT count the Hopf triangulation itself as new.
- **S020-F2:** Full Euclidean coordinates need not be decimal points: a complete 182×182 exact squared-distance prescription with a rigorous positive centered Gram is algebraically sufficient in R^181. Do NOT call this a five-dimensional point cloud; this particular Gram has rank exactly 181.
- **S020-F3:** Do not overlook isolated vertices in the short stages: 52 LOW components, 66 ALL components; punctured-square union equals sd(K) plus 14 isolated target-face vertices, yielding 14 S¹ summands in cofiber.
- **S020-F4:** Python checked finite cochain, face incidence/link, collapse pairs, graph/cutoff classes. It did NOT mechanically prove all π_j persistence, compute cofiber rings by an independent simplicial diagonal package, or run Lean/Palomar. These are human-level mathematical deductions from the verified poset construction.
- **S020-F5:** Oudot–Waas SoCG2026 compares persistent HOMOTOPY TYPES, stronger than ordinary π-group diagrams; Monoidal Rips 2026 §6.3 already treats exact one-function bifiltration. No novelty-as-keyword absence.
- **S020-F6:** Front A genuine succinct nonprincipal interval complexity, Front C global mixed all-prime integer splitting, and d=3/4/5 Rips counterpart were NOT resolved.

## S021 FATAL-HISTORICAL-CERTIFICATE BUG AND REPAIR
- **S021-F1:** S020 code maps mode0 source face to its first vertex's first letter, NOT constant a. Explicit transitivity failure b0_s<a0b0_s<a_t but b0_s≮a_t. Its SHA 138695... is mathematically INVALID as a poset mapping cylinder. Equal 2244 edges concealed it because each singleton image has exactly seven target supersets. **Always check relations, not just aggregate counts.**
- **S021-F2:** Corrected f0 constant a changes SHA to 65deab... but keeps count and supports poset retraction. Independent all-clique GF2 verified 182-node high complexes; mathematical K sphere and all-j group persistence still need *proof*, not rank comparisons.
- **S021-F3:** Exact Euclidean points can be supplied constructively by rational anchored Gram plus algebraic Cholesky recursion; numeric residual ~1e−16 is corroboration, not exactness. A near-equilateral d≥N−1 lemma does not rule out different low-d realisations.
- **S021-F4:** Each pointwise cohomology *ring* in both filtrations is too simple to detect the mixed Hopf cup: positive ring products are zero and cross-positive maps factor through balls. This yields genuinely sharpened T48, but classical CP² and current cup persistence remain serious novelty killers.
- **S021-F5:** No independent cofiber AW diagonal program; f1 input cochain was independently *validated*, not discovered. Do not report a full machine proof of the cup-square or all π_j.
- **S021-F6:** Source-first comparison added ORIGINAL 2000 PDF and 2023/24 cup work, priority still unpassed. A/C and d3/4/5 remain OPEN.

## S022 — faithful low-d Euclidean compression ruled out, but not all low-d models
- Graph-preserving nonlinear realization of S021 exact corrected f0 high relation in d<=5 FAILS universally: common target {a} with all 72 incomparable source triangles forms induced K_(1,72); a dimension-5 spherical packing argument gives <=51. This is a PROOF, not a failed numerical optimizer. T49 near-equilateral rank argument had NOT ruled out arbitrary distances.
- Any claim that this also precludes an alternative graph or homotopy-equivalent bifiltration is FALSE reasoning; redesigns may remove this large star.
- Originality: total homotopy cofibers of squares appear in 2015 cubical homotopy theory, and Hopf cone cup square/CP² is classical. Searching for literal phrase 'mixed cofiber' was inadequate. Exact persistent application remains unreviewed, and no HHA novelty G2.
- Front A attempted succinct incidence/hook extensions but no proved new complexity bound; Front C primitive integral local-to-global projector idea lacks global all-hypotheses construction. No speculative positive.


## S023 — radius/height low-dimensional redesign limits
- The S021 constant f0 null model's 72-star was a MODEL-CHOICE obstruction, not all null maps. Explicit four-colour g factors through a disc while redistributing source triangles; actual cross-antichain target widths ≤31. Lesson: vary null simplicial map, not only the Gram matrix; ALWAYS test 36 tetra simpliciality and transitivity before distance optimization.
- A small star is NOT an actual Euclidean embedding. Redesigned g/f1 still have K1,31/K1,27 so fail in d<=4 (published Musin tau4=24). In dimension5, failure or success still OPEN. No numerical nonconvergence is an impossibility proof.
- Recoloured f0 is a constructive refinement of classical Hopf/CP2 comparisons; original square cofiber not new. HHA novelty and secondary A/C remain open.

## S024 mathematical lessons
- S023 source-only facet antichain width31/27 is NOT full induced star; mixed target singleton leaves increase maxima to32/30. Exhaustive lower/upper interval poset matching is the correct test, verified independently (not guess from one center).
- A diameter/minimum-separation packing theorem is not an impossibility proof for arbitrary unit-ball graph representations. T55 makes a strong **conditional** d5 spread restriction; graph could require D/s>7/5. Do not imply d5 solved.
- Four 5D L-BFGS-B attempts each violated ~1500+ strict high-threshold edges/nonedges; no local-optimum success/failure is a proof. Rank5 infeasibility needs independent algebraic/global certificate.
- Finite 2×2 Rips diagrams remain literally unchanged under certified small perturbations; full-plane equality does not. Related geometric/function-Rips stability is established literature. No originality claims.

## S025 — exact quantitative gap without journal originality
- Strict R5 graph feasibility/infeasibility remains entirely undecided for corrected 182-node g/f1 high graphs. Independently reproducing class hashes and testing graph-neighborhood VC patterns is NOT a low-dimensional coordinate solution or a no-go proof.
- A closed neighbourhood family in Euclidean R5 cannot shatter 7 points, but a failed 350-seed search is NOT a proof none exist in our finite graphs. Greedy best patterns61/65 out of128; do not conflate 'not found' with VC≤6.
- T57 gives a positive **homotopy-interleaving** separation by NATURAL weak-equivalence zigzags of whole 2×2 diagrams; a weaker objectwise Ho(Top) comparison loses the higher coherence needed to compare total cofibers. The arithmetic margin is certified, classical Hopf cup-square inherited. Neither is proof of a new HHA flagship.
- Blumberg–Lesnick, Lanari–Scoccola and MSZ significantly limit novelty; no nontrivial new operation or application. Stage2 priority remains closed.


## S026 — hostile topology/geometric lessons
- S025 bare assertion "b∘a weak equivalence implies a weak equivalence by two-out-of-three" is FALSE. S026 repairs by BOTH interleaving identities and naturality of plateau structure maps (split monic+epic in HoTop). Never reuse false one-composite inference.
- Actual RELATIVE F2 Alexander–Whitney total-cofiber diagonal on D/U computed g0/f1 nonzero; explicit Hopf 1440 relative 4-simplex cycle, cup pairing1, d3 rank1439. Not an independent INTEGRAL AW calculation, nor all pi_j machine proof.
- Improved exact dHI lower bound >=1/145603 is not equality or a Gromov–Hausdorff comparison. No-radius-event checks exact; no distance upper bound matching it.
- Both graphs have NO induced K6,6 by exact exhaustive test, but this kills only that particular sphericity obstruction; all strict R5 distance constraints remain OPEN.
- Original BL2017 persistent-Whitehead counterexample, Lanari–Scoccola AGT2023, MSZ2024, classical 2015 cubical total cofiber and 2000 Hopf impose major originality risk. Two full primary PDFs still not proof-inspected, source provenance explicit; no flagship/G2. Hosted static checks not math.

## S027 — scalable Hopf families versus originality and constructive obligations
- Quantifier trap: unbounded coefficient n comes with N(n) and Euclidean ambient dimension N(n)-1 allowed to grow; 12 **parameter strata** is NOT bounded cloud complexity or strict d5 embedding.
- Pointwise pi3 persistence maps do NOT include the coherent source union U->terminal D attaching map f_n. All actual nonidentity positive-degree transition maps between S² plateaux factor through a contractible Bplus or Bminus stage. H0 rings require exact labelled-component tracking, not Betti count.
- The integer x²=n mapping-cone theorem is CLASSICAL. No independent integral relative AW cochain, signed 4-cycle and integral pairing for explicit f2 done; F2 S026 witness does not solve this.
- S027 dHI>=1/(1600N) follows symbolic no-event margin, not sampled Fraction checks alone. Prior BL coherent warning/Whitehead examples and MSZ stable categorical theorem create major newness risk.
- Strict frozen S023 182-graph d5 feasibility remains OPEN despite S026 no-K6,6. Dimension N(n)-1 family does not compress graphs. No genuine real-data/HHA-worthy use case shown.

## S028 — certification is distinct from significance
- Direct proof-level LS Proposition3.14 source access resolves the prior vague novelty risk: the coherent-square plateau separation mechanism is already established. Repeating its construction at larger Hopf coefficients is not an original HHA flagship.
- Corrected original book citation: Definition3.8.1 is total cofiber;3.8.8 is square homology. Prior full-download failures are historical; S028 retrieved and inspected selected chapter proofs.
- Integer AW2 is essential: mod2 erases coefficient2. Primitive cochain/cycle generators and integral UCT must be checked before treating a numeric pairing as a structure coefficient.
- Separate checker imports no constructor and checks every simplex and pair. Source/target Smith diagnostics are actual unit reductions; relative torsion-freeness comes from the integral LES, not an unperformed huge Smith computation.
- New constant-null graph and rank333 matrices do not settle old frozen g/f1 R5. The original optional NetworkX-dependent replay failed without its dependency; disclose it rather than turn missing execution into PASS.
- A selected all-field cofiber ring comparison2/4 is not a natural isomorphism of all derived profiles and remains elementary classical arithmetic.

- S028 final convention audit: the12 product strata count requires retaining vertices for negative-radius graph extension. Standard empty negative-radius Rips adds event0 (at most15 strata); all pairwise invariant equalities and the gap survive. Never suppress this convention.

## S029 lessons and hostile corrections — 2026-10-13
- Boolean T28's kernels from the bottom primitive *edges* do not lift deaths at v_j=1 on a three-level axis. Necessary repair: simultaneous kernels of bottom→axis points a_j=(v_j+1)e_j, not b→v+e_j. The latter misses exits whose other coordinates are low.
- Do NOT choose slab projection arbitrarily: it must annihilate the incoming lower-layer image I_i. All-prime directness plus unit Smith factors saturates K'_i+I_i and permits such an integral projection.
- Primitive generating edges do NOT imply primitive composites even on a 3-point chain; explicit BA=×2. Missing F2 purity of pairwise spans likewise defeats a naive lift despite all composites pure. No such negative control satisfies T65 hypotheses.
- The field theorem LLO and projective-poset freeness precede parts of the proof; internal mathematical success does NOT equal HHA originality or submission clearance. Finite prime computations cannot certify every p; all-prime inference uses Smith/UCT.

## S030 (2026-10-13) hostile lessons
- Naive treat-[1,2]-as-singleton or peel [1,1] before [1,2] fails exit naturality proof: [1,2] survives to index2. Use **descending death/end, ascending birth/start** and rank inversion.
- Projection onto an interval image need not annihilate earlier incoming maps. Require **joint** saturation H+I across Q/F_p and choose one Z-projection zero on I.
- Finite 3²/4²/4³/5² Smith tests cannot prove universal validity or all-prime coverage; the symbolic Smith unit argument does that conditionally on field hypothesis.
- 1981 and 2026 ring-valued original full proofs inaccessible; no novelty implication from abstract or negative search. FoCM qualitative rank resolutions not a succinct BIT result.
- No new R5 exact certificate and no replacement original HHA homotopy application. Stage1 still open.

## S031 lessons (14 October 2026)
- Every-prime middle exactness is not just zero rational and zero integral middle homology; H0 of EACH cube may have torsion, whose Tor term creates mod-p H1. Explicit primitive-arrow square has Smith d1=(1,2): H1(Z)=0 but H1(F2) !=0. Unit Smith of each d_j plus rational middle rank equations gives finite exact replacement for infinitely many field tests.
- Internal sheared tests now actually extract Z sections/retractions and recover full natural basis on every comparable pair; positive finite evidence is not universal proof or originality.
- An algorithm enumerating 2^n stalks on an O(n) succinct Boolean-grid presentation is not a succinct polynomial decision algorithm, and does not itself yield hardness.
- Full original 1981/2026 proofs not accessible: do not claim priority or select a flagship; ordinary homology-filtration interpretation is not an original homotopy theorem.

## S032 lessons — 14 October 2026
- Number of all order cubes in an **expanded** product chain grid with N vertices is ∏m_j(m_j+1)/2≤N². This closes an unproved explicit-input polynomial-bit **recognition** obligation once bit-growth bounds and classical deterministic Smith algorithms are invoked. It is not an efficient algorithm for succinct representations of N=2^n, nor a polynomial-bit certificate of small integral conjugating bases.
- Source priority can improve with direct original arXiv HTML even when an earlier PDF download was disabled: Keagy2026 actual full proof sections now inspected, chain/zigzag only; authentic 1981 JPAA pp7–12 still not accessed. Do not overclaim uniqueness.
- Corrected Smith test generator: a single entry change in an already sheared matrix is not generally unimodular; apply elementary **row additions**. Boundary naturality must compare against the 0/identity thin module arrow, not identity across outside-to-inside support. Both issues fixed *in the test harness* before PASS, not mathematical counterexamples.
- Construction from known split blocks is positive extraction evidence, not a nonsplit universal adversary. Preserving all-composite purity, joint H+I saturation, H0 torsion and all-prime field criterion is mandatory for real T66 counterexample.
- No genuine new homotopy invariant/obstruction or nonprincipal succinct k≥1 reduction found. Stop promoting inherited Hopf/cofiber or pure persistence certificates as original HHA flagship.

## S033 — higher homotopy source-kill lessons
- Classical 3-type κ=Sq² example is literally printed in Møller–Scherer2009, not a new 2-parameter obstruction just because displayed on a square.
- Edgewise compatibility bκ=a*κ is NECESSARY and suffices for a single arrow but not proven sufficient for an entire coherently rectified grid. Missing higher coherence must NOT be ignored.
- The Moore Ext¹ class is invisible to **integral** H/π group maps, yet mod2 H3 maps detect it; a universal field-invisibility headline is demonstrably false.
- Total cofiber H3=Z²/<(a,n)> shows a real derived distinction but is elementary UCT + classical cubical theory, NOT a sufficient HHA novelty claim.
- Do not silently replace K(Z,3) with S3: K(Z,3) has no higher π, crucial to proving every π_i map zero.
- Genuine original 1981 JPAA20 7–12 remains uninspected despite similarly named proceedings in public search; strict R5 and succinct n2,k1 BIT unchanged.

## S034 failures and controls
- **S034-F1 COEFFICIENTS VS MAPS:** equality of edge κ with identity a,b does not imply prescribed *edge map classes* form Ho-square: nonzero H³(K(F₂,2);F₂) shear. Does not prohibit *some* all-identity coherent completion from the coefficient data.
- **S034-F2 HIGHER OBSTRUCTION OVERCLAIM:** nonzero π₁ shear mapping space is a torsor of 2-cell fillers, not a nonzero obstruction to existence; full self-map space not identified with shear subspace.
- **S034-F3 CLASSICAL STRICTIFICATION:** all 256 closed [2]² shear assignments admit explicit strict potential realization in restricted class; DKS generic mapping-space obstruction and Baues–Blanc comparison preexist, so Postnikov-coherence as original HHA flagship RETIRED.
- **S034-F4 PRIORITY:** LS Remark3.13 explicitly poses space-level interleaving distance strictness; 2025 dg module equality does NOT solve all spaces. Contemporary solutions must still be audited, no novelty assumption.
- **S034-F5 PRESERVED OBLIGATIONS:** T66 original1981 unavailable, universal all-composite/Q-all-Fp counterproof outstanding, binary succinct k1 still no P/hardness, S023 16471 all-pairs strict R5 open; Hopf benchmark remains retired as proposed flagship.


## S035 — new obstacles and lessons
1. An ordinary pointwise null square is NOT zero as an arrow morphism in Ho(Top^[1]); nonvanishing Toda bracket is coherence-level obstruction. Derived pullback must be checked under both pointed/unpointed categories. T75/T76 internally proved; independent referee still required.
2. 2026 published dg-module interleaving equalities do NOT assert equality of original Top^R distances. Related relative Sullivan CDGA results likewise distinct. No category substitution allowed.
3. LS2020 preprint v1 already speculated the d_IHC>d_HC adaptation; published 2023 calls both strictness questions open. Internal proof is not automatic priority novelty.
4. Initial finite stage script accidentally checked F instead of G in the intermediate object and failed; corrected source checked 5 rational scales. Test is only floor-stage sanity, not homotopy certification.
5. Expanded integer-grid SNF says nothing about genuinely binary succinct LLO nonprincipal k>=1, retained open.

## S036 — hostile tests and lessons
1. Previous T76 numerical ≤2 upper bound was not sharp. Full composite cofibration from two mapping cylinders and HEP yields strict null triple composite and exact d_IHC=d_HI=3/2; don't confuse it with an HI/IHC *separation*.
2. S035 derived arrow θ survived a second projectively cofibrant mapping-cylinder model and explicit Toda indeterminacy; degree-two actions on pi5(S3) vanish. External independent referee remains outstanding.
3. Pointwise null maps alone never imply zero derived arrow: nullhomotopy coherence and π1 Map(S4,S3) matter; the source's 2-connected target is necessary for the easy unpointed reduction.
4. Any replacement of last arrow by a homotopic map must be connected by an actual **objectwise weak equivalence zigzag of full diagrams** (path-object terminal stage), not by a declaration of equal homotopy classes.
5. Original 2020 LS v1 already stated the proposed IHC adaptation, so even an internally proven exact endpoint is not automatically publishably original. No novelty gate.
6. 2026 dg-module/CDGA equalities are in different categories; LLO input length must be binary BIT not expanded N; no unrelated computing campaign.

## S037 hostile lessons
1. Repeating four-stage Toda with higher brackets and only ONE nonterminal shifted composite cannot yield HI>IHC: full null n-fold composite strictifies at n/2 via HEP after n-1 cofibration replacements (T82).
2. For relative k1, checking only principal upsets confuses **standard** pd and all-rectangle relative pd. Enumerate ALL finite-grid rectangle summands in canonical cover, use all-square weak exactness for its kernel.
3. Binary grading coordinates are not an exponentially large grid: generator/relation grade changes give polynomially many critical coordinates. Need both-direction transport of *relative exactness*, not just stalk isomorphism.
4. FALSE auxiliary lemma: Hom(Q,E M)=0 whenever Q's upper cut lies strictly inside a critical gap. Maps from Q may survive earlier while M vanishes late; correct method is pi_!Q (shorter aligned rectangle) and Hom adjunction.
5. Discrete N² left Kan/right floor proof is NOT a complete argument for original arbitrary real R² rectangle open/closed/below-min conventions; these are explicit S038 hostile obligations. Full general LLO Problem1 not pronounced solved.
6. 2020 Botnan and 2025 FoCM prior work gives substantial method precedence; no current HHA-original homotopy theorem, no novelty Gate2. 1981 T66 / frozen R5 / retired Hopf preserved.

## S038 hostile lessons
1. Major archival self-duplication: S018-T43/T44 ALREADY had real all-rectangle endpoint-safe transfer and fixed n,k polynomial arithmetic, contrary to S037's supposed real gap. Audit own claim history before treating a gap as open/new.
2. Incorrect substitute: restricting off-grid Q at critical grades changes Hom tests. Q=[1,5] has restriction support grid3 but Kan support grid0 in finite [0,3,7] example.
3. Real rays have no maximal point; membership exactly at an upper cut is distinct from cofinality below it. A finite P diagnostic cannot replace that proof. A prebirth sentinel handles all x<first grade and open/closed/unbounded cases.
4. First enumerator attempt WRONG: naturality formula omitted the source arrow factor u(p), forcing artificial zeros. Corrected exhaustive 396 F2 Hom and 4356 rectangle products pass; only corrected run used.
5. T84 binary-bit F2 specialization avoids exponent expansion but may be a direct recombination of 2020/2024/2025 established methods. It is not original HHA work without further claim differentiation, genuine homotopy application and external referee.
6. HI/IHC overlapping windows: two π0 equations with individual homotopies do not yet yield a replacement-robust higher coherence obstruction. No gap survivor and no general equality proof.

## S039 failures and lessons
- Reusing the 2023 LS (2,η,2) vertexwise null composites for HI>IHC fails: θ is NONZERO in Ho(Top^[1]), so the supposed IHC upper does not exist. It tests the necessity of T87's coherent hypothesis.
- Mapping-cylinder factorization of g alone does not preserve strict g f=constant; the quotient B/A and mapping cylinder of B/A→C preserve it and let relative HEP kill h g.
- Two overlapping derived-arrow windows against the point target do NOT yield HI>IHC in a four-stage chain under T87; move to derived [2] at five stages or a genuine non-point target. External proof priority and full 1989 DKS source unverified.
- F2 all-real rectangle k1 BIT is earlier T84 combining S018 T43/T44 with S037, hence not fresh S039 novelty.


## S040 hostile lessons
- Pointwise [gf]=[hg]=[kh]=0 is NOT a morphism-zero certificate in Ho(Top^[2]); compute in a projectively cofibrant strict equalizer and retain both overlap coherences.
- Even FOUR essential primitive arrows give no gap: n=i1 p2 on S³∨S³ has nonzero pi3 matrix N but N²=literal constant, yielding dHI=dIHC=1 on five stages.
- If any ONE of f,g,h,k is null and theta2 is coherently zero, T92's four-case HEP/T87 constructions strictify the triple; proposed counterexample must evade all four cases.
- A candidate at epsilon1.5 needs derived-arrow coherence of two overlapping three-step composites; no proof this automatically rectifies. A failed fixed model is not a replacement-invariant obstruction.
- Original DKS1989 §§4.4–4.8 explicitly supplies relative realization and H^{n+1} obstruction theory. Even a genuine obstruction computation must be compared to these published results before novelty credit.


## S041 failures and lessons
- A T87 strictification of compressed A->B->D->E is NOT yet a five-stage theorem; preserving C requires cofibration B↪C and HEP to lift the homotopy-compatible modified B->D map, proven as restricted T95.
- An arbitrary equivalence zigzag cannot yield a chosen strict homotopy inverse D->D'. Rely explicitly on T87's quotient-cylinder retraction and edge homotopy; if this relative property fails, T96 must be downgraded.
- Trying to make h:C->D a cofibration while hg literal constant breaks injectivity when g is essential. This naive epsilon1 HEP step is INVALID.
- Quaternary Toda without coherent null and full indeterminacy is not a gap witness; no nonzero DKS relative cocycle was calculated. Epsilon1 remains genuinely OPEN, no invented obstruction.
- S041 T95/T96 T97 rely on unrefereed T87 and classical DKS1989. No original HHA priority or gate increase.
