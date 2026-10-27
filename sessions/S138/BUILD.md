# S138 BUILD — actual tools, exact verification and limits

## Python replay
* Source: `sessions/S076/check_c4.py`, unmodified; Git blob SHA `4d22fec866c39d4cd5894b508e1410b4927b2b13`.
* SHA256 `52653eee774b5ad74a5b2d5375aae07fb66fed6bb9b0aa0531b6654563a22948`. Exact script copy verified with `git hash-object /tmp/check_c4.py`.
* Environment: local Linux, Python 3.13.5; `python3 /tmp/check_c4.py`. Elapsed 14.19s, max RSS 95,632 KiB.
```text
EXPLICIT_40_DEGREES: PASS
ADJACENT_JETS: PASS 16
PRIMARY_ALL_CHOICES: PASS 8192
SECONDARY_ALL_CHOICES: PASS 524288
TERMINAL_INVARIANT: PASS; finite jets only, NOT metric proof
```

## Lean hosted verification
* Pinned `leanprover/lean4:v4.35.0-rc2`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. Committed `lake-manifest.json` is unchanged.
* Scratch branch `scratch/S138-c4-lean-validation`. Initial C4 arbitrary-choice lemma at scratch `07d77274958e0e34e85952db015c9b5814218d43`: hosted Lean #40504555444 SUCCESS, integrity #40504555450 SUCCESS.
* Extended annihilator version at `e6f7018a03667a002508313bf1c51b17c7e581f0`: Lean #40505047518 FAILED at two proof-normalisation goals (lines 165/176), **not** claimed success. Hypotheses were repaired by `dsimp at h0 h1 h2` in scratch head `2d7326ed70ceaa508279f88462c1130760a6c7ec`.
* Final repaired scratch: pinned Lean #40505314255; static integrity #40505314145 SUCCESS. Final Lean conclusion must be checked from GitHub before marking the expanded annihilator lemmas certified.
* Workflow includes both library targets `OptionD` and `C4` and scans both for forbidden `sorry`, `admit`, `sorryAx`, `axiom`. The standard run also asserts the committed manifest unchanged. PR and main checks for the final authored commit must be observed independently, not inferred from scratch.

This is kernel-checking of named C4 coefficient lemmas, NOT the paper's full homotopy-interleaving theorem. No local Lean compiler is installed in the runtime; the actual compilation is the hosted pinned GitHub Action.
