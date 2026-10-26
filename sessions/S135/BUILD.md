# S135 BUILD — actual hosted GitHub evidence (26 October 2026)

- Entry live main `57b2655363262413497beaf75cbf0c1e9d0709a2`, tree `29b2f6789c3aeed005952c7e2dbf5bcfccd846e4`; S134 PR #160 ordinary two-parent merge verified. Prior main Option D Lean #40316517196 and repository integrity #40316517107 both SUCCESS; zero concurrent open PRs. Branch-protection endpoint access returned HTTP 403 (UNKNOWN, not evidence of no protection).
- Toolchain `leanprover/lean4:v4.35.0-rc2`; Mathlib commit `065356127b1dc0016f66b7283ce0ce2c4055aa55`; dependency manifest unchanged.
- Scratch 1 `76ca09f0f92b1e1a01e24ab27776e8cb352ec848`: Lean #40404319504 FAILURE (malformed doc comment, opaque endpoint definition, finite-index/face witness errors); integrity #40404319419 SUCCESS.
- Scratch 2 `eee991a3a04eb13a863be6e309d8421b59e7d4f6`: Lean #40404736340 FAILURE (finite index coercions and continuous-add proof); integrity #40404736408 SUCCESS.
- Scratch 3 `284ec7c0e96a443a9debfef44d65ca513f5281b7`: Lean #40405097168 FAILURE (continuity elaboration); integrity #40405097434 SUCCESS.
- FINAL SCRATCH `f1196776b8f5ded81b14ac76880197ac7e2fa343`: hosted pinned Option D Lean #40405529215 **SUCCESS** and integrity #40405529221 **SUCCESS**. This certifies the literal full N2 edge-to-Icc homeomorphism in `OptionD/IntervalTopology.lean` together with previously built Option D module imports.
- Official numbered S135 PR and merged-main results are separate checks, and must be independently verified after the commit/merge. Neither a static integrity pass nor hand topology is a Lean proof. No Palomar test, novelty audit or external action.
