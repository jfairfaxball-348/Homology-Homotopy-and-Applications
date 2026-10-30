# S169 — pinned code and CI evidence (30 October 2026)

- Entry live main: `9199e2c4e1c677dd2099893f710337f00d10f971` (ordinary two-parent #202 merge of the top-down strategy).
- PR: [#203](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/pull/203); working branch `s169-critical-path-feasibility`.
- Toolchain: Lean `v4.35.0-rc2`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`.
- During exact compiler exploration, failed earlier heads `21c277d`, `eeb1e24`, `bbd865f` and `f16640d` were NOT claimed as successful. Diagnoses were global `QuasiIso` namespace, zero-object notation, natural-zero composite simplification and noncomputability of literal zero diagrams.
- **Proof code checkpoint:** `63d123667c58edee49ea2dbd4587021838e83b38`. Pinned full OptionD+C4 hosted [Lean #41046995470](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41046995470): **SUCCESS**. [Integrity #41046995461](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41046995461): **SUCCESS**, covering both `scripts/validate_repository.py` and `scripts/session_handoff.py --check` at that checkpoint.
- The source is imported by `C4.lean`: `AcyclicRealReplacement`, `StrictRealInterleaving`, and `FiveCutExtraction`; no OptionD changes. GitHub Actions compilation is the actual proof check because no local Lean/Lake installation was available in the execution environment.
- **Promotion gate:** documentation head PR checks, ordinary two-parent merge and independent merged-main exact-sha Lean and repository integrity must be checked separately. This file does not predeclare future checks PASS.
