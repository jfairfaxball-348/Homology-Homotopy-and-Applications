module
public import C4.DirectTransfer
public import Mathlib.Algebra.Category.ModuleCat.LeftResolution
public import Mathlib.Algebra.Homology.LeftResolution.Reduced

@[expose] public noncomputable section

/-! # A functorial projective resolution which preserves strict zero composites

The unreduced free-module resolution does not preserve zero morphisms.
Mathlib's reduced left resolution removes that obstruction. These are
actual projective resolutions of coefficient modules, not yet a total
replacement of an arbitrary unbounded complex or real diagram.
-/
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true
namespace C4
open CategoryTheory CategoryTheory.Limits CategoryTheory.Abelian

/-- A retract of a projective module is projective. -/
theorem projective_module_retract {X Y : ModuleCat B} [Projective X]
    (i : Y ⟶ X) (e : X ⟶ Y) (h : i ≫ e = 𝟙 Y) : Projective Y where
  factors f p _ := ⟨i ≫ Projective.factorThru (e ≫ f) p, by
    simp only [Category.assoc, Projective.factorThru_comp]
    rw [← Category.assoc, h, Category.id_comp]⟩

/-- Projective modules are closed under splitting idempotents, so Mathlib's
reduced-resolution construction applies inside their full subcategory. -/
instance projectiveModules_idempotentComplete :
    IsIdempotentComplete (isProjective (ModuleCat B)).FullSubcategory where
  idempotents_split X p hp := by
    haveI : Projective X.obj := X.property
    obtain ⟨Y, i, e, hi, he⟩ := IsIdempotentComplete.idempotents_split X.obj p.hom
      (by simpa using congrArg (fun f : X ⟶ X => f.hom) hp)
    refine ⟨⟨Y, projective_module_retract i e hi⟩,
      ObjectProperty.homMk i, ObjectProperty.homMk e, ?_, ?_⟩
    · apply ObjectProperty.hom_ext
      exact hi
    · apply ObjectProperty.hom_ext
      exact he

/-- The existing library resolution, reduced to preserve zero morphisms. -/
def reducedProjectiveResolution :
    LeftResolution (ObjectProperty.ι (isProjective (ModuleCat B))) :=
  (ModuleCat.projectiveResolution B).reduced

instance reducedProjectiveResolution_preservesZero :
    reducedProjectiveResolution.F.PreservesZeroMorphisms := by
  dsimp [reducedProjectiveResolution]
  infer_instance

instance reducedProjectiveChain_preservesZero :
    reducedProjectiveResolution.chainComplexFunctor.PreservesZeroMorphisms where
  map_zero X Y := LeftResolution.chainComplexMap_zero reducedProjectiveResolution X Y

/-- A genuine zero-preserving functor to complexes of projective B-modules. -/
def reducedProjectiveFunctor : ModuleCat B ⥤ ChainComplex (ModuleCat B) ℕ :=
  reducedProjectiveResolution.chainComplexFunctor ⋙
    (ObjectProperty.ι (isProjective (ModuleCat B))).mapHomologicalComplex (.down ℕ)

instance reducedProjectiveFunctor_preservesZero :
    reducedProjectiveFunctor.PreservesZeroMorphisms := by
  dsimp [reducedProjectiveFunctor]
  infer_instance

theorem reducedProjectiveFunctor_projective (M : ModuleCat B) (n : ℕ) :
    Projective ((reducedProjectiveFunctor.obj M).X n) :=
  ((reducedProjectiveResolution.chainComplex M).X n).property

/-- The strict consecutive-zero relation survives functorial resolution. -/
theorem reducedProjectiveFunctor_squareZero {M N K : ModuleCat B}
    (f : M ⟶ N) (g : N ⟶ K) (h : f ≫ g = 0) :
    reducedProjectiveFunctor.map f ≫ reducedProjectiveFunctor.map g = 0 := by
  rw [← Functor.map_comp, h, Functor.map_zero]

theorem reducedProjectiveFunctor_exact (M : ModuleCat B) (n : ℕ) :
    (reducedProjectiveFunctor.obj M).ExactAt (n+1) :=
  reducedProjectiveResolution.exactAt_map_chainComplex_succ M n

#print axioms reducedProjectiveFunctor_squareZero
#print axioms reducedProjectiveFunctor_exact
end C4
