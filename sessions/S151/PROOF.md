# S151 PROOF — actual x naturality at truncation boundaries

Pinned entry main `5c1764e0661837ec8d1b7f20665d08d583d91915`, tree `533323436952aaa66c0c7d13918602401dcafa63`. Frozen target unchanged. Lean-verified scratch source `b6e061be604dd6ae1bf0945154a0f77e679987d0`: C4/ShiftedDG.lean extends existing actual all-integer `integerShiftResolution`, `globalXComponent` with theorems `globalXComponent_naturality_at_boundary` and `globalXComponent_zero_below`.

For any integers s,n with n≤s, the degree-n target `(integerShiftResolution (s+1)).X n = integerObject (n-(s+1))` is an actual zero object by `integerObject_isZero_negative` (n-(s+1)<0), so its hom-set is a subsingleton. Thus the two actual categorical compositions `globalXComponent s (n+1) ≫ (integerShiftResolution (s+1)).d (n+1) n` and `(integerShiftResolution s).d (n+1) n ≫ globalXComponent s n` are equal. The same zero-target argument gives `globalXComponent s n=0`. This covers the boundary n=s and all smaller (including negative) degrees for every s; it is not a coefficient surrogate.

Pinned full Lean #40682347499 SUCCESS; integrity #40682347435 SUCCESS. No extra axioms/admissions.

**Still missing:** positive-degree n≥s+1 categorical cast transport; therefore no full `globalXChainMap`, global h/z nullhomotopies, global all-choice fourfold transfer, any whole-real interleaving metric, or literal frozen full theorem. Eight exploratory attempts are isolated on branch `s151-complete-global-c4`, not promoted. No formalisation-complete claim.
