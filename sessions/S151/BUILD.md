# S151 BUILD — pinned Lean success and failed global x diagnostics

Pinned compiler leanprover/lean4:v4.35.0-rc2, Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55, default OptionD and C4 build, no admitted proof or manifest drift.

**CERTIFIED** `b6e061be604dd6ae1bf0945154a0f77e679987d0`: C4/ShiftedDG.lean boundary lemmas, Lean #40682347499 SUCCESS, integrity #40682347435 SUCCESS. This is the only new formalised S151 mathematics eligible for promotion.

Exploratory positive naturality attempts, all Lean FAIL, with corresponding distinct source:
- `72d16d122c4d23448929c5363afd2de43806ff62` #40679570569:121:69 — wrong carrier type for applying regular hom identity to an unnormalised shifted element.
- `51f3d304a9ed914c57c02dc07521df0a115d85c3` #40679842388:113:4 — dependent `eqToHom` casts not reducible to `regularDx_commute`.
- `4a03a96fb00b527d7306b98edc2e221b2fb9fd42` #40680207290:117:4 — differential-index transport compiled but nested casts remained.
- `238109fe5f070f4699259c7d2fffdefeb6799cdb` #40680582971:125:4 — cast-sandwich `core` identity compiled; failed matching to shifted compositions.
- `e01e042577aa1bbbeb5e26ffe5acb2666c71d6b0` #40680930566:125:4 — identity wrappers and cast-composition simp insufficient.
- `3e49c710e7c3f9c66a1eb83863378ac6d47de588` #40681344094:104:2 — `convert` isolates heterogeneous category equality and two cast sandwiches.
- `5c82af317a62ba011e8ceb28811ce3a5f55d4ed6` #40681650406:104:2 — term type mismatch resolved; two pure cast-sandwich equality goals remain.
- `2bb97f32c2dc0f9208e826f21a0ee5cc5fb13b40` #40682024547:131:16 — broad `cat_disch` normalization triggers max recursion depth.

Final PR and post-merge main Lean and integrity must be observed independently; do not infer future results from this pre-merge record. The complete paper theorem remains unproved.
