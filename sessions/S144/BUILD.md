# S144 BUILD — exact pinned hosted evidence

- Entry main SHA: `6b90ab593e53a3384ee883e29f1c6164b3424531`; merged S143 main Lean #40537369296 SUCCESS and integrity #40537369347 SUCCESS.
- Pinned Lean: `leanprover/lean4:v4.35.0-rc2`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`; no manifest/toolchain drift.
- `e546ebf921b2408a3acca24b0dd3014798e68ae1`: Lean #40538510554 FAILED: remaining associativity/cast zero rewrite and reversed `ChainComplex.ofHom` equation; integrity #40538510587 SUCCESS.
- `24e40a44abe37487a2727fc72699a7c5e84074ae`: Lean #40538805810 **SUCCESS** for all-integer categorical `augmentationChainMap`, integrity #40538805837 SUCCESS.
- `a49229f24fc38c0d2f35b059fb3274c0123e2119`: Lean #40539187214 FAILED: basis namespace import; integrity #40539187686 SUCCESS.
- `4e176a1052071942e23a6819f5c833ef762d2dac`: Lean #40539487670 FAILED: `Basis.singleton` was in the `Module` namespace; integrity #40539487662 SUCCESS.
- `6528c6dedb5e267315ca93b14ec54f1ce29c69e7`: Lean #40539821868 **SUCCESS** after qualifying `Module.Basis.singleton`; integrity #40539822258 SUCCESS. Thus projectivity is a verified categorical statement, not an uncompiled conjecture.
- An authored documentation closeout commit, PR checks and post-merge main conclusions are separately verified, not inferred from these earlier source SHAs.
