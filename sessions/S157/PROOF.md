# S157 — PROOF (executed 29 October 2026)

Entry main `5f50dce56d60426016aafc6fd625b3bb8c2461dc`, tree `da5b18623d757b56c25b8c2eaf572269fffae1ae`. S156 merged PR #188 was genuine two-parent merge; main pinned Lean #40840270222 and integrity #40840270152 both succeeded.

**Lean-certified exact statements:** `C4.globalHComponent_identity (s n : ℤ)`, all s,n, actual ModuleCat B integer-shifted morphisms, canonical boundary zero and positive `Dh=x²`; `C4.globalZComponent_identity (s n : ℤ)`, all s,n, actual degree-TWO z and positive/boundary `Dz=xh+hx`. The latter proof uses `regularCastFourPathsFinal` for 4 transported coefficient paths plus three final shifts, `shiftedDifferential_regular_any` for arbitrary successor integer index `i=j+1`; the former uses the verified S156 cast bridge with normalised shifted objects, reducing to `regularDh_xx`. Neither theorem is a standalone full Mathlib homotopy.

**Source and evidence:** H-only scratch `76925ecbb1d99fe2d5f8e0291a248c6dc8f3002e` green #40880287952; H+Z scratch `b57f5de381771fbe2828ff5517e610b274899c04` green #40881428555 and integrity #40881428517. Earlier failed intermediate scratch attempts were not promoted. Frozen manuscript's full real quantitative theorem is NOT yet Lean certified.

**Next obligation:** Genuine Mathlib `Homotopy (globalXSquared s) 0`, degree-two z coherence, *universal* shifted fourfold with arbitrary filler choices/conjugation, then full-real L2/L3 entire-diagram metric theorem.
