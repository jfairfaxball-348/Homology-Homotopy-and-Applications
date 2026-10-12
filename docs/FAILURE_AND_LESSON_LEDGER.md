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
