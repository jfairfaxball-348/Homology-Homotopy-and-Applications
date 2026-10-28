# S153 BUILD — exact-source pinned diagnostics

- Baseline: main `ea26f666c041e03470610b4f3b31499b523e4f28`, tree `9d58685ab8ba6ccca1cc70ce98a568270065b21d`.
- Scratch `1b7d78f18925082f12544b4835dce40bb9201673`: Lean #40694311661 FAILURE; general positive x-square still leaves conditional differential and casts.
- Scratch `8732734a501945ff726de15018cb54decae3ee98`: Lean #40694780869 FAILURE; shifted differential positive condition not discharged.
- Scratch `cd4480398fdb7db0d85b208531e89e15c5d593f8`: Lean #40695054313 FAILURE; condition discharged, casts unresolved.
- Scratch `04bb70a2d614a22002d9c0f3d5befb8448b553d5`: Lean #40695325464 FAILURE; exact nested `eqToHom` mismatch persists.
- Scratch `e1cf75eb6a6b74b548abdb31e9ef546d5050b8a7`: Lean #40695679740 FAILURE; positive x normal form differed by identity coercion.
- **Certified** `e0076635671ddd4f17a8dfe1ce7dbdfcfee95e47`: pinned full C4/OptionD Lean #40696118260 SUCCESS and repository integrity #40696118205 SUCCESS. Only `C4.globalXComponent_regular` promoted.
- Lean v4.35.0-rc2, Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55 unchanged. No sorry/admit/axioms. Final PR and postmerge CI not asserted before observation.
