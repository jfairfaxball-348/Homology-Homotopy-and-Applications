module
public import C4.DirectDefiningSystem

@[expose] public section

/-! # Finite coherent-lifting equations for arbitrary quasi-isomorphism targets -/
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true
namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex.HomComplex

lemma cochain_add_self_zero {P Q : CochainComplex (ModuleCat B) ℤ} {n : ℤ}
    (z : Cochain P Q n) : z+z=0 := neg_eq_iff_add_eq_zero.mp (cochain_neg z)

variable {P0 P1 P2 P3 P4 Q0 Q1 Q2 Q3 Q4 : CochainComplex (ModuleCat B) ℤ}

/-- The first replacement-side comparison word. -/
def weakPairWord (x : P0 ⟶ P1) (b : Q1 ⟶ Q2)
    (a : Cochain P0 Q1 (-1)) (a' : Cochain P1 Q2 (-1)) : Cochain P0 Q2 (-1) :=
  a.comp (Cochain.ofHom b) (by decide) + (Cochain.ofHom x).comp a' (by decide)

/-- Strict zero kills the first comparison curvature. -/
theorem weakPairWord_d
    (x01 : P0 ⟶ P1) (x12 : P1 ⟶ P2)
    (u0 : P0 ⟶ Q0) (u1 : P1 ⟶ Q1) (u2 : P2 ⟶ Q2)
    (b0 : Q0 ⟶ Q1) (b1 : Q1 ⟶ Q2)
    (a01 : Cochain P0 Q1 (-1)) (a12 : Cochain P1 Q2 (-1))
    (h01 : δ (-1) 0 a01 = Cochain.ofHom (u0 ≫ b0) + Cochain.ofHom (x01 ≫ u1))
    (h12 : δ (-1) 0 a12 = Cochain.ofHom (u1 ≫ b1) + Cochain.ofHom (x12 ≫ u2))
    (hz : b0 ≫ b1 = 0) :
    δ (-1) 0 (weakPairWord x01 b1 a01 a12) =
      (Cochain.ofHom (x01 ≫ x12)).comp (Cochain.ofHom u2) (by decide) := by
  have hz' : u0 ≫ b0 ≫ b1 = 0 := by rw [← Category.assoc, hz, comp_zero]
  simp only [weakPairWord, δ_add, unsigned_δ_comp_any, Int.reduceSub,
    Int.reduceAdd, Int.reduceNeg, δ_ofHom, h01, h12, Cochain.comp_zero,
    Cochain.zero_comp, zero_add, add_zero, Cochain.comp_add, Cochain.add_comp,
    ← Cochain.ofHom_comp, Category.assoc, hz', Cochain.ofHom_zero]
  first | rfl | (abel_nf <;> simp only [two_zsmul, two_nsmul, cochain_add_self_zero, add_zero, zero_add])

/-- The original three-edge terminal determined by the chosen primaries. -/
def threefoldTerminal (x : P0 ⟶ P1) (y : P2 ⟶ P3)
    (h : Cochain P0 P2 (-1)) (h' : Cochain P1 P3 (-1)) : Cochain P0 P3 (-1) :=
  h.comp (Cochain.ofHom y) (by decide) + (Cochain.ofHom x).comp h' (by decide)

theorem threefoldTerminal_closed
    (x01 : P0 ⟶ P1) (x12 : P1 ⟶ P2) (x23 : P2 ⟶ P3)
    (h02 : Cochain P0 P2 (-1)) (h13 : Cochain P1 P3 (-1))
    (d02 : δ (-1) 0 h02 = Cochain.ofHom (x01 ≫ x12))
    (d13 : δ (-1) 0 h13 = Cochain.ofHom (x12 ≫ x23)) :
    δ (-1) 0 (threefoldTerminal x01 x23 h02 h13) = 0 := by
  simp only [threefoldTerminal, δ_add, unsigned_δ_comp_any,
    Int.reduceSub, Int.reduceAdd, Int.reduceNeg, δ_ofHom, d02, d13,
    Cochain.comp_zero, Cochain.zero_comp, zero_add, add_zero,
    ← Cochain.ofHom_comp, Category.assoc, cochain_add_self_zero]

/-- The next comparison word includes the primary correction term. -/
def weakTripleWord (x : P0 ⟶ P1) (b : Q2 ⟶ Q3)
    (h : Cochain P0 P2 (-1)) (a23 : Cochain P2 Q3 (-1))
    (a02 : Cochain P0 Q2 (-2)) (a13 : Cochain P1 Q3 (-2)) : Cochain P0 Q3 (-2) :=
  a02.comp (Cochain.ofHom b) (by decide) +
    h.comp a23 (by decide) + (Cochain.ofHom x).comp a13 (by decide)

/-- The three-edge comparison curvature factors through the original terminal. -/
theorem weakTripleWord_d
    (x01 : P0 ⟶ P1) (x12 : P1 ⟶ P2) (x23 : P2 ⟶ P3)
    (u2 : P2 ⟶ Q2) (u3 : P3 ⟶ Q3) (b1 : Q1 ⟶ Q2) (b2 : Q2 ⟶ Q3)
    (a01 : Cochain P0 Q1 (-1)) (a12 : Cochain P1 Q2 (-1)) (a23 : Cochain P2 Q3 (-1))
    (h02 : Cochain P0 P2 (-1)) (h13 : Cochain P1 P3 (-1))
    (a02 : Cochain P0 Q2 (-2)) (a13 : Cochain P1 Q3 (-2))
    (d02 : δ (-1) 0 h02 = Cochain.ofHom (x01 ≫ x12))
    (da23 : δ (-1) 0 a23 = Cochain.ofHom (u2 ≫ b2) + Cochain.ofHom (x23 ≫ u3))
    (da02 : δ (-2) (-1) a02 = weakPairWord x01 b1 a01 a12 +
      h02.comp (Cochain.ofHom u2) (by decide))
    (da13 : δ (-2) (-1) a13 = weakPairWord x12 b2 a12 a23 +
      h13.comp (Cochain.ofHom u3) (by decide))
    (hz : b1 ≫ b2 = 0) :
    δ (-2) (-1) (weakTripleWord x01 b2 h02 a23 a02 a13) =
      (threefoldTerminal x01 x23 h02 h13).comp (Cochain.ofHom u3) (by decide) := by
  have hz' (n : ℤ) : b1.f n ≫ b2.f n = 0 := by
    simpa using congrArg (fun f : Q1 ⟶ Q3 => f.f n) hz
  simp only [weakTripleWord, δ_add, unsigned_δ_comp_any,
    Int.reduceSub, Int.reduceAdd, Int.reduceNeg, δ_ofHom, d02, da23, da02, da13,
    Cochain.comp_zero, Cochain.zero_comp, zero_add, add_zero,
    Cochain.comp_add, Cochain.add_comp, weakPairWord, threefoldTerminal]
  apply Cochain.ext
  intro p q hpq
  simp only [Cochain.add_v, Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    Cochain.ofHom_v, HomologicalComplex.comp_f, Category.assoc, hz', comp_zero,
    add_zero, zero_add]
  first | rfl | (abel_nf <;> simp only [two_zsmul, two_nsmul, moduleHom_add_self_zero, add_zero, zero_add])

#print axioms weakPairWord_d
#print axioms weakTripleWord_d
end C4
