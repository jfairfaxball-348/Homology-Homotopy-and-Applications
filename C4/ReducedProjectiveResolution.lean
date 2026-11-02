module
public import C4.DirectTransfer
public import Mathlib.Algebra.Category.ModuleCat.LeftResolution
public import Mathlib.Algebra.Homology.LeftResolution.Reduced
public import Mathlib.Algebra.Homology.TotalComplex

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

/-- Applying the reduced resolution to a nonnegative complex gives a genuine
bicomplex; zero preservation is what certifies its outer square-zero law. -/
def reducedProjectiveBicomplex (K : ChainComplex (ModuleCat B) ℕ) :
    HomologicalComplex₂ (ModuleCat B) (.down ℕ) (.down ℕ) :=
  (reducedProjectiveFunctor.mapHomologicalComplex (.down ℕ)).obj K

/-- Mathlib's total functor preserves zero maps, checked on every coproduct summand. -/
instance totalNat_preservesZero :
    (HomologicalComplex₂.totalFunctor (ModuleCat B) (.down ℕ) (.down ℕ) (.down ℕ)).PreservesZeroMorphisms where
  map_zero K L := by
    apply HomologicalComplex.Hom.ext
    intro n
    apply HomologicalComplex₂.total.hom_ext
    intro i j hij
    rw [HomologicalComplex₂.ιTotal_map]
    simp

/-- The functorial projective total complex. A natural augmentation and its
QuasiIso proof are still required before this can replace an input complex. -/
def projectiveTotalFunctor :
    ChainComplex (ModuleCat B) ℕ ⥤ ChainComplex (ModuleCat B) ℕ :=
  reducedProjectiveFunctor.mapHomologicalComplex (.down ℕ) ⋙
    HomologicalComplex₂.totalFunctor (ModuleCat B) (.down ℕ) (.down ℕ) (.down ℕ)

instance projectiveTotalFunctor_preservesZero :
    projectiveTotalFunctor.PreservesZeroMorphisms := by
  dsimp [projectiveTotalFunctor]
  infer_instance

theorem projectiveTotalFunctor_squareZero {K L M : ChainComplex (ModuleCat B) ℕ}
    (f : K ⟶ L) (g : L ⟶ M) (h : f ≫ g = 0) :
    projectiveTotalFunctor.map f ≫ projectiveTotalFunctor.map g = 0 := by
  rw [← Functor.map_comp, h, Functor.map_zero]

theorem projectiveTotalFunctor_projective (K : ChainComplex (ModuleCat B) ℕ) (n : ℕ) :
    Projective ((projectiveTotalFunctor.obj K).X n) := by
  let T := {ij : ℕ × ℕ // ComplexShape.π (.down ℕ) (.down ℕ) (.down ℕ) ij = n}
  change Projective (∐ fun ij : T =>
    ((reducedProjectiveBicomplex K).X ij.val.1).X ij.val.2)
  haveI (ij : T) : Projective (((reducedProjectiveBicomplex K).X ij.val.1).X ij.val.2) :=
    reducedProjectiveFunctor_projective (K.X ij.val.1) ij.val.2
  infer_instance

/-- The projective total is K-projective in the integer cochain embedding. -/
theorem projectiveTotalFunctor_isKProjective (K : ChainComplex (ModuleCat B) ℕ) :
    CochainComplex.IsKProjective
      ((projectiveTotalFunctor.obj K).extend ComplexShape.embeddingDownNat) := by
  haveI (n : ℕ) : Projective ((projectiveTotalFunctor.obj K).X n) :=
    projectiveTotalFunctor_projective K n
  infer_instance

#print axioms reducedProjectiveFunctor_squareZero
#print axioms reducedProjectiveFunctor_exact
#print axioms projectiveTotalFunctor_squareZero
#print axioms projectiveTotalFunctor_isKProjective
end C4
