# S174 PARTIAL — entire-real algebraic bar indexing (IN PROGRESS, NOT CLOSED)

## Verified entry boundary

The S173 ordinary two-parent merge is `3d10eb7908d47dec9a4c51ae46552520db95bcfa` (parents `d8e26a32e98ea641506c589eef2d6b662c16220a` and `4c7ae600d36526aa50eddf281c0b1dcc7560e9fc`).
The S173 exact PR head passed Lean #41183865211 and integrity #41183865209; independent main push passed Lean #41184125042 and integrity #41184125033. Main was pinned at that merge SHA on S174 entry.

## Actual S174 code and status

`C4/RealShoelaceBarIndices.lean` supplies the true degree-n weak chains of arbitrary length in the two-lane *entire-real* shoelace preorder (including repetitions), coefficient-source vertex, upper-bound transport, injectivity for EVERY fixed simplicial n and EVERY poset arrow, composition of endpoint transport, the n=0 terminal simplex and the sigma indexing type across all n. `C4.lean` imports it into the full pinned build.

First draft `515145f8623a846a3c4caf4dda0c827a75bf2d27`: Lean #41187728007 FAILED in the index-injection proof and dependent-sigma injection attempt; not certified. Corrected source `c4027a5bf1ba6608f32f76c9d6270a13f2bae080`: full pinned OptionD+C4 Lean #41187841286 SUCCESS; repository integrity #41187841303 SUCCESS. The injection theorem at the *dependent sum* level was removed rather than accepted unproved. Confirm final PR-head and eventual main runs separately before further promotion.

## What remains unproved — the required S174 mathematical target

The actual bar total `Q(D)(p)_k = ⨁_{n, q₀≤⋯≤qₙ≤p} D(q₀)_{k-n}` has NOT been built as a chain complex in Lean. Neither the horizontal faces nor internal differential, square-zero, chain-level split-mono endpoint maps, natural augmentation, append-terminal contracting homotopy nor objectwise QuasiIso are compiled. Also still OPEN: strict-interleaving-to-full-shoelace-functor conversion; full-real BOTH-lane weak-equivalence transport; application of S172/S171/S169 to an actual bar replacement; C1 higher transfer; C2 derived cone; C4 numerical metrics.

The index embedding proves injectivity only at the **set of generator indices**. It does NOT prove mono of any chain-complex arrow, nor provide cofibrant objects or quasi-isomorphic augmentations. Preserve arbitrary nonzero acyclic zero-lane replacements and exact full-real quantifiers.

**Session boundary:** This is a verified partial proof step, **not** completed S174. Do NOT advance `STATE.last_completed_session` to S174 or install S175. Do not claim the entire C4 theorem, make external submissions or weaken the frozen first paper. Continue S174's remaining bar construction on subsequent authorization in the active conversation.


## S174 continuation — actual B-linear graded bar coefficients (31 October 2026)

The S174 partial index checkpoint is now extended by `C4/RealShoelaceBarTerms.lean`, imported by the C4 root. For an arbitrary genuine entire-real two-lane shoelace diagram `D`, any real endpoint `p`, and any integer homological degree `k`, `realShoelaceBarTerm D p k` is the **actual B-module** direct sum over ALL simplicial lengths and weak chains of the underlying coefficient module `(D.obj σ.first).X (k-n)`. This is not a hypothetical description of a module; it is a Lean definition of `ModuleCat B`. The same file implements the actual B-linear endpoint inclusion on sums and a projection map which discards summands not bounded by the smaller endpoint.

Evidence on independently pinned commits: source `072abd47510e0b9350cc7be67df5d876d83dad2e` full OptionD+C4 Lean [#41193646776](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41193646776) SUCCESS and integrity #41193646787 SUCCESS; source `34e0adac64fd0cc88b76afab2b1bf65a3893016d` Lean #41193733136 SUCCESS and integrity #41193733090 SUCCESS for actual inclusion; source `3d646f5d66f2ac9c73938fc03a8d6efef9e98d64` Lean #41193917001 SUCCESS and integrity #41193917020 SUCCESS for actual projection. These were source/branch runs, NOT independent post-merge `main` checks.

**Explicit failed proof attempts, excluded from the promoted source.** A proposed equality `realShoelaceBarTermInclusion ≫ realShoelaceBarTermProjection = 𝟙` failed elaboration/tactic closure on `a608d3ab` Lean #41194023460, `9c924dfe` Lean #41194185440, `11b068e1` Lean #41194323396 and `145194c9` Lean #41194470171. The exact unresolved normalisation is reduction of `ModuleCat.Hom.hom` / the underlying `DirectSum.toModule` applied to a `DirectSum.lof` generator and its dependent endpoint proof. In the pinned Mathlib, `DirectSum.toModule_lof (i) (x)` is a pointwise formula, but unqualified `simp`/`rw` did not match the expanded elaborated nested expression. Do not assert the retraction or a split mono; isolate the B-linear map compositions and instantiate the `toModule_lof` identity explicitly, or switch to direct `DFinsupp` embeddings before trying again. All the failed retraction theorem text was removed from the final source, preserving only verified definitions.

**Still missing:** the bar horizontal faces and total differential on these actual B-modules, d²=0, chain-complex functor laws, degreewise retraction/mono, natural augmentation, pointwise append-terminal contraction / QuasiIso, strict-interleaving-to-shoelace conversion, acyclicity transfer, applications of S172/S171/S169, C1/C2 bridges and exact C4 metrics. No S174 closeout or S175 prompt is authorised; keep `STATE.last_completed_session = S173` and `recommended_next_session = S174`. No external research/publication action.


## S174 continuation — full-real horizontal and internal bar boundaries compiled (31 October 2026)

This checkpoint extends the genuine full-real B-linear graded direct-sum construction, **without claiming to have completed S174**.

New pinned C4 imports:
- `C4/RealShoelaceBarFaces.lean`: actual simplicial face deletion, endpoint compatibility and first-face coefficient order.
- `C4/RealShoelaceBarHorizontal.lean`: actual B-linear horizontal face maps and their sum on the full direct-sum coefficient modules, including the first-face diagram morphism and integer total-degree transport.
- `C4/RealShoelaceBarTotal.lean`: actual B-linear internal differential on graded terms and a proposed total differential equal to internal plus horizontal.

The first draft of dependent-sigma index injectivity **failed Lean**, including at commits `5fda2bab8367f70e465c37b58d69fbbfe51f3821` and `4cfbc4f18d9005b5a60d3312092a7d60d3858e3b`. It was removed, NOT promoted as proven. Distinct simplex lengths are retained in the dependent index definition, and single-length inclusion injectivity was already certified; the dependent sigma theorem remains a standalone proof obligation.

**Verified exact source:** `487a65dc6d3439298877094d29d36016b02a6cf8`.
- Full pinned OptionD+C4 Lean build: [#41220482986](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41220482986) **SUCCESS**.
- Repository integrity: [#41220482903](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41220482903) **SUCCESS**.
- Independent PR-head and merged-main checks **must still be verified separately**; these are source branch checks only.

**Important scope limitation:** The new `realShoelaceBarTotalBoundary` is a family of degree-minus-one `ModuleCat B` morphisms; no proof of `d_total²=0` has been given. Accordingly no `C4Complex` bar object, endpoint **chain** maps, natural augmentation, append-p contraction, QuasiIso, full two-lane functor conversion or application of S172/S171/S169 has yet been verified. Do NOT claim completed S174, C1/C2/C3 closure or the numerical C4 theorem. S175 remains uninstalled.

**Critical next proof:** establish the paired simplicial face relation and the total square-zero theorem directly on `DirectSum.lof` generators, using `DirectSum.linearMap_ext`/pointwise reductions. Then package the genuine bar chain complexes and functorial endpoint maps. Preserve all-real and both-lane quantifiers throughout.

## S174 continuation — complete dependent index embedding and degreewise augmentation (1 November 2026)

Fresh owner invocation on 1 November, building from merged S174 partial PR #210 (main `df523933838e9f590325e764d5e6c13642c929f1`), installed the following **actual Lean definitions/theorems**:

- `realShoelaceBarIndexInclusion_fst`, `realShoelaceBarIndexInclusion_injective`, `realShoelaceBarIndexInclusion_refl`, `realShoelaceBarIndexInclusion_comp`: **all** dependent-sigma simplicial degrees, **all** endpoints on both real lanes, including arbitrary crossing arrows. This addresses the earlier failure to prove index injectivity at the dependent-sum level; it is an injectivity statement about **indices**, not yet the needed mono statement for chain-complex morphisms.
- `C4/RealShoelaceBarAugmentation.lean`: `realShoelaceBarTermAugmentation`, an actual graded B-linear map from each bar direct-sum term to the original coefficient module, using the genuine `D.map` at simplicial length zero and zero on positive lengths. The explicit `eqToHom` reconciles integer degree `k - 0` with `k`.
- The root `C4.lean` imports the new augmentation module.

**Verified exact source** `842a575f8d004f31ff6d47c9501412c56451c591`: full pinned OptionD+C4 Lean [#41290566421](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41290566421) **SUCCESS**; repository integrity [#41290566425](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41290566425) **SUCCESS**. Initial proof draft failed for an extra tactic after a solved goal; the intermediate augmentation map attempts failed due to `ModuleCat.Hom` vs underlying linear maps and then an unresolved `k - 0` degree equality. All were corrected in the verified source. Exact **final** PR-head and merged-main checks remain separately required after this checkpoint documentation.

**STILL OPEN, NOT ASSERTED:** the paired simplicial face identities and total square-zero theorem, genuine bar chain complex and functor, its degreewise-monic **chain** maps, natural chain-level augmentation and append-terminal contraction / objectwise QuasiIso, two-way strict interleaving/full-poset conversion, application S172/S171/S169 to arbitrary both-lane weak-equivalence replacements, C1/C2 and the frozen exact metric theorem. Keep `STATE.last_completed_session=S173` and future active S174, NOT S175. No OptionD modifications, custom axioms, paper completion or external actions.


## S174 continuation — direct HomComplex calculus and the explicit comparison contract (2 November 2026)

Entry main was `f962b97dbf6d8ffd314c0ce09e98bc8a3dcb3235` (tree `e052f454a97829c4db4c2e98aced620375df01df`), following documentation PR #212. No competing proof PR was open; this continuation uses draft PR #213. This is substantial partial work, not an S174 closeout.

`C4/DirectTransfer.lean`, imported by the root, now supplies:

- `reverseComplex`, `reverseMap` (composition/identity/zero), `reverseHomotopy`, and `reverseHomotopy_d` on actual arbitrary integer-indexed B-module complexes/maps/homotopies.
- Characteristic-two sign/subtraction lemmas on every HomComplex cochain and `unsigned_δ_comp_any`, derived from Mathlib's Leibniz theorem.
- Actual `directPrimary`, `directSecondary`, and `directTertiary` words of degrees -1/-2/-3. Their `_d` theorems differentiate the words and kill all identity cuts using the explicit strict consecutive-zero hypotheses. `directPrimaryHomotopy` uses the library cochain/homotopy equivalence to produce an actual Mathlib homotopy.
- `comparison_of_quasiIso` under K-projectivity of BOTH complexes; the explicit bounded-above/termwise-projective sufficient version; `reverseResolution_isKProjective` for every original shifted C4 resolution; and `comparison_to_resolution`, whose remaining additional hypothesis is replacement-side K-projectivity. This does NOT infer a homotopy equivalence from arbitrary QuasiIso.

**Checked exact proof source:** `76120036d64ae3200c78ec9b6742deeeffcc38f0`. Exact PR Lean [#41478721288](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41478721288) and integrity #41478721382 SUCCESS; push Lean #41478712366 and integrity #41478712244 SUCCESS. Full pinned C4+preserved OptionD build, unchanged manifest. The printed axiom dependencies of the comparison, reversal, primary, secondary and tertiary theorems are exactly `[propext, Classical.choice, Quot.sound]`. Final-head and independent merged-main evidence must be checked separately during promotion; PR #213 retains the exact integration record.

**Actual failures and repair:** earlier draft heads, including `5863576`, `9923cc7`, `40ecf68`, `df69106`, `0649ab5`, `50805ca`, and `5afdcd6`, failed Lean and were not treated as certified. Failures included implicit source/target complexes in `dNext_eq`, arithmetic degree expressions preventing `δ_ofHomotopy` matching, and dependent component transports (`p+0` and nested negative-degree sums). Choosing matching intermediate indices before expansion, reducing integer degrees before the homotopy lemma, and reusable component normal forms resolved them. Failed declarations' temporary compiler recovery axioms were NOT accepted as proofs; the successful source's axiom audit excludes them. Two malformed orchestration calls in the earlier conversation never executed; they made no repository changes or mathematical progress.

**Environment/evidence distinction:** local pinned Lean startup was unavailable (the attempted extracted toolchain could not locate its application); this batch was compiled by the pinned hosted workflow. Local repository validation, partial-session handoff check, all ten handoff tests and whitespace/source audit passed. No OptionD source, theorem quantifier or external-action boundary changed.

**Exact remaining mathematical blocker:** construct compatible replacement-side K-projective complexes (or a proved weaker comparison route) from arbitrary whole-diagram objectwise quasi-isomorphism zigzags on BOTH real lanes, retaining the strict consecutive-zero relations and adjacent derived classes. The three middle homotopies `v_i ≫ u_i ~ id` suffice for the raw word calculus; endpoint inverse homotopies are not required by that calculation. The existing bar's graded maps/augmentation do not prove this producer contract.

**Still unimplemented consumer work:** factor the raw middle endomorphisms `r_i = v_i ≫ u_i`, convert the degree-two/three cochains to the existing all-degree chain-family interfaces, establish the four adjacent unit residues, construct the actual original-system `GlobalFourfoldDefiningSystem` and `TertiaryFiller`, then apply `.no_tertiary_filler`. The raw three-cut identity is not that completed contradiction. Bar total square-zero/functor/chain augmentation/contraction, derived whole-real cone/localisation, coefficient presentation and final metrics remain open. S173 stays last completed, S174 IN_PROGRESS/PARTIAL; no S175.


## S174 draft continuation — original-system obstruction bridge (2 November 2026)

Entry main `783565958c01b36f35fcb01bda3593f328f11525` (PR #213) has independent main Lean #41480400099 and integrity #41480400038 SUCCESS. Continuing work is saved in **draft PR #214**, branch `proof/s174-obstruction-bridge-20261102`. It has NOT been promoted to main. S174 remains IN_PROGRESS/PARTIAL.

The hosted compiler has accepted the individual `ChainCochainBridge`, `CochainDefiningSystem`, `DirectDefiningSystem`, and `DirectObstruction` modules. They construct the actual all-integer chain defining-system/tertiary-filler interfaces from HomComplex cochains, factor the strict-zero direct words using only the three middle retraction homotopies, derive adjacent unit residues from actual original-side homotopies, and apply the existing arbitrary-global no-tertiary-filler theorem. Derived equalities of original adjacent maps are reflected to homotopies using original-resolution K-projectivity. This closes the consumer under its explicit comparison and four adjacent-class hypotheses; it does **not** supply those hypotheses from arbitrary whole-real weak-equivalence zigzags. Component compilation during a failing full build is not a passing integration certificate.

The fallback `ReducedProjectiveResolution` module also compiled: zero-preserving coefficient projective resolutions using Mathlib's reduced left resolution, their natural degree-zero augmentation, and termwise-projective total complexes. It does not supply a natural total augmentation/QuasiIso for arbitrary unbounded complexes or retain whole-diagram comparison data. `ReducedProjectiveAugmentation` is a further draft of the coefficient-level QuasiIso.

The active weaker-data route is `KProjectiveBoundaryLift`: a derived-zero mapping cone should lift an original cocycle together with a replacement-side boundary through an arbitrary target QuasiIso, producing an original filler and the next comparison correction. No K-projectivity of the target is assumed. The source-K-projective derived-zero cocycle/boundary lemma compiled, but the final coherent lift hit the default deterministic heartbeat limit. `WeakTransferAlgebra` contains the two-, three-, and four-edge comparison-curvature equations needed to iterate that lift. The three-edge equation compiled; the pair strict-zero rewrite was repaired, and the four-edge equation is newly under test. These are not yet an assembled weak-comparison-to-obstruction theorem.

At code head `eaf7092f75674801ba64c0cb237d088ebbf33f70`, integrity #41536335230 SUCCESS; pinned Lean #41536335245 was still running when this checkpoint was written. This head repairs the coefficient H0 packaging and pair rewrite and tests a finite 2,000,000-heartbeat bound for the coherent lift. Earlier heads, including `96e67e6c3e5207657b493f5dfc5ad46328c769e6`, failed full Lean; they are not certified. Inspect the exact latest run result before continuing.

Next: finish and compile the cone boundary lift and four-edge algebra, iterate the lift to produce the actual original defining system and filler from target QuasiIso comparisons, then reflect finite derived isomorphisms to actual source-K-projective comparison maps. The whole-real bar chain/functor/contraction/QuasiIso, full-poset comparison, derived cone/localisation, coefficient presentation and frozen numerical declaration remain open. The local extracted pinned Lean still fails startup with `failed to locate application`; hosted pinned CI is the available compiler evidence. No placeholder proof, new axiom, relaxed theorem or S175 has been introduced.


**Latest diagnostic:** pinned Lean #41536335245 finished **FAILURE**. At code head `eaf7092f75674801ba64c0cb237d088ebbf33f70`, all seven new modules other than `KProjectiveBoundaryLift` compiled, including the coefficient augmentation QuasiIso and all two/three/four-edge curvature equations. Their printed proof dependencies are the standard `[propext, Classical.choice, Quot.sound]`. The sole reported error is `C4/KProjectiveBoundaryLift.lean:67:0`, deterministic `whnf` timeout at 2,000,000 heartbeats while elaborating `lift_coherent_boundary`. That declaration's subsequent empty axiom report is compiler recovery, **not** a proof certificate. The coherent lift remains unproved; raising the bound did not resolve it. Isolate its mapping-cone lifts and degree/derived-category elaboration into smaller typed lemmas before further full integration. No promotion was attempted.


## S174 continuation — weak-data obstruction route; dHI and dCohI certified (2 November 2026, later)

Owner invocation in a new conversation: "pick up the remaining work on this project and formalise in Lean". Entry main `783565958c01b36f35fcb01bda3593f328f11525` (tree `ecb75993cd8054a4b157aa03ffac99efba2dd1ce`). The only competing PR was draft #214; its branch was merged (fast-forward) into working branch `ccr-efb93145-frhiz0`, reused, and repaired rather than duplicated. S173 remains the last completed session; S174 remains IN PROGRESS.

**Compiler environment.** Unlike earlier continuations, a local pinned toolchain now works: elan installed `leanprover/lean4:v4.35.0-rc2`, `lake exe cache get` fetched the pinned Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55` cache, and the full `lake build` (C4 + preserved OptionD) ran locally in about 2.5 minutes. All evidence below is LOCAL pinned compilation. Hosted exact-head PR checks, merge and merged-main CI have NOT yet been run for this continuation.

**Route change (mathematical).** The quotient/bar route needed a replacement producing strict square-zero composites plus homotopy inverses. It is no longer needed. The obstruction is transferred directly through the strict interleaving, using its acyclic (possibly nonzero) opposite lane, with only original-side K-projectivity:

- `C4/KProjectiveLifting.lean`: `kProjective_postcomp_bijective` (postcomposition with ANY quasi-isomorphism is bijective on homotopy classes out of a K-projective complex, via `ObjectProperty.isColocal_trW` in the homotopy category; no derived category); `kProjective_cocycle_injective/surjective`; `kProjective_relative_lift` (an original cocycle whose image bounds lifts to an original filler together with the next comparison correction); `kProjective_acyclic_coboundary` (all degrees); reversal preserves exactness and `QuasiIso`.
- `C4/InterleavingTransfer.lean`: comparison words and curvature identities `interleavedPrimaryWord_d`, `interleavedOmega_d`, `interleavedSecondaryWord_d`, `interleavedChi_d`, `interleavedTertiaryWord_d`, using both interleaving laws and both naturalities in place of strict zeros; `CochainInterleavingLadder.nonempty_fourfold` constructs a complete `FourfoldCochainSystem` (three primaries, two secondaries, tertiary filler) on the ORIGINAL complexes from a homotopy-commutative ladder whose rungs `u₂,u₃,u₄` are quasi-isomorphisms.
- `C4/InterleavingObstruction.lean`: `canonical_no_fourfoldCochainSystem` and `canonical_no_interleavingLadder` — through PR #214's `CochainFourfoldData`/`TertiaryFiller` bridge and the certified `GlobalFourfoldDefiningSystem.no_tertiary_filler`; adjacent unit residues are the canonical ones because the adjacent maps ARE the canonical maps.
- `C4/RealLadderTransport.lean`: `WeakZigzag` := `Relation.EqvGen` of whole-diagram natural transformations with objectwise `QuasiIso` components (arbitrary finite zigzags, either direction); `WeakZigzag.acyclic_of_zero`; `WeakZigzag.hasRevLadder_iff` (ladder transport both directions; backwards by K-projective lifting on the original side only).
- `C4/HomotopyInterleavingBound.lean`: base ladder of `realDiagram` at cuts `0,1,2e,2e+1,4e`; `StrictRealInterleaving.mono`; **`strictInterleaving_ge_five_fourths`**; `homotopyInterleavingDistance` (`ℝ≥0∞`-valued infimum, `∞` if empty); **`five_fourths_le_homotopyInterleavingDistance`** and **`homotopyInterleavingDistance_le_five_halves`**.
- `C4/HomologyInterleavingDistance.lean`: generic `PersistenceInterleaving`/`persistenceInterleavingDistance`; underlying-𝔽₂ homology persistence via `ModuleCat.restrictScalars (ZMod 2 → B)`; `homologyInterleavingDistance` (supremum over all integer degrees); **`homologyInterleavingDistance_realDiagram_zero : … = ENNReal.ofReal (1/2)`**.
- PR #214's failing `lift_coherent_boundary` (whnf timeout) is re-proved in two lines from `kProjective_relative_lift`; its `maxHeartbeats 2000000` override was removed.

**Evidence.** Full local pinned build `Build completed successfully (9009 jobs)` at commit `fc42de8` on `ccr-efb93145-frhiz0`. Printed axioms of every new headline declaration: `[propext, Classical.choice, Quot.sound]`. No `sorry`, `admit` or custom axiom. Commits: `5faa917` (lifting + transfer + obstruction), `d331228` (zigzags + dHI bounds), `fc42de8` (dCohI). Local `python3 -m unittest discover -s scripts -p 'test_*.py'`: 10 tests OK.

**Still open (exact).** (1) C2: `dIHC(F,0)=1` in the localisation of whole real diagrams at objectwise quasi-isomorphisms — requires a derived interleaving definition (lifted translation functors), the upper bound `[η₂]=0` via a natural cone resolution and the canonical `h`/`z` fillers plus homotopy invariance of the localisation, and the lower bound by evaluation at `0` into `D(B)`. (2) The single faithful final declaration combining all three distances, and the manuscript-to-Lean crosswalk. (3) Hosted exact-head PR CI, ordinary two-parent merge and independent merged-main CI. The bar modules remain preserved but are no longer on the critical path. No S175, no external action, no OptionD change.


## S174 continuation — dIHC(F,0)=1 and the combined final declaration (3 November 2026)

Same owner-authorised conversation and branch `ccr-efb93145-frhiz0`.

- `C4/DerivedInterleavingDistance.lean`: `objectwiseQuasiIso`, `translateFunctor`, lifted `derivedTranslate`/`derivedTranslateMap` on an arbitrary localisation, `DerivedRealInterleaving`, `derivedInterleavingDistance`; **`one_le_derivedInterleavingDistance`** (evaluation at 0 into `D(B)`; the identity of `P` and the class `[x]` are reflected to chain homotopies by original K-projectivity).
- `C4/DiagramHomotopyInvariance.lean`: `diagramComplex`/`diagramComplexMap` (inverse of Mathlib's `complexOfFunctorsToFunctorToComplex` by structure eta) and **`map_eq_of_naturalHomotopy`** via Mathlib's cylinder lemma.
- `C4/DerivedStageReduction.lean`: two-stage advance on `Fin 7`, `stageTwoShift`, factorisation `twoShift_realDiagram_factor`, reduction `localized_twoShift_eq_zero_of_stage`.
- `C4/DerivedStageResolution.lean`: contractible cones `coneOfContraction`, `biprodSndHomotopyEquiv`, cone cycles `coneCycle`.
- `C4/DerivedStageNullhomotopy.lean`: seven-stage resolution (cone summands only on stages 2 and 3, since targets vanish from stage 4), stagewise quasi-isomorphism, nullhomotopies from canonical `h₀₂,h₁₃,h₂₄,z₀₃,z₁₄` (terminal edge included), naturality `stage_nat_one/two`, `stageNaturalHomotopy`, **`localized_twoShift_eq_zero`**, **`derivedInterleavingDistance_eq_one`**.
- `C4/MainTheorem.lean`: **`c4_distance_separation`** — `homologyInterleavingDistance realDiagram zeroDiagram = ofReal (1/2)`, `derivedInterleavingDistance L … = ofReal 1` (every localisation `L`), `ofReal (5/4) ≤ homotopyInterleavingDistance … ≤ ofReal (5/2)`, and the strict inequalities; `c4_distance_separation_canonical` for Mathlib's `objectwiseQuasiIso.Q`.

**Evidence.** Full local pinned build `Build completed successfully (9015 jobs)` at `a85920b`; `c4_distance_separation` and `c4_distance_separation_canonical` depend on axioms `[propext, Classical.choice, Quot.sound]`; no `sorry`/`admit`/custom axiom in C4 sources (`grep`), `sorryAx` absent from the build log. Crosswalk: `formal/C4_LEAN_CROSSWALK.md`.

**Remaining before S174 closeout.** (1) Hosted exact-head PR Lean and integrity CI, ordinary two-parent merge and independent merged-main CI (no PR has been opened by this conversation). (2) The presentation `C4.B ≅ 𝔽₂[C₄]` (via `t = 1 + g`) is the standard identification recorded in the crosswalk but is not a Lean `RingEquiv`. Only after (1), and an owner decision on (2), should S174 be closed and S175 installed.


## Session closed (3 November 2026)

At the owner's instruction, PR #215 passed exact-head Lean #41592284384 and integrity #41592284364. It was merged by the ordinary two-parent merge `bc06b6011f5556a8ba36ee85167b1fa5c875bc06`, and merged-main Lean #41593094820 and integrity #41593094882 passed. The working branch was fast-forwarded to the merge. Draft #214 is contained in it, and GitHub marked #214 merged. The owner decided that the presentation `RingEquiv` belongs to S175. The closeout is `sessions/S174/CLOSEOUT.md`. This record is otherwise unchanged history.
