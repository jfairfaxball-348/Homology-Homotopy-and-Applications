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



/-! ### S163: dependent intermediate-shift naturality and canonical later arrows -/

/-- Transport of the actual adjacent shifted chain map along an equality of
integer shifts. Both the source and the successor must be cast; transporting
only the intermediate source is not type-correct in later composites. -/
theorem globalXChainMap_shift_naturality (a b : ℤ) (h : a = b) :
    eqToHom (congrArg integerShiftResolution h) ≫ globalXChainMap b =
      globalXChainMap a ≫
        eqToHom (congrArg integerShiftResolution
          (congrArg (fun k : ℤ => k + 1) h)) := by
  cases h
  simp

/-- Regular normalisation is invariant under a true target equality cast
of entire shifted chain complexes, not an untyped coefficient conversion. -/
theorem positiveGlobalComponent_postcast
    (a b c n : ℤ) (h : b = c)
    (ha : a ≤ n) (hb : b ≤ n) (hc : c ≤ n)
    (f : integerShiftResolution a ⟶ integerShiftResolution b) :
    positiveGlobalComponent a c n ha hc
        (f ≫ eqToHom (congrArg integerShiftResolution h)) =
      positiveGlobalComponent a b n ha hb f := by
  cases h
  simp [positiveGlobalComponent]

/-- The third adjacent genuine arrow, with exact stage-3 indexing. -/
def canonicalX23 (s : ℤ) :
    integerShiftResolution (s + 2) ⟶ integerShiftResolution (s + 3) :=
  globalXChainMap (s + 2) ≫
    eqToHom (congrArg integerShiftResolution (by omega : s + 2 + 1 = s + 3))

/-- The fourth adjacent genuine arrow, with exact stage-4 indexing. -/
def canonicalX34 (s : ℤ) :
    integerShiftResolution (s + 3) ⟶ integerShiftResolution (s + 4) :=
  globalXChainMap (s + 3) ≫
    eqToHom (congrArg integerShiftResolution (by omega : s + 3 + 1 = s + 4))

/-- The second actual adjacent chain map has nonzero first residue. -/
theorem canonicalX12_unit (s : ℤ) :
    (regularEval (positiveGlobalComponent (s + 1) (s + 2) (s + 2)
      (by omega) (by omega) (canonicalX12 s))).c0 = 1 := by
  have ht : s + 1 + 1 = s + 2 := by omega
  unfold canonicalX12
  rw [positiveGlobalComponent_postcast (s + 1) (s + 1 + 1) (s + 2)
      (s + 2) ht (by omega) (by omega) (by omega)
      (globalXChainMap (s + 1))]
  simpa only [ht] using globalXChainMap_first_residue_unit (s + 1)

/-- The third actual adjacent chain map has nonzero first residue. -/
theorem canonicalX23_unit (s : ℤ) :
    (regularEval (positiveGlobalComponent (s + 2) (s + 3) (s + 3)
      (by omega) (by omega) (canonicalX23 s))).c0 = 1 := by
  have ht : s + 2 + 1 = s + 3 := by omega
  unfold canonicalX23
  rw [positiveGlobalComponent_postcast (s + 2) (s + 2 + 1) (s + 3)
      (s + 3) ht (by omega) (by omega) (by omega)
      (globalXChainMap (s + 2))]
  simpa only [ht] using globalXChainMap_first_residue_unit (s + 2)

/-- The fourth actual adjacent chain map has nonzero first residue. -/
theorem canonicalX34_unit (s : ℤ) :
    (regularEval (positiveGlobalComponent (s + 3) (s + 4) (s + 4)
      (by omega) (by omega) (canonicalX34 s))).c0 = 1 := by
  have ht : s + 3 + 1 = s + 4 := by omega
  unfold canonicalX34
  rw [positiveGlobalComponent_postcast (s + 3) (s + 3 + 1) (s + 4)
      (s + 4) ht (by omega) (by omega) (by omega)
      (globalXChainMap (s + 3))]
  simpa only [ht] using globalXChainMap_first_residue_unit (s + 3)


/-- A two-step shifted composite is the true globally nullhomotopic square
followed by the unique target cast. The middle cast is moved through the
SECOND actual chain map by the S163 naturality theorem, never erased. -/
theorem globalXSquared_stage_transport
    (a b c : ℤ) (h₁ : a + 1 = b) (h₂ : b + 1 = c)
    (h₃ : a + 2 = c) :
    (globalXChainMap a ≫
      eqToHom (congrArg integerShiftResolution h₁)) ≫
      (globalXChainMap b ≫
        eqToHom (congrArg integerShiftResolution h₂)) =
    globalXSquared a ≫
      eqToHom (congrArg integerShiftResolution h₃) := by
  calc
    _ = (globalXChainMap a ≫
          (eqToHom (congrArg integerShiftResolution h₁) ≫
            globalXChainMap b)) ≫
          eqToHom (congrArg integerShiftResolution h₂) := by
            simp only [Category.assoc]
    _ = (globalXChainMap a ≫
          (globalXChainMap (a + 1) ≫
            eqToHom (congrArg integerShiftResolution
              (congrArg (fun k : ℤ => k + 1) h₁)))) ≫
          eqToHom (congrArg integerShiftResolution h₂) := by
            rw [globalXChainMap_shift_naturality (a + 1) b h₁]
    _ = _ := by
      simp [globalXSquared, Category.assoc]

/-- The second genuine primary homotopy, from stage 1 to stage 3. -/
def canonicalPrimary13 (s : ℤ) :
    Homotopy (canonicalX12 s ≫ canonicalX23 s) 0 := by
  have h₁ : (s + 1) + 1 = s + 2 := by omega
  have h₂ : (s + 2) + 1 = s + 3 := by omega
  have h₃ : (s + 1) + 2 = s + 3 := by omega
  have heq :
      canonicalX12 s ≫ canonicalX23 s =
        globalXSquared (s + 1) ≫
          eqToHom (congrArg integerShiftResolution h₃) := by
    simpa only [canonicalX12, canonicalX23] using
      globalXSquared_stage_transport (s + 1) (s + 2) (s + 3)
        h₁ h₂ h₃
  rw [heq]
  simpa using
    (globalXSquaredNullHomotopy (s + 1)).compRight
      (eqToHom (congrArg integerShiftResolution h₃))

/-- The third genuine primary homotopy, from stage 2 to stage 4. -/
def canonicalPrimary24 (s : ℤ) :
    Homotopy (canonicalX23 s ≫ canonicalX34 s) 0 := by
  have h₁ : (s + 2) + 1 = s + 3 := by omega
  have h₂ : (s + 3) + 1 = s + 4 := by omega
  have h₃ : (s + 2) + 2 = s + 4 := by omega
  have heq :
      canonicalX23 s ≫ canonicalX34 s =
        globalXSquared (s + 2) ≫
          eqToHom (congrArg integerShiftResolution h₃) := by
    simpa only [canonicalX23, canonicalX34] using
      globalXSquared_stage_transport (s + 2) (s + 3) (s + 4)
        h₁ h₂ h₃
  rw [heq]
  simpa using
    (globalXSquaredNullHomotopy (s + 2)).compRight
      (eqToHom (congrArg integerShiftResolution h₃))

end C4
