# S147 BUILD — pinned hosted CI

Pinned Lean toolchain `leanprover/lean4:v4.35.0-rc2`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`; manifest unchanged. Branch scratch `scratch/s147-positive-cast-1` is disposable evidence; the session branch uses ONE independent authored commit from main.

| Source/run | Pinned Lean | Static integrity | Exact finding |
| --- | --- | --- | --- |
| `fac1e26d`, #40586782515 | FAIL | #40586782416 SUCCESS | two ShortComplex cast goals and exactAt index |
| `b0607dea`, #40587217857 | FAIL | checked independently | dependent index rewrite invalid motive |
| `7a8feee0`, #40587819672 | **SUCCESS** | #40587819643 SUCCESS | all positive integer `ExactAt`, `IsZero homology` |
| `8209cfc9`, #40588371060 | FAIL | independent check | requires explicit `Epi augmentationShortComplex.g` |
| `e9898c40`, #40588606381 | **SUCCESS** | #40588606758 **SUCCESS** | all nonzero integer vanishing + categorical residue cokernel |
| `441c2894`, #40588997656 | FAIL | scratch only | degree-zero `hf` cast identity |
| `f7b59c0a`, #40589338567 | FAIL | scratch only | smallest `Exactness.lean:140:36`: two `eqToHom` casts preceding `differential 0` |

**Approved green source:** full `C4/Exactness.lean` from `e9898c401a25037a8d3862f88ef27bbb4e347bb5` ONLY; not the failed H₀ scratch. Main/PR CI and post-merge integrity must be verified separately from these scratch results. These CI results certify Lean compilation and repository checks, not HHA suitability, novelty, publication, or the full internal frozen metric theorem.
