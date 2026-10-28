module
public import C4.Exactness

@[expose] public section

/-!
# S150: actual shifted integer-resolution components

These are genuine B-module morphisms between the terms of the previously
constructed, integer-indexed, shifted ChainComplex objects. Their target
degrees encode the dg degrees, including the truncation at the endpoint.
-/

namespace C4

open CategoryTheory

/-- The intended adjacent degree-zero x map, with the source and target
given by actual shifted chain-complex objects. -/
def globalXComponent (s n : ℤ) :
    (integerShiftResolution s).X n ⟶
      (integerShiftResolution (s + 1)).X n := by
  change integerObject (n - s) ⟶ integerObject (n - (s + 1))
  by_cases hn : s + 1 ≤ n
  · have hs : 0 ≤ n - s := by omega
    have ht : 0 ≤ n - (s + 1) := by omega
    exact eqToHom (integerObject_nonnegative _ hs) ≫
      regularCoefficientHom (Periodic.x (n - (s + 1)).toNat) ≫
      eqToHom (integerObject_nonnegative _ ht).symm
  · exact 0

/-- The degree-one primary filler between genuine shifted terms. -/
def globalHComponent (s n : ℤ) :
    (integerShiftResolution s).X n ⟶
      (integerShiftResolution (s + 2)).X (n + 1) := by
  change integerObject (n - s) ⟶ integerObject ((n + 1) - (s + 2))
  by_cases hn : s + 1 ≤ n
  · have hs : 0 ≤ n - s := by omega
    have ht : 0 ≤ (n + 1) - (s + 2) := by omega
    exact eqToHom (integerObject_nonnegative _ hs) ≫
      regularCoefficientHom (Periodic.h (n - (s + 1)).toNat) ≫
      eqToHom (integerObject_nonnegative _ ht).symm
  · exact 0

/-- The degree-one secondary filler between genuine shifted terms. -/
def globalZComponent (s n : ℤ) :
    (integerShiftResolution s).X n ⟶
      (integerShiftResolution (s + 3)).X (n + 1) := by
  change integerObject (n - s) ⟶ integerObject ((n + 1) - (s + 3))
  by_cases hn : s + 2 ≤ n
  · have hs : 0 ≤ n - s := by omega
    have ht : 0 ≤ (n + 1) - (s + 3) := by omega
    exact eqToHom (integerObject_nonnegative _ hs) ≫
      regularCoefficientHom (Periodic.z (n - (s + 2)).toNat) ≫
      eqToHom (integerObject_nonnegative _ ht).symm
  · exact 0

end C4
