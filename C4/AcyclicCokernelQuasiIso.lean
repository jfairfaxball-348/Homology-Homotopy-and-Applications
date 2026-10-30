module
public import C4.RealShoelaceCokernel
public import Mathlib.Algebra.Homology.HomologySequence

@[expose] public section

/-!
# S172: acyclic monomorphism quotient bridge

The homology long exact sequence turns the cokernel projection of a
monomorphism of unbounded C4 chain complexes with acyclic source into
a genuine quasi-isomorphism. This is NOT yet the construction of a
projectively-cofibrant whole-real shoelace replacement.
-/

namespace C4
open CategoryTheory CategoryTheory.Limits

/-- The actual short exact sequence of complexes associated to a
monomorphism, not just a degreewise sequence of underlying modules. -/
noncomputable def monoCokernelSequence
    {K L : C4Complex} (f : K ⟶ L) : ShortComplex C4Complex :=
  ShortComplex.mk f (cokernel.π f) (cokernel.condition f)

/-- A monomorphism presents its actual cokernel as a short exact sequence
in the abelian category of unbounded B-linear chain complexes. -/
theorem monoCokernelSequence_shortExact
    {K L : C4Complex} (f : K ⟶ L) [Mono f] :
    (monoCokernelSequence f).ShortExact := by
  apply ShortComplex.ShortExact.mk'
  · exact ShortComplex.exact_of_g_is_cokernel
      (monoCokernelSequence f) (cokernelIsCokernel f)
  · change Mono f
    infer_instance
  · change Epi (cokernel.π f)
    infer_instance

/-- The projection from a complex to the cokernel of an acyclic
subcomplex is a quasi-isomorphism in EVERY integer homological degree.
The mono hypothesis cannot be dropped. -/
theorem quasiIso_cokernel_of_acyclic_mono
    {K L : C4Complex} (f : K ⟶ L) [Mono f]
    (hK : K.Acyclic) : QuasiIso (cokernel.π f) := by
  let S := monoCokernelSequence f
  have hS : S.ShortExact := monoCokernelSequence_shortExact f
  refine (quasiIso_iff (cokernel.π f)).2 ?_
  intro i
  apply (quasiIsoAt_iff_isIso_homologyMap (cokernel.π f) i).2
  have hi : IsZero (K.homology i) := (hK i).isZero_homology
  have hfzero : HomologicalComplex.homologyMap S.f i = 0 := by
    exact hi.eq_of_src _ _
  have hm : Mono (HomologicalComplex.homologyMap (cokernel.π f) i) := by
    change Mono (HomologicalComplex.homologyMap S.g i)
    exact (hS.homology_exact₂ i).mono_g hfzero
  have hrel : (ComplexShape.down ℤ).Rel i (i - 1) := by
    rw [ComplexShape.down_Rel]
    omega
  have hprev : IsZero (K.homology (i - 1)) :=
    (hK (i - 1)).isZero_homology
  have hdelta : hS.δ i (i - 1) hrel = 0 := by
    exact hprev.eq_of_tgt _ _
  have he : Epi (HomologicalComplex.homologyMap (cokernel.π f) i) := by
    change Epi (HomologicalComplex.homologyMap S.g i)
    exact (hS.homology_exact₃ i (i - 1) hrel).epi_f hdelta
  letI := hm
  letI := he
  exact isIso_of_mono_of_epi _

end C4
