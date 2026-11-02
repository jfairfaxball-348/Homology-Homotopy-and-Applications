module
public import C4.DerivedStageReduction

@[expose] public section

/-!
# Contractible cones and cone cycles for the seven-stage resolution

`Cone(X)` is the homotopy cofiber of `𝟙 X`; it is contractible. A *cone
cycle* is a homotopy from `0` to `0` out of `Cone(X)`: it is built from a
degree-two family `λ` and a degree-one family `μ` with `μ = Dλ`; on the
unshifted copy of `X` it restricts to `μ`. These carry the canonical secondary
fillers in the natural nullhomotopy of the stage two-shift.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits HomologicalComplex

noncomputable section

/-- The contractible cone of the identity. -/
abbrev coneOf (X : C4Complex) : C4Complex := homotopyCofiber (𝟙 X)

theorem down_rel (i : ℤ) : (ComplexShape.down ℤ).Rel i (i - 1) := by
  change i - 1 + 1 = i
  omega

theorem down_rel' (i : ℤ) : (ComplexShape.down ℤ).Rel (i + 1) i := rfl

/-- The cone of the identity is contractible. -/
def coneOfContraction (X : C4Complex) : Homotopy (𝟙 (coneOf X)) 0 where
  hom i j := if h : (ComplexShape.down ℤ).Rel j i then
      homotopyCofiber.sndX (𝟙 X) i ≫ homotopyCofiber.inlX (𝟙 X) i j h else 0
  zero i j h := dif_neg h
  comm i := by
    rw [dNext_eq _ (down_rel i), prevD_eq _ (down_rel' i), dif_pos (down_rel i),
      dif_pos (down_rel' i)]
    apply homotopyCofiber.ext_from_X (𝟙 X) (i - 1) i (down_rel i)
    · simp only [homotopyCofiber_d, HomologicalComplex.id_f, HomologicalComplex.zero_f,
        add_zero, Category.comp_id, Preadditive.comp_add,
        homotopyCofiber.inlX_d_assoc (𝟙 X) i (i - 1) (i - 1 - 1) (down_rel i) (down_rel (i - 1)),
        Preadditive.add_comp, Preadditive.neg_comp, Category.assoc,
        homotopyCofiber.inlX_sndX_assoc, homotopyCofiber.inrX_sndX_assoc, comp_zero,
        neg_zero, zero_add, Category.id_comp]
      simp
    · simp only [homotopyCofiber_d, HomologicalComplex.id_f, HomologicalComplex.zero_f,
        add_zero, Category.comp_id, Preadditive.comp_add, homotopyCofiber.inrX_d_assoc,
        homotopyCofiber.inrX_sndX_assoc, Category.assoc,
        homotopyCofiber.inlX_d (𝟙 X) (i + 1) i (i - 1) (down_rel' i) (down_rel i),
        Preadditive.neg_comp, Category.id_comp]
      abel

theorem acyclic_of_contraction {K : C4Complex} (h : Homotopy (𝟙 K) 0) : K.Acyclic := by
  intro n
  rw [HomologicalComplex.exactAt_iff_isZero_homology, IsZero.iff_id_eq_zero]
  have := h.homologyMap_eq n
  rwa [HomologicalComplex.homologyMap_id, HomologicalComplex.homologyMap_zero] at this

/-- Projection off a contractible summand is a homotopy equivalence. -/
def biprodSndHomotopyEquiv {K L : C4Complex} (h : Homotopy (𝟙 K) 0) :
    HomotopyEquiv (K ⊞ L) L where
  hom := biprod.snd
  inv := biprod.inr
  homotopyHomInvId :=
    (Homotopy.ofEq (by simp)).trans ((((Homotopy.refl (biprod.snd ≫ biprod.inr)).add
      ((h.compLeft biprod.fst).compRight biprod.inl)).symm).trans
      (Homotopy.ofEq (by rw [Category.comp_id, add_comm]; exact biprod.total)))
  homotopyInvHomId := Homotopy.ofEq (by simp)

instance quasiIso_biprod_snd_coneOf (X Y : C4Complex) :
    QuasiIso (biprod.snd : coneOf X ⊞ Y ⟶ Y) :=
  (biprodSndHomotopyEquiv (coneOfContraction X)).quasiIso_hom

/-- A biproduct of two contractible complexes is contractible. -/
def biprodContraction {K L : C4Complex} (hK : Homotopy (𝟙 K) 0) (hL : Homotopy (𝟙 L) 0) :
    Homotopy (𝟙 (K ⊞ L)) 0 :=
  (Homotopy.ofEq (by simp)).trans ((((hK.compLeft biprod.fst).compRight biprod.inl).add
    ((hL.compLeft biprod.snd).compRight biprod.inr)).trans (Homotopy.ofEq (by simp)))

instance quasiIso_biprod_snd_coneOf₂ (X X' Y : C4Complex) :
    QuasiIso (biprod.snd : (coneOf X ⊞ coneOf X') ⊞ Y ⟶ Y) :=
  (biprodSndHomotopyEquiv (biprodContraction (coneOfContraction X)
    (coneOfContraction X'))).quasiIso_hom

/-- A cone cycle: the homotopy from `0` to `0` out of `Cone(X)` with
components `λ` on the shifted copy and `μ` on the unshifted copy, valid when
`μ = Dλ` (characteristic two; arbitrary index spellings). -/
def coneCycle {X Y : C4Complex} (lam mu : ∀ i j : ℤ, X.X i ⟶ Y.X j)
    (hcyc : ∀ a b c d : ℤ, b = a + 1 → c = a - 1 → d = a + 2 →
      mu a b = X.d a c ≫ lam c b + lam a d ≫ Y.d d b) :
    Homotopy (0 : coneOf X ⟶ Y) 0 where
  hom i j := if h : (ComplexShape.down ℤ).Rel j i then
      homotopyCofiber.fstX (𝟙 X) i (i - 1) (down_rel i) ≫ lam (i - 1) j +
        homotopyCofiber.sndX (𝟙 X) i ≫ mu i j else 0
  zero i j h := dif_neg h
  comm i := by
    rw [dNext_eq _ (down_rel i), prevD_eq _ (down_rel' i), dif_pos (down_rel i),
      dif_pos (down_rel' i)]
    apply homotopyCofiber.ext_from_X (𝟙 X) (i - 1) i (down_rel i)
    · rw [hcyc (i - 1) i (i - 1 - 1) (i + 1) (by omega) rfl (by omega)]
      simp only [homotopyCofiber_d, HomologicalComplex.zero_f, comp_zero, add_zero,
        Preadditive.comp_add, Preadditive.add_comp, Category.assoc,
        homotopyCofiber.inlX_d_assoc (𝟙 X) i (i - 1) (i - 1 - 1) (down_rel i) (down_rel (i - 1)),
        Preadditive.neg_comp, homotopyCofiber.inlX_fstX_assoc, homotopyCofiber.inlX_sndX_assoc,
        homotopyCofiber.inrX_fstX_assoc, homotopyCofiber.inrX_sndX_assoc, zero_comp,
        HomologicalComplex.id_f, Category.id_comp, zero_add]
      char2_hom
    · rw [hcyc (i - 1) i (i - 1 - 1) (i + 1) (by omega) rfl (by omega),
        hcyc i (i + 1) (i - 1) (i + 2) rfl rfl rfl]
      simp only [homotopyCofiber_d, HomologicalComplex.zero_f, comp_zero, add_zero,
        Preadditive.comp_add, Preadditive.add_comp, Category.assoc,
        homotopyCofiber.inrX_d_assoc, homotopyCofiber.inrX_fstX_assoc,
        homotopyCofiber.inrX_sndX_assoc, zero_comp, zero_add, Category.id_comp,
        HomologicalComplex.d_comp_d_assoc, HomologicalComplex.d_comp_d, comp_zero]
      char2_hom

theorem coneCycle_inr {X Y : C4Complex} (lam mu : ∀ i j : ℤ, X.X i ⟶ Y.X j)
    (hcyc : ∀ a b c d : ℤ, b = a + 1 → c = a - 1 → d = a + 2 →
      mu a b = X.d a c ≫ lam c b + lam a d ≫ Y.d d b) (i : ℤ) :
    homotopyCofiber.inrX (𝟙 X) i ≫ (coneCycle lam mu hcyc).hom i (i + 1) = mu i (i + 1) := by
  change homotopyCofiber.inrX (𝟙 X) i ≫ (if h : (ComplexShape.down ℤ).Rel (i + 1) i then _ else 0) = _
  rw [dif_pos (down_rel' i)]
  simp

#print axioms coneOfContraction
#print axioms coneCycle

end

end C4
