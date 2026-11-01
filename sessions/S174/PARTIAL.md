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
