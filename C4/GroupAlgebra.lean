module
public import C4.HomologyInterleavingDistance
public import Mathlib.Algebra.MonoidAlgebra.Lift

public section

/-! The characteristic-two presentation of the cyclic group algebra. -/

namespace C4

abbrev CyclicFour := Multiplicative (ZMod 4)
abbrev GroupAlgebra := MonoidAlgebra (ZMod 2) CyclicFour

/-- The basis element of the group algebra corresponding to the generator of C₄. -/
noncomputable def groupGenerator : GroupAlgebra :=
  MonoidAlgebra.of (ZMod 2) CyclicFour (Multiplicative.ofAdd 1)

private theorem one_add_t_fourth : (1 + t : B) ^ (4 : ℕ) = 1 := by decide

private def cyclicRepresentation : CyclicFour →* B where
  toFun a := (1 + t) ^ a.toAdd.val
  map_one' := by decide
  map_mul' a b := by
    change (1 + t) ^ (a.toAdd + b.toAdd).val =
      (1 + t) ^ a.toAdd.val * (1 + t) ^ b.toAdd.val
    rw [ZMod.val_add, ← pow_add]
    let n := a.toAdd.val + b.toAdd.val
    change (1 + t) ^ (n % 4) = (1 + t) ^ n
    conv_rhs => rw [← Nat.mod_add_div n 4, pow_add, pow_mul, one_add_t_fourth, one_pow, mul_one]

private noncomputable def fromGroupAlgebra : GroupAlgebra →+* B :=
  MonoidAlgebra.liftNCRingHom residueFieldToB cyclicRepresentation
    (fun _ _ => Commute.all _ _)

private theorem fromGroupAlgebra_generator : fromGroupAlgebra groupGenerator = 1 + t := by
  change fromGroupAlgebra (MonoidAlgebra.single (Multiplicative.ofAdd 1) 1) = 1 + t
  rw [fromGroupAlgebra, MonoidAlgebra.liftNCRingHom_single, map_one, one_mul]
  decide

private theorem fromGroupAlgebra_scalar (a : ZMod 2) :
    fromGroupAlgebra (MonoidAlgebra.single 1 a) = residueFieldToB a := by
  rw [fromGroupAlgebra, MonoidAlgebra.liftNCRingHom_single, map_one, mul_one]

private theorem fromGroupAlgebra_surjective : Function.Surjective fromGroupAlgebra := by
  intro x
  let s := fun a : ZMod 2 => MonoidAlgebra.single (1 : CyclicFour) a
  let y := 1 + groupGenerator
  have hy : fromGroupAlgebra y = t := by
    change fromGroupAlgebra (1 + groupGenerator) = t
    rw [map_add, map_one, fromGroupAlgebra_generator]
    decide
  refine ⟨s x.c0 + s x.c1 * y + s x.c2 * y ^ 2 + s x.c3 * y ^ 3, ?_⟩
  simp only [s, map_add, map_mul, map_pow, fromGroupAlgebra_scalar, hy]
  rcases x with ⟨a, b, c, d⟩
  fin_cases a <;> fin_cases b <;> fin_cases c <;> fin_cases d <;> decide

private def coefficientTuple : B ≃ (ZMod 2 × ZMod 2 × ZMod 2 × ZMod 2) where
  toFun x := ⟨x.c0, x.c1, x.c2, x.c3⟩
  invFun x := ⟨x.1, x.2.1, x.2.2.1, x.2.2.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

private theorem fromGroupAlgebra_bijective : Function.Bijective fromGroupAlgebra := by
  classical
  let e : GroupAlgebra ≃ (CyclicFour → ZMod 2) :=
    MonoidAlgebra.coeffEquiv.trans Finsupp.equivFunOnFinite
  let _ : Fintype GroupAlgebra := Fintype.ofEquiv _ e.symm
  let _ : Fintype B := Fintype.ofEquiv _ coefficientTuple.symm
  apply (Fintype.bijective_iff_surjective_and_card _).2
  refine ⟨fromGroupAlgebra_surjective, ?_⟩
  rw [Fintype.card_congr e, Fintype.card_congr coefficientTuple, Fintype.card_fun]
  simp [CyclicFour, Fintype.card_prod]

/-- The presentation `𝔽₂[t]/(t⁴) ≃ 𝔽₂[C₄]`. -/
noncomputable def groupAlgebraEquiv : B ≃+* GroupAlgebra :=
  (RingEquiv.ofBijective fromGroupAlgebra fromGroupAlgebra_bijective).symm

theorem groupAlgebraEquiv_t : groupAlgebraEquiv t = 1 + groupGenerator := by
  apply groupAlgebraEquiv.symm.injective
  rw [RingEquiv.symm_apply_apply]
  change t = fromGroupAlgebra (1 + groupGenerator)
  rw [map_add, map_one, fromGroupAlgebra_generator]
  decide

theorem groupAlgebraEquiv_t3 : groupAlgebraEquiv t3 =
    1 + groupGenerator + groupGenerator ^ 2 + groupGenerator ^ 3 := by
  apply groupAlgebraEquiv.symm.injective
  rw [RingEquiv.symm_apply_apply]
  change t3 = fromGroupAlgebra
    (1 + groupGenerator + groupGenerator ^ 2 + groupGenerator ^ 3)
  simp only [map_add, map_one, map_pow, fromGroupAlgebra_generator]
  decide

#print axioms groupAlgebraEquiv
#print axioms groupAlgebraEquiv_t
#print axioms groupAlgebraEquiv_t3

end C4
