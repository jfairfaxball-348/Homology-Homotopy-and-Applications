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

/-- The genuine adjacent x chain map is nontrivial in its first positive
regular component. This verifies the residue-one hypothesis needed for a
canonical global defining-system map at every integer shift. -/
theorem globalXChainMap_first_residue_unit (s : ℤ) :
    (regularEval (positiveGlobalComponent s (s + 1) (s + 1)
      (by omega) (by omega) (globalXChainMap s))).c0 = 1 := by
  unfold positiveGlobalComponent
  change (regularEval
    (eqToHom (integerObject_nonnegative (s + 1 - s) (by omega)).symm ≫
      globalXComponent s (s + 1) ≫
      eqToHom (integerObject_nonnegative (s + 1 - (s + 1)) (by omega)))).c0 = 1
  rw [globalXComponent_regular s (s + 1) (by omega)]
  have hp := integerObject_nonnegative (s + 1 - s) (by omega)
  have hq := integerObject_nonnegative (s + 1 - (s + 1)) (by omega)
  cases hp
  cases hq
  simp [Periodic.x, Category.assoc]


end C4
