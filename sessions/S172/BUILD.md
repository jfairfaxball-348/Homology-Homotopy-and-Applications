# S172 BUILD — exact pinned source evidence

Entry `main`: `c761eddc57a3b7b98ce3efef17a24a75434453d0` (merged S171 PR #205). New import `C4/AcyclicCokernelQuasiIso.lean` is included in the root `C4.lean`; unchanged pinned Lean 4.35.0-rc2 / Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`; OptionD untouched.

- Source `61758ccb3d99497588295707aed98e3b642bc2b4`: full pinned OptionD+C4 Lean [#41130939737](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41130939737) SUCCESS; integrity [#41130939731](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41130939731) SUCCESS. Compiled acyclic mono cokernel QuasiIso.
- Expanded source `abcb591f53646b73903687f1ecfa7c723f9037ff`: full pinned Lean [#41131166960](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41131166960) SUCCESS; integrity [#41131166873](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41131166873) SUCCESS. Also compiled entire-real pointwise quotient quasi-isomorphism under explicit monic and acyclic hypotheses.
- Failed preliminary source `e3cd888bd46d64a495302398122039edb3398a3f` failed Lean #41130702196 because of incorrectly constructed `ShortExact` wrapper; corrected via `ShortComplex.ShortExact.mk'` and never promoted.

**Important:** This authored BUILD records certified proof sources, not proof that the later documentation head, two-parent PR merge or merged-main CI has passed. Verify those against the live GitHub exact SHAs before claiming them. Source scan prohibits placeholders and the certified integrity jobs passed.
