# S149 BUILD — independently tested proof gates and shift diagnostics

Compiler: `leanprover/lean4:v4.35.0-rc2`; pinned Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. Full default OptionD and C4 Lean targets; manifest unchanged, admitted-token scan and repository integrity are mandatory.

| Source SHA | Lean workflow | Integrity | Evidence |
|---|---|---|---|
| `70f3aedeaac912a769e422ed8fb61b8e2497bbee` | #40666132514 SUCCESS | #40666132577 SUCCESS | actual regular categorical dg equations and chosen terminal identity |
| `0d671fef9523822d0fb6b2b9457ce2cdd5571b2d` | #40666531530 SUCCESS | #40666531486 SUCCESS | arbitrary endomorphism/filler local fourfold nonboundary |
| `6946373f96258bb7841d88ba5c6d6b54fb507098` | #40666649683 FAILED | integrity success | `Exactness.lean:237:2` arithmetic cast normalization mismatch |
| `44087ecde3575426e0f13ffe9587aea62f95d813` | #40666952043 FAILED | #40666951647 SUCCESS | `Exactness.lean:238:32` unknown `comp_zero`, unresolved casts |
| `181186023106c1e441cd08a2faa6f458d66d6822` | #40667349137 FAILED | #40667349199 SUCCESS | same actual `eqToHom` cast goal |
| `4237a350ac703ecc1c136a8bfda2e0b0f9705666` | #40667762021 SUCCESS | #40667761975 observed | genuine translated `ChainComplex` structure, no casts |

The intermediate attempt `61467293e26865b4111ed529287a5386c6d6ca86` combined the older failing shift into green categorical source and failed Lean #40667450321. It is NOT a certificate or the promoted code. The corrected reindexing shift, rather than the failed cast implementation, is the only shift code eligible for promotion.

Final S149 authored tree and final PR/merged-main checks are independently observable on GitHub; do not infer their outcome from this pre-merge BUILD record.
