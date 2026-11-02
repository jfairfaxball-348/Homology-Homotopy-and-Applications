module
public import C4.CochainDefiningSystem

@[expose] public section

/-! # The direct square-zero words as one actual defining system and filler -/
set_option backward.isDefEq.respectTransparency false
set_option backward.defeqAttrib.useBackward true
namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex.HomComplex

/-- Component normal form for the one-cut word, without dependent zero shifts. -/
theorem directPrimary_v
    {P0 P2 Q0 Q1 Q2 : CochainComplex (ModuleCat B) ℤ}
    (u : P0 ⟶ Q0) (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (v : Q2 ⟶ P2)
    {r1 : Q1 ⟶ Q1} (s1 : Homotopy r1 (𝟙 Q1))
    (p q : ℤ) (hpq : p+(-1)=q) :
    (directPrimary u b0 b1 v s1).v p q hpq =
      u.f p ≫ b0.f p ≫ s1.hom p q ≫ b1.f q ≫ v.f q := by
  simp only [directPrimary, Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    Cochain.ofHom_v, cochain_ofHomotopy_v, HomologicalComplex.comp_f, Category.assoc]

/-- Component normal form for the two-cut word. -/
theorem directSecondary_v
    {P0 P3 Q0 Q1 Q2 Q3 : CochainComplex (ModuleCat B) ℤ}
    (u : P0 ⟶ Q0) (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3)
    (v : Q3 ⟶ P3) {r1 : Q1 ⟶ Q1} {r2 : Q2 ⟶ Q2}
    (s1 : Homotopy r1 (𝟙 Q1)) (s2 : Homotopy r2 (𝟙 Q2))
    (p q : ℤ) (hpq : p+(-2)=q) :
    (directSecondary u b0 b1 b2 v s1 s2).v p q hpq =
      u.f p ≫ b0.f p ≫ s1.hom p (p-1) ≫ b1.f (p-1) ≫
        s2.hom (p-1) q ≫ b2.f q ≫ v.f q := by
  simp only [directSecondary, cochain_comp_v_neg_one,
    Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    Cochain.ofHom_v, cochain_ofHomotopy_v, HomologicalComplex.comp_f, Category.assoc]

/-- Factoring each comparison endomorphism gives exactly the two defining-system products. -/
theorem directSecondary_coherence
    {P0 P1 P2 P3 Q0 Q1 Q2 Q3 : CochainComplex (ModuleCat B) ℤ}
    (u0 : P0 ⟶ Q0) (u1 : P1 ⟶ Q1) (u2 : P2 ⟶ Q2)
    (v1 : Q1 ⟶ P1) (v2 : Q2 ⟶ P2) (v3 : Q3 ⟶ P3)
    (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3)
    (s1 : Homotopy (v1 ≫ u1) (𝟙 Q1)) (s2 : Homotopy (v2 ≫ u2) (𝟙 Q2))
    (hz0 : b0 ≫ b1 = 0) (hz1 : b1 ≫ b2 = 0) :
    δ (-2) (-1) (directSecondary u0 b0 b1 b2 v3 s1 s2) =
      (directPrimary u0 b0 b1 v2 s1).comp (Cochain.ofHom (u2 ≫ b2 ≫ v3)) (by decide) +
        (Cochain.ofHom (u0 ≫ b0 ≫ v1)).comp (directPrimary u1 b1 b2 v3 s2) (by decide) := by
  rw [directSecondary_d u0 b0 b1 b2 v3 s1 s2 hz0 hz1]
  apply Cochain.ext
  intro p q hpq
  simp only [Cochain.add_v, Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    directPrimary_v, Cochain.ofHom_v, HomologicalComplex.comp_f, Category.assoc]

/-- All three cuts factor into the actual five-stage terminal expression. -/
theorem directTertiary_coherence
    {P0 P1 P2 P3 P4 Q0 Q1 Q2 Q3 Q4 : CochainComplex (ModuleCat B) ℤ}
    (u0 : P0 ⟶ Q0) (u1 : P1 ⟶ Q1) (u2 : P2 ⟶ Q2) (u3 : P3 ⟶ Q3)
    (v1 : Q1 ⟶ P1) (v2 : Q2 ⟶ P2) (v3 : Q3 ⟶ P3) (v4 : Q4 ⟶ P4)
    (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3) (b3 : Q3 ⟶ Q4)
    (s1 : Homotopy (v1 ≫ u1) (𝟙 Q1)) (s2 : Homotopy (v2 ≫ u2) (𝟙 Q2))
    (s3 : Homotopy (v3 ≫ u3) (𝟙 Q3))
    (hz0 : b0 ≫ b1 = 0) (hz1 : b1 ≫ b2 = 0) (hz2 : b2 ≫ b3 = 0) :
    δ (-3) (-2) (directTertiary u0 b0 b1 b2 b3 v4 s1 s2 s3) =
      (directSecondary u0 b0 b1 b2 v3 s1 s2).comp
        (Cochain.ofHom (u3 ≫ b3 ≫ v4)) (by decide) +
      ((directPrimary u0 b0 b1 v2 s1).comp (directPrimary u2 b2 b3 v4 s3) (by decide) +
        (Cochain.ofHom (u0 ≫ b0 ≫ v1)).comp
          (directSecondary u1 b1 b2 b3 v4 s2 s3) (by decide)) := by
  rw [directTertiary_d u0 b0 b1 b2 b3 v4 s1 s2 s3 hz0 hz1 hz2]
  apply Cochain.ext
  intro p q hpq
  simp only [Cochain.add_v, cochain_comp_v_neg_one,
    Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    directPrimary_v, directSecondary_v, Cochain.ofHom_v,
    HomologicalComplex.comp_f, HomologicalComplex.id_f, Category.id_comp, Category.assoc]
  abel

/-- The precise direct consumer input. There are only THREE middle inverse
homotopies. No endpoint inverse and no missing higher coherence is assumed. -/
structure StrictZeroComparison (P0 P1 P2 P3 P4 : C4Complex) where
  Q0 : C4Complex
  Q1 : C4Complex
  Q2 : C4Complex
  Q3 : C4Complex
  Q4 : C4Complex
  b0 : Q0 ⟶ Q1
  b1 : Q1 ⟶ Q2
  b2 : Q2 ⟶ Q3
  b3 : Q3 ⟶ Q4
  zero01 : b0 ≫ b1 = 0
  zero12 : b1 ≫ b2 = 0
  zero23 : b2 ≫ b3 = 0
  u0 : P0 ⟶ Q0
  u1 : P1 ⟶ Q1
  u2 : P2 ⟶ Q2
  u3 : P3 ⟶ Q3
  v1 : Q1 ⟶ P1
  v2 : Q2 ⟶ P2
  v3 : Q3 ⟶ P3
  v4 : Q4 ⟶ P4
  s1 : Homotopy (v1 ≫ u1) (𝟙 Q1)
  s2 : Homotopy (v2 ≫ u2) (𝟙 Q2)
  s3 : Homotopy (v3 ≫ u3) (𝟙 Q3)

variable {P0 P1 P2 P3 P4 : C4Complex}

theorem reverseMap_comp_eq_zero {P Q R : C4Complex}
    (f : P ⟶ Q) (g : Q ⟶ R) (h : f ≫ g = 0) :
    reverseMap f ≫ reverseMap g = 0 := by
  simpa only [reverseMap_comp, reverseMap_zero] using
    congrArg (fun k : P ⟶ R => reverseMap k) h

/-- All five lower coherences are proved from the actual words and strict zeros. -/
def StrictZeroComparison.cochainData (q : StrictZeroComparison P0 P1 P2 P3 P4) :
    CochainFourfoldData P0 P1 P2 P3 P4 where
  x01 := q.u0 ≫ q.b0 ≫ q.v1
  x12 := q.u1 ≫ q.b1 ≫ q.v2
  x23 := q.u2 ≫ q.b2 ≫ q.v3
  x34 := q.u3 ≫ q.b3 ≫ q.v4
  h02 := directPrimary (reverseMap q.u0) (reverseMap q.b0) (reverseMap q.b1)
    (reverseMap q.v2) (reverseHomotopy q.s1)
  h13 := directPrimary (reverseMap q.u1) (reverseMap q.b1) (reverseMap q.b2)
    (reverseMap q.v3) (reverseHomotopy q.s2)
  h24 := directPrimary (reverseMap q.u2) (reverseMap q.b2) (reverseMap q.b3)
    (reverseMap q.v4) (reverseHomotopy q.s3)
  d02 := by
    simpa only [reverseMap_comp] using directPrimary_coherence
      (reverseMap q.u0) (reverseMap q.b0) (reverseMap q.b1) (reverseMap q.v2)
      (reverseMap q.v1) (reverseMap q.u1) (reverseHomotopy q.s1)
      (reverseMap_comp_eq_zero _ _ q.zero01)
  d13 := by
    simpa only [reverseMap_comp] using directPrimary_coherence
      (reverseMap q.u1) (reverseMap q.b1) (reverseMap q.b2) (reverseMap q.v3)
      (reverseMap q.v2) (reverseMap q.u2) (reverseHomotopy q.s2)
      (reverseMap_comp_eq_zero _ _ q.zero12)
  d24 := by
    simpa only [reverseMap_comp] using directPrimary_coherence
      (reverseMap q.u2) (reverseMap q.b2) (reverseMap q.b3) (reverseMap q.v4)
      (reverseMap q.v3) (reverseMap q.u3) (reverseHomotopy q.s3)
      (reverseMap_comp_eq_zero _ _ q.zero23)
  z03 := directSecondary (reverseMap q.u0) (reverseMap q.b0) (reverseMap q.b1)
    (reverseMap q.b2) (reverseMap q.v3) (reverseHomotopy q.s1) (reverseHomotopy q.s2)
  z14 := directSecondary (reverseMap q.u1) (reverseMap q.b1) (reverseMap q.b2)
    (reverseMap q.b3) (reverseMap q.v4) (reverseHomotopy q.s2) (reverseHomotopy q.s3)
  d03 := by
    simpa only [reverseMap_comp] using directSecondary_coherence
      (reverseMap q.u0) (reverseMap q.u1) (reverseMap q.u2)
      (reverseMap q.v1) (reverseMap q.v2) (reverseMap q.v3)
      (reverseMap q.b0) (reverseMap q.b1) (reverseMap q.b2)
      (reverseHomotopy q.s1) (reverseHomotopy q.s2)
      (reverseMap_comp_eq_zero _ _ q.zero01) (reverseMap_comp_eq_zero _ _ q.zero12)
  d14 := by
    simpa only [reverseMap_comp] using directSecondary_coherence
      (reverseMap q.u1) (reverseMap q.u2) (reverseMap q.u3)
      (reverseMap q.v2) (reverseMap q.v3) (reverseMap q.v4)
      (reverseMap q.b1) (reverseMap q.b2) (reverseMap q.b3)
      (reverseHomotopy q.s2) (reverseHomotopy q.s3)
      (reverseMap_comp_eq_zero _ _ q.zero12) (reverseMap_comp_eq_zero _ _ q.zero23)

/-- The actual original-system tertiary filler, constructed rather than assumed. -/
def StrictZeroComparison.tertiary (q : StrictZeroComparison P0 P1 P2 P3 P4) :
    q.cochainData.secondary.TertiaryFiller :=
  q.cochainData.tertiary
    (directTertiary (reverseMap q.u0) (reverseMap q.b0) (reverseMap q.b1)
      (reverseMap q.b2) (reverseMap q.b3) (reverseMap q.v4)
      (reverseHomotopy q.s1) (reverseHomotopy q.s2) (reverseHomotopy q.s3)) (by
      simpa only [cochainData, reverseMap_comp] using directTertiary_coherence
        (reverseMap q.u0) (reverseMap q.u1) (reverseMap q.u2) (reverseMap q.u3)
        (reverseMap q.v1) (reverseMap q.v2) (reverseMap q.v3) (reverseMap q.v4)
        (reverseMap q.b0) (reverseMap q.b1) (reverseMap q.b2) (reverseMap q.b3)
        (reverseHomotopy q.s1) (reverseHomotopy q.s2) (reverseHomotopy q.s3)
        (reverseMap_comp_eq_zero _ _ q.zero01) (reverseMap_comp_eq_zero _ _ q.zero12)
        (reverseMap_comp_eq_zero _ _ q.zero23))

#print axioms directSecondary_coherence
#print axioms directTertiary_coherence
#print axioms StrictZeroComparison.tertiary
end C4
