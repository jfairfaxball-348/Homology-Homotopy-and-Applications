module
public import C4.Periodic

public section

/-!
# S140: actual commutative ring of four binary coefficients

Unlike the earlier coefficient identities, this installs an actual CommRing
instance on C4.B. Multiplication is the exact truncated convolution already
used in the S138 and S139 proofs. Every ring law is proved coefficientwise;
there are no abstract ring-law hypotheses or new axioms.
-/

namespace C4

private theorem binary_double (a : ZMod 2) : a + a = 0 := by
  have h : ∀ u : ZMod 2, u + u = 0 := by decide
  exact h a

/- These concrete operation instances permit ring axioms to be proved before the
   full CommRing instance is available to typeclass synthesis. The final ring
   fields are definitionally the same functions. -/
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
  sub := fun a b => C4.add a b
  nsmul := nsmulRec
  zsmul := zsmulRec
  add_assoc := by
    intro a b c
    cases a; cases b; cases c
    simp [C4.add, B.mk.injEq, add_assoc]
  zero_add := by
    intro a
    cases a
    simp [C4.add, C4.zero, B.mk.injEq]
  add_zero := by
    intro a
    cases a
    simp [C4.add, C4.zero, B.mk.injEq]
  neg_add_cancel := by
    intro a
    cases a
    simp [C4.add, C4.zero, B.mk.injEq, binary_double]
  sub_eq_add_neg := by
    intro a b
    rfl
  add_comm := by
    intro a b
    cases a; cases b
    simp [C4.add, B.mk.injEq, add_comm]
  mul_assoc := by
    intro a b c
    cases a; cases b; cases c
    simp [C4.mul, B.mk.injEq]
    <;> ring
  one_mul := by
    intro a
    cases a
    simp [C4.mul, C4.one, B.mk.injEq]
  mul_one := by
    intro a
    cases a
    simp [C4.mul, C4.one, B.mk.injEq]
  left_distrib := by
    intro a b c
    cases a; cases b; cases c
    simp [C4.add, C4.mul, B.mk.injEq]
    <;> ring
  right_distrib := by
    intro a b c
    cases a; cases b; cases c
    simp [C4.add, C4.mul, B.mk.injEq]
    <;> ring
  mul_comm := by
    intro a b
    cases a; cases b
    simp [C4.mul, B.mk.injEq]
    <;> ring
  zero_mul := by
    intro a
    cases a
    simp [C4.mul, C4.zero, B.mk.injEq]
  mul_zero := by
    intro a
    cases a
    simp [C4.mul, C4.zero, B.mk.injEq]

theorem add_is_coordinate_add (a b : B) : a + b = C4.add a b := rfl
theorem mul_is_truncated_convolution (a b : B) : a * b = C4.mul a b := rfl
theorem zero_is_coordinate_zero : (0 : B) = C4.zero := rfl
theorem one_is_coordinate_one : (1 : B) = C4.one := rfl

/-- The genuine ring inherits the exact two annihilator equations. -/
theorem ann_t_ring (a : B) :
    C4.t * a = 0 ↔ ∃ b : B, a = C4.t3 * b := by
  simpa only [mul_is_truncated_convolution, zero_is_coordinate_zero]
    using C4.ann_t a

theorem ann_t3_ring (a : B) :
    C4.t3 * a = 0 ↔ ∃ b : B, a = C4.t * b := by
  simpa only [mul_is_truncated_convolution, zero_is_coordinate_zero]
    using C4.ann_t3 a

end C4
