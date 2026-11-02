module
public import C4.DirectTransfer
public import C4.TerminalComponent

@[expose] public section

/-! # Supported chain families from the checked HomComplex adapter

All degree and differential equations below are on actual arbitrary
B-module complexes. This is the inverse-grading bridge needed by the
existing global defining-system and tertiary-filler interfaces.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex.HomComplex

/-- Equality transport for an arbitrary indexed family of module maps. -/
theorem indexed_map_naturality {P Q : ℤ → ModuleCat B}
    (f : ∀ i j, P i ⟶ Q j) {i i' j j' : ℤ} (hi : i=i') (hj : j=j') :
    eqToHom (congrArg P hi) ≫ f i' j' =
      f i j ≫ eqToHom (congrArg Q hj) := by
  subst i'
  subst j'
  simp

def doubleNegFrom (P : C4Complex) (i : ℤ) : P.X i ⟶ P.X (-(-i)) :=
  eqToHom (congrArg P.X (neg_neg i).symm)

def doubleNegTo (P : C4Complex) (i : ℤ) : P.X (-(-i)) ⟶ P.X i :=
  eqToHom (congrArg P.X (neg_neg i))

@[simp, reassoc] theorem doubleNegTo_from (P : C4Complex) (i : ℤ) :
    doubleNegTo P i ≫ doubleNegFrom P i = 𝟙 _ := by
  simp [doubleNegFrom, doubleNegTo]

@[simp, reassoc] theorem doubleNegFrom_to (P : C4Complex) (i : ℤ) :
    doubleNegFrom P i ≫ doubleNegTo P i = 𝟙 _ := by
  simp [doubleNegFrom, doubleNegTo]

@[reassoc] theorem doubleNeg_d_from (P : C4Complex) (i j : ℤ) :
    doubleNegFrom P i ≫ P.d (-(-i)) (-(-j)) =
      P.d i j ≫ doubleNegFrom P j :=
  indexed_map_naturality P.d (neg_neg i).symm (neg_neg j).symm

@[reassoc] theorem doubleNeg_d_to (P : C4Complex) (i j : ℤ) :
    P.d (-(-i)) (-(-j)) ≫ doubleNegTo P j =
      doubleNegTo P i ≫ P.d i j :=
  (indexed_map_naturality P.d (neg_neg i) (neg_neg j)).symm

/-- A cochain of reversed degree -k gives a supported chain degree-k family. -/
def chainFamily {P Q : C4Complex} {k : ℤ}
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (i j : ℤ) : P.X i ⟶ Q.X j :=
  if hij : i+k=j then
    doubleNegFrom P i ≫ z.v (-i) (-j) (by omega) ≫ doubleNegTo Q j
  else 0

theorem chainFamily_on {P Q : C4Complex} {k : ℤ}
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (i j : ℤ) (hij : i+k=j) :
    chainFamily z i j =
      doubleNegFrom P i ≫ z.v (-i) (-j) (by omega) ≫ doubleNegTo Q j := by
  rw [chainFamily, dif_pos hij]

@[simp] theorem chainFamily_off {P Q : C4Complex} {k : ℤ}
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (i j : ℤ) (hij : j ≠ i+k) : chainFamily z i j = 0 := by
  rw [chainFamily, dif_neg (Ne.symm hij)]

@[simp] theorem chainFamily_add {P Q : C4Complex} {k : ℤ}
    (z w : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (i j : ℤ) : chainFamily (z+w) i j = chainFamily z i j + chainFamily w i j := by
  by_cases h : i+k=j
  · simp only [chainFamily_on _ _ _ h, Cochain.add_v,
      Preadditive.add_comp, Preadditive.comp_add]
  · simp only [chainFamily, dif_neg h, add_zero]

@[simp] theorem chainFamily_zero {P Q : C4Complex} (k i j : ℤ) :
    chainFamily (0 : Cochain (reverseComplex P) (reverseComplex Q) (-k)) i j = 0 := by
  by_cases h : i+k=j
  · simp [chainFamily_on _ _ _ h]
  · simp [chainFamily, h]

/-- The transported degree-zero component is precisely the original map. -/
@[simp] theorem chainFamily_ofHom {P Q : C4Complex} (f : P ⟶ Q) (i : ℤ) :
    chainFamily (k := 0) (Cochain.ofHom (reverseMap f)) i i = f.f i := by
  rw [chainFamily_on _ _ _ (by omega), Cochain.ofHom_v]
  change doubleNegFrom P i ≫ f.f (-(-i)) ≫ doubleNegTo Q i = f.f i
  have hn {a b : ℤ} (h : a=b) :
      eqToHom (congrArg P.X h) ≫ f.f b ≫ eqToHom (congrArg Q.X h.symm) = f.f a := by
    subst b
    simp
  exact hn (neg_neg i).symm

theorem moduleHom_sign {M N : ModuleCat B} (m : ℤ) (f : M ⟶ N) :
    m.negOnePow • f = f := by
  have hn : -f=f := neg_eq_iff_add_eq_zero.mpr (moduleHom_add_self_zero f)
  rcases Int.even_or_odd m with h | h
  · rw [Int.negOnePow_even m h, one_smul]
  · rw [Int.negOnePow_odd m h, Units.neg_smul, one_smul, hn]

/-- The dg-Hom differential becomes the actual chain-family boundary,
with arbitrary degrees and no omitted support or boundary cases. -/
theorem chainFamily_d {P Q : C4Complex} {k : ℤ}
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (i j : ℤ) (hij : i+(k-1)=j) :
    chainFamily (k := k-1) (δ (-k) (-(k-1)) z) i j =
      chainFamily z i (j+1) ≫ Q.d (j+1) j +
        P.d i (i-1) ≫ chainFamily z (i-1) j := by
  rw [chainFamily_on _ _ _ hij,
    δ_v (-k) (-(k-1)) (by omega) z (-i) (-j) (by omega)
      (-(j+1)) (-(i-1)) (by omega) (by omega),
    chainFamily_on z i (j+1) (by omega),
    chainFamily_on z (i-1) j (by omega)]
  dsimp only [reverseComplex]
  simp only [moduleHom_sign, Preadditive.comp_add, Preadditive.add_comp,
    Category.assoc, doubleNeg_d_to, doubleNeg_d_from_assoc]

/-- Boundary evaluation with chosen neighboring chain degrees. -/
theorem chainFamily_d_at {P Q : C4Complex} {k : ℤ}
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (i i' j' j : ℤ) (hij : i+(k-1)=j) (hi : i'=i-1) (hj : j'=j+1) :
    chainFamily (k := k-1) (δ (-k) (-(k-1)) z) i j =
      chainFamily z i j' ≫ Q.d j' j + P.d i i' ≫ chainFamily z i' j := by
  rw [chainFamily_on _ _ _ hij,
    δ_v (-k) (-(k-1)) (by omega) z (-i) (-j) (by omega)
      (-j') (-i') (by omega) (by omega),
    chainFamily_on z i j' (by omega), chainFamily_on z i' j (by omega)]
  dsimp only [reverseComplex]
  simp only [moduleHom_sign, Preadditive.comp_add, Preadditive.add_comp,
    Category.assoc, doubleNeg_d_to, doubleNeg_d_from_assoc]

/-- Evaluation respects composition at a chosen actual intermediate chain degree. -/
theorem chainFamily_comp {P Q R : C4Complex} {k l : ℤ}
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (w : Cochain (reverseComplex Q) (reverseComplex R) (-l))
    (i j : ℤ) (hij : i+(k+l)=j) :
    chainFamily (k := k+l) (z.comp w (by omega)) i j =
      chainFamily z i (i+k) ≫ chainFamily w (i+k) j := by
  rw [chainFamily_on _ _ _ hij,
    Cochain.comp_v z w (by omega) (-i) (-(i+k)) (-j) (by omega) (by omega),
    chainFamily_on z i (i+k) rfl,
    chainFamily_on w (i+k) j (by omega)]
  simp only [Category.assoc, doubleNegTo_from_assoc, Category.id_comp]

/-- Composition at any chosen middle chain degree; useful when a degree is zero. -/
theorem chainFamily_comp_at {P Q R : C4Complex} {k l : ℤ}
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (w : Cochain (reverseComplex Q) (reverseComplex R) (-l))
    (i m j : ℤ) (hm : i+k=m) (hj : m+l=j) :
    chainFamily (k := k+l) (z.comp w (by omega)) i j =
      chainFamily z i m ≫ chainFamily w m j := by
  rw [chainFamily_on _ _ _ (by omega),
    Cochain.comp_v z w (by omega) (-i) (-m) (-j) (by omega) (by omega),
    chainFamily_on z i m hm, chainFamily_on w m j hj]
  simp only [Category.assoc, doubleNegTo_from_assoc, Category.id_comp]

@[reassoc] theorem chainFamily_target {P Q : C4Complex} {k : ℤ}
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-k))
    (i j j' : ℤ) (h : j=j') :
    chainFamily z i j ≫ eqToHom (congrArg Q.X h) = chainFamily z i j' := by
  simpa only [eqToHom_refl, Category.id_comp] using
    (indexed_map_naturality (chainFamily z) (i := i) rfl h).symm

/-- An actual boundary equation produces a genuine chain homotopy. -/
def chainHomotopyOfCochain {P Q : C4Complex} (f g : P ⟶ Q)
    (z : Cochain (reverseComplex P) (reverseComplex Q) (-1))
    (hz : δ (-1) 0 z = Cochain.ofHom (reverseMap f) + Cochain.ofHom (reverseMap g)) :
    Homotopy f g where
  hom := chainFamily (k := 1) z
  zero i j hij := chainFamily_off z i j (by
    intro h
    apply hij
    change j = i+1 at h
    change i+1 = j
    exact h.symm)
  comm i := by
    have hd := chainFamily_d (k := 1) z i i (by omega)
    have he : chainFamily (k := 0) (δ (-1) 0 z) i i = f.f i + g.f i := by
      rw [hz, chainFamily_add (k := 0), chainFamily_ofHom, chainFamily_ofHom]
    rw [he] at hd
    rw [dNext_eq (chainFamily (k := 1) z) (show (ComplexShape.down ℤ).Rel i (i-1) by
      change i-1+1=i; omega),
      prevD_eq (chainFamily (k := 1) z) (show (ComplexShape.down ℤ).Rel (i+1) i by rfl)]
    calc
      f.f i = (f.f i + g.f i) + g.f i := by
        rw [add_assoc, moduleHom_add_self_zero, add_zero]
      _ = _ := by rw [hd]; abel

#print axioms chainFamily_d
#print axioms chainFamily_comp
#print axioms chainHomotopyOfCochain
end C4
