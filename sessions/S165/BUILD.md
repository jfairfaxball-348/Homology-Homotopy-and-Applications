# S165 — hosted compilation and source evidence

- Entry main d214c72c95a444c3f68722f0e75bb720078d0997, the S164 ordinary two-parent merge (parents `9c813a7c9f43c7146193e7ab3cef2258c1e32927` and `96b8ac778fdc79c063bee7a4a57255fe0e5ebbca`).
- Entry main pinned Lean #40934137311 SUCCESS; integrity #40934137409 SUCCESS.
- First genuine homotopy-transfer source head `d9b4671ba3fd05bc308b9b2e0bb2b049d8580234`: PR Lean #40935391539 SUCCESS and integrity #40935391286 SUCCESS.
- Five-stage primary transfer source head `4f0c87d048bc1d859f1e7332b395bb92700f906e`: PR Lean #40935670919 SUCCESS, integrity #40935670965 SUCCESS.
- Initial adjacent-class version `f35e95d387ed1c442c5f88dc2526833c64be9ffc`: PR Lean #40935902917 FAILURE, because `s+1+1` differs from `s+2` in dependent shifted-complex types. It was not merged.
- Repaired source head `f9f257f5b8e7bb4d915c3309b96aab508b08056b`: push pinned Lean #40936255963 SUCCESS and integrity #40936255927 SUCCESS. Exact PR/head checks after document updates and final merged-main checks must be verified independently.
- Compiler Lean v4.35.0-rc2 / Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. All C4 + OptionD pinned build targets. No sorry/admit/custom axioms, no weaker finite-grid surrogate.

The proof declarations are in `C4/HomotopyTransfer.lean`, `C4/FiveStageTransfer.lean`, `C4/AdjacentNonNull.lean`, and are registered by `C4.lean`.
