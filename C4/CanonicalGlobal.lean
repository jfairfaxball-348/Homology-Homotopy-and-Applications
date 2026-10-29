module
public import C4.GlobalDefining

@[expose] public section

/-!
# S161: construct canonical nonzero global defining-system data

This module targets genuine instantiation of the all-integer arbitrary-choice
structure from S160 using S154–S158 verified x/h/z maps. The initial
component is the canonical primary homotopy with all integer-shift
transportations made explicit. It is not a completed fourfold instance or
an entire-real metric theorem.
-/

namespace C4

open CategoryTheory

/-- The second adjacent genuine chain map, with target exactly s+2
rather than the mathematically equal expression (s+1)+1. -/
def canonicalX12 (s : ℤ) :
    integerShiftResolution (s + 1) ⟶ integerShiftResolution (s + 2) :=
  globalXChainMap (s + 1) ≫
    eqToHom (congrArg integerShiftResolution (by omega : s + 1 + 1 = s + 2))

/-- The first canonical pair is genuinely nullhomotopic at all integer
degrees, with exactly the target indexing required by global choice. -/
def canonicalPrimary02 (s : ℤ) :
    Homotopy (globalXChainMap s ≫ canonicalX12 s) 0 := by
  simpa only [canonicalX12, globalXSquared, Category.assoc] using
    globalXSquaredNullHomotopy s

/-- Cancel the actual categorical transports to the regular module for a
positive component of a genuine adjacent global chain map. -/
theorem positiveGlobalComponent_globalX (s n : ℤ) (hn : s + 1 ≤ n) :
    positiveGlobalComponent s (s + 1) n (by omega) hn (globalXChainMap s) =
      regularCoefficientHom (Periodic.x (n - (s + 1)).toNat) := by
  unfold positiveGlobalComponent
  change
    eqToHom (integerObject_nonnegative (n - s) (by omega)).symm ≫
      globalXComponent s n ≫
      eqToHom (integerObject_nonnegative (n - (s + 1)) (by omega)) = _
  rw [globalXComponent_regular s n hn]
  change
    eqToHom (integerObject_nonnegative (n - s) (by omega)).symm ≫
      (eqToHom (integerObject_nonnegative (n - s) (by omega)) ≫
        regularCoefficientHom (Periodic.x (n - (s + 1)).toNat) ≫
        eqToHom (integerObject_nonnegative (n - (s + 1)) (by omega)).symm) ≫
      eqToHom (integerObject_nonnegative (n - (s + 1)) (by omega)) = _
  simp [Category.assoc]

/-- Residue-one of the first genuine positive component at every shift. -/
theorem globalXChainMap_first_residue_unit (s : ℤ) :
    (regularEval (positiveGlobalComponent s (s + 1) (s + 1)
      (by omega) (by omega) (globalXChainMap s))).c0 = 1 := by
  rw [positiveGlobalComponent_globalX s (s + 1) (by omega)]
  simp [Periodic.x, regularEval_coefficient, C4.one]


/-- Canonical third stage, transported to the exact third shift. -/
def canonicalX23 (s : ℤ) :
    integerShiftResolution (s + 2) ⟶ integerShiftResolution (s + 3) :=
  globalXChainMap (s + 2) ≫
    eqToHom (congrArg integerShiftResolution (by omega : s + 2 + 1 = s + 3))

/-- Canonical fourth stage, transported to the exact fourth shift. -/
def canonicalX34 (s : ℤ) :
    integerShiftResolution (s + 3) ⟶ integerShiftResolution (s + 4) :=
  globalXChainMap (s + 3) ≫
    eqToHom (congrArg integerShiftResolution (by omega : s + 3 + 1 = s + 4))

/-- The second genuine canonical primary shifted nullhomotopy. -/
def canonicalPrimary13 (s : ℤ) :
    Homotopy (canonicalX12 s ≫ canonicalX23 s) 0 := by
  simpa [canonicalX12, canonicalX23, globalXSquared, add_assoc, Category.assoc] using
    globalXSquaredNullHomotopy (s + 1)

/-- The third genuine canonical primary shifted nullhomotopy. -/
def canonicalPrimary24 (s : ℤ) :
    Homotopy (canonicalX23 s ≫ canonicalX34 s) 0 := by
  simpa [canonicalX23, canonicalX34, globalXSquared, add_assoc, Category.assoc] using
    globalXSquaredNullHomotopy (s + 2)


end C4
