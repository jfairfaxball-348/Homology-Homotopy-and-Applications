# S157 BUILD — exact verification and failed scratch provenance

Entry main 5f50dce56d60426016aafc6fd625b3bb8c2461dc; S156 PR #188 merged two-parent, prior main checks green. Scratch branch scratch/s157-positive-hz-01. The positive Dh identity first passed at 2fade4f00f6e5f8ebfb48f039ac72ce62b34d0c2 (pinned Lean #40880174225 SUCCESS, integrity #40880174153 SUCCESS). Earlier Dh cast scratch failed; subsequent Dz scratch commits 134ed69, 8194062, 8ca0a4b, acb5920, 1f6ae89, 876e908 failed due genuine dependent equality rewrites. Their source was not promoted. The reusable adjacent-index lemma closed those casts.

FINAL exact scratch 67c2b68eb119a1e961fe94782c9474006338cb88, pinned full OptionD+C4 Lean #40883221948 SUCCESS and integrity #40883221471 SUCCESS. Lean v4.35.0-rc2 and Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. No admitted proofs or OptionD changes. PR and merged-main checks must be independently confirmed after promotion and cannot be inferred from scratch.
