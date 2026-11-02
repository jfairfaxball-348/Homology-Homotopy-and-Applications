module
public import C4.HomDifferentialLemmas
public import Mathlib.Algebra.Homology.HomotopyCategory.HomComplex

@[expose] public section

/-!
# Direct square-zero transfer through actual homotopy comparisons

Degree reversal permits use of Mathlib's HomComplex differential and Leibniz
rule. The inputs below are genuine maps and homotopies of arbitrary complexes.
They are NOT inferred from a quasi-isomorphism. This module isolates the
consumer needed after the replacement/comparison construction.
-/

namespace C4
open CategoryTheory
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
set_option backward.isDefEq.respectTransparency false in
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
    rw [dNext_eq h.hom (show (ComplexShape.down ℤ).Rel (-i) (-i-1) by
      change -i-1+1 = -i; omega),
      prevD_eq h.hom (show (ComplexShape.down ℤ).Rel (-i+1) (-i) by rfl)] at hh
    rw [dNext_eq (fun i j => h.hom (-i) (-j))
        (show (ComplexShape.up ℤ).Rel i (i+1) by rfl),
      prevD_eq (fun i j => h.hom (-i) (-j))
        (show (ComplexShape.up ℤ).Rel (i-1) i by
          change i-1+1 = i; omega)]
    simpa [reverseMap, reverseComplex, neg_add, neg_sub, sub_eq_add_neg, add_comm] using hh


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
  simp only [directPrimary, unsigned_δ_comp_any, δ_ofHom, δ_ofHomotopy,
    cochain_sub, Cochain.comp_zero, Cochain.zero_comp, add_zero, zero_add,
    Cochain.comp_add, Cochain.add_comp, ← Cochain.ofHom_comp]
  simp [Category.assoc, hz]

/-- The primary equation in precisely the defining-system product form. -/
theorem directPrimary_coherence
    {P₀ P₂ Q₀ Q₁ Q₂ R₁ : CochainComplex (ModuleCat B) ℤ}
    (u₀ : P₀ ⟶ Q₀) (b₀ : Q₀ ⟶ Q₁) (b₁ : Q₁ ⟶ Q₂)
    (v₂ : Q₂ ⟶ P₂) (v₁ : Q₁ ⟶ R₁) (u₁ : R₁ ⟶ Q₁)
    (s₁ : Homotopy (v₁ ≫ u₁) (𝟙 Q₁)) (hz : b₀ ≫ b₁ = 0) :
    δ (-1) 0 (directPrimary u₀ b₀ b₁ v₂ s₁) =
      Cochain.ofHom ((u₀ ≫ b₀ ≫ v₁) ≫ (u₁ ≫ b₁ ≫ v₂)) := by
  simpa only [Category.assoc] using directPrimary_d u₀ b₀ b₁ v₂ s₁ hz

/-- The actual 2-cut word, not an assumed coherence. -/
def directSecondary {P₀ P3 Q0 Q1 Q2 Q3 : CochainComplex (ModuleCat B) ℤ}
    (u : P₀ ⟶ Q0) (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3)
    (v : Q3 ⟶ P3)
    {r1 : Q1 ⟶ Q1} (s1 : Homotopy r1 (𝟙 Q1))
    {r2 : Q2 ⟶ Q2} (s2 : Homotopy r2 (𝟙 Q2)) :
    Cochain P₀ P3 (-2) :=
  (Cochain.comp (n₁ := (-2)) (n₂ := (0)) (n₁₂ := (-2)) (Cochain.comp (n₁ := (-2)) (n₂ := (0)) (n₁₂ := (-2)) (Cochain.comp (n₁ := (-1)) (n₂ := (-1)) (n₁₂ := (-2)) (Cochain.comp (n₁ := (-1)) (n₂ := (0)) (n₁₂ := (-1)) (Cochain.comp (n₁ := (0)) (n₂ := (-1)) (n₁₂ := (-1)) (Cochain.comp (n₁ := (0)) (n₂ := (0)) (n₁₂ := (0)) (Cochain.ofHom u) (Cochain.ofHom b0) (by decide)) (Cochain.ofHomotopy s1) (by decide)) (Cochain.ofHom b1) (by decide)) (Cochain.ofHomotopy s2) (by decide)) (Cochain.ofHom b2) (by decide)) (Cochain.ofHom v) (by decide))

/-- The actual 3-cut word, not an assumed coherence. -/
def directTertiary {P₀ P4 Q0 Q1 Q2 Q3 Q4 : CochainComplex (ModuleCat B) ℤ}
    (u : P₀ ⟶ Q0) (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3) (b3 : Q3 ⟶ Q4)
    (v : Q4 ⟶ P4)
    {r1 : Q1 ⟶ Q1} (s1 : Homotopy r1 (𝟙 Q1))
    {r2 : Q2 ⟶ Q2} (s2 : Homotopy r2 (𝟙 Q2))
    {r3 : Q3 ⟶ Q3} (s3 : Homotopy r3 (𝟙 Q3)) :
    Cochain P₀ P4 (-3) :=
  (Cochain.comp (n₁ := (-3)) (n₂ := (0)) (n₁₂ := (-3)) (Cochain.comp (n₁ := (-3)) (n₂ := (0)) (n₁₂ := (-3)) (Cochain.comp (n₁ := (-2)) (n₂ := (-1)) (n₁₂ := (-3)) (Cochain.comp (n₁ := (-2)) (n₂ := (0)) (n₁₂ := (-2)) (Cochain.comp (n₁ := (-1)) (n₂ := (-1)) (n₁₂ := (-2)) (Cochain.comp (n₁ := (-1)) (n₂ := (0)) (n₁₂ := (-1)) (Cochain.comp (n₁ := (0)) (n₂ := (-1)) (n₁₂ := (-1)) (Cochain.comp (n₁ := (0)) (n₂ := (0)) (n₁₂ := (0)) (Cochain.ofHom u) (Cochain.ofHom b0) (by decide)) (Cochain.ofHomotopy s1) (by decide)) (Cochain.ofHom b1) (by decide)) (Cochain.ofHomotopy s2) (by decide)) (Cochain.ofHom b2) (by decide)) (Cochain.ofHomotopy s3) (by decide)) (Cochain.ofHom b3) (by decide)) (Cochain.ofHom v) (by decide))

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
  simp only [directSecondary, unsigned_δ_comp_any, δ_ofHom, δ_ofHomotopy,
    cochain_sub, Cochain.comp_zero, Cochain.zero_comp, add_zero, zero_add,
    Cochain.comp_add, Cochain.add_comp]
  apply Cochain.ext
  intro p q hpq
  simp [directPrimary, Cochain.comp, Cochain.mk, Cochain.v,
    Cochain.ofHom, Cochain.ofHoms, Cochain.ofHomotopy,
    Preadditive.add_comp, Preadditive.comp_add, Category.assoc,
    h0, h1, h0a, h1a, add_assoc]

end C4
