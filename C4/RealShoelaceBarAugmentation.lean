module
public import C4.RealShoelaceBarTotal

@[expose] public section

/-!
# S174: pointwise B-linear augmentation of the entire-real shoelace bar terms

For a genuine shoelace diagram D, the degree-k bar module is an
unnormalised direct sum over *all* weak chains and all nonnegative lengths.
The proposed augmentation is induced by the original diagram arrows on
length-zero simplices and vanishes on positive simplicial lengths.

This is a genuine graded B-linear module map. It is NOT yet a chain map,
and its quasi-isomorphism requires the still-open square-zero bar complex
and the append-terminal contracting homotopy.
-/

namespace C4
open CategoryTheory

/-- The genuine B-linear degree-k augmentation on the full bar direct sum:
D(q₀)ₖ → D(p)ₖ for n=0 and the zero map for n>0. -/
noncomputable def realShoelaceBarTermAugmentation
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    (p : RealShoelacePoint ε hε) (k : ℤ) :
    realShoelaceBarTerm D p k ⟶ (D.obj p).X k := by
  classical
  refine ModuleCat.ofHom
    (DirectSum.toModule B (RealShoelaceBarIndex p)
      ((D.obj p).X k) (fun idx => ?_))
  rcases idx with ⟨n, σ⟩
  cases n with
  | zero =>
      have hp : σ.first ≤ p := σ.vertex_le 0
      simpa using (D.map (homOfLE hp)).f k
  | succ n => exact 0

end C4
