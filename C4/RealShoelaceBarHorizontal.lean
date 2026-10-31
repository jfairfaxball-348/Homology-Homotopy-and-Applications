module
public import C4.RealShoelaceBarFaces

@[expose] public section

/-!
# S174: actual B-linear horizontal face maps on entire-real bar terms

This defines the sum of simplicial faces as a B-linear graded boundary;
the internal boundary, total complex and square-zero theorem still require
separate proof. Every index and endpoint is genuinely entire-real.
-/
namespace C4
open CategoryTheory

/-- Every face has a coefficient-arrow from its original first vertex.
For i > 0 this arrow is an identity up to the preorder's thinness;
for i = 0 it is the genuine map from the first to second vertex. -/
theorem RealShoelaceBarSimplex.first_le_face
    {ε : ℝ} {hε : 0 ≤ ε} {p : RealShoelacePoint ε hε}
    {n : ℕ} (σ : RealShoelaceBarSimplex (n + 1) p)
    (i : Fin (n + 2)) :
    σ.first ≤ (σ.face i).first := by
  change σ.vertex (0 : Fin (n + 2)) ≤ σ.vertex (i.succAbove 0)
  exact σ.ordered (Fin.zero_le _)

/-- A genuine module hom for a single horizontal bar face, including
its actual coefficient map and exact integer total-degree transport. -/
noncomputable def realShoelaceBarHorizontalFace
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    (p : RealShoelacePoint ε hε) (k : ℤ)
    (n : ℕ) (σ : RealShoelaceBarSimplex (n + 1) p)
    (i : Fin (n + 2)) :
    (D.obj σ.first).X (k - ((n + 1 : ℕ) : ℤ)) ⟶
      realShoelaceBarTerm D p (k - 1) := by
  classical
  have hdegree : k - ((n + 1 : ℕ) : ℤ) = (k - 1) - (n : ℤ) := by omega
  let coefficient :
      (D.obj σ.first).X (k - ((n + 1 : ℕ) : ℤ)) ⟶
        (D.obj (σ.face i).first).X (k - ((n + 1 : ℕ) : ℤ)) :=
    (D.map (homOfLE (σ.first_le_face i))).f _
  let shift :
      (D.obj (σ.face i).first).X (k - ((n + 1 : ℕ) : ℤ)) ⟶
        (D.obj (σ.face i).first).X ((k - 1) - (n : ℤ)) :=
    eqToHom (congrArg (D.obj (σ.face i).first).X hdegree)
  let summand :
      (D.obj (σ.face i).first).X ((k - 1) - (n : ℤ)) ⟶
        realShoelaceBarTerm D p (k - 1) :=
    ModuleCat.ofHom
      (DirectSum.lof B (RealShoelaceBarIndex p)
        (fun j => (D.obj j.2.first).X ((k - 1) - (j.1 : ℤ)))
        ⟨n, σ.face i⟩)
  exact coefficient ≫ shift ≫ summand

/-- The actual B-linear horizontal boundary on the entire-real bar
graded terms. The length-zero summands have no horizontal faces.
Length n+1 has the sum of all n+2 unnormalised simplicial faces.
Characteristic two removes alternating signs. -/
noncomputable def realShoelaceBarHorizontalBoundary
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
  cases n with
  | zero => exact 0
  | succ n =>
      exact ∑ i : Fin (n + 2),
        (realShoelaceBarHorizontalFace D p k n σ i).hom

end C4
