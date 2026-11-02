module
public import C4.KProjectiveLifting
public import C4.WeakTransferAlgebra

@[expose] public section

/-!
# Weak-data transfer of the fourfold obstruction through an interleaving

This module proves the replacement-to-obstruction implication with the data
that a strict interleaving with an ACYCLIC (possibly nonzero) opposite lane
actually supplies. No quotient, monomorphism, cofibrant replacement, homotopy
inverse or replacement-side K-projectivity is used.

Input (all cochain complexes of `B`-modules, diagrammatic composition):

* original complexes `P₀,…,P₄` with adjacent maps `xᵢ`, the sources `P₀,P₁,P₂`
  K-projective;
* replacement stages `Q₀ → ⋯ → Q₄` (maps `bᵢ`) and acyclic middle objects
  `Z₀,Z₁,Z₂` with forward crossings `αᵢ : Qᵢ ⟶ Zᵢ`, backward crossings
  `βᵢ : Zᵢ ⟶ Qᵢ₊₂` and opposite-lane maps `oᵢ : Zᵢ ⟶ Zᵢ₊₁`, satisfying exactly
  the two interleaving laws and both naturalities:
  `bᵢ ≫ bᵢ₊₁ = αᵢ ≫ βᵢ`, `bᵢ ≫ αᵢ₊₁ = αᵢ ≫ oᵢ`, `βᵢ ≫ bᵢ₊₂ = oᵢ ≫ βᵢ₊₁`,
  `β₀ ≫ α₂ = o₀ ≫ o₁`;
* a homotopy-commutative ladder `uᵢ : Pᵢ ⟶ Qᵢ`, `xᵢ ≫ uᵢ₊₁ ∼ uᵢ ≫ bᵢ`, whose
  rungs `u₂,u₃,u₄` are quasi-isomorphisms.

Output: a complete fourfold defining system on the ORIGINAL complexes,
including a tertiary filler of its terminal. Every filler is constructed;
none of the coherence equations is assumed.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex.HomComplex

/-- In a group of exponent two, an equation follows from the vanishing of the
sum of its two sides. -/
theorem char2_eq {A : Type*} [AddCommGroup A] (h2 : ∀ a : A, a + a = 0) {x y : A}
    (h : x + y = 0) : x = y := by
  have hx : x = x + (y + y) := by rw [h2, add_zero]
  rw [hx, ← add_assoc, h, zero_add]

/-- Close a characteristic-two identity between HomComplex cochains. -/
macro "char2_cochain" : tactic =>
  `(tactic| (
    apply char2_eq cochain_add_self_zero
    abel_nf
    try simp only [two_zsmul, two_nsmul, cochain_add_self_zero, add_zero, zero_add]))

/-- Close a characteristic-two identity between `B`-linear maps. -/
macro "char2_hom" : tactic =>
  `(tactic| (
    apply char2_eq moduleHom_add_self_zero
    abel_nf
    try simp only [two_zsmul, two_nsmul, moduleHom_add_self_zero, add_zero, zero_add]))

/-- Component of a product of two degree `-1` cochains, at the canonical
intermediate degree. -/
theorem cochain_comp_v_m1_m1
    {F G K : CochainComplex (ModuleCat B) ℤ}
    (f : Cochain F G (-1)) (g : Cochain G K (-1)) (h : -1 + -1 = (-2 : ℤ))
    (p q : ℤ) (hpq : p + (-2) = q) :
    (f.comp g h).v p q hpq = f.v p (p - 1) (by omega) ≫ g.v (p - 1) q (by omega) :=
  Cochain.comp_v f g h p (p - 1) q (by omega) (by omega)

variable {P0 P1 P2 P3 P4 Q0 Q1 Q2 Q3 Q4 Z0 Z1 Z2 : CochainComplex (ModuleCat B) ℤ}

/-! ### The comparison words and their curvature -/

/-- The replacement-side primary comparison word `λᵢ;bᵢ₊₁ + xᵢ;λᵢ₊₁ + θᵢ;βᵢ`. -/
def interleavedPrimaryWord {Z : CochainComplex (ModuleCat B) ℤ}
    (x : P0 ⟶ P1) (b : Q1 ⟶ Q2) (β : Z ⟶ Q2)
    (l0 : Cochain P0 Q1 (-1)) (l1 : Cochain P1 Q2 (-1)) (θ : Cochain P0 Z (-1)) :
    Cochain P0 Q2 (-1) :=
  l0.comp (Cochain.ofHom b) (by decide) + (Cochain.ofHom x).comp l1 (by decide) +
    θ.comp (Cochain.ofHom β) (by decide)

/-- The primary curvature is the original composite followed by the rung. The
strict zero of the quotient route is replaced by the forward/backward law and
a nullhomotopy `θ` into the acyclic opposite lane. -/
theorem interleavedPrimaryWord_d {Z : CochainComplex (ModuleCat B) ℤ}
    (x0 : P0 ⟶ P1) (x1 : P1 ⟶ P2) (u0 : P0 ⟶ Q0) (u1 : P1 ⟶ Q1) (u2 : P2 ⟶ Q2)
    (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2) (α : Q0 ⟶ Z) (β : Z ⟶ Q2)
    (l0 : Cochain P0 Q1 (-1)) (l1 : Cochain P1 Q2 (-1)) (θ : Cochain P0 Z (-1))
    (hl0 : δ (-1) 0 l0 = Cochain.ofHom (x0 ≫ u1) + Cochain.ofHom (u0 ≫ b0))
    (hl1 : δ (-1) 0 l1 = Cochain.ofHom (x1 ≫ u2) + Cochain.ofHom (u1 ≫ b1))
    (hθ : δ (-1) 0 θ = Cochain.ofHom (u0 ≫ α))
    (hr : b0 ≫ b1 = α ≫ β) :
    δ (-1) 0 (interleavedPrimaryWord x0 b1 β l0 l1 θ) =
      (Cochain.ofHom (x0 ≫ x1)).comp (Cochain.ofHom u2) (add_zero 0) := by
  have hr' : u0 ≫ b0 ≫ b1 = u0 ≫ α ≫ β := by rw [hr]
  simp only [interleavedPrimaryWord, δ_add, unsigned_δ_comp_any, Int.reduceSub,
    Int.reduceAdd, Int.reduceNeg, δ_ofHom, hl0, hl1, hθ, Cochain.comp_zero,
    Cochain.zero_comp, zero_add, add_zero, Cochain.comp_add, Cochain.add_comp,
    ← Cochain.ofHom_comp, Category.assoc, hr']
  char2_cochain

/-- The opposite-lane comparison word `λᵢ;αᵢ₊₁ + θᵢ;oᵢ + xᵢ;θᵢ₊₁`. -/
def interleavedOmega {Za Zb : CochainComplex (ModuleCat B) ℤ}
    (x0 : P0 ⟶ P1) (α1 : Q1 ⟶ Zb) (o0 : Za ⟶ Zb)
    (l0 : Cochain P0 Q1 (-1)) (θ0 : Cochain P0 Za (-1)) (θ1 : Cochain P1 Zb (-1)) :
    Cochain P0 Zb (-1) :=
  l0.comp (Cochain.ofHom α1) (by decide) + θ0.comp (Cochain.ofHom o0) (by decide) +
    (Cochain.ofHom x0).comp θ1 (by decide)

/-- Naturality of the forward crossing makes the opposite-lane word a cocycle. -/
theorem interleavedOmega_d {Za Zb : CochainComplex (ModuleCat B) ℤ}
    (x0 : P0 ⟶ P1) (u0 : P0 ⟶ Q0) (u1 : P1 ⟶ Q1)
    (b0 : Q0 ⟶ Q1) (α0 : Q0 ⟶ Za) (α1 : Q1 ⟶ Zb) (o0 : Za ⟶ Zb)
    (l0 : Cochain P0 Q1 (-1)) (θ0 : Cochain P0 Za (-1)) (θ1 : Cochain P1 Zb (-1))
    (hl0 : δ (-1) 0 l0 = Cochain.ofHom (x0 ≫ u1) + Cochain.ofHom (u0 ≫ b0))
    (hθ0 : δ (-1) 0 θ0 = Cochain.ofHom (u0 ≫ α0))
    (hθ1 : δ (-1) 0 θ1 = Cochain.ofHom (u1 ≫ α1))
    (hn : b0 ≫ α1 = α0 ≫ o0) :
    δ (-1) 0 (interleavedOmega x0 α1 o0 l0 θ0 θ1) = 0 := by
  have hn' : u0 ≫ b0 ≫ α1 = u0 ≫ α0 ≫ o0 := by rw [hn]
  simp only [interleavedOmega, δ_add, unsigned_δ_comp_any, Int.reduceSub,
    Int.reduceAdd, Int.reduceNeg, δ_ofHom, hl0, hθ0, hθ1, Cochain.comp_zero,
    Cochain.zero_comp, zero_add, add_zero, Cochain.comp_add, Cochain.add_comp,
    ← Cochain.ofHom_comp, Category.assoc, hn']
  char2_cochain

/-- The replacement-side secondary comparison word. -/
def interleavedSecondaryWord {Z : CochainComplex (ModuleCat B) ℤ}
    (H : Cochain P0 P2 (-1)) (l2 : Cochain P2 Q3 (-1)) (ν0 : Cochain P0 Q2 (-2))
    (b2 : Q2 ⟶ Q3) (x0 : P0 ⟶ P1) (ν1 : Cochain P1 Q3 (-2))
    (π : Cochain P0 Z (-2)) (β1 : Z ⟶ Q3) : Cochain P0 Q3 (-2) :=
  H.comp l2 (by decide) + ν0.comp (Cochain.ofHom b2) (by decide) +
    (Cochain.ofHom x0).comp ν1 (by decide) + π.comp (Cochain.ofHom β1) (by decide)

/-- The secondary curvature is the original threefold terminal followed by the
rung `u₃`. -/
theorem interleavedSecondaryWord_d
    (x0 : P0 ⟶ P1) (x1 : P1 ⟶ P2) (x2 : P2 ⟶ P3)
    (u2 : P2 ⟶ Q2) (u3 : P3 ⟶ Q3) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3)
    (α1 : Q1 ⟶ Z1) (β0 : Z0 ⟶ Q2) (β1 : Z1 ⟶ Q3) (o0 : Z0 ⟶ Z1)
    (l0 : Cochain P0 Q1 (-1)) (l1 : Cochain P1 Q2 (-1)) (l2 : Cochain P2 Q3 (-1))
    (θ0 : Cochain P0 Z0 (-1)) (θ1 : Cochain P1 Z1 (-1))
    (H0 : Cochain P0 P2 (-1)) (H1 : Cochain P1 P3 (-1))
    (ν0 : Cochain P0 Q2 (-2)) (ν1 : Cochain P1 Q3 (-2)) (π : Cochain P0 Z1 (-2))
    (dH0 : δ (-1) 0 H0 = Cochain.ofHom (x0 ≫ x1))
    (hl2 : δ (-1) 0 l2 = Cochain.ofHom (x2 ≫ u3) + Cochain.ofHom (u2 ≫ b2))
    (hν0 : δ (-2) (-1) ν0 = interleavedPrimaryWord x0 b1 β0 l0 l1 θ0 +
      H0.comp (Cochain.ofHom u2) (add_zero (-1)))
    (hν1 : δ (-2) (-1) ν1 = interleavedPrimaryWord x1 b2 β1 l1 l2 θ1 +
      H1.comp (Cochain.ofHom u3) (add_zero (-1)))
    (hπ : δ (-2) (-1) π = interleavedOmega x0 α1 o0 l0 θ0 θ1)
    (hr : b1 ≫ b2 = α1 ≫ β1) (hm : β0 ≫ b2 = o0 ≫ β1) :
    δ (-2) (-1) (interleavedSecondaryWord H0 l2 ν0 b2 x0 ν1 π β1) =
      (threefoldTerminal x0 x2 H0 H1).comp (Cochain.ofHom u3) (add_zero (-1)) := by
  have hr' (n : ℤ) : b1.f n ≫ b2.f n = α1.f n ≫ β1.f n := by
    simpa using congrArg (fun f : Q1 ⟶ Q3 => f.f n) hr
  have hm' (n : ℤ) : β0.f n ≫ b2.f n = o0.f n ≫ β1.f n := by
    simpa using congrArg (fun f : Z0 ⟶ Q3 => f.f n) hm
  simp only [interleavedSecondaryWord, interleavedPrimaryWord, interleavedOmega,
    threefoldTerminal, δ_add, unsigned_δ_comp_any, Int.reduceSub,
    Int.reduceAdd, Int.reduceNeg, δ_ofHom, dH0, hl2, hν0, hν1, hπ,
    Cochain.comp_zero, Cochain.zero_comp, zero_add, add_zero,
    Cochain.comp_add, Cochain.add_comp]
  apply Cochain.ext
  intro p q hpq
  simp only [Cochain.add_v, Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    Cochain.ofHom_v, HomologicalComplex.comp_f, Category.assoc, hr', hm']
  char2_hom

/-- The opposite-lane secondary correction word. -/
def interleavedChi {Zb Zc : CochainComplex (ModuleCat B) ℤ}
    (ν0 : Cochain P0 Q2 (-2)) (α2 : Q2 ⟶ Zc) (π0 : Cochain P0 Zb (-2)) (o1 : Zb ⟶ Zc)
    (H0 : Cochain P0 P2 (-1)) (θ2 : Cochain P2 Zc (-1)) (x0 : P0 ⟶ P1)
    (π1 : Cochain P1 Zc (-2)) : Cochain P0 Zc (-2) :=
  ν0.comp (Cochain.ofHom α2) (by decide) + π0.comp (Cochain.ofHom o1) (by decide) +
    H0.comp θ2 (by decide) + (Cochain.ofHom x0).comp π1 (by decide)

/-- The opposite-lane secondary correction is a cocycle. This uses the second
interleaving law `β₀ ≫ α₂ = o₀ ≫ o₁` and naturality of the forward crossing. -/
theorem interleavedChi_d
    (x0 : P0 ⟶ P1) (x1 : P1 ⟶ P2) (u2 : P2 ⟶ Q2)
    (b1 : Q1 ⟶ Q2) (α1 : Q1 ⟶ Z1) (α2 : Q2 ⟶ Z2) (β0 : Z0 ⟶ Q2)
    (o0 : Z0 ⟶ Z1) (o1 : Z1 ⟶ Z2)
    (l0 : Cochain P0 Q1 (-1)) (l1 : Cochain P1 Q2 (-1))
    (θ0 : Cochain P0 Z0 (-1)) (θ1 : Cochain P1 Z1 (-1)) (θ2 : Cochain P2 Z2 (-1))
    (H0 : Cochain P0 P2 (-1)) (ν0 : Cochain P0 Q2 (-2))
    (π0 : Cochain P0 Z1 (-2)) (π1 : Cochain P1 Z2 (-2))
    (dH0 : δ (-1) 0 H0 = Cochain.ofHom (x0 ≫ x1))
    (hθ2 : δ (-1) 0 θ2 = Cochain.ofHom (u2 ≫ α2))
    (hν0 : δ (-2) (-1) ν0 = interleavedPrimaryWord x0 b1 β0 l0 l1 θ0 +
      H0.comp (Cochain.ofHom u2) (add_zero (-1)))
    (hπ0 : δ (-2) (-1) π0 = interleavedOmega x0 α1 o0 l0 θ0 θ1)
    (hπ1 : δ (-2) (-1) π1 = interleavedOmega x1 α2 o1 l1 θ1 θ2)
    (hn : b1 ≫ α2 = α1 ≫ o1) (hc : β0 ≫ α2 = o0 ≫ o1) :
    δ (-2) (-1) (interleavedChi ν0 α2 π0 o1 H0 θ2 x0 π1) = 0 := by
  have hn' (n : ℤ) : b1.f n ≫ α2.f n = α1.f n ≫ o1.f n := by
    simpa using congrArg (fun f : Q1 ⟶ Z2 => f.f n) hn
  have hc' (n : ℤ) : β0.f n ≫ α2.f n = o0.f n ≫ o1.f n := by
    simpa using congrArg (fun f : Z0 ⟶ Z2 => f.f n) hc
  simp only [interleavedChi, interleavedPrimaryWord, interleavedOmega,
    δ_add, unsigned_δ_comp_any, Int.reduceSub,
    Int.reduceAdd, Int.reduceNeg, δ_ofHom, dH0, hθ2, hν0, hπ0, hπ1,
    Cochain.comp_zero, Cochain.zero_comp, zero_add, add_zero,
    Cochain.comp_add, Cochain.add_comp]
  apply Cochain.ext
  intro p q hpq
  simp only [Cochain.add_v, Cochain.zero_v, Cochain.comp_zero_cochain_v,
    Cochain.zero_cochain_comp_v, Cochain.ofHom_v, HomologicalComplex.comp_f,
    Category.assoc, hn', hc']
  char2_hom

/-- The replacement-side tertiary comparison word. -/
def interleavedTertiaryWord
    (K0 : Cochain P0 P3 (-2)) (l3 : Cochain P3 Q4 (-1)) (H0 : Cochain P0 P2 (-1))
    (ν2 : Cochain P2 Q4 (-2)) (ρ0 : Cochain P0 Q3 (-3)) (b3 : Q3 ⟶ Q4)
    (x0 : P0 ⟶ P1) (ρ1 : Cochain P1 Q4 (-3)) (σ : Cochain P0 Z2 (-3))
    (β2 : Z2 ⟶ Q4) : Cochain P0 Q4 (-3) :=
  K0.comp l3 (by decide) + H0.comp ν2 (by decide) +
    ρ0.comp (Cochain.ofHom b3) (by decide) + (Cochain.ofHom x0).comp ρ1 (by decide) +
    σ.comp (Cochain.ofHom β2) (by decide)

/-- The tertiary curvature is the original fourfold terminal followed by `u₄`. -/
theorem interleavedTertiaryWord_d
    (x0 : P0 ⟶ P1) (x1 : P1 ⟶ P2) (x2 : P2 ⟶ P3) (x3 : P3 ⟶ P4)
    (u3 : P3 ⟶ Q3) (u4 : P4 ⟶ Q4)
    (b2 : Q2 ⟶ Q3) (b3 : Q3 ⟶ Q4)
    (α2 : Q2 ⟶ Z2) (β1 : Z1 ⟶ Q3) (β2 : Z2 ⟶ Q4) (o1 : Z1 ⟶ Z2)
    (l2 : Cochain P2 Q3 (-1)) (l3 : Cochain P3 Q4 (-1)) (θ2 : Cochain P2 Z2 (-1))
    (H0 : Cochain P0 P2 (-1)) (H1 : Cochain P1 P3 (-1)) (H2 : Cochain P2 P4 (-1))
    (ν0 : Cochain P0 Q2 (-2)) (ν1 : Cochain P1 Q3 (-2)) (ν2 : Cochain P2 Q4 (-2))
    (π0 : Cochain P0 Z1 (-2)) (π1 : Cochain P1 Z2 (-2))
    (K0 : Cochain P0 P3 (-2)) (K1 : Cochain P1 P4 (-2))
    (ρ0 : Cochain P0 Q3 (-3)) (ρ1 : Cochain P1 Q4 (-3)) (σ : Cochain P0 Z2 (-3))
    (dH0 : δ (-1) 0 H0 = Cochain.ofHom (x0 ≫ x1))
    (hl3 : δ (-1) 0 l3 = Cochain.ofHom (x3 ≫ u4) + Cochain.ofHom (u3 ≫ b3))
    (dK0 : δ (-2) (-1) K0 = threefoldTerminal x0 x2 H0 H1)
    (hν2 : δ (-2) (-1) ν2 = interleavedPrimaryWord x2 b3 β2 l2 l3 θ2 +
      H2.comp (Cochain.ofHom u4) (add_zero (-1)))
    (hρ0 : δ (-3) (-2) ρ0 = interleavedSecondaryWord H0 l2 ν0 b2 x0 ν1 π0 β1 +
      K0.comp (Cochain.ofHom u3) (add_zero (-2)))
    (hρ1 : δ (-3) (-2) ρ1 = interleavedSecondaryWord H1 l3 ν1 b3 x1 ν2 π1 β2 +
      K1.comp (Cochain.ofHom u4) (add_zero (-2)))
    (hσ : δ (-3) (-2) σ = interleavedChi ν0 α2 π0 o1 H0 θ2 x0 π1)
    (hr : b2 ≫ b3 = α2 ≫ β2) (hm : β1 ≫ b3 = o1 ≫ β2) :
    δ (-3) (-2) (interleavedTertiaryWord K0 l3 H0 ν2 ρ0 b3 x0 ρ1 σ β2) =
      (fourfoldTerminal x0 x3 H0 H2 K0 K1).comp (Cochain.ofHom u4) (add_zero (-2)) := by
  have hr' (n : ℤ) : b2.f n ≫ b3.f n = α2.f n ≫ β2.f n := by
    simpa using congrArg (fun f : Q2 ⟶ Q4 => f.f n) hr
  have hm' (n : ℤ) : β1.f n ≫ b3.f n = o1.f n ≫ β2.f n := by
    simpa using congrArg (fun f : Z1 ⟶ Q4 => f.f n) hm
  simp only [interleavedTertiaryWord, interleavedSecondaryWord, interleavedPrimaryWord,
    interleavedChi, threefoldTerminal, fourfoldTerminal,
    δ_add, unsigned_δ_comp_any, Int.reduceSub,
    Int.reduceAdd, Int.reduceNeg, δ_ofHom, dH0, hl3, dK0, hν2, hρ0, hρ1, hσ,
    Cochain.comp_zero, Cochain.zero_comp, zero_add, add_zero,
    Cochain.comp_add, Cochain.add_comp]
  apply Cochain.ext
  intro p q hpq
  simp only [Cochain.add_v, cochain_comp_v_m1_m1, Cochain.comp_zero_cochain_v,
    Cochain.zero_cochain_comp_v, Cochain.ofHom_v, HomologicalComplex.comp_f,
    Category.assoc, hr', hm']
  char2_hom

/-- `a = b + c` gives `c = a + b` in a group of exponent two. -/
theorem char2_isolate {A : Type*} [AddCommGroup A] (h2 : ∀ a : A, a + a = 0) {a b c : A}
    (h : a = b + c) : c = a + b := by
  rw [h, add_comm b c, add_assoc, h2, add_zero]

/-! ### The weak-data transfer theorem -/

/-- A complete fourfold defining system WITH a tertiary filler of its terminal,
in HomComplex form: three primary fillers, two secondary fillers and a degree
`-3` cochain whose differential is the full fourfold terminal. -/
structure FourfoldCochainSystem (x0 : P0 ⟶ P1) (x1 : P1 ⟶ P2) (x2 : P2 ⟶ P3)
    (x3 : P3 ⟶ P4) where
  h02 : Cochain P0 P2 (-1)
  h13 : Cochain P1 P3 (-1)
  h24 : Cochain P2 P4 (-1)
  z03 : Cochain P0 P3 (-2)
  z14 : Cochain P1 P4 (-2)
  w : Cochain P0 P4 (-3)
  d02 : δ (-1) 0 h02 = Cochain.ofHom (x0 ≫ x1)
  d13 : δ (-1) 0 h13 = Cochain.ofHom (x1 ≫ x2)
  d24 : δ (-1) 0 h24 = Cochain.ofHom (x2 ≫ x3)
  d03 : δ (-2) (-1) z03 = threefoldTerminal x0 x2 h02 h13
  d14 : δ (-2) (-1) z14 = threefoldTerminal x1 x3 h13 h24
  dw : δ (-3) (-2) w = fourfoldTerminal x0 x3 h02 h24 z03 z14

/-- The data supplied by a strict interleaving with an acyclic opposite lane,
sampled at five cuts, together with a homotopy-commutative ladder from the
original complexes. Only `u₂,u₃,u₄` are required to be quasi-isomorphisms. -/
structure CochainInterleavingLadder (x0 : P0 ⟶ P1) (x1 : P1 ⟶ P2) (x2 : P2 ⟶ P3)
    (x3 : P3 ⟶ P4) where
  Q0 : CochainComplex (ModuleCat B) ℤ
  Q1 : CochainComplex (ModuleCat B) ℤ
  Q2 : CochainComplex (ModuleCat B) ℤ
  Q3 : CochainComplex (ModuleCat B) ℤ
  Q4 : CochainComplex (ModuleCat B) ℤ
  Z0 : CochainComplex (ModuleCat B) ℤ
  Z1 : CochainComplex (ModuleCat B) ℤ
  Z2 : CochainComplex (ModuleCat B) ℤ
  b0 : Q0 ⟶ Q1
  b1 : Q1 ⟶ Q2
  b2 : Q2 ⟶ Q3
  b3 : Q3 ⟶ Q4
  α0 : Q0 ⟶ Z0
  α1 : Q1 ⟶ Z1
  α2 : Q2 ⟶ Z2
  β0 : Z0 ⟶ Q2
  β1 : Z1 ⟶ Q3
  β2 : Z2 ⟶ Q4
  o0 : Z0 ⟶ Z1
  o1 : Z1 ⟶ Z2
  acyclic0 : Z0.Acyclic
  acyclic1 : Z1.Acyclic
  acyclic2 : Z2.Acyclic
  r01 : b0 ≫ b1 = α0 ≫ β0
  r12 : b1 ≫ b2 = α1 ≫ β1
  r23 : b2 ≫ b3 = α2 ≫ β2
  n0 : b0 ≫ α1 = α0 ≫ o0
  n1 : b1 ≫ α2 = α1 ≫ o1
  m0 : β0 ≫ b2 = o0 ≫ β1
  m1 : β1 ≫ b3 = o1 ≫ β2
  c0 : β0 ≫ α2 = o0 ≫ o1
  u0 : P0 ⟶ Q0
  u1 : P1 ⟶ Q1
  u2 : P2 ⟶ Q2
  u3 : P3 ⟶ Q3
  u4 : P4 ⟶ Q4
  qi2 : QuasiIso u2
  qi3 : QuasiIso u3
  qi4 : QuasiIso u4
  l0 : Homotopy (x0 ≫ u1) (u0 ≫ b0)
  l1 : Homotopy (x1 ≫ u2) (u1 ≫ b1)
  l2 : Homotopy (x2 ≫ u3) (u2 ≫ b2)
  l3 : Homotopy (x3 ≫ u4) (u3 ≫ b3)

theorem ladder_cochain_d {P Q R S : CochainComplex (ModuleCat B) ℤ}
    {x : P ⟶ Q} {u' : Q ⟶ S} {u : P ⟶ R} {b : R ⟶ S} (h : Homotopy (x ≫ u') (u ≫ b)) :
    δ (-1) 0 (Cochain.ofHomotopy h) = Cochain.ofHom (x ≫ u') + Cochain.ofHom (u ≫ b) := by
  simpa only [cochain_sub] using δ_ofHomotopy h

/-- **Weak-data transfer.** An interleaving with an acyclic opposite lane and a
homotopy-commutative quasi-isomorphism ladder from K-projective originals
produces a complete fourfold defining system with a tertiary filler on the
ORIGINAL complexes. All fillers are constructed by the K-projective lifts. -/
theorem CochainInterleavingLadder.nonempty_fourfold
    [P0.IsKProjective] [P1.IsKProjective] [P2.IsKProjective]
    {x0 : P0 ⟶ P1} {x1 : P1 ⟶ P2} {x2 : P2 ⟶ P3} {x3 : P3 ⟶ P4}
    (L : CochainInterleavingLadder x0 x1 x2 x3) :
    Nonempty (FourfoldCochainSystem x0 x1 x2 x3) := by
  have := L.qi2
  have := L.qi3
  have := L.qi4
  have hl0 := ladder_cochain_d L.l0
  have hl1 := ladder_cochain_d L.l1
  have hl2 := ladder_cochain_d L.l2
  have hl3 := ladder_cochain_d L.l3
  set l0 := Cochain.ofHomotopy L.l0
  set l1 := Cochain.ofHomotopy L.l1
  set l2 := Cochain.ofHomotopy L.l2
  set l3 := Cochain.ofHomotopy L.l3
  -- nullhomotopies of the forward crossings into the acyclic lane
  obtain ⟨θ0, hθ0⟩ := kProjective_acyclic_coboundary (P := P0) L.acyclic0 0 (-1)
    (by decide) 1 (by decide) (Cochain.ofHom (L.u0 ≫ L.α0)) (δ_ofHom _)
  obtain ⟨θ1, hθ1⟩ := kProjective_acyclic_coboundary (P := P1) L.acyclic1 0 (-1)
    (by decide) 1 (by decide) (Cochain.ofHom (L.u1 ≫ L.α1)) (δ_ofHom _)
  obtain ⟨θ2, hθ2⟩ := kProjective_acyclic_coboundary (P := P2) L.acyclic2 0 (-1)
    (by decide) 1 (by decide) (Cochain.ofHom (L.u2 ≫ L.α2)) (δ_ofHom _)
  -- primary fillers and their comparison corrections
  obtain ⟨H0, ν0, dH0, eν0⟩ := kProjective_relative_lift (P := P0) L.u2 (-1) 0 (-2)
    (by decide) (by decide) 1 (by decide) (Cochain.ofHom (x0 ≫ x1)) (δ_ofHom _)
    (interleavedPrimaryWord x0 L.b1 L.β0 l0 l1 θ0)
    (interleavedPrimaryWord_d x0 x1 L.u0 L.u1 L.u2 L.b0 L.b1 L.α0 L.β0 l0 l1 θ0
      hl0 hl1 hθ0 L.r01)
  obtain ⟨H1, ν1, dH1, eν1⟩ := kProjective_relative_lift (P := P1) L.u3 (-1) 0 (-2)
    (by decide) (by decide) 1 (by decide) (Cochain.ofHom (x1 ≫ x2)) (δ_ofHom _)
    (interleavedPrimaryWord x1 L.b2 L.β1 l1 l2 θ1)
    (interleavedPrimaryWord_d x1 x2 L.u1 L.u2 L.u3 L.b1 L.b2 L.α1 L.β1 l1 l2 θ1
      hl1 hl2 hθ1 L.r12)
  obtain ⟨H2, ν2, dH2, eν2⟩ := kProjective_relative_lift (P := P2) L.u4 (-1) 0 (-2)
    (by decide) (by decide) 1 (by decide) (Cochain.ofHom (x2 ≫ x3)) (δ_ofHom _)
    (interleavedPrimaryWord x2 L.b3 L.β2 l2 l3 θ2)
    (interleavedPrimaryWord_d x2 x3 L.u2 L.u3 L.u4 L.b2 L.b3 L.α2 L.β2 l2 l3 θ2
      hl2 hl3 hθ2 L.r23)
  have hν0 := char2_isolate cochain_add_self_zero eν0
  have hν1 := char2_isolate cochain_add_self_zero eν1
  have hν2 := char2_isolate cochain_add_self_zero eν2
  -- opposite-lane secondary corrections
  obtain ⟨π0, hπ0⟩ := kProjective_acyclic_coboundary (P := P0) L.acyclic1 (-1) (-2)
    (by decide) 0 (by decide) _
    (interleavedOmega_d x0 L.u0 L.u1 L.b0 L.α0 L.α1 L.o0 l0 θ0 θ1 hl0 hθ0 hθ1 L.n0)
  obtain ⟨π1, hπ1⟩ := kProjective_acyclic_coboundary (P := P1) L.acyclic2 (-1) (-2)
    (by decide) 0 (by decide) _
    (interleavedOmega_d x1 L.u1 L.u2 L.b1 L.α1 L.α2 L.o1 l1 θ1 θ2 hl1 hθ1 hθ2 L.n1)
  -- secondary fillers
  obtain ⟨K0, ρ0, dK0, eρ0⟩ := kProjective_relative_lift (P := P0) L.u3 (-2) (-1) (-3)
    (by decide) (by decide) 0 (by decide) (threefoldTerminal x0 x2 H0 H1)
    (threefoldTerminal_closed x0 x1 x2 H0 H1 dH0 dH1)
    (interleavedSecondaryWord H0 l2 ν0 L.b2 x0 ν1 π0 L.β1)
    (interleavedSecondaryWord_d x0 x1 x2 L.u2 L.u3 L.b1 L.b2 L.α1 L.β0 L.β1 L.o0
      l0 l1 l2 θ0 θ1 H0 H1 ν0 ν1 π0 dH0 hl2 hν0 hν1 hπ0 L.r12 L.m0)
  obtain ⟨K1, ρ1, dK1, eρ1⟩ := kProjective_relative_lift (P := P1) L.u4 (-2) (-1) (-3)
    (by decide) (by decide) 0 (by decide) (threefoldTerminal x1 x3 H1 H2)
    (threefoldTerminal_closed x1 x2 x3 H1 H2 dH1 dH2)
    (interleavedSecondaryWord H1 l3 ν1 L.b3 x1 ν2 π1 L.β2)
    (interleavedSecondaryWord_d x1 x2 x3 L.u3 L.u4 L.b2 L.b3 L.α2 L.β1 L.β2 L.o1
      l1 l2 l3 θ1 θ2 H1 H2 ν1 ν2 π1 dH1 hl3 hν1 hν2 hπ1 L.r23 L.m1)
  have hρ0 := char2_isolate cochain_add_self_zero eρ0
  have hρ1 := char2_isolate cochain_add_self_zero eρ1
  -- opposite-lane tertiary correction
  obtain ⟨σ, hσ⟩ := kProjective_acyclic_coboundary (P := P0) L.acyclic2 (-2) (-3)
    (by decide) (-1) (by decide) _
    (interleavedChi_d x0 x1 L.u2 L.b1 L.α1 L.α2 L.β0 L.o0 L.o1 l0 l1 θ0 θ1 θ2 H0 ν0
      π0 π1 dH0 hθ2 hν0 hπ0 hπ1 L.n1 L.c0)
  -- the tertiary filler
  obtain ⟨w, _, dw, _⟩ := kProjective_relative_lift (P := P0) L.u4 (-3) (-2) (-4)
    (by decide) (by decide) (-1) (by decide) (fourfoldTerminal x0 x3 H0 H2 K0 K1)
    (fourfoldTerminal_closed x0 x1 x2 x3 H0 H1 H2 K0 K1 dH0 dH2 dK0 dK1)
    (interleavedTertiaryWord K0 l3 H0 ν2 ρ0 L.b3 x0 ρ1 σ L.β2)
    (interleavedTertiaryWord_d x0 x1 x2 x3 L.u3 L.u4 L.b2 L.b3 L.α2 L.β1 L.β2 L.o1
      l2 l3 θ2 H0 H1 H2 ν0 ν1 ν2 π0 π1 K0 K1 ρ0 ρ1 σ dH0 hl3 dK0 hν2 hρ0 hρ1 hσ
      L.r23 L.m1)
  exact ⟨⟨H0, H1, H2, K0, K1, w, dH0, dH1, dH2, dK0, dK1, dw⟩⟩

#print axioms interleavedPrimaryWord_d
#print axioms interleavedSecondaryWord_d
#print axioms interleavedChi_d
#print axioms interleavedTertiaryWord_d
#print axioms CochainInterleavingLadder.nonempty_fourfold

end C4
