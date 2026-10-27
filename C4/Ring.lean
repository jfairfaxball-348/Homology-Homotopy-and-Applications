module
public import C4.Periodic

public section

/-! A genuine commutative ring on the exact truncated four-coefficient algebra.
The ring axioms are proved for the explicit operations BEFORE packaging
them into the CommRing class; this avoids circular class elaboration. -/

namespace C4

private theorem binary_double (a : ZMod 2) : a + a = 0 := by
  have h : ∀ u : ZMod 2, u + u = 0 := by decide
  exact h a

private theorem add_assoc' (a b c : B) :
    C4.add (C4.add a b) c = C4.add a (C4.add b c) := by
  cases a; cases b; cases c
  simp [C4.add, B.mk.injEq, add_assoc]
private theorem zero_add' (a : B) : C4.add C4.zero a = a := by
  cases a
  simp [C4.add, C4.zero, B.mk.injEq]
private theorem add_zero' (a : B) : C4.add a C4.zero = a := by
  cases a
  simp [C4.add, C4.zero, B.mk.injEq]
private theorem neg_add_cancel' (a : B) : C4.add a a = C4.zero := by
  cases a
  simp [C4.add, C4.zero, B.mk.injEq, binary_double]
private theorem add_comm' (a b : B) : C4.add a b = C4.add b a := by
  cases a; cases b
  simp [C4.add, B.mk.injEq, add_comm]
private theorem mul_assoc' (a b c : B) :
    C4.mul (C4.mul a b) c = C4.mul a (C4.mul b c) := by
  cases a; cases b; cases c
  simp [C4.mul, B.mk.injEq]
  <;> ring
private theorem one_mul' (a : B) : C4.mul C4.one a = a := by
  cases a
  simp [C4.mul, C4.one, B.mk.injEq]
private theorem mul_one' (a : B) : C4.mul a C4.one = a := by
  cases a
  simp [C4.mul, C4.one, B.mk.injEq]
private theorem left_distrib' (a b c : B) :
    C4.mul a (C4.add b c) =
      C4.add (C4.mul a b) (C4.mul a c) := by
  cases a; cases b; cases c
  simp [C4.add, C4.mul, B.mk.injEq]
  <;> ring
private theorem right_distrib' (a b c : B) :
    C4.mul (C4.add a b) c =
      C4.add (C4.mul a c) (C4.mul b c) := by
  cases a; cases b; cases c
  simp [C4.add, C4.mul, B.mk.injEq]
  <;> ring
private theorem mul_comm' (a b : B) : C4.mul a b = C4.mul b a := by
  cases a; cases b
  simp [C4.mul, B.mk.injEq]
  <;> ring
private theorem zero_mul' (a : B) : C4.mul C4.zero a = C4.zero := by
  cases a
  simp [C4.mul, C4.zero, B.mk.injEq]
private theorem mul_zero' (a : B) : C4.mul a C4.zero = C4.zero := by
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
  add_assoc := add_assoc'
  zero_add := zero_add'
  add_zero := add_zero'
  neg_add_cancel := neg_add_cancel'
  sub_eq_add_neg := by intro a b; rfl
  add_comm := add_comm'
  mul_assoc := mul_assoc'
  one_mul := one_mul'
  mul_one := mul_one'
  left_distrib := left_distrib'
  right_distrib := right_distrib'
  mul_comm := mul_comm'
  zero_mul := zero_mul'
  mul_zero := mul_zero'

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
