module
public import C4.GroupAlgebra
public import C4.MainTheorem
public import Mathlib.CategoryTheory.Localization.Equivalence

public section

/-! Transport of the whole-real distances along the coefficient presentation. -/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits CategoryTheory.Functor
open scoped ENNReal

private def StrictRealInterleaving.postcompose {C D : Type*} [Category C] [Category D]
    {X Y : ℝ ⥤ C} {ε : ℝ} {hε : 0 ≤ ε}
    (I : StrictRealInterleaving X Y ε hε) (H : C ⥤ D) :
    StrictRealInterleaving (X ⋙ H) (Y ⋙ H) ε hε where
  forward := whiskerRight I.forward H
  backward := whiskerRight I.backward H
  forward_backward t := by
    change H.map (I.forward.app t) ≫ H.map (I.backward.app (t + ε)) = H.map (X.map _)
    rw [← H.map_comp, I.forward_backward]
  backward_forward t := by
    change H.map (I.backward.app t) ≫ H.map (I.forward.app (t + ε)) = H.map (Y.map _)
    rw [← H.map_comp, I.backward_forward]

section ChangeOfCoefficients

variable {R S : Type} [Ring R] [Ring S]
abbrev CoefficientDiagrams (A : Type) [Ring A] := ℝ ⥤ ChainComplex (ModuleCat A) ℤ

private theorem quasiIso_postcompose {H : ModuleCat R ⥤ ModuleCat S}
    [H.Additive] [H.PreservesHomology] [H.ReflectsIsomorphisms]
    {X Y : CoefficientDiagrams R} (f : X ⟶ Y) :
    objectwiseQuasiIsoOver S (whiskerRight f (H.mapHomologicalComplex (.down ℤ))) ↔
      objectwiseQuasiIsoOver R f :=
  forall_congr' fun t => HomologicalComplex.quasiIso_map_iff_of_preservesHomology (f.app t) H

private theorem weakZigzag_postcompose {H : ModuleCat R ⥤ ModuleCat S}
    [H.Additive] [H.PreservesHomology] [H.ReflectsIsomorphisms]
    {X Y : CoefficientDiagrams R} (h : WeakZigzag X Y) :
    WeakZigzag (X ⋙ H.mapHomologicalComplex (.down ℤ))
      (Y ⋙ H.mapHomologicalComplex (.down ℤ)) := by
  induction h with
  | rel A A' hs =>
    obtain ⟨f, hf⟩ := hs
    exact .rel _ _ ⟨whiskerRight f _, (quasiIso_postcompose f).2 hf⟩
  | refl A => exact .refl _
  | symm A A' _ ih => exact .symm _ _ ih
  | trans A A' A'' _ _ ih₁ ih₂ => exact .trans _ _ _ ih₁ ih₂

private theorem weakZigzag_of_iso {X Y : CoefficientDiagrams R} (e : X ≅ Y) :
    WeakZigzag X Y :=
  .rel _ _ ⟨e.hom, fun t => by infer_instance⟩

variable (E : ModuleCat R ≌ ModuleCat S)
  [E.functor.Additive] [E.inverse.Additive]

/-- Change coefficients degreewise, then at every real time. -/
def coefficientDiagramEquivalence : CoefficientDiagrams R ≌ CoefficientDiagrams S :=
  (E.mapHomologicalComplex (.down ℤ)).congrRight

private theorem homotopyDistance_postcompose (X Y : CoefficientDiagrams R) :
    homotopyInterleavingDistance ((coefficientDiagramEquivalence E).functor.obj X)
        ((coefficientDiagramEquivalence E).functor.obj Y) =
      homotopyInterleavingDistance X Y := by
  let e := coefficientDiagramEquivalence E
  have hparams : homotopyInterleavingParameters (e.functor.obj X) (e.functor.obj Y) =
      homotopyInterleavingParameters X Y := by
    ext ε
    constructor
    · rintro ⟨hε, X', Y', hx, hy, ⟨I⟩⟩
      exact ⟨hε, e.inverse.obj X', e.inverse.obj Y',
        .trans _ _ _ (weakZigzag_of_iso (e.unitIso.app X)) (weakZigzag_postcompose (H := E.inverse) hx),
        .trans _ _ _ (weakZigzag_of_iso (e.unitIso.app Y)) (weakZigzag_postcompose (H := E.inverse) hy),
        ⟨I.postcompose (E.inverse.mapHomologicalComplex (.down ℤ))⟩⟩
    · rintro ⟨hε, X', Y', hx, hy, ⟨I⟩⟩
      exact ⟨hε, e.functor.obj X', e.functor.obj Y',
        weakZigzag_postcompose (H := E.functor) hx, weakZigzag_postcompose (H := E.functor) hy,
        ⟨I.postcompose (E.functor.mapHomologicalComplex (.down ℤ))⟩⟩
  unfold homotopyInterleavingDistance
  rw [hparams]

section Derived

universe w' w
variable {D : Type w} [Category.{w'} D]
variable (L : CoefficientDiagrams S ⥤ D) [L.IsLocalization (objectwiseQuasiIsoOver S)]

private theorem localization_postcompose :
    ((coefficientDiagramEquivalence E).functor ⋙ L).IsLocalization (objectwiseQuasiIsoOver R) := by
  let e := coefficientDiagramEquivalence E
  refine Functor.IsLocalization.of_equivalence_source L (objectwiseQuasiIsoOver S)
    (e.functor ⋙ L) (objectwiseQuasiIsoOver R) e.symm ?_ ?_
    ((Functor.associator _ _ _).symm ≪≫ isoWhiskerRight e.counitIso L ≪≫ L.leftUnitor)
  · intro X Y f hf
    exact (objectwiseQuasiIsoOver R).le_isoClosure _
      ((quasiIso_postcompose (H := E.inverse) f).2 hf)
  · intro X Y f hf
    exact Localization.inverts L (objectwiseQuasiIsoOver S) _
      ((quasiIso_postcompose (H := E.functor) f).2 hf)

variable [((coefficientDiagramEquivalence E).functor ⋙ L).IsLocalization (objectwiseQuasiIsoOver R)]

omit [E.inverse.Additive] in
private theorem derivedTranslateMap_postcompose (ε : ℝ) {X Y : CoefficientDiagrams R}
    (f : L.obj ((coefficientDiagramEquivalence E).functor.obj X) ⟶
      L.obj ((coefficientDiagramEquivalence E).functor.obj Y)) :
    derivedTranslateMap ((coefficientDiagramEquivalence E).functor ⋙ L) ε f =
      derivedTranslateMap L ε f := by
  let M := (coefficientDiagramEquivalence E).functor
  let T := derivedTranslate (M ⋙ L) ε
  let U := derivedTranslate L ε
  let i : (M ⋙ L) ⋙ T ≅ translateFunctor ε ⋙ (M ⋙ L) :=
    derivedTranslateIso (M ⋙ L) ε
  let j : (M ⋙ L) ⋙ U ≅ translateFunctor ε ⋙ (M ⋙ L) :=
    isoWhiskerLeft M (derivedTranslateIso L ε)
  let W := Localization.fullyFaithfulWhiskeringLeft (M ⋙ L) (objectwiseQuasiIsoOver R) D
  let c : T ≅ U := W.preimageIso (i ≪≫ j.symm)
  have hc (Z : CoefficientDiagrams R) : c.hom.app ((M ⋙ L).obj Z) =
      i.hom.app Z ≫ j.inv.app Z := by
    exact congr_app (W.map_preimage (i ≪≫ j.symm).hom) Z
  change i.inv.app X ≫ T.map f ≫ i.hom.app Y = j.inv.app X ≫ U.map f ≫ j.hom.app Y
  have hn : T.map f ≫ c.hom.app ((M ⋙ L).obj Y) =
      c.hom.app ((M ⋙ L).obj X) ≫ U.map f := c.hom.naturality f
  apply (cancel_mono (j.inv.app Y)).mp
  calc
    (i.inv.app X ≫ T.map f ≫ i.hom.app Y) ≫ j.inv.app Y =
        i.inv.app X ≫ (T.map f ≫ c.hom.app ((M ⋙ L).obj Y)) := by
      rw [hc Y]
      simp only [Category.assoc]
    _ = i.inv.app X ≫ (c.hom.app ((M ⋙ L).obj X) ≫ U.map f) := by rw [hn]
    _ = (j.inv.app X ≫ U.map f ≫ j.hom.app Y) ≫ j.inv.app Y := by
      rw [hc X]
      simp only [Category.assoc, Iso.inv_hom_id_app_assoc, Iso.hom_inv_id_app]
      exact congrArg (fun g => j.inv.app X ≫ g) (Category.comp_id (U.map f)).symm

omit [E.inverse.Additive] in
private theorem derivedDistance_postcompose (X Y : CoefficientDiagrams R) :
    derivedInterleavingDistance L ((coefficientDiagramEquivalence E).functor.obj X)
        ((coefficientDiagramEquivalence E).functor.obj Y) =
      derivedInterleavingDistance ((coefficientDiagramEquivalence E).functor ⋙ L) X Y := by
  let M := (coefficientDiagramEquivalence E).functor
  have hparams : {ε : ℝ | ∃ hε : 0 ≤ ε,
      Nonempty (DerivedRealInterleaving L (M.obj X) (M.obj Y) ε hε)} =
      {ε : ℝ | ∃ hε : 0 ≤ ε,
      Nonempty (DerivedRealInterleaving (M ⋙ L) X Y ε hε)} := by
    ext ε
    constructor
    · rintro ⟨hε, ⟨I⟩⟩
      refine ⟨hε, ⟨⟨I.forward, I.backward, ?_, ?_⟩⟩⟩
      · change I.forward ≫ derivedTranslateMap (M ⋙ L) ε
          (X := Y) (Y := translateDiagram X ε) I.backward = L.map (twoShift (M.obj X) ε hε)
        rw [derivedTranslateMap_postcompose E L]
        exact I.forward_backward
      · change I.backward ≫ derivedTranslateMap (M ⋙ L) ε
          (X := X) (Y := translateDiagram Y ε) I.forward = L.map (twoShift (M.obj Y) ε hε)
        rw [derivedTranslateMap_postcompose E L]
        exact I.backward_forward
    · rintro ⟨hε, ⟨I⟩⟩
      refine ⟨hε, ⟨⟨I.forward, I.backward, ?_, ?_⟩⟩⟩
      · have h := I.forward_backward
        change I.forward ≫ derivedTranslateMap (M ⋙ L) ε
          (X := Y) (Y := translateDiagram X ε) I.backward = L.map (twoShift (M.obj X) ε hε) at h
        rw [derivedTranslateMap_postcompose E L] at h
        exact h
      · have h := I.backward_forward
        change I.backward ≫ derivedTranslateMap (M ⋙ L) ε
          (X := X) (Y := translateDiagram Y ε) I.forward = L.map (twoShift (M.obj Y) ε hε) at h
        rw [derivedTranslateMap_postcompose E L] at h
        exact h
  unfold derivedInterleavingDistance
  rw [hparams]

end Derived

end ChangeOfCoefficients

/-- Restriction of scalars along the inverse presentation, from B to 𝔽₂[C₄]. -/
noncomputable abbrev groupAlgebraModules : ModuleCat.{0} B ≌ ModuleCat.{0} GroupAlgebra :=
  ModuleCat.restrictScalarsEquivalenceOfRingEquiv groupAlgebraEquiv.symm

abbrev GroupAlgebraComplex := ChainComplex (ModuleCat.{0} GroupAlgebra) ℤ

/-- The genuine five-stage diagram with its coefficients in 𝔽₂[C₄]. -/
noncomputable def groupAlgebraDiagram : ℝ ⥤ GroupAlgebraComplex :=
  (coefficientDiagramEquivalence groupAlgebraModules).functor.obj realDiagram

/-- The image of the zero diagram under the coefficient equivalence. -/
noncomputable def groupAlgebraZeroDiagram : ℝ ⥤ GroupAlgebraComplex :=
  (coefficientDiagramEquivalence groupAlgebraModules).functor.obj zeroDiagram

theorem groupAlgebraZeroDiagram_isZero (u : ℝ) : IsZero (groupAlgebraZeroDiagram.obj u) :=
  (groupAlgebraModules.mapHomologicalComplex (.down ℤ)).functor.map_isZero
    HomologicalComplex.isZero_zero

/-- The canonical scalar inclusion into the group algebra. -/
noncomputable def groupAlgebraScalar : ZMod 2 →+* GroupAlgebra :=
  algebraMap (ZMod 2) GroupAlgebra

private theorem groupAlgebraScalar_compat :
    residueFieldToB = groupAlgebraEquiv.symm.toRingHom.comp groupAlgebraScalar := by
  ext a
  change residueFieldToB a = groupAlgebraEquiv.symm (groupAlgebraScalar a)
  fin_cases a
  · change residueFieldToB 0 = groupAlgebraEquiv.symm (groupAlgebraScalar 0)
    simp only [map_zero]
  · change residueFieldToB 1 = groupAlgebraEquiv.symm (groupAlgebraScalar 1)
    simp only [map_one]

private noncomputable def homologyPersistenceGroupAlgebraIso (X : ℝ ⥤ C4Complex) (n : ℤ) :
    homologyPersistenceOver groupAlgebraScalar
      ((coefficientDiagramEquivalence groupAlgebraModules).functor.obj X) n ≅
      homologyPersistence X n := by
  let H := groupAlgebraModules.functor
  let i : H.mapHomologicalComplex (.down ℤ) ⋙
      HomologicalComplex.homologyFunctor (ModuleCat GroupAlgebra) (.down ℤ) n ≅
      HomologicalComplex.homologyFunctor (ModuleCat B) (.down ℤ) n ⋙ H :=
    isoWhiskerLeft (HomologicalComplex.shortComplexFunctor (ModuleCat B) (.down ℤ) n)
      (ShortComplex.homologyFunctorIso H)
  let j : ModuleCat.restrictScalars residueFieldToB ≅
      H ⋙ ModuleCat.restrictScalars groupAlgebraScalar :=
    ModuleCat.restrictScalarsComp' _ _ _ groupAlgebraScalar_compat
  exact isoWhiskerLeft X (isoWhiskerRight i (ModuleCat.restrictScalars groupAlgebraScalar) ≪≫
    isoWhiskerLeft (HomologicalComplex.homologyFunctor (ModuleCat B) (.down ℤ) n) j.symm)

private theorem persistenceInterleavingDistance_zero_iso {C : Type*} [Category C]
    [HasZeroMorphisms C] {M M' N N' : ℝ ⥤ C} (e : M ≅ M') (eN : N ≅ N')
    (hN' : ∀ t, IsZero (N'.obj t)) :
    persistenceInterleavingDistance M N = persistenceInterleavingDistance M' N' := by
  have hN t := IsZero.of_iso (hN' t) (eN.app t)
  have hparam : {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (PersistenceInterleaving M N ε hε)} =
      {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (PersistenceInterleaving M' N' ε hε)} := by
    ext ε
    refine exists_congr fun hε => ?_
    rw [persistenceInterleaving_zero_iff _ _ hN, persistenceInterleaving_zero_iff _ _ hN']
    exact forall_congr' fun t => by
      have hn := e.hom.naturality (homOfLE (show t ≤ (t + ε) + ε by linarith))
      constructor
      · intro h
        rw [h, zero_comp] at hn
        apply (cancel_epi (e.hom.app t)).mp
        simpa only [comp_zero] using hn.symm
      · intro h
        rw [h, comp_zero] at hn
        apply (cancel_mono (e.hom.app ((t + ε) + ε))).mp
        simpa only [zero_comp] using hn
  unfold persistenceInterleavingDistance
  rw [hparam]

/-- The homology distances use the canonical 𝔽₂-scalar structures on both sides. -/
theorem groupAlgebraHomologyDistance :
    homologyInterleavingDistanceOver groupAlgebraScalar groupAlgebraDiagram groupAlgebraZeroDiagram =
      homologyInterleavingDistance realDiagram zeroDiagram := by
  unfold homologyInterleavingDistance homologyInterleavingDistanceOver
  refine iSup_congr fun n => ?_
  exact persistenceInterleavingDistance_zero_iso
    (homologyPersistenceGroupAlgebraIso realDiagram n)
    (homologyPersistenceGroupAlgebraIso zeroDiagram n)
    (zeroDiagram_homologyPersistence_isZero n)

universe w' w

/-- The frozen distance separation over the literal group algebra 𝔽₂[C₄], in
every localisation of whole real diagrams at objectwise quasi-isomorphisms. -/
theorem c4_distance_separation_groupAlgebra {D : Type w} [Category.{w'} D]
    (L : (ℝ ⥤ GroupAlgebraComplex) ⥤ D) [L.IsLocalization (objectwiseQuasiIsoOver GroupAlgebra)] :
    homologyInterleavingDistanceOver groupAlgebraScalar groupAlgebraDiagram groupAlgebraZeroDiagram =
      ENNReal.ofReal (1 / 2) ∧
    derivedInterleavingDistance L groupAlgebraDiagram groupAlgebraZeroDiagram = ENNReal.ofReal 1 ∧
    ENNReal.ofReal (5 / 4) ≤ homotopyInterleavingDistance groupAlgebraDiagram groupAlgebraZeroDiagram ∧
    homotopyInterleavingDistance groupAlgebraDiagram groupAlgebraZeroDiagram ≤ ENNReal.ofReal (5 / 2) ∧
    homologyInterleavingDistanceOver groupAlgebraScalar groupAlgebraDiagram groupAlgebraZeroDiagram <
      derivedInterleavingDistance L groupAlgebraDiagram groupAlgebraZeroDiagram ∧
    derivedInterleavingDistance L groupAlgebraDiagram groupAlgebraZeroDiagram < ENNReal.ofReal (5 / 4) := by
  let _ := localization_postcompose groupAlgebraModules L
  have hD := derivedDistance_postcompose groupAlgebraModules L realDiagram zeroDiagram
  have hH := homotopyDistance_postcompose groupAlgebraModules realDiagram zeroDiagram
  change derivedInterleavingDistance L groupAlgebraDiagram groupAlgebraZeroDiagram = _ at hD
  change homotopyInterleavingDistance groupAlgebraDiagram groupAlgebraZeroDiagram = _ at hH
  rw [groupAlgebraHomologyDistance, hD, hH]
  exact c4_distance_separation ((coefficientDiagramEquivalence groupAlgebraModules).functor ⋙ L)

#print axioms c4_distance_separation_groupAlgebra

end C4
