# S118 — D1 centered Gram form and exact Euclidean transfer (FUTURE, UNEXECUTED)

## Authority and entry
S117 is the single authorised first formalisation session of the owner-selected Option D theorem. This is the complete next-session handoff, NOT permission to execute S118 now. A fresh, separate owner instruction such as “Run next session” is required. Reconcile live remote main SHA/tree, S117 PR/merge/hosted governance and Lean checks, open PRs, rulesets, formal plan and AGENTS before creating one isolated S118 branch and one atomic authored commit with ordinary two-parent PR merge.

## Exact target and exclusions
Primary Option D is D1, D2, D6 universal two-height R³ attaching square, D7 Hopf specialisation, and D8 perturbation; earlier D3–D5 R⁴ route is optional archival research. D1 is the real-valued centered Gram matrix for arbitrary N≥2 edge/nonedge squared distances 1±1/(100N), PSD of rank N−1 and N labelled points in ℝ^(N−1) realising those exact distances, then the flag-Rips reconstruction. The pointwise mixed-product and row-margin lemmas in OptionD/GramBounds.lean are ONLY intermediate numerical D1 obligations. They do not prove full matrix PSD/rank or D6. Do not change to an easier unrelated Gram hypothesis, use nonstandard axioms, or claim full Lean certification.

## Decisive formal work
1. First verify whether S117 CI really built on hosted GitHub. If the Lean job is failing or missing, repair source/Lake/manifest and pin compatibility, and report the full failure and fix; do not infer success from governance CI.
2. Define the finite squared-distance matrix and centering operator as actual Lean objects; prove the quadratic-form identity on the mean-zero subspace, with the diagonal equilateral contribution of 1/2.
3. Lift `d1_pair_error_lower` to finite off-diagonal sums, proving the `(N−1)ε` row error for arbitrary z; combine with `d1_strict_gram_margin` to kernel-prove strict centered positivity.
4. If feasible within the same session, prove centered Gram PSD and kernel equal to constants, rank N−1 and Euclidean reconstruction with exactly the prescribed edge/nonedge distances. If not, state precisely the missing lemma and its Mathlib API and leave it for S119.
5. Run a *cold*, exact-pinned `lake build` via local/hosted Actions and inspect actual output. Keep `lean-toolchain` at leanprover/lean4:v4.35.0-rc2 and matching Mathlib SHA 065356127b1dc0016f66b7283ce0ce2c4055aa55 unless live Palomar compatibility demands a documented migration; capture updated lockfile and record axiom checks. Challenge/Solution comparator and NanoDa/con-ron preflight remain future tasks until honest matching declarations exist.

## Integrity and certification boundaries
Check no sorry/admit/axiom in Solution dependencies, module headers and ≤10000 physical lines per Lean file, authentic resolved manifest, no submodules, LFS or built artifacts. A successful `lake build` certifies only exact compiled declarations, not the full Option D theorem, Palomar comparator, independent kernel replay, novelty or HHA fit. No novelty audit, Palomar registration, manuscript, arXiv/HHA submission or external contact.

## Closeout
Produce a substantial S118 formal proof dossier with commands and run URLs, exact statement map, residual mathematical dependencies and truthful ACCEPT/PARTIAL verdict. Synchronise STATE, phase/decision/session ledgers, claim and provenance records, formal plan, and one fully executable S119 FUTURE UNEXECUTED prompt in the same authored commit. Require hosted governance AND Lean checks before ordinary merge; verify two merge parents and outgoing main workflow. Present the complete S119 prompt, but NEVER execute it in this session without a fresh separate owner instruction.
