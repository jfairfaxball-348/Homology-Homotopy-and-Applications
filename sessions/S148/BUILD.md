# S148 BUILD — pinned Lean and integrity

| Source/run | Pinned Lean (OptionD + C4) | Integrity | Finding |
| --- | --- | --- | --- |
| S147 merged main `23729d785d66f1a34f3bbb8a9fae74e89f32b3ef` | #40590419160 SUCCESS | #40590418891 SUCCESS | entry baseline |
| failed S147 H₀ adaptation `c1f2f305` | #40655893515 FAIL | #40655893312 SUCCESS | `rw [ChainComplex.of_d]` on concrete cast equality |
| all-integer draft `88630b52` | #40656381151 FAIL | #40656381301 SUCCESS | same cast equality, at `Exactness.lean:143:8` |
| **corrected full source** `c22d3890b77b753476f5731cc393edc9f1baf7e5` | **#40657026979 SUCCESS** | **#40657026873 SUCCESS** | actual degree-zero H₀ ISO and all-n induced QuasiIso |

Toolchain `leanprover/lean4:v4.35.0-rc2`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. The successful pinned Lean workflow performed module/admission-token scan, all default build targets (OptionD, C4), and unchanged-manifest assertion. Final PR checks and merged-main checks must be assessed against live refs; this session document does not manufacture downstream results.

No shifted global dg theorem or whole-real metric compilation is claimed.
