module
public import C4.ReducedProjectiveResolution
public import Mathlib.Algebra.Homology.SingleHomology
public import Mathlib.CategoryTheory.Preadditive.Projective.Resolution

@[expose] public noncomputable section

/-! # Natural quasi-isomorphic augmentation of the reduced coefficient resolution -/
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true
namespace C4
open CategoryTheory CategoryTheory.Limits CategoryTheory.Abelian

/-- Package the actual coefficient augmentation as an actual chain map. -/
def reducedProjectiveAugmentationMap (M : ModuleCat B) :
    reducedProjectiveFunctor.obj M ⟶ (ChainComplex.single₀ (ModuleCat B)).obj M :=
  (ChainComplex.toSingle₀Equiv _ _).symm
    ⟨reducedProjectiveAugmentation M, reducedProjectiveAugmentation_d M⟩

@[simp] theorem reducedProjectiveAugmentationMap_zero (M : ModuleCat B) :
    (reducedProjectiveAugmentationMap M).f 0 = reducedProjectiveAugmentation M :=
  ChainComplex.toSingle₀Equiv_symm_apply_f_zero _ _

/-- Exactness at the augmentation is inherited from the epimorphism onto its kernel. -/
theorem reducedProjectiveAugmentation_exact (M : ModuleCat B) :
    (ShortComplex.mk ((reducedProjectiveFunctor.obj M).d 1 0)
      (reducedProjectiveAugmentation M) (reducedProjectiveAugmentation_d M)).Exact := by
  let Λ := reducedProjectiveResolution
  let I := ObjectProperty.ι (isProjective (ModuleCat B))
  let S := ShortComplex.mk
    (Λ.π.app (kernel (Λ.π.app M)) ≫ kernel.ι (Λ.π.app M))
    (Λ.π.app M) (by simp)
  have hs : S.Exact := by
    let T := ShortComplex.mk (kernel.ι (Λ.π.app M)) (Λ.π.app M) (by simp)
    let φ : S ⟶ T := ShortComplex.homMk
      (Λ.π.app (kernel (Λ.π.app M))) (𝟙 _) (𝟙 _) (by simp [S, T]) (by simp [S, T])
    haveI : Epi φ.τ₁ := by dsimp [φ]; infer_instance
    haveI : IsIso φ.τ₂ := by dsimp [φ]; infer_instance
    haveI : Mono φ.τ₃ := by dsimp [φ]; infer_instance
    exact (ShortComplex.exact_iff_of_epi_of_isIso_of_mono φ).2
      (ShortComplex.exact_kernel (Λ.π.app M))
  let e : (ShortComplex.mk ((reducedProjectiveFunctor.obj M).d 1 0)
      (reducedProjectiveAugmentation M) (reducedProjectiveAugmentation_d M)) ≅ S :=
    ShortComplex.isoMk
      (I.mapIso (Λ.chainComplexXOneIso M))
      (I.mapIso (Λ.chainComplexXZeroIso M)) (Iso.refl M)
      (by
        change I.map (Λ.chainComplexXOneIso M).hom ≫ _ =
          I.map ((Λ.chainComplex M).d 1 0) ≫ I.map (Λ.chainComplexXZeroIso M).hom
        rw [LeftResolution.map_chainComplex_d_1_0]
        simp [S, Category.assoc])
      (by simp [S, reducedProjectiveAugmentation, Λ, I])
  exact ShortComplex.exact_of_iso e.symm hs

/-- The induced map on degree-zero homology is an isomorphism, not just an abstract H0 computation. -/
theorem reducedProjectiveAugmentationMap_quasiIsoAt_zero (M : ModuleCat B) :
    QuasiIsoAt (reducedProjectiveAugmentationMap M) 0 := by
  have hg1 : ((reducedProjectiveFunctor.obj M).sc' 1 0 0).g = 0 := by
    change (reducedProjectiveFunctor.obj M).d 0 0 = 0
    apply HomologicalComplex.shape
    decide
  have hf2 : (((ChainComplex.single₀ (ModuleCat B)).obj M).sc' 1 0 0).f = 0 := by
    simp [HomologicalComplex.sc']
  have hg2 : (((ChainComplex.single₀ (ModuleCat B)).obj M).sc' 1 0 0).g = 0 := by
    simp [HomologicalComplex.sc']
  apply (quasiIsoAt_iff' (reducedProjectiveAugmentationMap M) 1 0 0
    (by simp [ChainComplex.prev]) (by simp [ChainComplex.next])).2
  apply (ShortComplex.quasiIso_iff_of_zeros' _ hg1 hf2 hg2).2
  constructor
  · simpa only [HomologicalComplex.sc', HomologicalComplex.shortComplexFunctor',
      reducedProjectiveAugmentationMap_zero] using reducedProjectiveAugmentation_exact M
  · simpa only [HomologicalComplex.sc', HomologicalComplex.shortComplexFunctor',
      reducedProjectiveAugmentationMap_zero] using reducedProjectiveAugmentation_epi M

/-- The entire reduced coefficient resolution has the correct induced augmentation quasi-isomorphism. -/
instance reducedProjectiveAugmentationMap_quasiIso (M : ModuleCat B) :
    QuasiIso (reducedProjectiveAugmentationMap M) := by
  apply (quasiIso_iff _).2
  intro n
  cases n with
  | zero => exact reducedProjectiveAugmentationMap_quasiIsoAt_zero M
  | succ n =>
    apply (quasiIsoAt_iff_exactAt' _ (n+1) (ChainComplex.exactAt_succ_single_obj M n)).2
    exact reducedProjectiveFunctor_exact M n

/-- This is a genuine projective resolution, with functorial zero-preserving chain maps. -/
def reducedCoefficientProjectiveResolution (M : ModuleCat B) : ProjectiveResolution M where
  complex := reducedProjectiveFunctor.obj M
  projective := reducedProjectiveFunctor_projective M
  π := reducedProjectiveAugmentationMap M

/-- Naturality as chain maps, not only in degree zero. -/
def reducedProjectiveAugmentationNat :
    reducedProjectiveFunctor ⟶ ChainComplex.single₀ (ModuleCat B) where
  app := reducedProjectiveAugmentationMap
  naturality {M N} f := by
    apply HomologicalComplex.Hom.ext
    funext n
    cases n with
    | zero =>
      simpa only [HomologicalComplex.comp_f, reducedProjectiveAugmentationMap_zero,
        ChainComplex.single₀_map_f_zero] using reducedProjectiveAugmentation_naturality f
    | succ n =>
      exact (HomologicalComplex.isZero_single_obj_X _ _ _ _ (by simp)).eq_of_tgt _ _

#print axioms reducedProjectiveAugmentationMap_quasiIso
#print axioms reducedCoefficientProjectiveResolution
end C4
