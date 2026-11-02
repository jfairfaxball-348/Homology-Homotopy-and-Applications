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
def reverseComplex (P : C4Complex) : CochainComplex (ModuleCat B) ℤ where
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
    rw [dNext_eq h.hom (show (ComplexShape.down ℤ).Rel (-i) (-i-1) by
      change -i-1+1 = -i; omega),
      prevD_eq h.hom (show (ComplexShape.down ℤ).Rel (-i+1) (-i) by rfl)] at hh
    rw [dNext_eq _ (show (ComplexShape.up ℤ).Rel i (i+1) by rfl),
      prevD_eq _ (show (ComplexShape.up ℤ).Rel (i-1) i by
        change i-1+1 = i; omega)]
    simpa [reverseMap, reverseComplex, neg_add, neg_sub] using hh

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

end C4
