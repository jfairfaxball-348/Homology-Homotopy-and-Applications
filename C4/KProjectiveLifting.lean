module
public import C4.DirectTransfer
public import Mathlib.Algebra.Homology.HomotopyCategory.HomComplexCohomology
public import Mathlib.Algebra.Homology.HomotopyCategory.ShiftSequence
public import Mathlib.CategoryTheory.Triangulated.Orthogonal

@[expose] public section

/-!
# Lifting HomComplex cocycles out of K-projective complexes

For a K-projective source `P` and an ARBITRARY quasi-isomorphism `u : X ⟶ Y`,
postcomposition with `u` is bijective on homotopy classes `P ⟶ X⟦n⟧`.
Nothing is assumed about `X` or `Y`: no K-projectivity, cofibrancy or
homotopy inverse of the target. The proof uses only Mathlib's identification
of quasi-isomorphisms with the acyclic-cone morphisms of the homotopy
category and the colocality of its left orthogonal.

The cochain-level consequences below are the lifting operations used by the
weak-data transfer of the fourfold obstruction:

* `kProjective_cocycle_injective` / `kProjective_cocycle_surjective`;
* `kProjective_relative_lift`: an original-side cocycle whose image is a
  boundary lifts to an original filler TOGETHER with the next comparison
  correction;
* `kProjective_acyclic_coboundary`: every cocycle into an acyclic complex is
  a coboundary (all degrees).
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex CochainComplex.HomComplex

/-- The quotient functor to the homotopy category of `B`-module cochain complexes. -/
noncomputable abbrev homotopyQuotient :
    CochainComplex (ModuleCat B) ℤ ⥤ HomotopyCategory (ModuleCat B) (ComplexShape.up ℤ) :=
  HomotopyCategory.quotient (ModuleCat B) (ComplexShape.up ℤ)

/-- Postcomposition with an arbitrary quasi-isomorphism is a bijection on
homotopy classes out of a K-projective complex. -/
theorem kProjective_postcomp_bijective {P X Y : CochainComplex (ModuleCat B) ℤ}
    [P.IsKProjective] (u : X ⟶ Y) [QuasiIso u] :
    Function.Bijective (fun f : homotopyQuotient.obj P ⟶ homotopyQuotient.obj X =>
      f ≫ homotopyQuotient.map u) := by
  have hP : (HomotopyCategory.subcategoryAcyclic (ModuleCat B)).trW.isColocal
      (homotopyQuotient.obj P) := by
    rw [ObjectProperty.isColocal_trW]
    exact CochainComplex.IsKProjective.leftOrthogonal P
  apply hP
  rw [← HomotopyCategory.quasiIso_eq_trW_subcategoryAcyclic,
    HomotopyCategory.quotient_map_mem_quasiIso_iff]
  exact (HomologicalComplex.mem_quasiIso_iff u).2 inferInstance

/-- Injectivity on HomComplex cohomology: if `z ≫ u` is a coboundary, so is `z`. -/
theorem kProjective_cocycle_injective {P X Y : CochainComplex (ModuleCat B) ℤ}
    [P.IsKProjective] (u : X ⟶ Y) [QuasiIso u] {n : ℤ} (z : Cocycle P X n)
    (hz : z.postcomp u ∈ coboundaries P Y n) : z ∈ coboundaries P X n := by
  rw [← CohomologyClass.toHom_mk_eq_zero_iff] at hz ⊢
  rw [CohomologyClass.toHom_mk, Cocycle.equivHomShift_symm_postcomp,
    Functor.map_comp] at hz
  rw [CohomologyClass.toHom_mk]
  apply (kProjective_postcomp_bijective (P := P) (u⟦n⟧')).1
  change homotopyQuotient.map (Cocycle.equivHomShift.symm z) ≫
      homotopyQuotient.map (u⟦n⟧') = 0 ≫ homotopyQuotient.map (u⟦n⟧')
  rw [hz, zero_comp]

/-- Surjectivity on HomComplex cohomology: every cocycle into `Y` is
cohomologous to the image of a cocycle into `X`. -/
theorem kProjective_cocycle_surjective {P X Y : CochainComplex (ModuleCat B) ℤ}
    [P.IsKProjective] (u : X ⟶ Y) [QuasiIso u] {n : ℤ} (c : Cocycle P Y n) :
    ∃ c' : Cocycle P X n, c - c'.postcomp u ∈ coboundaries P Y n := by
  obtain ⟨f, hf⟩ := (kProjective_postcomp_bijective (P := P) (u⟦n⟧')).2
    (CohomologyClass.toHom (CohomologyClass.mk c))
  refine ⟨Cocycle.equivHomShift f.out, ?_⟩
  rw [← CohomologyClass.toHom_mk_eq_zero_iff, CohomologyClass.mk_sub, map_sub,
    sub_eq_zero, CohomologyClass.toHom_mk (Cocycle.postcomp _ u),
    Cocycle.equivHomShift_symm_postcomp, AddEquiv.symm_apply_apply,
    Functor.map_comp, HomotopyCategory.quotient_map_out]
  exact hf.symm

/-- The relative lifting step. An original-side cocycle `z` whose image is the
boundary of a replacement-side cochain `μ` is itself a boundary `δ H`, and `H`
may be chosen so that `μ` and `H ≫ u` differ by a boundary `δ ν`. -/
theorem kProjective_relative_lift {P X Y : CochainComplex (ModuleCat B) ℤ}
    [P.IsKProjective] (u : X ⟶ Y) [QuasiIso u] (n m l : ℤ)
    (hm : n + 1 = m) (hl : l + 1 = n) (k : ℤ) (hk : m + 1 = k)
    (z : Cochain P X m) (hz : δ m k z = 0)
    (μ : Cochain P Y n) (hμ : δ n m μ = z.comp (Cochain.ofHom u) (add_zero m)) :
    ∃ (H : Cochain P X n) (ν : Cochain P Y l),
      δ n m H = z ∧ μ = H.comp (Cochain.ofHom u) (add_zero n) + δ l n ν := by
  let zc : Cocycle P X m := Cocycle.mk z k hk hz
  have h1 : zc.postcomp u ∈ coboundaries P Y m :=
    (mem_coboundaries_iff _ n hm).2 ⟨μ, hμ⟩
  obtain ⟨H₀, hH₀⟩ := (mem_coboundaries_iff zc n hm).1
    (kProjective_cocycle_injective u zc h1)
  have hH₀' : δ n m H₀ = z := hH₀
  have hc : δ n m (μ - H₀.comp (Cochain.ofHom u) (add_zero n)) = 0 := by
    rw [δ_sub, hμ, δ_comp_ofHom, hH₀', sub_self]
  let cc : Cocycle P Y n := Cocycle.mk _ m hm hc
  obtain ⟨c', hc'⟩ := kProjective_cocycle_surjective u cc
  obtain ⟨ν, hν⟩ := (mem_coboundaries_iff _ l hl).1 hc'
  have hν' : δ l n ν = (μ - H₀.comp (Cochain.ofHom u) (add_zero n)) -
      c'.1.comp (Cochain.ofHom u) (add_zero n) := hν
  refine ⟨H₀ + c'.1, ν, ?_, ?_⟩
  · rw [δ_add, hH₀', Cocycle.δ_eq_zero, add_zero]
  · rw [hν', Cochain.add_comp]
    abel

/-- Every cocycle, of any degree, from a K-projective complex into an
acyclic complex is a coboundary. -/
theorem kProjective_acyclic_coboundary {P Z : CochainComplex (ModuleCat B) ℤ}
    [P.IsKProjective] (hZ : Z.Acyclic) (n m : ℤ) (hm : m + 1 = n) (k : ℤ) (hk : n + 1 = k)
    (z : Cochain P Z n) (hz : δ n k z = 0) :
    ∃ β : Cochain P Z m, δ m n β = z := by
  let zc : Cocycle P Z n := Cocycle.mk z k hk hz
  have hZq : HomotopyCategory.subcategoryAcyclic (ModuleCat B) (homotopyQuotient.obj Z) :=
    (HomotopyCategory.quotient_obj_mem_subcategoryAcyclic_iff_acyclic Z).2 hZ
  have hZs : HomotopyCategory.subcategoryAcyclic (ModuleCat B)
      (homotopyQuotient.obj (Z⟦n⟧)) :=
    ObjectProperty.prop_of_iso _ ((homotopyQuotient.commShiftIso n).symm.app Z)
      ((HomotopyCategory.subcategoryAcyclic (ModuleCat B)).le_shift n _ hZq)
  have hzero : CohomologyClass.toHom (CohomologyClass.mk zc) = 0 :=
    CochainComplex.IsKProjective.leftOrthogonal P _ hZs
  rw [CohomologyClass.toHom_mk_eq_zero_iff] at hzero
  exact (mem_coboundaries_iff zc m hm).1 hzero

/-! ### Reversal preserves exactness and quasi-isomorphisms -/

theorem reverseComplex_exactAt_iff (P : C4Complex) (i : ℤ) :
    (reverseComplex P).ExactAt i ↔ P.ExactAt (-i) := by
  rw [HomologicalComplex.exactAt_iff' (reverseComplex P) (i - 1) i (i + 1)
      (by simp) (by simp),
    HomologicalComplex.exactAt_iff' P (-(i - 1)) (-i) (-(i + 1))
      (by simp; omega) (by simp; omega)]
  rfl

theorem reverseComplex_acyclic {P : C4Complex} (hP : P.Acyclic) :
    (reverseComplex P).Acyclic :=
  fun i => (reverseComplex_exactAt_iff P i).2 (hP (-i))

theorem quasiIsoAt_reverseMap_iff {P Q : C4Complex} (f : P ⟶ Q) (i : ℤ) :
    QuasiIsoAt (reverseMap f) i ↔ QuasiIsoAt f (-i) := by
  rw [quasiIsoAt_iff' (reverseMap f) (i - 1) i (i + 1) (by simp) (by simp),
    quasiIsoAt_iff' f (-(i - 1)) (-i) (-(i + 1)) (by simp; omega) (by simp; omega)]
  rfl

instance quasiIso_reverseMap {P Q : C4Complex} (f : P ⟶ Q) [QuasiIso f] :
    QuasiIso (reverseMap f) := by
  rw [quasiIso_iff]
  intro i
  rw [quasiIsoAt_reverseMap_iff]
  infer_instance

#print axioms kProjective_postcomp_bijective
#print axioms kProjective_relative_lift
#print axioms kProjective_acyclic_coboundary
#print axioms quasiIso_reverseMap

end C4
