# S139 — pinned build evidence

- Entry main: 8f35e0104e5d74490f11f773da721ea7faa3af72; tree 297d76d25f86ea906df0c9e999d0bcdf61ae394b.
- Toolchain unchanged: leanprover/lean4:v4.35.0-rc2, mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55; unchanged lakefile.toml and lake-manifest.json.
- Scratch PR #166, not the authored numbered session PR, is validation only. Scratch initial 0f070b771d672859849ef1aa7ebd5e1a4b2466c7: integrity #40509652989 SUCCESS, Lean #40509652825 FAILURE because imported Jets definitions had no public API. Scratch 040202079aea29de8b7e6097e9d00d05f9aa4335: integrity #40509977397 SUCCESS, Lean #40509977440 FAILURE because cross-module closed `decide` lacked reducible implementation data. Scratch 708e1146019c60e9b31921f3f8db967b9f35069a: integrity #40510362092 SUCCESS; pinned Lean #40510361943 SUCCESS (independently observed from GitHub after completion).
- Fix: `public import Mathlib` and `public section` in Jets, `public import C4.Jets` in Periodic, with named closed parity lemmas certified in Jets and used by Periodic; root `C4.lean` publicly imports both.
- No local Lean executable was available in the authoring environment. The only actual Lean compilation evidence is hosted GitHub Actions; no asserted local build. Verify the final authored PR and post-merge main independently; no fabricated outgoing run IDs.
