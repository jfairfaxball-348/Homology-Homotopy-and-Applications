# S141 — hosted Lean and integrity

Entry main 304f3bbd92b092cebb0d20cfef29669880d3131f, tree 92a5686ac93e10f462ebb95b5706a57c3e63d298; S140 PR #169 ordinary two-parent merge, observed main Lean #40520030861 and integrity #40520031160 SUCCESS.

Scratch experiments (NOT the authored integration branch): initial Lean #40520143525 FAIL (ModuleCat zero object and opaque coefficientLinear); #40520488849 FAIL (dependent casts); #40520778695 FAIL (remaining dependent casts); #40521280648 FAIL (associator simplification); #40521608305 FAIL (composite not reassociated); #40521938415 FAIL (rewrite did not match associative composition). Verified corrected scratch c393380e50b9aa118fd2a3045986ed1314e1ba94: pinned hosted Lean #40522303891 SUCCESS and integrity #40522303279 SUCCESS, with both `lake build OptionD` and `lake build C4` and unchanged manifest. Some subsequent exploratory scratch runs are not necessary for the certified source and are not represented as final validation.

Pinned Lean: leanprover/lean4:v4.35.0-rc2. Mathlib: 065356127b1dc0016f66b7283ce0ce2c4055aa55. No local compiler; only hosted results count. The authored S141 PR and merged-main CI must be separately checked; this pre-integration record does not claim their outcome.
