# S174 continuation — isolate and repair the coherent boundary lift (IN PROGRESS, PARTIAL)

S173 remains the last completed session. S174 is active and unfinished. Continue this same proof campaign; do not create S175 or describe the frozen theorem as Lean-certified.

## Frozen theorem

Over B = F₂[C₄], formalise the genuine five-stage entire-real diagram F against zero and prove
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4 ≤ dHI(F,0) ≤ 5/2`.
The derived category is for whole real diagrams. Homotopy distance allows arbitrary whole-diagram objectwise quasi-isomorphism zigzags on BOTH lanes, including nonzero acyclic replacements of zero. Do not weaken these quantifiers or substitute finite-grid or literal-zero assumptions.

## Entry state and current branch

Entry main is `783565958c01b36f35fcb01bda3593f328f11525`, with merged-main Lean #41480400099 and integrity #41480400038 SUCCESS. Continue draft PR #214, branch `proof/s174-obstruction-bridge-20261102`, from its live head. It is deliberately unmerged because the exact-head pinned Lean build #41536335245 FAILED. Integrity #41536335230 passed. Recheck branch head and all workflows before any promotion.

## What this continuation established

The hosted compiler built these connected pieces in the failed full build: `ChainCochainBridge`, `CochainDefiningSystem`, `DirectDefiningSystem`, `DirectObstruction`, `ReducedProjectiveResolution`, `ReducedProjectiveAugmentation`, and `WeakTransferAlgebra`. In particular:

- Actual HomComplex cochains map to the existing all-integer chain-family interfaces, including primary homotopies, secondary data and tertiary fillers.
- The strict-zero direct obstruction consumer derives adjacent unit residues from actual homotopies and reaches the existing global no-tertiary-filler theorem, conditional on its explicit comparison and adjacent-class inputs.
- The two-, three- and four-edge comparison-curvature equations compile.
- A coefficient-level reduced projective resolution and augmentation QuasiIso compile.

These components do not provide compatible comparisons from arbitrary whole-real zigzags. The bar is still not a chain complex: total square-zero, chain/functor packaging, chain-level mono, natural augmentation and contraction/QuasiIso remain open. Whole-real derived comparison and the final metric/presentation bridges also remain open.

## Exact current blocker

`C4/KProjectiveBoundaryLift.lean` proves the source-K-projective derived-zero cocycle/boundary lemma. Its intended `lift_coherent_boundary` would lift an original cocycle and a boundary through an arbitrary target QuasiIso, without assuming target K-projectivity. The exact pinned build failed at line 67 with deterministic whnf timeout at 2,000,000 heartbeats. The subsequent empty axiom print for that declaration is compiler recovery, not evidence of a proof.

First split mapping-cone cocycle construction, the derived-zero boundary application, and extraction of the two component equations into small typed lemmas. Compile each targeted module and then the full project. Do not just increase the heartbeat limit. If the cone route remains intractable, use the compiled direct obstruction consumer and seek another proved route from QuasiIso data; state precisely what the producer still lacks.

Once the lift compiles, iterate the two/three/four-edge equations to construct the actual original defining system and forbidden tertiary filler from strict square-zero replacement data. Then prove the finite comparison maps arise from the whole-real objectwise quasi-isomorphism zigzags on both lanes, retaining strict zero composites and adjacent derived classes.

## Validation and closeout

Pinned Lean is available through hosted CI; the local extracted toolchain currently fails with `failed to locate application`. For any candidate promotion, require exact-head pinned C4 plus preserved OptionD success, source/axiom audit, repository validation and handoff checks, reviewed diff, ordinary two-parent merge, and independent merged-main CI. A component build or passing integrity check alone is insufficient.

Keep `STATE.last_completed_session=S173`, `recommended_next_session=S174`, and `full_paper_theorem_lean_certified=false`. Update `sessions/S174/PARTIAL.md` with concrete evidence and failures. Do not claim completion until the faithful final theorem declaration, full build, axiom evidence, and manuscript-to-Lean crosswalk are complete. No OptionD development, novelty/prior-art review, external submission, public release, or third-party contact is in scope.
