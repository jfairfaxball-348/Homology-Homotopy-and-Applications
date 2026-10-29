module
public import C4.CanonicalGlobal

@[expose] public section

/-!
# Chain-homotopy transfer: genuine maps and primary fillers

This is the first structural part of the S165 comparison bridge. It works
for arbitrary chain complexes and actual Mathlib chain homotopies; no
isomorphism or termwise equality is presumed.

This file does NOT assert a complete transferred fourfold defining system,
secondary coherence, tertiary boundary, or the final metric inequalities.
-/

namespace C4

open CategoryTheory

/-- Explicit homotopy-inverse comparison of two genuine chain complexes.
Neither composite is required to equal the identity strictly. -/
structure ChainHomotopyEquivalence (P Q : C4Complex) where
  fromOriginal : P ⟶ Q
  toOriginal : Q ⟶ P
  original_retract : Homotopy (fromOriginal ≫ toOriginal) (𝟙 P)
  replacement_retract : Homotopy (toOriginal ≫ fromOriginal) (𝟙 Q)

/-- Transport an actual chain map between arbitrarily homotopy-equivalent
objects, without casting object components. -/
def ChainHomotopyEquivalence.transportMap
    {P Q P' Q' : C4Complex}
    (e : ChainHomotopyEquivalence P P')
    (f : P ⟶ Q)
    (e' : ChainHomotopyEquivalence Q Q') : P' ⟶ Q' :=
  e.toOriginal ≫ f ≫ e'.fromOriginal

/-- Any genuine primary nullhomotopy transports to the composite of the
two new adjacent arrows. The middle homotopy inverse contributes the
explicit correction; a strict inverse is NOT assumed. -/
def transferPrimary
    {P₀ P₁ P₂ Q₀ Q₁ Q₂ : C4Complex}
    (x : P₀ ⟶ P₁) (y : P₁ ⟶ P₂)
    (hxy : Homotopy (x ≫ y) 0)
    (a₀ : Q₀ ⟶ P₀) (b₁ : P₁ ⟶ Q₁)
    (a₁ : Q₁ ⟶ P₁) (b₂ : P₂ ⟶ Q₂)
    (hmid : Homotopy (b₁ ≫ a₁) (𝟙 P₁)) :
    Homotopy ((a₀ ≫ x ≫ b₁) ≫ (a₁ ≫ y ≫ b₂)) 0 := by
  let first :
      Homotopy ((a₀ ≫ x ≫ b₁) ≫ (a₁ ≫ y ≫ b₂))
        ((a₀ ≫ (x ≫ y)) ≫ b₂) :=
    relabelHomotopy ((hmid.compLeft (a₀ ≫ x)).compRight (y ≫ b₂))
      (by simp [Category.assoc]) (by simp [Category.assoc])
  let second : Homotopy ((a₀ ≫ (x ≫ y)) ≫ b₂) 0 :=
    relabelHomotopy ((hxy.compLeft a₀).compRight b₂)
      (by simp [Category.assoc]) (by simp)
  exact first.trans second

/-- The primary equation survives *arbitrary actual chain-homotopy
equivalences* of all three objects, not just isomorphism transports. -/
def ChainHomotopyEquivalence.transportPrimary
    {P₀ P₁ P₂ Q₀ Q₁ Q₂ : C4Complex}
    (e₀ : ChainHomotopyEquivalence P₀ Q₀)
    (e₁ : ChainHomotopyEquivalence P₁ Q₁)
    (e₂ : ChainHomotopyEquivalence P₂ Q₂)
    (x : P₀ ⟶ P₁) (y : P₁ ⟶ P₂)
    (hxy : Homotopy (x ≫ y) 0) :
    Homotopy ((e₀.transportMap x e₁) ≫ (e₁.transportMap y e₂)) 0 :=
  transferPrimary x y hxy e₀.toOriginal e₁.fromOriginal
    e₁.toOriginal e₂.fromOriginal e₁.original_retract

/-- If a transported adjacent arrow is nullhomotopic, then the original
arrow is nullhomotopic. Both homotopy-inverse equations are used. -/
def ChainHomotopyEquivalence.reflectNull
    {P Q P' Q' : C4Complex}
    (e : ChainHomotopyEquivalence P P')
    (e' : ChainHomotopyEquivalence Q Q')
    (f : P ⟶ Q)
    (h : Homotopy (e.transportMap f e') 0) :
    Homotopy f 0 := by
  let first : Homotopy f ((e.fromOriginal ≫ e.toOriginal) ≫ f) :=
    relabelHomotopy (e.original_retract.symm.compRight f)
      (by simp) rfl
  let second : Homotopy ((e.fromOriginal ≫ e.toOriginal) ≫ f)
      ((e.fromOriginal ≫ e.toOriginal) ≫ f ≫
        (e'.fromOriginal ≫ e'.toOriginal)) :=
    relabelHomotopy
      (e'.original_retract.symm.compLeft
        ((e.fromOriginal ≫ e.toOriginal) ≫ f))
      (by simp [Category.assoc]) (by simp [Category.assoc])
  let last : Homotopy
      ((e.fromOriginal ≫ e.toOriginal) ≫ f ≫
        (e'.fromOriginal ≫ e'.toOriginal)) 0 :=
    relabelHomotopy ((h.compLeft e.fromOriginal).compRight e'.toOriginal)
      (by simp [ChainHomotopyEquivalence.transportMap, Category.assoc])
      (by simp)
  exact (first.trans second).trans last

/-- Non-nullhomotopic adjacent classes stay non-nullhomotopic under
arbitrary chain-homotopy-equivalent replacement. This is an actual
homotopy-category detection statement, but not yet a residue-one
normalisation for the new representatives. -/
theorem ChainHomotopyEquivalence.transport_nonnull
    {P Q P' Q' : C4Complex}
    (e : ChainHomotopyEquivalence P P')
    (e' : ChainHomotopyEquivalence Q Q')
    (f : P ⟶ Q)
    (hf : ¬ Nonempty (Homotopy f 0)) :
    ¬ Nonempty (Homotopy (e.transportMap f e') 0) := by
  rintro ⟨h⟩
  exact hf ⟨e.reflectNull e' f h⟩

end C4
