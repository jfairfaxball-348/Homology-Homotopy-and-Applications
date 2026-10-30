module
public import C4.AcyclicRealReplacement
public import Mathlib.Algebra.Homology.ShortComplex.ModuleCat

@[expose] public section

/-!
# S170: a genuinely nonzero acyclic whole-real replacement of zero

The exact zero lane is not the only representative in the strict
homotopy-interleaving problem. This file constructs an honest, nonzero
contractible chain complex with identity differentials in alternate
degrees, and takes its constant diagram at every real parameter.

This satisfies the genuine entire-diagram objectwise quasi-isomorphism
predicate from S169. It does not identify the resulting shoelace quotient
for arbitrary zigzags, or establish the 5/4 strict lower bound.
-/

namespace C4

open CategoryTheory CategoryTheory.Limits

private instance : Nontrivial B := by
  refine ⟨⟨0, 1, ?_⟩⟩
  decide

/-- A copy of the nonzero free rank-one B-module in every integer degree. -/
def acyclicIdentityObject (_ : ℤ) : ModuleCat B := ModuleCat.of B B

/-- A genuine all-integer differential, alternating identity and zero. -/
def acyclicIdentityDifferential (n : ℤ) :
    acyclicIdentityObject (n + 1) ⟶ acyclicIdentityObject n :=
  if n % 2 = 0 then 𝟙 _ else 0

theorem acyclicIdentityDifferential_square (n : ℤ) :
    acyclicIdentityDifferential (n + 1) ≫ acyclicIdentityDifferential n = 0 := by
  by_cases hn : n % 2 = 0
  · have hn1 : (n + 1) % 2 ≠ 0 := by omega
    simp only [acyclicIdentityDifferential, ite_eq_left hn, ite_eq_right hn1,
      Category.comp_id]
  · have hn1 : (n + 1) % 2 = 0 := by omega
    simp only [acyclicIdentityDifferential, ite_eq_right hn, ite_eq_left hn1,
      Category.id_comp]

/-- The two-sided unbounded alternating identity/zero complex. -/
def acyclicIdentityComplex : C4Complex :=
  ChainComplex.of acyclicIdentityObject acyclicIdentityDifferential
    acyclicIdentityDifferential_square

/-- The literal incoming arrow in the actual categorical short complex. -/
private theorem acyclicIdentity_sc_f (n : ℤ) :
    (acyclicIdentityComplex.sc' (n + 1) n (n - 1)).f =
      acyclicIdentityDifferential n := by
  change ChainComplex.of.d acyclicIdentityObject acyclicIdentityDifferential (n + 1) n = _
  simp [ChainComplex.of.d]

/-- The literal outgoing arrow in the actual categorical short complex. -/
private theorem acyclicIdentity_sc_g (n : ℤ) :
    (acyclicIdentityComplex.sc' (n + 1) n (n - 1)).g =
      acyclicIdentityDifferential (n - 1) := by
  change ChainComplex.of.d acyclicIdentityObject acyclicIdentityDifferential n (n - 1) = _
  simp only [ChainComplex.of.d,
    dite_eq_left (show n = (n - 1) + 1 by omega)]
  simp [acyclicIdentityObject]

/-- The complex is exact in every integer degree, including all negative
ones: at each degree exactly one incident differential is the identity. -/
theorem acyclicIdentityComplex_exactAt (n : ℤ) :
    acyclicIdentityComplex.ExactAt n := by
  apply (acyclicIdentityComplex.exactAt_iff'
    (i := n + 1) (j := n) (k := n - 1)
    (by simp [ChainComplex.prev])
    (by simp [ChainComplex.next])).2
  apply (ShortComplex.moduleCat_exact_iff _).2
  intro x hx
  rw [acyclicIdentity_sc_g] at hx
  by_cases hn : n % 2 = 0
  · refine ⟨x, ?_⟩
    rw [acyclicIdentity_sc_f]
    simpa only [acyclicIdentityDifferential, ite_eq_left hn,
      ModuleCat.hom_id, LinearMap.id_apply]
  · have hprev : (n - 1) % 2 = 0 := by omega
    have hx0 : x = 0 := by
      simpa only [acyclicIdentityDifferential, ite_eq_left hprev,
        ModuleCat.hom_id, LinearMap.id_apply] using hx
    refine ⟨0, ?_⟩
    rw [acyclicIdentity_sc_f]
    simp [acyclicIdentityDifferential, hn, hx0]

theorem acyclicIdentityComplex_acyclic : acyclicIdentityComplex.Acyclic :=
  acyclicIdentityComplex_exactAt

/-- This is not a disguised zero complex: its value in every degree is B. -/
theorem acyclicIdentityComplex_nonzero : ¬ IsZero acyclicIdentityComplex := by
  intro hz
  have ho : IsZero (ModuleCat.of B B) := by
    have h := (HomologicalComplex.eval (ModuleCat B)
      (ComplexShape.down ℤ) (0 : ℤ)).map_isZero hz
    exact h
  have hs : Subsingleton B := (ModuleCat.isZero_of_iff_subsingleton).mp ho
  exact (zero_ne_one : (0 : B) ≠ 1) (Subsingleton.elim _ _)

/-- A genuinely nonzero opposite lane over the whole real parameter line. -/
noncomputable def acyclicIdentityDiagram : ℝ ⥤ C4Complex :=
  (Functor.const ℝ).obj acyclicIdentityComplex

theorem acyclicIdentityDiagram_acyclic (u : ℝ) :
    (acyclicIdentityDiagram.obj u).Acyclic :=
  acyclicIdentityComplex_acyclic

theorem acyclicIdentityDiagram_nonzero (u : ℝ) :
    ¬ IsZero (acyclicIdentityDiagram.obj u) :=
  acyclicIdentityComplex_nonzero

/-- The canonical ENTIRE-REAL zero-to-nonzero-lane natural map is
objectwise a quasi-isomorphism, in every integer homological degree. -/
theorem zero_to_acyclicIdentityDiagram_objectwise_quasiIso :
    ∀ u : ℝ, QuasiIso ((0 : zeroDiagram ⟶ acyclicIdentityDiagram).app u) :=
  (zeroDiagram_to_objectwise_quasiIso_iff acyclicIdentityDiagram).2
    acyclicIdentityDiagram_acyclic

end C4
