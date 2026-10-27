module
public import C4.Resolution

public section

/-!
# S141: integer-indexed cyclic-four complex with zero negative terms

This is an actual `ChainComplex (ModuleCat B) ℤ`, not yet an
augmented projective resolution with a categorical homology computation.
The indexing is deliberately explicit at -1 and 0.
-/

namespace C4

open CategoryTheory

/-- Copies of the regular module in nonnegative homological degrees,
and the zero module in all negative degrees. -/
def integerObject (n : ℤ) : ModuleCat B :=
  if 0 ≤ n then ModuleCat.of B B else ModuleCat.of B (Fin 0 → B)

theorem integerObject_nonnegative (n : ℤ) (hn : 0 ≤ n) :
    integerObject n = ModuleCat.of B B := by
  simp [integerObject, hn]

theorem integerObject_negative (n : ℤ) (hn : n < 0) :
    integerObject n = ModuleCat.of B (Fin 0 → B) := by
  have h : ¬ 0 ≤ n := by omega
  simp [integerObject, h]

/-- The differential P_(n+1) → P_n, including P_0 → P_(-1) = 0.
For n ≥ 0 it is the honest B-linear multiplication map; at n < 0
it is the zero morphism. -/
def integerDifferential (n : ℤ) :
    integerObject (n + 1) ⟶ integerObject n := by
  by_cases hn : 0 ≤ n
  · have hn1 : 0 ≤ n + 1 := by omega
    exact (eqToHom (integerObject_nonnegative (n + 1) hn1)) ≫
      differential n.toNat ≫ (eqToHom (integerObject_nonnegative n hn).symm)
  · exact 0

theorem integerDifferential_square (n : ℤ) :
    integerDifferential (n + 1) ≫ integerDifferential n = 0 := by
  by_cases hn : 0 ≤ n
  · have hn1 : 0 ≤ n + 1 := by omega
    have hn2 : 0 ≤ (n + 1) + 1 := by omega
    have hcast : (n + 1).toNat = n.toNat + 1 := by omega
    simp [integerDifferential, hn, hn1, hcast, Category.assoc,
      differential_square]
  · simp [integerDifferential, hn]

/-- The entire integer-indexed periodic chain complex. -/
def integerResolution : ChainComplex (ModuleCat B) ℤ :=
  ChainComplex.of integerObject integerDifferential integerDifferential_square

/-- Ring-level expression of exactness at every positive degree:
the kernel of multiplication by d_n is the image of d_(n+1). -/
theorem positiveDifferential_exact_coeff (n : ℕ) (a : B) :
    coefficientLinear (Periodic.d n) a = 0 ↔
      ∃ b : B, a = coefficientLinear (Periodic.d (n + 1)) b := by
  simpa [coefficientLinear, mul_is_truncated_convolution,
    zero_is_coordinate_zero] using (Periodic.exact_positive n a)

end C4
