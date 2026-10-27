# S144 — certify categorical C4 homology, projectivity and shifted dg (FUTURE, UNEXECUTED)

**Authorisation boundary.** S143 is the current owner-invoked session; S144 is NOT authorised by installing this file. S144 requires a fresh, separate owner instruction. No Palomar, arXiv/HHA submission, external release, third-party contact, novelty, prior-art, HHA-fit screening, outside review, new target, OptionD development or metric optimisation.

## Entry
Pin LIVE main SHA and tree. Reconcile authored S143 merge, read AGENTS.md, authoritative/STATE.json, sessions/S143/{PROOF,BUILD,CLOSEOUT}.md, C4/*.lean, formal/C4_FORMALIZATION_PLAN.md, research/C4_FROZEN_CANDIDATE.md, paper/C4_MANUSCRIPT.md and docs/ROADMAP.md. Confirm hosted Lean AND integrity PR/main checks by actual conclusions. One isolated S144 branch and ordinary two-parent PR merge. No admitted proofs, new axioms, unchecked oracle, version/manifest drift.

## Exact frozen first-paper theorem
Over B=F₂[C₄], the fixed five-stage whole-real diagram F:ℝ→Ch(right B) compared with O=0 has *internally written, NOT fully Lean-certified* distances d_CohI=1/2 < d_IHC=1 < 5/4 ≤ d_HI ≤ 5/2. d_HI admits arbitrary objectwise-quasi-isomorphism zigzags of both whole real-indexed diagrams (including nonzero acyclic zero-lane replacements). Not Top^ℝ. Do not alter the claim or conflate a degree-2 jet with an all-choice dg theorem.

## Work, in order
1. Build from the S143 compiled categorical residue `ModuleCat B` module and concentrated residue complex. If S143 did **not** compile `C4.augmentationChainMap`, fix its last exact dependent cast/associativity gap first using the public `ChainComplex.ofHom` and the already-certified zero differential after B-linear residue; verify n=-1,0 explicitly. Do NOT silently claim a chain map from component maps.
2. Prove categorical homology, all integer degrees: H₀(integerResolution) ≅ residue B-module, H_n ≅0 for every n≠0 (including negative n). Reuse S142 `residueLinear_ker_eq_range` and `positiveLinear_ker_eq_range`, with actual `ModuleCat` kernel/range and typed homology objects. Prove regular B-module projectivity in actual Mathlib notions, and cofibrancy only if a typed projective-model structure is present.
3. Prove genuine `RingEquiv` B ≅ F₂[t]/(t⁴), if feasible in pinned Mathlib without substituting mere coordinate equalities. Then construct indexed shifts P[i] 0..4, true B-linear chain maps x, all-degree h/z nullhomotopy data and prove the universal nonzero fourfold obstruction across ALL representatives, fillers and derived conjugations. The S138 jet all-choice lemma is not a substitute.
4. Only if all L1 code compiles, commence finite free-quiver cone and η₂ proof as L2; do not claim any whole-real d_IHC/d_HI from componentwise results. Draft matching manuscript passages in parallel.

## Build/closeout
Pin `leanprover/lean4:v4.35.0-rc2` and Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. Run hosted `lake build OptionD` and `lake build C4` and repository integrity; record actual scratch/PR/main workflow IDs and conclusions. Freeze the largest green fragment when blocked; record smallest typed error and remaining mathematical obligations. Update state, formal plan, roadmap, manuscript, S144 proof/build/closeout, and ONE complete S145 FUTURE prompt. Merge by ordinary non-force PR and verify both parents and main CI. Do not execute S145 without new owner authority.
