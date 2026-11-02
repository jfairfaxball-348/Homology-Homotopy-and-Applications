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

/-- The actual fourfold terminal cochain. -/
def fourfoldTerminal (x : P0 ⟶ P1) (y : P3 ⟶ P4)
    (h02 : Cochain P0 P2 (-1)) (h24 : Cochain P2 P4 (-1))
    (z03 : Cochain P0 P3 (-2)) (z14 : Cochain P1 P4 (-2)) : Cochain P0 P4 (-2) :=
  z03.comp (Cochain.ofHom y) (by decide) +
    (h02.comp h24 (by decide) + (Cochain.ofHom x).comp z14 (by decide))

theorem fourfoldTerminal_closed
    (x01 : P0 ⟶ P1) (x12 : P1 ⟶ P2) (x23 : P2 ⟶ P3) (x34 : P3 ⟶ P4)
    (h02 : Cochain P0 P2 (-1)) (h13 : Cochain P1 P3 (-1)) (h24 : Cochain P2 P4 (-1))
    (z03 : Cochain P0 P3 (-2)) (z14 : Cochain P1 P4 (-2))
    (d02 : δ (-1) 0 h02 = Cochain.ofHom (x01 ≫ x12))
    (d24 : δ (-1) 0 h24 = Cochain.ofHom (x23 ≫ x34))
    (d03 : δ (-2) (-1) z03 = threefoldTerminal x01 x23 h02 h13)
    (d14 : δ (-2) (-1) z14 = threefoldTerminal x12 x34 h13 h24) :
    δ (-2) (-1) (fourfoldTerminal x01 x34 h02 h24 z03 z14) = 0 := by
  simp only [fourfoldTerminal, δ_add, unsigned_δ_comp_any,
    Int.reduceSub, Int.reduceAdd, Int.reduceNeg, δ_ofHom, d02, d24, d03, d14,
    Cochain.comp_zero, Cochain.zero_comp, zero_add, add_zero,
    Cochain.comp_add, Cochain.add_comp, threefoldTerminal]
  apply Cochain.ext
  intro p q hpq
  simp only [Cochain.add_v, Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    Cochain.ofHom_v, Cochain.zero_v, HomologicalComplex.comp_f, Category.assoc]
  first | rfl | (abel_nf <;> simp only [two_zsmul, two_nsmul, moduleHom_add_self_zero, add_zero, zero_add])

/-- The final replacement-side comparison word. -/
def weakQuadWord (x : P0 ⟶ P1) (b : Q3 ⟶ Q4)
    (h02 : Cochain P0 P2 (-1)) (z03 : Cochain P0 P3 (-2))
    (a34 : Cochain P3 Q4 (-1)) (a24 : Cochain P2 Q4 (-2))
    (a03 : Cochain P0 Q3 (-3)) (a14 : Cochain P1 Q4 (-3)) : Cochain P0 Q4 (-3) :=
  a03.comp (Cochain.ofHom b) (by decide) + z03.comp a34 (by decide) +
    h02.comp a24 (by decide) + (Cochain.ofHom x).comp a14 (by decide)

/-- The final curvature is the original terminal followed by the comparison quasi-isomorphism. -/
theorem weakQuadWord_d
    (x01 : P0 ⟶ P1) (x12 : P1 ⟶ P2) (x23 : P2 ⟶ P3) (x34 : P3 ⟶ P4)
    (u3 : P3 ⟶ Q3) (u4 : P4 ⟶ Q4) (b2 : Q2 ⟶ Q3) (b3 : Q3 ⟶ Q4)
    (a01 : Cochain P0 Q1 (-1)) (a12 : Cochain P1 Q2 (-1))
    (a23 : Cochain P2 Q3 (-1)) (a34 : Cochain P3 Q4 (-1))
    (h02 : Cochain P0 P2 (-1)) (h13 : Cochain P1 P3 (-1)) (h24 : Cochain P2 P4 (-1))
    (a02 : Cochain P0 Q2 (-2)) (a13 : Cochain P1 Q3 (-2)) (a24 : Cochain P2 Q4 (-2))
    (z03 : Cochain P0 P3 (-2)) (z14 : Cochain P1 P4 (-2))
    (a03 : Cochain P0 Q3 (-3)) (a14 : Cochain P1 Q4 (-3))
    (d02 : δ (-1) 0 h02 = Cochain.ofHom (x01 ≫ x12))
    (d03 : δ (-2) (-1) z03 = threefoldTerminal x01 x23 h02 h13)
    (da34 : δ (-1) 0 a34 = Cochain.ofHom (u3 ≫ b3) + Cochain.ofHom (x34 ≫ u4))
    (da24 : δ (-2) (-1) a24 = weakPairWord x23 b3 a23 a34 +
      h24.comp (Cochain.ofHom u4) (by decide))
    (da03 : δ (-3) (-2) a03 = weakTripleWord x01 b2 h02 a23 a02 a13 +
      z03.comp (Cochain.ofHom u3) (by decide))
    (da14 : δ (-3) (-2) a14 = weakTripleWord x12 b3 h13 a34 a13 a24 +
      z14.comp (Cochain.ofHom u4) (by decide))
    (hz : b2 ≫ b3 = 0) :
    δ (-3) (-2) (weakQuadWord x01 b3 h02 z03 a34 a24 a03 a14) =
      (fourfoldTerminal x01 x34 h02 h24 z03 z14).comp (Cochain.ofHom u4) (by decide) := by
  have hz' (n : ℤ) : b2.f n ≫ b3.f n = 0 := by
    simpa using congrArg (fun f : Q2 ⟶ Q4 => f.f n) hz
  simp only [weakQuadWord, δ_add, unsigned_δ_comp_any,
    Int.reduceSub, Int.reduceAdd, Int.reduceNeg, δ_ofHom, d02, d03, da34, da24, da03, da14,
    Cochain.comp_zero, Cochain.zero_comp, zero_add, add_zero,
    Cochain.comp_add, Cochain.add_comp, weakPairWord, weakTripleWord,
    threefoldTerminal, fourfoldTerminal]
  apply Cochain.ext
  intro p q hpq
  simp only [Cochain.add_v, cochain_comp_v_neg_one,
    Cochain.comp_zero_cochain_v, Cochain.zero_cochain_comp_v,
    Cochain.ofHom_v, HomologicalComplex.comp_f, Category.assoc, hz', comp_zero,
    add_zero, zero_add]
  first | rfl | (abel_nf <;> simp only [two_zsmul, two_nsmul, moduleHom_add_self_zero, add_zero, zero_add])

#print axioms weakPairWord_d
#print axioms weakTripleWord_d
#print axioms fourfoldTerminal_closed
#print axioms weakQuadWord_d
end C4
