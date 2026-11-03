module
public import C4.HomotopyInterleavingBound
public import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
public import Mathlib.Algebra.CharP.Basic

@[expose] public section

/-!
# The homology interleaving distance of the C4 diagram: `dCohI(F, 0) = 1/2`

For a real diagram `A` of `B`-module complexes and an integer degree `n`, the
homology persistence module `u ↦ Hₙ(A(u))` is taken with its UNDERLYING
`k = 𝔽₂`-module structure (restriction of scalars along `k → B`). The
homology interleaving distance is the supremum over ALL integer degrees of the
ordinary interleaving distances of these persistence modules, valued in
`[0, ∞]`; an interleaving is a pair of natural maps of entire real persistence
modules satisfying both shifted composite laws at every real index.

For the genuine diagram `F = realDiagram` against zero: every degree has
distance at most `1/2` (no nonzero homology class survives one unit of time),
and degree zero has distance exactly `1/2` (the identity of `H₀(P) = k` on the
stage `[0,1)`). Hence `dCohI(F, 0) = 1/2`.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
open scoped ENNReal

/-! ### Interleavings of persistence modules in an arbitrary category -/

section General

universe v u
variable {C : Type u} [Category.{v} C]

/-- A strict `ε`-interleaving of two real persistence objects. -/
structure PersistenceInterleaving (M N : ℝ ⥤ C) (ε : ℝ) (hε : 0 ≤ ε) where
  forward : M ⟶ realTranslation ε ⋙ N
  backward : N ⟶ realTranslation ε ⋙ M
  forward_backward : ∀ t : ℝ,
    forward.app t ≫ backward.app (t + ε) =
      M.map (homOfLE (show t ≤ (t + ε) + ε by linarith))
  backward_forward : ∀ t : ℝ,
    backward.app t ≫ forward.app (t + ε) =
      N.map (homOfLE (show t ≤ (t + ε) + ε by linarith))

/-- The interleaving distance of real persistence objects, in `[0, ∞]`. -/
noncomputable def persistenceInterleavingDistance (M N : ℝ ⥤ C) : ℝ≥0∞ :=
  ⨅ ε ∈ {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (PersistenceInterleaving M N ε hε)},
    ENNReal.ofReal ε

variable [HasZeroMorphisms C]

/-- Against an objectwise-zero persistence object, an `ε`-interleaving exists
exactly when every `2ε` structure map vanishes. -/
theorem persistenceInterleaving_zero_iff (M N : ℝ ⥤ C) (hN : ∀ t, IsZero (N.obj t))
    (ε : ℝ) (hε : 0 ≤ ε) :
    Nonempty (PersistenceInterleaving M N ε hε) ↔
      ∀ t : ℝ, M.map (homOfLE (show t ≤ (t + ε) + ε by linarith)) = 0 := by
  constructor
  · rintro ⟨I⟩ t
    rw [← I.forward_backward t,
      show I.forward.app t = 0 from (hN (t + ε)).eq_of_tgt _ _, zero_comp]
  · intro h
    exact ⟨{ forward := 0
             backward := 0
             forward_backward := fun t =>
               (show (0 : M.obj t ⟶ N.obj (t + ε)) ≫
                   (0 : N.obj (t + ε) ⟶ M.obj (t + ε + ε)) = _ by
                 rw [zero_comp, h t])
             backward_forward := fun t => (hN t).eq_of_src _ _ }⟩

end General

/-! ### Underlying `k`-module homology persistence -/

instance : Nontrivial B := ⟨⟨0, 1, by decide⟩⟩

instance : CharP B 2 :=
  (CharP.charP_iff_prime_eq_zero Nat.prime_two).2 (by
    rw [Nat.cast_ofNat]
    exact B_two_eq_zero)

/-- The structure map `k = 𝔽₂ → B`. -/
noncomputable def residueFieldToB : ZMod 2 →+* B := ZMod.castHom (dvd_refl 2) B

/-- The homology persistence module of a whole real diagram in degree `n`,
with its underlying `k`-module structure. -/
noncomputable def homologyPersistence (A : ℝ ⥤ C4Complex) (n : ℤ) :
    ℝ ⥤ ModuleCat (ZMod 2) :=
  A ⋙ HomologicalComplex.homologyFunctor (ModuleCat B) (ComplexShape.down ℤ) n ⋙
    ModuleCat.restrictScalars residueFieldToB

/-- The homology interleaving distance: supremum over all degrees. -/
noncomputable def homologyInterleavingDistance (A A' : ℝ ⥤ C4Complex) : ℝ≥0∞ :=
  ⨆ n : ℤ, persistenceInterleavingDistance (homologyPersistence A n) (homologyPersistence A' n)

theorem restrictScalars_map_eq_zero_iff {X Y : ModuleCat B} (f : X ⟶ Y) :
    (ModuleCat.restrictScalars residueFieldToB).map f = 0 ↔ f = 0 := by
  constructor
  · intro h
    apply (ModuleCat.restrictScalars residueFieldToB).map_injective
    rw [h, Functor.map_zero]
  · intro h
    rw [h, Functor.map_zero]

theorem homologyPersistence_map_eq_zero_iff (A : ℝ ⥤ C4Complex) (n : ℤ) {t t' : ℝ}
    (f : t ⟶ t') :
    (homologyPersistence A n).map f = 0 ↔ HomologicalComplex.homologyMap (A.map f) n = 0 :=
  restrictScalars_map_eq_zero_iff _

/-! ### Homology of the shifted resolutions and of the real diagram -/

theorem integerShiftResolution_exactAt_iff (s n : ℤ) :
    (integerShiftResolution s).ExactAt n ↔ integerResolution.ExactAt (n - s) := by
  rw [HomologicalComplex.exactAt_iff' (integerShiftResolution s) (n + 1) n (n - 1)
      (by simp) (by simp),
    HomologicalComplex.exactAt_iff' integerResolution (n + 1 - s) (n - s) (n - 1 - s)
      (by simp; omega) (by simp; omega)]
  rfl

theorem integerResolution_not_exactAt_zero : ¬ integerResolution.ExactAt 0 := by
  intro h
  have hz : IsZero residueModuleObject :=
    IsZero.of_iso (HomologicalComplex.ExactAt.isZero_homology h)
      integerResolution_homology_zero_iso.symm
  have hs : Subsingleton (ZMod 2) := (ModuleCat.isZero_of_iff_subsingleton).mp hz
  exact absurd (Subsingleton.elim (0 : ZMod 2) 1) (by decide)

theorem integerShiftResolution_exactAt_iff_ne (s n : ℤ) :
    (integerShiftResolution s).ExactAt n ↔ n ≠ s := by
  rw [integerShiftResolution_exactAt_iff]
  constructor
  · intro h hns
    subst hns
    rw [sub_self] at h
    exact integerResolution_not_exactAt_zero h
  · intro hns
    rcases lt_or_gt_of_ne (sub_ne_zero.mpr hns) with h | h
    · exact integerResolution_exactAt_negative _ h
    · exact integerResolution_exactAt_positive _ h

/-- Every real time lies before, after, or in exactly one half-open stage. -/
theorem real_time_cases (t : ℝ) :
    t < 0 ∨ 5 ≤ t ∨ ∃ i : Fin 5, (i.val : ℝ) ≤ t ∧ t < (i.val : ℝ) + 1 := by
  by_cases h0 : t < 0
  · exact Or.inl h0
  by_cases h5 : 5 ≤ t
  · exact Or.inr (Or.inl h5)
  right; right
  push Not at h0 h5
  by_cases h1 : t < 1
  · exact ⟨0, by simp; linarith, by simp; linarith⟩
  by_cases h2 : t < 2
  · exact ⟨1, by simp; linarith, by simp; linarith⟩
  by_cases h3 : t < 3
  · exact ⟨2, by simp; linarith, by norm_num; linarith⟩
  by_cases h4 : t < 4
  · exact ⟨3, by simp; linarith, by norm_num; linarith⟩
  exact ⟨4, by simp; linarith, by norm_num; linarith⟩

/-- `Hₙ(F(t))` vanishes unless `t` lies in the stage `[n, n+1)`. -/
theorem realDiagram_exactAt_of_not_mem (t : ℝ) (n : ℤ)
    (hn : ¬ ((n : ℝ) ≤ t ∧ t < (n : ℝ) + 1)) : (realDiagram.obj t).ExactAt n := by
  rcases real_time_cases t with h | h | ⟨i, hi1, hi2⟩
  · rw [realDiagram_obj_before t h]
    exact zeroComplex_exactAt n
  · rw [realDiagram_obj_after t h]
    exact zeroComplex_exactAt n
  · rw [realDiagram_obj_on_interval i t hi1 hi2, integerShiftResolution_exactAt_iff_ne]
    intro hni
    apply hn
    subst hni
    exact ⟨by exact_mod_cast hi1, by exact_mod_cast hi2⟩

/-- Every homology class of `F` dies after one unit of real time. -/
theorem realDiagram_homologyMap_zero_of_gap (n : ℤ) {t t' : ℝ} (h : t ≤ t')
    (hgap : 1 ≤ t' - t) :
    HomologicalComplex.homologyMap (realDiagram.map (homOfLE h)) n = 0 := by
  by_cases ht : (n : ℝ) ≤ t ∧ t < (n : ℝ) + 1
  · have ht' : ¬ ((n : ℝ) ≤ t' ∧ t' < (n : ℝ) + 1) := by
      rintro ⟨_, h2⟩
      linarith [ht.1]
    exact ((realDiagram_exactAt_of_not_mem t' n ht').isZero_homology).eq_of_tgt _ _
  · exact ((realDiagram_exactAt_of_not_mem t n ht).isZero_homology).eq_of_src _ _

/-- Inside the first stage the structure map of `F` is an isomorphism. -/
theorem realDiagram_map_first_stage_isIso {t : ℝ} (h0 : 0 ≤ t) (h1 : t < 1) :
    IsIso (realDiagram.map (homOfLE h0)) := by
  have ha : realStage 0 = 1 := by
    rw [realStage_on_interval (0 : Fin 5) 0 (by norm_num) (by norm_num)]
    rfl
  have hb : realStage t = 1 := by
    rw [realStage_on_interval (0 : Fin 5) t (by simpa using h0) (by simpa using h1)]
    rfl
  rw [realDiagram_map_eq_stage h0 (le_refl (1 : Fin 7)) ha hb,
    show (homOfLE (le_refl (1 : Fin 7))) = 𝟙 _ from Subsingleton.elim _ _,
    CategoryTheory.Functor.map_id, Category.id_comp]
  infer_instance

/-- The degree-zero class of the first stage survives every time shorter
than one unit. -/
theorem realDiagram_homologyMap_zero_ne {t : ℝ} (h0 : 0 ≤ t) (h1 : t < 1) :
    HomologicalComplex.homologyMap (realDiagram.map (homOfLE h0)) 0 ≠ 0 := by
  intro hz
  have := realDiagram_map_first_stage_isIso h0 h1
  set f := HomologicalComplex.homologyMap (realDiagram.map (homOfLE h0)) 0 with hf
  have e1 : f ≫ inv f = 𝟙 _ := IsIso.hom_inv_id f
  have e2 := congrArg (fun g => g ≫ inv f) hz
  simp only [zero_comp] at e2
  have hzero : IsZero ((realDiagram.obj 0).homology 0) := by
    rw [IsZero.iff_id_eq_zero, ← e1]
    exact e2
  have hex : (realDiagram.obj 0).ExactAt 0 :=
    (HomologicalComplex.exactAt_iff_isZero_homology _ _).2 hzero
  rw [realDiagram_obj_on_interval (0 : Fin 5) 0 (by norm_num) (by norm_num),
    integerShiftResolution_exactAt_iff_ne] at hex
  exact hex (by simp)

/-! ### The distance computation -/

theorem zeroDiagram_homologyPersistence_isZero (n : ℤ) (t : ℝ) :
    IsZero ((homologyPersistence zeroDiagram n).obj t) :=
  (ModuleCat.restrictScalars residueFieldToB).map_isZero
    (zeroComplex_exactAt n).isZero_homology

/-- In every degree, `1/2` is an admissible interleaving parameter with zero. -/
theorem homologyPersistence_interleaving_half (n : ℤ) :
    Nonempty (PersistenceInterleaving (homologyPersistence realDiagram n)
      (homologyPersistence zeroDiagram n) (1 / 2) (by norm_num)) := by
  rw [persistenceInterleaving_zero_iff _ _ (zeroDiagram_homologyPersistence_isZero n)]
  intro t
  rw [homologyPersistence_map_eq_zero_iff]
  exact realDiagram_homologyMap_zero_of_gap n _ (by linarith)

/-- In degree zero no parameter below `1/2` is admissible. -/
theorem homologyPersistence_zero_interleaving_ge (ε : ℝ) (hε : 0 ≤ ε)
    (I : PersistenceInterleaving (homologyPersistence realDiagram 0)
      (homologyPersistence zeroDiagram 0) ε hε) : 1 / 2 ≤ ε := by
  by_contra hlt
  have hvan := (persistenceInterleaving_zero_iff _ _
    (zeroDiagram_homologyPersistence_isZero 0) ε hε).1 ⟨I⟩ 0
  rw [homologyPersistence_map_eq_zero_iff] at hvan
  exact realDiagram_homologyMap_zero_ne (t := 0 + ε + ε) (by linarith) (by linarith) hvan

/-- **`dCohI(F, 0) = 1/2`.** -/
theorem homologyInterleavingDistance_realDiagram_zero :
    homologyInterleavingDistance realDiagram zeroDiagram = ENNReal.ofReal (1 / 2) := by
  apply le_antisymm
  · apply iSup_le
    intro n
    exact iInf₂_le (1 / 2) ⟨by norm_num, homologyPersistence_interleaving_half n⟩
  · apply le_iSup_of_le (0 : ℤ)
    exact le_iInf₂ fun ε ⟨hε, ⟨I⟩⟩ =>
      ENNReal.ofReal_le_ofReal (homologyPersistence_zero_interleaving_ge ε hε I)

#print axioms homologyInterleavingDistance_realDiagram_zero

end C4
