# S154 BUILD — exact pinned hosted Lean record

- Entry main `911b72eba232795c80d2ec6110edad8e59d06081`, tree `21a013055b9bea85feba9275b0d0f01e6c0056cc`.
- Failed isolated scratch positive differential attempts: Lean #40702764360 (opaque shifted-X type), #40703038189 (opaque integerResolution.X), #40703429286 (of_d successor matching), #40703756373 (dependent rewrite motive), #40704250325 (remaining linear extensionality goal), #40704722000 (transitive calc type), #40705141900 (undischarged positive conditional). Failed source NOT promoted.
- First certified new positive differential: scratch `cf883c676ec28d4b7513ad2c639921bb69ab1dc9`; pinned Lean #40705424211 SUCCESS and integrity #40705424824 SUCCESS.
- First full-x scratch Lean #40705889532 FAILURE: residual typed target normalization and ChainComplex.ofHom orientation. Not promoted.
- **FINAL CERTIFIED SCRATCH** `436bcf89657f9ba1777ed7d47b556d7b69b27eb6`: pinned Lean #40706366948 SUCCESS and repository-integrity #40706367054 SUCCESS. This includes all three new Lean results and unchanged C4/OptionD import graph. Lean v4.35.0-rc2; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`; no sorry/admit/axioms.
- Final authored S154 PR and merged-main checks must be observed independently; a scratch run does not certify an untested different commit.
