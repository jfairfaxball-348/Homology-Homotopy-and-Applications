module
public import C4.DiagramHomotopyInvariance

@[expose] public section

/-!
# Reduction of the derived two-unit shift to the seven stages

The genuine diagram is `realDiagram = realStage ⋙ c4Stages`. For `t ≥ 0`, the
stage of `t + 2` is the two-stage advance of the stage of `t` (saturating at
the zero end); for `t < 0` the source `F(t)` is zero. Hence the whole-real
two-unit shift factors as the pullback of the stage-level shift
`stageTwoShift : c4Stages ⟶ advance ⋙ c4Stages`, followed by a natural
comparison `θ`. Any functor inverting objectwise quasi-isomorphisms of real
diagrams, precomposed with stage pullback, inverts objectwise
quasi-isomorphisms of stage diagrams. So the remaining C2 statement is
reduced to the finite seven-stage statement `StageTwoShiftVanishes`.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
noncomputable section

/-- The two-stage advance on the seven stages; stage `0` is the zero end. -/
def stageAdvance (k : Fin 7) : Fin 7 :=
  if k.val = 0 then 0 else ⟨min (k.val + 2) 6, by omega⟩

theorem stageAdvance_monotone : Monotone stageAdvance := by
  intro a b h
  have h' : a.val ≤ b.val := h
  unfold stageAdvance
  split_ifs with ha hb hb <;> simp only [Fin.le_def, Fin.val_zero] <;> omega

theorem le_stageAdvance (k : Fin 7) : k ≤ stageAdvance k := by
  unfold stageAdvance
  split_ifs with hk <;> simp only [Fin.le_def, Fin.val_zero] <;> omega

/-- The advance as a functor of the stage poset. -/
def stageAdvanceFunctor : Fin 7 ⥤ Fin 7 := stageAdvance_monotone.functor

/-- The stage-level two-step shift of `c4Stages`. -/
def stageTwoShift : c4Stages ⟶ stageAdvanceFunctor ⋙ c4Stages where
  app k := c4Stages.map (homOfLE (le_stageAdvance k))
  naturality a b f := by
    rw [Functor.comp_map, ← c4Stages.map_comp, ← c4Stages.map_comp]
    congr 1

/-- Pullback of stage diagrams along the real stage clock. -/
def stagePullback : (Fin 7 ⥤ C4Complex) ⥤ (ℝ ⥤ C4Complex) :=
  (Functor.whiskeringLeft ℝ (Fin 7) C4Complex).obj realStage_monotone.functor

theorem realStage_advance (t : ℝ) (ht : 0 ≤ t) :
    realStage ((t + 1) + 1) = stageAdvance (realStage t) := by
  rcases real_time_cases t with h | h | ⟨i, hi1, hi2⟩
  · exact absurd ht (not_le.mpr h)
  · rw [realStage_after t h, realStage_after _ (by linarith)]
    rfl
  · rw [realStage_on_interval i t hi1 hi2]
    fin_cases i
    · rw [realStage_on_interval (2 : Fin 5) _ (by simp at hi1 ⊢; linarith)
        (by norm_num at hi2 ⊢; linarith)]
      rfl
    · rw [realStage_on_interval (3 : Fin 5) _ (by norm_num at hi1 ⊢; linarith)
        (by norm_num at hi2 ⊢; linarith)]
      rfl
    · rw [realStage_on_interval (4 : Fin 5) _ (by norm_num at hi1 ⊢; linarith)
        (by norm_num at hi2 ⊢; linarith)]
      rfl
    · rw [realStage_after _ (by norm_num at hi1 ⊢; linarith)]
      rfl
    · rw [realStage_after _ (by norm_num at hi1 ⊢; linarith)]
      rfl

theorem realStage_neg (t : ℝ) (ht : t < 0) : realStage t = 0 := realStage_before t ht

theorem c4Stages_obj_zero_isZero : IsZero (c4Stages.obj 0) := HomologicalComplex.isZero_zero

/-- A stage map followed by a stage identification. -/
theorem c4Stages_map_eqToHom {a b b' : Fin 7} (h : a ≤ b) (h' : a ≤ b') (e : b = b') :
    c4Stages.map (homOfLE h) ≫ eqToHom (congrArg c4Stages.obj e) = c4Stages.map (homOfLE h') := by
  subst e
  simp

/-- Generic commutation of stage maps with stage identifications. -/
theorem c4Stages_square_eqToHom {A A' S S' : Fin 7} (g : A ⟶ A') (g' : S ⟶ S')
    (e : S = A) (e' : S' = A') :
    c4Stages.map g ≫ eqToHom (congrArg c4Stages.obj e'.symm) =
      eqToHom (congrArg c4Stages.obj e.symm) ≫ c4Stages.map g' := by
  subst e e'
  simp only [eqToHom_refl, Category.comp_id, Category.id_comp]
  congr 1
  exact Subsingleton.elim _ _

/-- The comparison component at a real time. -/
noncomputable def stageShiftComparisonApp (t : ℝ) :
    c4Stages.obj (stageAdvance (realStage t)) ⟶ c4Stages.obj (realStage ((t + 1) + 1)) :=
  if ht : 0 ≤ t then eqToHom (congrArg c4Stages.obj (realStage_advance t ht).symm) else 0

theorem stageShiftComparisonApp_pos (t : ℝ) (ht : 0 ≤ t) :
    stageShiftComparisonApp t = eqToHom (congrArg c4Stages.obj (realStage_advance t ht).symm) :=
  dif_pos ht

theorem stageAdvance_realStage_isZero (t : ℝ) (ht : t < 0) :
    IsZero (c4Stages.obj (stageAdvance (realStage t))) := by
  rw [realStage_neg t ht]
  exact c4Stages_obj_zero_isZero

/-- The comparison from the pulled-back stage shift target to `F(· + 2)`. -/
noncomputable def stageShiftComparison :
    stagePullback.obj (stageAdvanceFunctor ⋙ c4Stages) ⟶
      translateDiagram (translateDiagram realDiagram 1) 1 where
  app t := stageShiftComparisonApp t
  naturality t t' f := by
    by_cases ht : t < 0
    · exact (stageAdvance_realStage_isZero t ht).eq_of_src _ _
    · have ht0 : 0 ≤ t := not_lt.mp ht
      have ht' : 0 ≤ t' := le_trans ht0 (leOfHom f)
      have key := c4Stages_square_eqToHom
        (stageAdvanceFunctor.map (realStage_monotone.functor.map f))
        (realStage_monotone.functor.map ((realTranslation 1).map ((realTranslation 1).map f)))
        (realStage_advance t ht0) (realStage_advance t' ht')
      rw [← stageShiftComparisonApp_pos t' ht', ← stageShiftComparisonApp_pos t ht0] at key
      exact key

/-- The whole-real two-unit shift factors through the stage-level shift. -/
theorem twoShift_realDiagram_factor :
    twoShift realDiagram 1 (by norm_num) =
      stagePullback.map stageTwoShift ≫ stageShiftComparison := by
  apply NatTrans.ext
  funext t
  by_cases ht : t < 0
  · have hz : IsZero (realDiagram.obj t) := by
      rw [realDiagram_obj_before t ht]
      exact HomologicalComplex.isZero_zero
    exact hz.eq_of_src _ _
  · have ht0 : 0 ≤ t := not_lt.mp ht
    have key := c4Stages_square_eqToHom (homOfLE (le_stageAdvance (realStage t)))
      (realStage_monotone.functor.map (homOfLE (show t ≤ (t + 1) + 1 by linarith)))
      (rfl : realStage t = realStage t) (realStage_advance t ht0)
    rw [eqToHom_refl, Category.id_comp, ← stageShiftComparisonApp_pos t ht0] at key
    exact key.symm

/-- **Reduction.** If the stage-level two-shift and zero agree after
`stagePullback ⋙ L`, the whole-real localised two-shift vanishes. -/
theorem localized_twoShift_eq_zero_of_stage
    {D : Type*} [Category D] (L : (ℝ ⥤ C4Complex) ⥤ D)
    (hS : (stagePullback ⋙ L).map stageTwoShift = (stagePullback ⋙ L).map 0) :
    L.map (twoShift realDiagram 1 (by norm_num)) = L.map 0 := by
  rw [twoShift_realDiagram_factor, L.map_comp]
  change (stagePullback ⋙ L).map stageTwoShift ≫ _ = _
  rw [hS, Functor.comp_map, show stagePullback.map
      (0 : c4Stages ⟶ stageAdvanceFunctor ⋙ c4Stages) = 0 from
      NatTrans.ext (funext fun _ => rfl), ← L.map_comp, zero_comp]

/-- Stage pullback followed by a localisation inverts stagewise quasi-isomorphisms. -/
theorem stagePullback_comp_inverts {D : Type*} [Category D] (L : (ℝ ⥤ C4Complex) ⥤ D)
    [L.IsLocalization objectwiseQuasiIso] {X Y : Fin 7 ⥤ C4Complex} (w : X ⟶ Y)
    (hw : ∀ k, QuasiIso (w.app k)) : IsIso ((stagePullback ⋙ L).map w) :=
  Localization.inverts L objectwiseQuasiIso (stagePullback.map w) (fun t => hw (realStage t))

end

#print axioms localized_twoShift_eq_zero_of_stage

end C4
