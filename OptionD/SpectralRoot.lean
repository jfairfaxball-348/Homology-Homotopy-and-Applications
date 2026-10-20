module

public import OptionD.Rank
public import Mathlib.Analysis.Matrix.Order

public section

open scoped MatrixOrder

/-!
# S124: canonical positive square root of the native centered Gram matrix

The pinned Mathlib functional calculus supplies a self-adjoint real matrix
square root with the SAME finite index type (Fin N). This is an algebraic
Gram factor, not yet a dimension-N-1 Euclidean coordinate family.
-/

namespace OptionD

/-- Every centered Gram matrix admits a symmetric real square root whose
matrix product with itself is exactly the centered Gram. This is a
finite-size-unrestricted, assumption-preserving PSD factorisation. -/
theorem d1_centered_symmetric_square_root (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) :
    ∃ B : Matrix (Fin N) (Fin N) ℝ,
      B.IsHermitian ∧ B * B = d1CenteredGram N edge := by
  let A : Matrix (Fin N) (Fin N) ℝ := d1CenteredGram N edge
  have hA : A.PosSemidef := d1_centered_matrix_posSemidef N hN edge hsym
  let B : Matrix (Fin N) (Fin N) ℝ := CFC.sqrt A
  refine ⟨B, ?_, ?_⟩
  · have hB : (0 : Matrix (Fin N) (Fin N) ℝ) ≤ B :=
      CFC.sqrt_nonneg A
    exact (Matrix.nonneg_iff_posSemidef.mp hB).isHermitian
  · have hsqrt : (CFC.sqrt A) ^ 2 = A := CFC.sq_sqrt A hA.nonneg
    simpa only [B, pow_two] using hsqrt

end OptionD
