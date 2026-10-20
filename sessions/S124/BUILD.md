# S124 BUILD — pinned source and compiler evidence
- Baseline main d1eda1d63f8d5e1901978a52d410e96e4e0ef16c: post-merge Lean #39380219402 SUCCESS, integrity #39380219430 SUCCESS.
- Environment pinned leanprover/lean4:v4.35.0-rc2; Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55; committed lake-manifest.json unchanged.
- OptionD/RealizedFlag.lean on scratch SHA fd7819c46620891d107812d93d287b21600e28ac: hosted Lean #39387743060 SUCCESS, static integrity #39387743022 SUCCESS. Initial scratch failed solely missing open scoped InnerProductSpace.
- OptionD/SpectralRoot.lean plus first actual Gram points: scratch SHA eaa5fe27f098e4c9e7f972872027c81e70abdf03 hosted Lean #39388220184 SUCCESS, integrity #39388220191 SUCCESS. Earlier scratch had invalid direct projection of the nonnegative matrix proof; corrected by Matrix.nonneg_iff_posSemidef.
- Full-N norm-square and unconditional strict all-finset Rips code: initial scratch #39388531389 failed at unknown identifier d1_squared_distance_lt_one_iff because RealizedFlag was not imported; import was explicitly added. Latest scratch compiler and final single-commit hosted PR/main checks require independent verification before claiming integration success.
- These hosted actions execute 'lake build' with pinned Lean and compiled Mathlib. No local Lean toolchain existed in this environment, so no independent local cold lake build was claimed. Static GitHub workflow also runs repository validation and next-session handoff check.
- No Palomar Challenge/Solution/comparator/preflight or registration; no paper or novelty audit.
