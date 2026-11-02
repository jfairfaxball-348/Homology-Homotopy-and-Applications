module
public import C4.HomDifferentialLemmas
public import Mathlib.Algebra.Homology.HomotopyCategory.HomComplex
public import Mathlib.Algebra.Homology.DerivedCategory.KProjective
public import Mathlib.Algebra.Category.ModuleCat.Projective

@[expose] public section

/-!
# Direct square-zero transfer through actual homotopy comparisons

Degree reversal permits use of Mathlib's HomComplex differential and Leibniz
rule. The inputs below are genuine maps and homotopies of arbitrary complexes.
They are NOT inferred from a quasi-isomorphism. This module isolates the
consumer needed after the replacement/comparison construction.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex.HomComplex

/-- A chain complex read in the opposite integer grading. -/
abbrev reverseComplex (P : C4Complex) : CochainComplex (ModuleCat B) ℤ where
  X i := P.X (-i)
  d i j := P.d (-i) (-j)
  shape i j hij := by
    apply P.shape
    intro h
    apply hij
    change i + 1 = j
    change -j + 1 = -i at h
    omega
  d_comp_d' i j k _ _ := P.d_comp_d (-i) (-j) (-k)

/-- Reindex an actual chain map, retaining its commuting equations. -/
def reverseMap {P Q : C4Complex} (f : P ⟶ Q) :
    reverseComplex P ⟶ reverseComplex Q where
  f i := f.f (-i)
  comm' i j _ := f.comm (-i) (-j)

@[simp] theorem reverseMap_comp {P Q R : C4Complex}
    (f : P ⟶ Q) (g : Q ⟶ R) :
    reverseMap (f ≫ g) = reverseMap f ≫ reverseMap g := rfl

@[simp] theorem reverseMap_id (P : C4Complex) :
    reverseMap (𝟙 P) = 𝟙 (reverseComplex P) := rfl

@[simp] theorem reverseMap_zero (P Q : C4Complex) :
    reverseMap (0 : P ⟶ Q) = 0 := rfl

/-- Actual chain homotopies become actual cochain homotopies. -/
def reverseHomotopy {P Q : C4Complex} {f g : P ⟶ Q}
    (h : Homotopy f g) : Homotopy (reverseMap f) (reverseMap g) where
  hom i j := h.hom (-i) (-j)
  zero i j hij := by
    apply h.zero
    intro hji
    apply hij
    change j + 1 = i
    change -i + 1 = -j at hji
    omega
  comm i := by
    have hh := h.comm (-i)
    rw [dNext_eq h.hom (show (ComplexShape.down ℤ).Rel (-i) (-(i+1)) by
      change -(i+1)+1 = -i; omega),
      prevD_eq h.hom (show (ComplexShape.down ℤ).Rel (-(i-1)) (-i) by
        change -i+1 = -(i-1); omega)] at hh
    rw [dNext_eq (C := reverseComplex P) (D := reverseComplex Q)
        (fun i j => h.hom (-i) (-j))
        (show (ComplexShape.up ℤ).Rel i (i+1) by rfl),
      prevD_eq (C := reverseComplex P) (D := reverseComplex Q)
        (fun i j => h.hom (-i) (-j))
        (show (ComplexShape.up ℤ).Rel (i-1) i by
          change i-1+1 = i; omega)]
    exact hh


/-- Characteristic two on every HomComplex cochain, over arbitrary B-modules. -/
@[simp] theorem cochain_neg {F G : CochainComplex (ModuleCat B) ℤ}
    {n : ℤ} (z : Cochain F G n) : -z = z := by
  apply neg_eq_iff_add_eq_zero.mpr
  funext t
  exact moduleHom_add_self_zero (z t)

@[simp] theorem cochain_sub {F G : CochainComplex (ModuleCat B) ℤ}
    {n : ℤ} (z w : Cochain F G n) : z - w = z + w := by
  rw [sub_eq_add_neg, cochain_neg]

@[simp] theorem cochain_sign {F G : CochainComplex (ModuleCat B) ℤ}
    {n : ℤ} (m : ℤ) (z : Cochain F G n) : m.negOnePow • z = z := by
  rcases Int.even_or_odd m with h | h
  · rw [Int.negOnePow_even m h, one_smul]
  · rw [Int.negOnePow_odd m h, Units.neg_smul, one_smul, cochain_neg]

/-- Component normal forms choose the same intermediate degree on both
sides of a transfer equation, avoiding dependent transports from `p + 0`. -/
theorem cochain_comp_v_neg_one
    {F G K : CochainComplex (ModuleCat B) ℤ} {b c : ℤ}
    (f : Cochain F G (-1)) (g : Cochain G K b) (h : -1+b=c)
    (p q : ℤ) (hpq : p+c=q) :
    (f.comp g h).v p q hpq =
      f.v p (p-1) (by omega) ≫ g.v (p-1) q (by omega) :=
  Cochain.comp_v f g h p (p-1) q (by omega) (by omega)

theorem cochain_comp_v_neg_two
    {F G K : CochainComplex (ModuleCat B) ℤ} {b c : ℤ}
    (f : Cochain F G (-2)) (g : Cochain G K b) (h : -2+b=c)
    (p q : ℤ) (hpq : p+c=q) :
    (f.comp g h).v p q hpq =
      f.v p (p-2) (by omega) ≫ g.v (p-2) q (by omega) :=
  Cochain.comp_v f g h p (p-2) q (by omega) (by omega)

theorem cochain_ofHomotopy_v
    {F G : CochainComplex (ModuleCat B) ℤ} {f g : F ⟶ G}
    (h : Homotopy f g) (p q : ℤ) (hpq : p+(-1)=q) :
    (Cochain.ofHomotopy h).v p q hpq = h.hom p q := rfl

/-- Mathlib's full Leibniz theorem, with the signs justified over B. -/
theorem unsigned_δ_comp {F G K : CochainComplex (ModuleCat B) ℤ}
    {a b c : ℤ} (f : Cochain F G a) (g : Cochain G K b) (hab : a+b=c)
    (a' b' c' : ℤ) (hc : c+1=c') (ha : a+1=a') (hb : b+1=b') :
    δ c c' (f.comp g hab) =
      f.comp (δ b b' g) (by omega) + (δ a a' f).comp g (by omega) := by
  simpa only [cochain_sign] using δ_comp f g hab a' b' c' hc ha hb

/-- Reindexed genuine homotopy, including the characteristic-two sign. -/
@[simp] theorem reverseHomotopy_d {P Q : C4Complex} {f g : P ⟶ Q}
    (h : Homotopy f g) :
    δ (-1) 0 (Cochain.ofHomotopy (reverseHomotopy h)) =
      Cochain.ofHom (reverseMap f) + Cochain.ofHom (reverseMap g) := by
  simpa only [cochain_sub] using δ_ofHomotopy (reverseHomotopy h)

/-- Fixed-degree form suitable for reducing a concrete transfer word. -/
theorem unsigned_δ_comp_succ {F G K : CochainComplex (ModuleCat B) ℤ}
    {a b c : ℤ} (f : Cochain F G a) (g : Cochain G K b) (hab : a+b=c) :
    δ c (c+1) (f.comp g hab) =
      f.comp (δ b (b+1) g) (by omega) +
        (δ a (a+1) f).comp g (by omega) :=
  unsigned_δ_comp f g hab (a+1) (b+1) (c+1) rfl rfl rfl

/-- A total-degree form of Leibniz with no arithmetic side goals for simp. -/
theorem unsigned_δ_comp_any {F G K : CochainComplex (ModuleCat B) ℤ}
    {a b c : ℤ} (f : Cochain F G a) (g : Cochain G K b) (hab : a+b=c)
    (m : ℤ) :
    δ c m (f.comp g hab) =
      f.comp (δ b (m-a) g) (by omega) +
        (δ a (m-b) f).comp g (by omega) := by
  by_cases h : c+1=m
  · exact unsigned_δ_comp f g hab (m-b) (m-a) m h (by omega) (by omega)
  · rw [δ_shape c m (by omega), δ_shape b (m-a) (by omega),
      δ_shape a (m-b) (by omega)]
    simp only [Cochain.comp_zero, Cochain.zero_comp, add_zero]

/-- An explicit sufficient comparison contract. QuasiIso is used only with
K-projectivity of BOTH complexes. Supplying these instances for a strict
square-zero replacement remains a separate producer obligation. -/
theorem comparison_of_quasiIso
    {P Q : CochainComplex (ModuleCat B) ℤ}
    [P.IsKProjective] [Q.IsKProjective] (v : Q ⟶ P)
    [QuasiIso v] :
    ∃ u : P ⟶ Q, Nonempty (Homotopy (v ≫ u) (𝟙 Q)) ∧
      Nonempty (Homotopy (u ≫ v) (𝟙 P)) := by
  obtain ⟨e, rfl⟩ := (CochainComplex.IsKProjective.quasiIso_iff v).mp
    (inferInstance : QuasiIso v)
  exact ⟨e.inv, ⟨e.homotopyHomInvId⟩, ⟨e.homotopyInvHomId⟩⟩

/-- Bounded-above complexes of projective B-modules satisfy the comparison
contract. These are additional hypotheses, not consequences of monic bar
maps or objectwise QuasiIso. Reversal turns this bound into a chain lower bound. -/
theorem comparison_of_bounded_projective_quasiIso
    {P Q : CochainComplex (ModuleCat B) ℤ} (p q : ℤ)
    [P.IsStrictlyLE p] [Q.IsStrictlyLE q]
    [∀ n : ℤ, Projective (P.X n)] [∀ n : ℤ, Projective (Q.X n)]
    (v : Q ⟶ P) [QuasiIso v] :
    ∃ u : P ⟶ Q, Nonempty (Homotopy (v ≫ u) (𝟙 Q)) ∧
      Nonempty (Homotopy (u ≫ v) (𝟙 P)) := by
  letI := CochainComplex.isKProjective_of_projective P p
  letI := CochainComplex.isKProjective_of_projective Q q
  exact comparison_of_quasiIso v

/-- The ORIGINAL C4 shifted resolutions satisfy K-projectivity after
reversal. This proves the original-side comparison hypothesis; it says
nothing about arbitrary replacement objects. -/
theorem reverseResolution_isKProjective (s : ℤ) :
    (reverseComplex (integerShiftResolution s)).IsKProjective := by
  let P := reverseComplex (integerShiftResolution s)
  haveI : ∀ n : ℤ, Projective (P.X n) := by
    intro n
    change Projective (integerObject (-n-s))
    by_cases hn : 0 ≤ -n-s
    · rw [integerObject_nonnegative (-n-s) hn]
      infer_instance
    · exact (integerObject_isZero_negative (-n-s) (by omega)).projective
  haveI : P.IsStrictlyLE (-s) := by
    apply (CochainComplex.isStrictlyLE_iff P (-s)).2
    intro n hn
    exact integerObject_isZero_negative (-n-s) (by omega)
  exact CochainComplex.isKProjective_of_projective P (-s)

/-- For comparison INTO an original shifted C4 resolution, the additional
K-projectivity obligation is only on the replacement. Its construction
must still preserve strict square-zero arrows and adjacent classes. -/
theorem comparison_to_resolution
    {Q : CochainComplex (ModuleCat B) ℤ} [Q.IsKProjective] (s : ℤ)
    (v : Q ⟶ reverseComplex (integerShiftResolution s)) [QuasiIso v] :
    ∃ u : reverseComplex (integerShiftResolution s) ⟶ Q,
      Nonempty (Homotopy (v ≫ u) (𝟙 Q)) ∧
      Nonempty (Homotopy (u ≫ v) (𝟙 _)) := by
  haveI := reverseResolution_isKProjective s
  exact comparison_of_quasiIso v

/-- The actual one-cut word in manuscript (5.3), in reversed grading. -/
def directPrimary {P₀ P₂ Q₀ Q₁ Q₂ : CochainComplex (ModuleCat B) ℤ}
    (u₀ : P₀ ⟶ Q₀) (b₀ : Q₀ ⟶ Q₁) (b₁ : Q₁ ⟶ Q₂)
    (v₂ : Q₂ ⟶ P₂) {r₁ : Q₁ ⟶ Q₁} (s₁ : Homotopy r₁ (𝟙 Q₁)) :
    Cochain P₀ P₂ (-1) :=
  let a : Cochain P₀ Q₁ 0 := Cochain.ofHom (u₀ ≫ b₀)
  let b : Cochain P₀ Q₁ (-1) := a.comp (Cochain.ofHomotopy s₁) (by decide)
  let c : Cochain P₀ Q₂ (-1) := b.comp (Cochain.ofHom b₁) (by decide)
  c.comp (Cochain.ofHom v₂) (by decide)


/-- Direct primary coherence from a strict consecutive zero. The middle
endomorphism is supplied by an ACTUAL homotopy, never by QuasiIso alone. -/
theorem directPrimary_d {P₀ P₂ Q₀ Q₁ Q₂ : CochainComplex (ModuleCat B) ℤ}
    (u₀ : P₀ ⟶ Q₀) (b₀ : Q₀ ⟶ Q₁) (b₁ : Q₁ ⟶ Q₂)
    (v₂ : Q₂ ⟶ P₂) {r₁ : Q₁ ⟶ Q₁} (s₁ : Homotopy r₁ (𝟙 Q₁))
    (hz : b₀ ≫ b₁ = 0) :
    δ (-1) 0 (directPrimary u₀ b₀ b₁ v₂ s₁) =
      Cochain.ofHom (u₀ ≫ b₀ ≫ r₁ ≫ b₁ ≫ v₂) := by
  simp only [directPrimary, unsigned_δ_comp_any, Int.reduceSub, Int.reduceAdd, Int.reduceNeg, δ_ofHom, δ_ofHomotopy,
    cochain_sub, Cochain.comp_zero, Cochain.zero_comp, add_zero, zero_add,
    Cochain.comp_add, Cochain.add_comp, ← Cochain.ofHom_comp]
  have hzv : b₀ ≫ b₁ ≫ v₂ = 0 := by
    rw [← Category.assoc, hz, zero_comp]
  simp only [← Cochain.ofHom_comp, Category.assoc, Category.id_comp, hzv, comp_zero,
    Cochain.ofHom_zero, add_zero]

/-- The primary equation in precisely the defining-system product form. -/
theorem directPrimary_coherence
    {P₀ P₂ Q₀ Q₁ Q₂ R₁ : CochainComplex (ModuleCat B) ℤ}
    (u₀ : P₀ ⟶ Q₀) (b₀ : Q₀ ⟶ Q₁) (b₁ : Q₁ ⟶ Q₂)
    (v₂ : Q₂ ⟶ P₂) (v₁ : Q₁ ⟶ R₁) (u₁ : R₁ ⟶ Q₁)
    (s₁ : Homotopy (v₁ ≫ u₁) (𝟙 Q₁)) (hz : b₀ ≫ b₁ = 0) :
    δ (-1) 0 (directPrimary u₀ b₀ b₁ v₂ s₁) =
      Cochain.ofHom ((u₀ ≫ b₀ ≫ v₁) ≫ (u₁ ≫ b₁ ≫ v₂)) := by
  simpa only [Category.assoc] using directPrimary_d u₀ b₀ b₁ v₂ s₁ hz

/-- The constructed primary word gives an actual Mathlib homotopy via the
library equivalence, rather than an assumed primary-coherence field. -/
def directPrimaryHomotopy
    {P₀ P₂ Q₀ Q₁ Q₂ R₁ : CochainComplex (ModuleCat B) ℤ}
    (u₀ : P₀ ⟶ Q₀) (b₀ : Q₀ ⟶ Q₁) (b₁ : Q₁ ⟶ Q₂)
    (v₂ : Q₂ ⟶ P₂) (v₁ : Q₁ ⟶ R₁) (u₁ : R₁ ⟶ Q₁)
    (s₁ : Homotopy (v₁ ≫ u₁) (𝟙 Q₁)) (hz : b₀ ≫ b₁ = 0) :
    Homotopy ((u₀ ≫ b₀ ≫ v₁) ≫ (u₁ ≫ b₁ ≫ v₂)) 0 :=
  (Cochain.equivHomotopy _ _).symm
    ⟨directPrimary u₀ b₀ b₁ v₂ s₁, by
      simp only [Cochain.ofHom_zero, add_zero,
        directPrimary_coherence u₀ b₀ b₁ v₂ v₁ u₁ s₁ hz]⟩

/-- The actual 2-cut word, not an assumed coherence. -/
def directSecondary {P₀ P3 Q0 Q1 Q2 Q3 : CochainComplex (ModuleCat B) ℤ}
    (u : P₀ ⟶ Q0) (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3)
    (v : Q3 ⟶ P3)
    {r1 : Q1 ⟶ Q1} (s1 : Homotopy r1 (𝟙 Q1))
    {r2 : Q2 ⟶ Q2} (s2 : Homotopy r2 (𝟙 Q2)) :
    Cochain P₀ P3 (-2) :=
  let a0 : Cochain P₀ Q1 0 := Cochain.ofHom (u ≫ b0)
  let h1 : Cochain P₀ Q1 (-1) := a0.comp (Cochain.ofHomotopy s1) (by decide)
  let a1 : Cochain P₀ Q2 (-1) := h1.comp (Cochain.ofHom b1) (by decide)
  let h2 : Cochain P₀ Q2 (-2) := a1.comp (Cochain.ofHomotopy s2) (by decide)
  let a2 : Cochain P₀ Q3 (-2) := h2.comp (Cochain.ofHom b2) (by decide)
  a2.comp (Cochain.ofHom v) (by decide)

/-- The actual 3-cut word, not an assumed coherence. -/
def directTertiary {P₀ P4 Q0 Q1 Q2 Q3 Q4 : CochainComplex (ModuleCat B) ℤ}
    (u : P₀ ⟶ Q0) (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3) (b3 : Q3 ⟶ Q4)
    (v : Q4 ⟶ P4)
    {r1 : Q1 ⟶ Q1} (s1 : Homotopy r1 (𝟙 Q1))
    {r2 : Q2 ⟶ Q2} (s2 : Homotopy r2 (𝟙 Q2))
    {r3 : Q3 ⟶ Q3} (s3 : Homotopy r3 (𝟙 Q3)) :
    Cochain P₀ P4 (-3) :=
  let a0 : Cochain P₀ Q1 0 := Cochain.ofHom (u ≫ b0)
  let h1 : Cochain P₀ Q1 (-1) := a0.comp (Cochain.ofHomotopy s1) (by decide)
  let a1 : Cochain P₀ Q2 (-1) := h1.comp (Cochain.ofHom b1) (by decide)
  let h2 : Cochain P₀ Q2 (-2) := a1.comp (Cochain.ofHomotopy s2) (by decide)
  let a2 : Cochain P₀ Q3 (-2) := h2.comp (Cochain.ofHom b2) (by decide)
  let h3 : Cochain P₀ Q3 (-3) := a2.comp (Cochain.ofHomotopy s3) (by decide)
  let a3 : Cochain P₀ Q4 (-3) := h3.comp (Cochain.ofHom b3) (by decide)
  a3.comp (Cochain.ofHom v) (by decide)

/-- The two-cut equation obtained by differentiating the actual word.
Both identity summands are eliminated by strict consecutive zero maps. -/
theorem directSecondary_d
    {P₀ P3 Q0 Q1 Q2 Q3 : CochainComplex (ModuleCat B) ℤ}
    (u : P₀ ⟶ Q0) (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3)
    (v : Q3 ⟶ P3) {r1 : Q1 ⟶ Q1} {r2 : Q2 ⟶ Q2}
    (s1 : Homotopy r1 (𝟙 Q1)) (s2 : Homotopy r2 (𝟙 Q2))
    (hz0 : b0 ≫ b1 = 0) (hz1 : b1 ≫ b2 = 0) :
    δ (-2) (-1) (directSecondary u b0 b1 b2 v s1 s2) =
      directPrimary u b0 b1 (r2 ≫ b2 ≫ v) s1 +
        directPrimary (u ≫ b0 ≫ r1) b1 b2 v s2 := by
  have h0 (n : ℤ) : b0.f n ≫ b1.f n = 0 := by
    simpa using congrArg (fun f : Q0 ⟶ Q2 => f.f n) hz0
  have h1 (n : ℤ) : b1.f n ≫ b2.f n = 0 := by
    simpa using congrArg (fun f : Q1 ⟶ Q3 => f.f n) hz1
  have h0a (n : ℤ) {M : ModuleCat B} (f : Q2.X n ⟶ M) :
      b0.f n ≫ b1.f n ≫ f = 0 := by rw [← Category.assoc, h0, zero_comp]
  have h1a (n : ℤ) {M : ModuleCat B} (f : Q3.X n ⟶ M) :
      b1.f n ≫ b2.f n ≫ f = 0 := by rw [← Category.assoc, h1, zero_comp]
  simp only [directSecondary, unsigned_δ_comp_any, Int.reduceSub, Int.reduceAdd, Int.reduceNeg, δ_ofHom, δ_ofHomotopy,
    cochain_sub, Cochain.comp_zero, Cochain.zero_comp, add_zero, zero_add,
    Cochain.comp_add, Cochain.add_comp]
  apply Cochain.ext
  intro p q hpq
  subst q
  dsimp [directPrimary, Cochain.comp, Cochain.mk, Cochain.v,
    Cochain.ofHom, Cochain.ofHoms, Cochain.ofHomotopy,
    HomologicalComplex.comp_f, HomologicalComplex.id_f]
  <;> simp [add_assoc, Category.assoc, h0, h1, h0a, h1a, Preadditive.add_comp, Preadditive.comp_add]

/-- Differentiating the three-cut word gives the three possible cuts.
This is the degree-three filler calculation required by manuscript (5.4). -/
theorem directTertiary_d
    {P₀ P4 Q0 Q1 Q2 Q3 Q4 : CochainComplex (ModuleCat B) ℤ}
    (u : P₀ ⟶ Q0) (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2)
    (b2 : Q2 ⟶ Q3) (b3 : Q3 ⟶ Q4) (v : Q4 ⟶ P4)
    {r1 : Q1 ⟶ Q1} {r2 : Q2 ⟶ Q2} {r3 : Q3 ⟶ Q3}
    (s1 : Homotopy r1 (𝟙 Q1)) (s2 : Homotopy r2 (𝟙 Q2))
    (s3 : Homotopy r3 (𝟙 Q3))
    (hz0 : b0 ≫ b1 = 0) (hz1 : b1 ≫ b2 = 0) (hz2 : b2 ≫ b3 = 0) :
    δ (-3) (-2) (directTertiary u b0 b1 b2 b3 v s1 s2 s3) =
      directSecondary u b0 b1 b2 (r3 ≫ b3 ≫ v) s1 s2 +
        (directPrimary u b0 b1 r2 s1).comp
          (directPrimary (𝟙 Q2) b2 b3 v s3) (by decide) +
        directSecondary (u ≫ b0 ≫ r1) b1 b2 b3 v s2 s3 := by
  have h0 (n : ℤ) : b0.f n ≫ b1.f n = 0 := by
    simpa using congrArg (fun f : Q0 ⟶ Q2 => f.f n) hz0
  have h1 (n : ℤ) : b1.f n ≫ b2.f n = 0 := by
    simpa using congrArg (fun f : Q1 ⟶ Q3 => f.f n) hz1
  have h2 (n : ℤ) : b2.f n ≫ b3.f n = 0 := by
    simpa using congrArg (fun f : Q2 ⟶ Q4 => f.f n) hz2
  have h0a (n : ℤ) {M : ModuleCat B} (f : Q2.X n ⟶ M) :
      b0.f n ≫ b1.f n ≫ f = 0 := by rw [← Category.assoc, h0, zero_comp]
  have h1a (n : ℤ) {M : ModuleCat B} (f : Q3.X n ⟶ M) :
      b1.f n ≫ b2.f n ≫ f = 0 := by rw [← Category.assoc, h1, zero_comp]
  have h2a (n : ℤ) {M : ModuleCat B} (f : Q4.X n ⟶ M) :
      b2.f n ≫ b3.f n ≫ f = 0 := by rw [← Category.assoc, h2, zero_comp]
  simp only [directTertiary, unsigned_δ_comp_any, Int.reduceSub, Int.reduceAdd, Int.reduceNeg, δ_ofHom, δ_ofHomotopy,
    cochain_sub, Cochain.comp_zero, Cochain.zero_comp, add_zero, zero_add,
    Cochain.comp_add, Cochain.add_comp]
  apply Cochain.ext
  intro p q hpq
  subst q
  simp only [directPrimary, directSecondary, Cochain.add_v,
    cochain_comp_v_neg_one, cochain_comp_v_neg_two,
    Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    Cochain.ofHom_v, cochain_ofHomotopy_v,
    HomologicalComplex.comp_f, HomologicalComplex.id_f]
  simp [sub_eq_add_neg, add_assoc, Category.assoc, h0, h1, h2,
    h0a, h1a, h2a, Preadditive.add_comp, Preadditive.comp_add]
  <;> abel

-- Hosted build records the dependency axioms of the actual proof batch.
#print axioms comparison_of_quasiIso
#print axioms comparison_of_bounded_projective_quasiIso
#print axioms reverseResolution_isKProjective
#print axioms comparison_to_resolution
#print axioms reverseHomotopy_d
#print axioms directPrimaryHomotopy
#print axioms directPrimary_d
#print axioms directSecondary_d
#print axioms directTertiary_d

end C4
