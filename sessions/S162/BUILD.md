# S162 BUILD — pinned green scratch and isolated failed experiments

- Entry `main`: `e42e6f72b663059ea16030c067405c6354eb7522`, tree `d2aab9eaae97815e564c1c5f4e5be95dcf3f9b90`.
- S161 PR #194 ordinary two-parent main merge. Main Lean workflow #40898640788 SUCCESS; integrity #40898640887 SUCCESS.
- Failed preliminary scratch `add1e3809738fa1283677376d3c9d1f8c239c6e2`: full Lean #40901510427 FAILURE (`C4/CanonicalGlobal.lean:45` implicit-transparency regular-object mismatch; residue goal needed `C4.one` unfolding), integrity #40901510369 SUCCESS.
- Exact **green** scratch `83fe631034b29223a63a0f50a3fd505d82a5d3ab`: pinned Lean #40901999271 SUCCESS; repository integrity #40901998877 SUCCESS. Both new theorems compiled without admitted proofs.
- **Rejected** extension `cefd9565e8db22849e5c36653a9e230ada1a6cd3`: pinned Lean #40902383312 FAILURE at `C4/CanonicalGlobal.lean:76,82`. `simpa` cannot equate `globalXChainMap (s+1) ≫ globalXChainMap (s+1+1)` with `globalXChainMap (s+1) ≫ eqToHom ⋙ globalXChainMap (s+2)` across a genuine dependent intermediate integer-shift cast. Integrity #40902383188 SUCCESS. Do NOT promote this experimental source.
- Pin Lean v4.35.0-rc2 and Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. Do not alter OptionD sources. PR/main checks independently follow authored tree.
