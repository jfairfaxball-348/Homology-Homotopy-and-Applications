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

end C4
