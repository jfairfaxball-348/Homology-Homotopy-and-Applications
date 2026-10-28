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


/-! ### S150: categorical chain-map equation across all integers -/

/-- Characteristic-two chain-map identity as an equality of actual
regular-module morphisms, rather than an addition-to-zero statement. -/
theorem regularDx_commute (m : ℕ) :
    regularCoefficientHom (Periodic.x (m + 1)) ≫
      regularCoefficientHom (Periodic.d m) =
    regularCoefficientHom (Periodic.d (m + 1)) ≫
      regularCoefficientHom (Periodic.x m) := by
  rw [regularCoefficientHom_comp, regularCoefficientHom_comp]
  apply congrArg regularCoefficientHom
  have hh : Periodic.d m * Periodic.x (m + 1) +
      Periodic.x m * Periodic.d (m + 1) = (0 : B) := by
    simpa only [← mul_is_truncated_convolution, ← add_is_coordinate_add,
      ← zero_is_coordinate_zero] using Periodic.Dx_zero m
  have hneg : -(Periodic.x m * Periodic.d (m + 1)) =
      Periodic.x m * Periodic.d (m + 1) := rfl
  exact ((add_eq_zero_iff_eq_neg).mp hh).trans hneg

/-- Uniform transport of an integer-resolution differential with a
mathematically equal (rather than definitionally equal) source index. -/
theorem integerResolution_d_transport (i j : ℤ) (h : i = j + 1) :
    integerResolution.d i j =
      eqToHom (congrArg integerObject h) ≫ integerDifferential j := by
  subst i
  simp [integerResolution, ChainComplex.of_d]


/-! ### S151: actual chain-map naturality at all integer truncation degrees -/

/-- Both compositions in the adjacent x chain-map square end in the
zero target object whenever n ≤ s. This includes the degree-zero endpoint
and all negative degrees; no coefficient-level surrogate is used. -/
theorem globalXComponent_naturality_at_boundary
    (s n : ℤ) (hn : n ≤ s) :
    globalXComponent s (n + 1) ≫
      (integerShiftResolution (s + 1)).d (n + 1) n =
    (integerShiftResolution s).d (n + 1) n ≫
      globalXComponent s n := by
  have hz : Limits.IsZero ((integerShiftResolution (s + 1)).X n) := by
    change Limits.IsZero (integerObject (n - (s + 1)))
    exact integerObject_isZero_negative _ (by omega)
  exact hz.eq_of_tgt _ _

/-- The component of the adjacent x map is zero whenever its actual
shifted target is the zero module. -/
theorem globalXComponent_zero_below
    (s n : ℤ) (hn : n ≤ s) :
    globalXComponent s n = 0 := by
  have hz : Limits.IsZero ((integerShiftResolution (s + 1)).X n) := by
    change Limits.IsZero (integerObject (n - (s + 1)))
    exact integerObject_isZero_negative _ (by omega)
  exact hz.eq_of_tgt _ _


/-! ### S152: explicit coherence of the regular-module transport casts -/

/-- Changing a nonnegative index by a proof of equality is coherent with
its canonical identification with the regular B-module. -/
theorem integerObject_cast_commutes
    (i j : ℤ) (h : i = j) (hi : 0 ≤ i) (hj : 0 ≤ j) :
    eqToHom (congrArg integerObject h) ≫
      eqToHom (integerObject_nonnegative j hj) =
      eqToHom (integerObject_nonnegative i hi) := by
  subst j
  simp

/-- The inverse transport coherence, for the return leg of a regular
B-module cast sandwich. -/
theorem integerObject_cast_inverse_commutes
    (i j : ℤ) (h : i = j) (hi : 0 ≤ i) (hj : 0 ≤ j) :
    eqToHom (integerObject_nonnegative i hi).symm ≫
      eqToHom (congrArg integerObject h) =
      eqToHom (integerObject_nonnegative j hj).symm := by
  subst j
  simp

/-- A regular-module square stays commutative after all four vertices are
transported through equalities. -/
theorem regularCastSquare
    {P Q R S : ModuleCat B}
    (ep : P = ModuleCat.of B B)
    (eq : Q = ModuleCat.of B B)
    (er : R = ModuleCat.of B B)
    (es : S = ModuleCat.of B B)
    (a b c d : ModuleCat.of B B ⟶ ModuleCat.of B B)
    (hab : a ≫ b = c ≫ d) :
    (eqToHom ep ≫ a ≫ eqToHom er.symm) ≫
      (eqToHom er ≫ b ≫ eqToHom es.symm) =
    (eqToHom ep ≫ c ≫ eqToHom eq.symm) ≫
      (eqToHom eq ≫ d ≫ eqToHom es.symm) := by
  cases ep
  cases eq
  cases er
  cases es
  simpa using hab


/-! ### S153: positive adjacent square (scratch, subject to pinned compiler) -/

theorem globalXComponent_naturality_positive
    (s n : ℤ) (hn : s + 1 ≤ n) :
    globalXComponent s (n + 1) ≫
      (integerShiftResolution (s + 1)).d (n + 1) n =
    (integerShiftResolution s).d (n + 1) n ≫
      globalXComponent s n := by
  have hp : s + 1 ≤ n + 1 := by omega
  have ha : 0 ≤ n - (s + 1) := by omega
  have hb : 0 ≤ n - s := by omega
  have ha1 : 0 ≤ n + 1 - (s + 1) := by omega
  have hb1 : 0 ≤ n + 1 - s := by omega
  have hnat : (n - s).toNat = (n - (s + 1)).toNat + 1 := by omega
  have hA : n + 1 - (s + 1) = n - (s + 1) + 1 := by omega
  have hB : n + 1 - s = n - s + 1 := by omega
  rw [integerShiftResolution_d, integerShiftResolution_d]
  rw [integerResolution_d_transport _ _ hA, integerResolution_d_transport _ _ hB]
  simp [globalXComponent, integerDifferential, hp, hn, ha, hb, ha1,
    hb1, hnat, integerObject, regularCoefficientHom, differential,
    Category.assoc, eqToHom_trans, eqToHom_refl]


end C4
