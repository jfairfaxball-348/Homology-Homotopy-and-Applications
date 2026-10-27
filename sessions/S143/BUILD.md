# S143 — build and diagnostic evidence

Entry live main: `2583d2d2d151a0f7e04b585b8acbf32e79f27055` (S142 PR #171 merge); frozen Lean `leanprover/lean4:v4.35.0-rc2`, Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`; manifest unchanged.

Disposable smoke branch: `scratch/S143-typed-augmentation`, PR #172 DRAFT (not to merge). Scratch attempts:
- `daadbe57f419142c32a9e4327abf0297888996d3`: Lean #40533287160 FAILED (missing `Module B (ZMod 2)` instance and implicit composition simplification); integrity #40533287155 SUCCESS.
- `b18885b274470e9795b3013a44028e6a6e2f500c`: Lean #40533692900 FAILED solely on forbidden internal ModuleCat.Hom constructor; residue object and degree-zero proof elaborated; integrity #40533692939 SUCCESS.
- `8a9fa6963920dee94293b0b2cde0bfc8b0e699c2`: Lean #40534205170 SUCCESS and integrity #40534205300 SUCCESS. Uses `ModuleCat.ofHom` with explicit module structure.
- `b514244c1eeaaad3d96566c599e75262bca39396`: Lean #40534476045 SUCCESS, adds genuine residue complex and components; integrity #40534476198 SUCCESS.
- `a81b82c5cd36d8a7fac95f67f918f17f4b5201ee`: Lean #40534970828 FAILED (unknown `Category.comp_zero`, degree-zero cast).
- `eb86d5ebe4f8aeb2e2624e713ec3be4b075674a9`: Lean #40535274807 FAILED (unknown `comp_zero`, dependent cast unresolved).
- Follow-up attempts tracked on scratch, not asserted green until observed.

All certificates are for exact pinned scratch SHAs; the final authored PR and main CI require separate actual observation. Never infer CI PASS from an empty statuses list.

- `3e49329344c5336e70fee5b18dc0aa9771ac2c62`: Lean #40535558430 FAILED from inherited degree-zero cast and argument type mismatch in `ChainComplex.ofHom`; integrity #40535558837 SUCCESS.
- `0cee445257b377d49279a9700f25772cbab217b4`: Lean #40535882109 FAILED with unresolved degree-zero `eqToHom` casts and missing conversion from `integerDifferential` to `integerResolution.d`; integrity #40535882733 SUCCESS.
- `cc7cfc128855d9b2d009187ce75117494c7c4804`: Lean #40536296496 FAILED, the smallest final typed diagnostic at `C4/Augmentation.lean:159:38` is `failed to synthesize HMul B ↑(integerObject (0 + 1)) ?m.87` from an overaggressive `change` crossing dependent casts. Integrity #40536296458 SUCCESS.
**Freeze decision:** Do not merge any of these red scratch variants. The authored S143 `C4/Augmentation.lean` equals the exact **green** code from scratch `b514244c1eeaaad3d96566c599e75262bca39396`. The pending chain-map naturality and `ChainComplex.of_d` coercion belong in S144, not as uncompiled S143 proofs.
