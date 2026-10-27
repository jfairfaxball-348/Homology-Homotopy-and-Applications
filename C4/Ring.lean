module
public import C4.Periodic

@[expose] public section

/-! A genuine commutative ring on the exact truncated four-coefficient algebra.
The ring axioms are proved for the explicit operations BEFORE packaging
them into the CommRing class; this avoids circular class elaboration. -/

namespace C4

private theorem binary_double (a : ZMod 2) : a + a = 0 := by
  have h : ∀ u : ZMod 2, u + u = 0 := by decide
  exact h a

theorem c4_add_assoc_coord (a b c : B) :
    C4.add (C4.add a b) c = C4.add a (C4.add b c) := by
  cases a; cases b; cases c
  simp [C4.add, B.mk.injEq, add_assoc]
theorem c4_zero_add_coord (a : B) : C4.add C4.zero a = a := by
  cases a
  simp [C4.add, C4.zero, B.mk.injEq]
theorem c4_add_zero_coord (a : B) : C4.add a C4.zero = a := by
  cases a
  simp [C4.add, C4.zero, B.mk.injEq]
theorem c4_neg_add_cancel_coord (a : B) : C4.add a a = C4.zero := by
  cases a
  simp [C4.add, C4.zero, B.mk.injEq, binary_double]
theorem c4_add_comm_coord (a b : B) : C4.add a b = C4.add b a := by
  cases a; cases b
  simp [C4.add, B.mk.injEq, add_comm]
theorem c4_mul_assoc_coord (a b c : B) :
    C4.mul (C4.mul a b) c = C4.mul a (C4.mul b c) := by
  cases a; cases b; cases c
  simp [C4.mul, B.mk.injEq]
  <;> ring <;> simp
theorem c4_one_mul_coord (a : B) : C4.mul C4.one a = a := by
  cases a
  simp [C4.mul, C4.one, B.mk.injEq]
theorem c4_mul_one_coord (a : B) : C4.mul a C4.one = a := by
  cases a
  simp [C4.mul, C4.one, B.mk.injEq]
theorem c4_left_distrib_coord (a b c : B) :
    C4.mul a (C4.add b c) =
      C4.add (C4.mul a b) (C4.mul a c) := by
  cases a; cases b; cases c
  simp [C4.add, C4.mul, B.mk.injEq]
  <;> ring <;> simp
theorem c4_right_distrib_coord (a b c : B) :
    C4.mul (C4.add a b) c =
      C4.add (C4.mul a c) (C4.mul b c) := by
  cases a; cases b; cases c
  simp [C4.add, C4.mul, B.mk.injEq]
  <;> ring <;> simp
theorem c4_mul_comm_coord (a b : B) : C4.mul a b = C4.mul b a := by
  cases a; cases b
  simp [C4.mul, B.mk.injEq]
  <;> ring <;> simp
theorem c4_zero_mul_coord (a : B) : C4.mul C4.zero a = C4.zero := by
  cases a
  simp [C4.mul, C4.zero, B.mk.injEq]
theorem c4_mul_zero_coord (a : B) : C4.mul a C4.zero = C4.zero := by
  cases a
  simp [C4.mul, C4.zero, B.mk.injEq]

instance : Zero B := ⟨C4.zero⟩
instance : One B := ⟨C4.one⟩
instance : Add B := ⟨C4.add⟩
instance : Mul B := ⟨C4.mul⟩
instance : Neg B := ⟨id⟩
instance : Sub B := ⟨C4.add⟩

instance : CommRing B where
  zero := C4.zero
  one := C4.one
  add := C4.add
  mul := C4.mul
  neg := id
  sub := C4.add
  nsmul := nsmulRec
  zsmul := zsmulRec
  add_assoc := c4_add_assoc_coord
  zero_add := c4_zero_add_coord
  add_zero := c4_add_zero_coord
  neg_add_cancel := c4_neg_add_cancel_coord
  sub_eq_add_neg := by intro a b; rfl
  add_comm := c4_add_comm_coord
  mul_assoc := c4_mul_assoc_coord
  one_mul := c4_one_mul_coord
  mul_one := c4_mul_one_coord
  left_distrib := c4_left_distrib_coord
  right_distrib := c4_right_distrib_coord
  mul_comm := c4_mul_comm_coord
  zero_mul := c4_zero_mul_coord
  mul_zero := c4_mul_zero_coord

theorem add_is_coordinate_add (a b : B) : a + b = C4.add a b := rfl
theorem mul_is_truncated_convolution (a b : B) : a * b = C4.mul a b := rfl
theorem zero_is_coordinate_zero : (0 : B) = C4.zero := rfl
theorem one_is_coordinate_one : (1 : B) = C4.one := rfl

theorem ann_t_ring (a : B) :
    C4.t * a = 0 ↔ ∃ b : B, a = C4.t3 * b := by
  simpa only [mul_is_truncated_convolution, zero_is_coordinate_zero]
    using C4.ann_t a

theorem ann_t3_ring (a : B) :
    C4.t3 * a = 0 ↔ ∃ b : B, a = C4.t * b := by
  simpa only [mul_is_truncated_convolution, zero_is_coordinate_zero]
    using C4.ann_t3 a

end C4
