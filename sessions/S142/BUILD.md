# S142 BUILD — pinned evidence and blockers

Entry main `52ad583a51dbace87360f753e93627ee2e999511`, tree `f4bd73997f45ad8b3d15d925b0a992daf9bd95a9`, S141 PR #170 ordinary two-parent merge, latest main Lean #40523856237 and integrity #40523856241 SUCCESS. No open PRs on entry.

Scratch branch: `scratch/S142-augmentation-smoke` (not the authored session branch). Lean attempts #40527789364, #40527947182, #40528144952, #40528821228 and #40529378042 failed while constructing the augmented categorical chain map and orienting linear-image existential witnesses. Exact blocker in #40528821228: `C4/Augmentation.lean:66:23: failed to synthesize Module B (ZMod 2)` when forming `ModuleCat.of`, plus dependent `integerDifferential n` vs `integerResolution.X` coercion mismatch at n+1. These failures are **not** paper disproofs; the unsupported code was removed.

**PINNED GREEN SCRATCH:** `472a81a53b01311f56c1d9e15e20d201fab935c3`, hosted Lean/Mathlib `leanprover/lean4:v4.35.0-rc2`, pinned Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`; `lake build OptionD` and `lake build C4` via workflow #40529780801 SUCCESS; integrity #40529781169 SUCCESS. No new axiom, `sorry` or `admit`; manifest unchanged. Final authored PR and main integration CI must be verified independently.
