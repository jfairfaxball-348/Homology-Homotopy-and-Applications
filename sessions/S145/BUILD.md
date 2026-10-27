# S145 BUILD — independently observed pinned evidence

Entry `main` SHA `4c5a5ec3b04cc4a819855ccbc00dc88d885ea25f`, tree `c5a8b439c99404a2d85834864f254e7f7a0cc33c`. S144 merged via PR #174. Pinned Lean `leanprover/lean4:v4.35.0-rc2` and Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55` unchanged.

- Scratch positive `515129075c0bbbb444d233fc716391924912858b`: pinned Lean #40575179311 **SUCCESS**, integrity #40575179328 **SUCCESS**.
- Scratch augmentation `85386ec4eeca4f6cf94bfb608a6bd28e12a01f64`: pinned Lean #40575347270 **SUCCESS**, integrity #40575347115 **SUCCESS**.
- These runs cover the real C4 and OptionD default targets; no admitted proofs or dependency drift. Authored branch/PR checks and post-merge main must be observed separately; do not infer those from scratch.
