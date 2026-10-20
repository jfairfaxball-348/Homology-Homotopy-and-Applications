module

public import OptionD.Recovery
public import Mathlib.LinearAlgebra.Matrix.PosDef
public import Mathlib.LinearAlgebra.Matrix.Rank

public section

/-!
# S123: true matrix PSD and matrix-vector kernel

These theorems bridge the already compiled finite quadratic and coordinate
statements to Mathlib's native matrix interfaces, uniformly for N ≥ 2.
They do not by themselves produce Euclidean coordinates or a Gram root.
-/

namespace OptionD

/-- The centered distance matrix is a positive semidefinite matrix in
Mathlib's matrix sense (including the Hermitian hypothesis). -/
theorem d1_centered_matrix_posSemidef (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) :
    (d1CenteredGram N edge).PosSemidef := by
  apply Matrix.PosSemidef.of_dotProduct_mulVec_nonneg
  · apply Matrix.IsHermitian.ext
    intro i j
    simpa using d1_centered_gram_symmetric N edge hsym j i
  · intro x
    have hq := d1_centered_quadratic_nonneg N hN edge hsym x
    convert hq using 1
    simp only [dotProduct, Matrix.mulVec, star_trivial, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i hi
    apply Finset.sum_congr rfl
    intro j hj
    ring

/-- The genuine Matrix.mulVec kernel is exactly the one-dimensional
space of constant functions: no exceptional graph or size is excluded. -/
theorem d1_centered_mulVec_kernel (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (x : Fin N → ℝ) :
    (d1CenteredGram N edge).mulVec x = 0 ↔
      ∃ c : ℝ, ∀ i : Fin N, x i = c := by
  constructor
  · intro hx
    apply (d1_centered_coordinate_kernel N hN edge hsym x).mp
    intro i
    have hi := congrFun hx i
    simpa only [Matrix.mulVec, dotProduct, Pi.zero_apply] using hi
  · intro hx
    have h := (d1_centered_coordinate_kernel N hN edge hsym x).mpr hx
    funext i
    simpa only [Matrix.mulVec, dotProduct, Pi.zero_apply] using h i

end OptionD
