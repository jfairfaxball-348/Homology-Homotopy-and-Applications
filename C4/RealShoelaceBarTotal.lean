module
public import C4.RealShoelaceBarHorizontal

@[expose] public section

/-!
# S174: B-linear internal and proposed total bar differentials

All indices refer to the genuine full-real two-lane shoelace category.
This file constructs the degree -1 maps, not yet their square-zero proof.
-/
namespace C4
open CategoryTheory

/-- Apply the source complex's original differential to the coefficient
in a fixed simplex summand, with exact integer degree transport. -/
noncomputable def realShoelaceBarInternalComponent
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    (p : RealShoelacePoint ε hε) (k : ℤ)
    (n : ℕ) (σ : RealShoelaceBarSimplex n p) :
    (D.obj σ.first).X (k - (n : ℤ)) ⟶
      realShoelaceBarTerm D p (k - 1) := by
  classical
  have hdegree : (k - (n : ℤ)) - 1 = (k - 1) - (n : ℤ) := by omega
  let differential :
      (D.obj σ.first).X (k - (n : ℤ)) ⟶
        (D.obj σ.first).X ((k - (n : ℤ)) - 1) :=
    (D.obj σ.first).d (k - (n : ℤ)) ((k - (n : ℤ)) - 1)
  let shift :
      (D.obj σ.first).X ((k - (n : ℤ)) - 1) ⟶
        (D.obj σ.first).X ((k - 1) - (n : ℤ)) :=
    eqToHom (congrArg (D.obj σ.first).X hdegree)
  let summand :
      (D.obj σ.first).X ((k - 1) - (n : ℤ)) ⟶
        realShoelaceBarTerm D p (k - 1) :=
    ModuleCat.ofHom
      (DirectSum.lof B (RealShoelaceBarIndex p)
        (fun j => (D.obj j.2.first).X ((k - 1) - (j.1 : ℤ)))
        ⟨n, σ⟩)
  exact differential ≫ shift ≫ summand

/-- Actual B-linear internal bar boundary, on every finite-support
direct sum in every integer degree and at every real shoelace endpoint. -/
noncomputable def realShoelaceBarInternalBoundary
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    (p : RealShoelacePoint ε hε) (k : ℤ) :
    realShoelaceBarTerm D p k ⟶ realShoelaceBarTerm D p (k - 1) := by
  classical
  refine ModuleCat.ofHom
    (DirectSum.toModule B (RealShoelaceBarIndex p)
      (realShoelaceBarTerm D p (k - 1))
      (fun idx => ?_))
  rcases idx with ⟨n, σ⟩
  exact (realShoelaceBarInternalComponent D p k n σ).hom

/-- Candidate total differential: internal plus horizontal, in
characteristic two. Its square-zero property is NOT asserted here. -/
noncomputable def realShoelaceBarTotalBoundary
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    (p : RealShoelacePoint ε hε) (k : ℤ) :
    realShoelaceBarTerm D p k ⟶ realShoelaceBarTerm D p (k - 1) :=
  realShoelaceBarInternalBoundary D p k +
    realShoelaceBarHorizontalBoundary D p k

end C4
