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

/-- Change the endpoints of a homotopy without casting its data family.
The endpoint equations affect only the commutativity proof. -/
def relabelHomotopy
    {C D : ChainComplex (ModuleCat B) ℤ}
    {f g f' g' : C ⟶ D} (h : Homotopy f g)
    (hf : f' = f) (hg : g' = g) : Homotopy f' g' where
  hom := h.hom
  zero := h.zero
  comm i := by simpa only [hf, hg] using h.comm i

/-- The second adjacent genuine chain map, with target exactly s+2
rather than the mathematically equal expression (s+1)+1. -/
def canonicalX12 (s : ℤ) :
    integerShiftResolution (s + 1) ⟶ integerShiftResolution (s + 2) :=
  globalXChainMap (s + 1) ≫
    eqToHom (congrArg integerShiftResolution (by omega : s + 1 + 1 = s + 2))

/-- The first canonical pair is genuinely nullhomotopic at all integer
degrees, with exactly the target indexing required by global choice. -/
def canonicalPrimary02 (s : ℤ) :
    Homotopy (globalXChainMap s ≫ canonicalX12 s) 0 :=
  relabelHomotopy (globalXSquaredNullHomotopy s)
    (by simp only [canonicalX12, globalXSquared, Category.assoc]) rfl

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
  exact relabelHomotopy
    ((globalXSquaredNullHomotopy (s + 1)).compRight
      (eqToHom (congrArg integerShiftResolution h₃))) heq (by simp)

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
  exact relabelHomotopy
    ((globalXSquaredNullHomotopy (s + 2)).compRight
      (eqToHom (congrArg integerShiftResolution h₃))) heq (by simp)


/-! ### S163: actual degree-two secondary maps with exact fourfold targets -/

/-- The first degree-two family has exactly the stage-0 to stage-3 target. -/
def canonicalZ03 (s i j : ℤ) :
    (integerShiftResolution s).X i ⟶
      (integerShiftResolution (s + 3)).X j :=
  globalZFamily s i j

theorem canonicalZ03_zero (s i j : ℤ) (h : j ≠ i + 2) :
    canonicalZ03 s i j = 0 := globalZFamily_zero s i j h

/-- Transport the second genuine degree-two family from the arithmetic
shift (s+1)+3 to the stage-4 shift s+4 in the actual target complex. -/
def canonicalZ14 (s i j : ℤ) :
    (integerShiftResolution (s + 1)).X i ⟶
      (integerShiftResolution (s + 4)).X j :=
  globalZFamily (s + 1) i j ≫
    eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X j)
      (by omega : s + 1 + 3 = s + 4))

theorem canonicalZ14_zero (s i j : ℤ) (h : j ≠ i + 2) :
    canonicalZ14 s i j = 0 := by
  simp [canonicalZ14, globalZFamily_zero (s + 1) i j h]

/-- Endpoint equalities do not hide the actual primary components. -/
@[simp] theorem canonicalPrimary02_hom (s n : ℤ) :
    (canonicalPrimary02 s).hom n (n + 1) = globalHComponent s n := by
  exact globalHFamily_next s n

@[simp] theorem canonicalPrimary13_hom (s n : ℤ) :
    (canonicalPrimary13 s).hom n (n + 1) =
      globalHComponent (s + 1) n ≫
        eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X (n + 1))
          (by omega : s + 1 + 2 = s + 3)) := by
  change globalHFamily (s + 1) n (n + 1) ≫ _ = _
  simp [globalHFamily_next]

@[simp] theorem canonicalPrimary24_hom (s n : ℤ) :
    (canonicalPrimary24 s).hom n (n + 1) =
      globalHComponent (s + 2) n ≫
        eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X (n + 1))
          (by omega : s + 2 + 2 = s + 4)) := by
  change globalHFamily (s + 2) n (n + 1) ≫ _ = _
  simp [globalHFamily_next]

/-- Coherence of the first secondary against the actual chosen primaries. -/
theorem canonicalZ03_coherence (s n : ℤ) :
    canonicalZ03 s n (n + 2) ≫
      (integerShiftResolution (s + 3)).d (n + 2) (n + 1) +
    (((integerShiftResolution s).d n (n - 1) ≫
      canonicalZ03 s (n - 1) ((n - 1) + 2)) ≫
      eqToHom (congrArg (integerShiftResolution (s + 3)).X
        (by omega : n - 1 + 2 = n + 1))) =
    (canonicalPrimary02 s).hom n (n + 1) ≫ (canonicalX23 s).f (n + 1) +
    (globalXChainMap s).f n ≫ (canonicalPrimary13 s).hom n (n + 1) := by
  simpa only [canonicalZ03, canonicalPrimary02_hom, canonicalPrimary13_hom,
    canonicalX23, globalXChainMap, HomologicalComplex.comp_f, HomologicalComplex.eqToHom_f,
    Category.assoc] using globalZFamily_coherence s n

/-- Index-equality transport for the actual degree-one component family. -/
@[reassoc] theorem globalHComponent_shift_naturality
    (a b n : ℤ) (h : a = b) :
    eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X n) h) ≫
      globalHComponent b n =
    globalHComponent a n ≫
      eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X (n + 1))
        (by omega : a + 2 = b + 2)) := by
  cases h
  simp

@[reassoc] theorem globalXComponent_shift_naturality
    (a b n : ℤ) (h : a = b) :
    eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X n) h) ≫
      globalXComponent b n =
    globalXComponent a n ≫
      eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X n)
        (by omega : a + 1 = b + 1)) := by
  cases h
  simp

@[reassoc] theorem shiftedDifferential_shift_naturality
    (a b i j : ℤ) (h : a = b) :
    eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X i) h) ≫
      (integerShiftResolution b).d i j =
    (integerShiftResolution a).d i j ≫
      eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X j) h) := by
  cases h
  simp

/-- Coherence of the second secondary, including both intermediate casts. -/
theorem canonicalZ14_coherence (s n : ℤ) :
    canonicalZ14 s n (n + 2) ≫
      (integerShiftResolution (s + 4)).d (n + 2) (n + 1) +
    (((integerShiftResolution (s + 1)).d n (n - 1) ≫
      canonicalZ14 s (n - 1) ((n - 1) + 2)) ≫
      eqToHom (congrArg (integerShiftResolution (s + 4)).X
        (by omega : n - 1 + 2 = n + 1))) =
    (canonicalPrimary13 s).hom n (n + 1) ≫ (canonicalX34 s).f (n + 1) +
    (canonicalX12 s).f n ≫ (canonicalPrimary24 s).hom n (n + 1) := by
  have hd := shiftedDifferential_shift_naturality
    (s + 1 + 3) (s + 4) (n + 2) (n + 1) (by omega)
  have hx := globalXComponent_shift_naturality_assoc
    (s + 1 + 2) (s + 3) (n + 1) (by omega)
    (eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X (n + 1))
      (by omega : s + 3 + 1 = s + 4)))
  have hh := globalHComponent_shift_naturality_assoc
    (s + 1 + 1) (s + 2) n (by omega)
    (eqToHom (congrArg (fun k : ℤ => (integerShiftResolution k).X (n + 1))
      (by omega : s + 2 + 2 = s + 4)))
  have hz := congrArg
    (fun f => f ≫ eqToHom
      (congrArg (fun k : ℤ => (integerShiftResolution k).X (n + 1))
        (by omega : s + 1 + 3 = s + 4)))
    (globalZFamily_coherence (s + 1) n)
  simpa [canonicalZ14, canonicalPrimary13_hom, canonicalPrimary24_hom,
    canonicalX12, canonicalX34, globalXChainMap, HomologicalComplex.comp_f,
    HomologicalComplex.eqToHom_f, Category.assoc,
    Preadditive.add_comp, hd, hx, hh] using hz

/-- A genuine chosen global fourfold defining system at every integer shift. -/
def canonicalGlobalFourfold (s : ℤ) : GlobalFourfoldDefiningSystem s where
  x01 := globalXChainMap s
  x12 := canonicalX12 s
  x23 := canonicalX23 s
  x34 := canonicalX34 s
  x01_unit := globalXChainMap_first_residue_unit s
  x12_unit := canonicalX12_unit s
  x23_unit := canonicalX23_unit s
  x34_unit := canonicalX34_unit s
  h02 := canonicalPrimary02 s
  h13 := canonicalPrimary13 s
  h24 := canonicalPrimary24 s
  z03 := canonicalZ03 s
  z14 := canonicalZ14 s
  z03_zero := canonicalZ03_zero s
  z14_zero := canonicalZ14_zero s
  z03_coherence := canonicalZ03_coherence s
  z14_coherence := canonicalZ14_coherence s

theorem globalFourfold_nonempty (s : ℤ) : Nonempty (GlobalFourfoldDefiningSystem s) :=
  ⟨canonicalGlobalFourfold s⟩

end C4
