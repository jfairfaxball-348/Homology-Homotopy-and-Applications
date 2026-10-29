module
public import Mathlib

@[expose] public section

/-!
Cyclic-four truncated coefficient algebra, S138.

`B` consists of the four F₂ coefficients of a polynomial modulo t⁴.
The multiplication below is *exact* truncated polynomial convolution.
This module addresses degree-two coefficient constraints for arbitrary
representatives and fillers; it does not claim a derived-metric certificate.
-/

namespace C4

structure B where
  c0 : ZMod 2
  c1 : ZMod 2
  c2 : ZMod 2
  c3 : ZMod 2
  deriving DecidableEq

def zero : B := ⟨0, 0, 0, 0⟩
def one : B := ⟨1, 0, 0, 0⟩
def t : B := ⟨0, 1, 0, 0⟩
def t2 : B := ⟨0, 0, 1, 0⟩
def t3 : B := ⟨0, 0, 0, 1⟩

def add (a b : B) : B :=
  ⟨a.c0 + b.c0, a.c1 + b.c1, a.c2 + b.c2, a.c3 + b.c3⟩

def mul (a b : B) : B :=
  ⟨a.c0 * b.c0,
   a.c0 * b.c1 + a.c1 * b.c0,
   a.c0 * b.c2 + a.c1 * b.c1 + a.c2 * b.c0,
   a.c0 * b.c3 + a.c1 * b.c2 + a.c2 * b.c1 + a.c3 * b.c0⟩

theorem t_sq : mul t t = t2 := by decide
theorem t_cube : mul t t2 = t3 := by decide
theorem t_fourth : mul t t3 = zero := by decide
theorem t3_t : mul t3 t = zero := by decide

private theorem double_zero (a : ZMod 2) : a + a = 0 := by
  have h : ∀ u : ZMod 2, u + u = 0 := by decide
  exact h a

private theorem eq_of_add_eq_zero {a b : ZMod 2}
    (h : a + b = 0) : a = b := by
  have heq : a + (a + b) = a := by rw [h, add_zero]
  rw [← add_assoc, double_zero, zero_add] at heq
  exact heq.symm

def Adjacent (a1 a2 : B) : Prop :=
  a1.c0 = 1 ∧ add (mul t a2) (mul t3 a1) = zero

theorem adjacent_jet {a1 a2 : B} (h : Adjacent a1 a2) :
    a2.c0 = 0 ∧ a2.c1 = 0 ∧ a2.c2 = 1 := by
  rcases h with ⟨ha, hd⟩
  have h0 := congrArg B.c1 hd
  have h1 := congrArg B.c2 hd
  have h2 := congrArg B.c3 hd
  have hc0 : a2.c0 = 0 := by
    simpa [add, mul, t, t3, zero] using h0
  have hc1 : a2.c1 = 0 := by
    simpa [add, mul, t, t3, zero] using h1
  have hsum : a2.c2 + a1.c0 = 0 := by
    simpa [add, mul, t, t3, zero] using h2
  have hc2 : a2.c2 = 1 := by
    have hh := eq_of_add_eq_zero hsum
    simpa [ha] using hh
  exact ⟨hc0, hc1, hc2⟩

def Primary (b1 a2 h1 h2 : B) : Prop :=
  add (mul t h2) (mul t3 h1) = mul b1 a2

theorem primary_jet {a2 b1 h1 h2 : B}
    (ha : a2.c0 = 0 ∧ a2.c1 = 0 ∧ a2.c2 = 1)
    (hb : b1.c0 = 1)
    (h : Primary b1 a2 h1 h2) :
    h2.c0 = 0 ∧ h2.c1 = 1 := by
  have h0 := congrArg B.c1 h
  have h1' := congrArg B.c2 h
  have hc0 : h2.c0 = 0 := by
    simpa [Primary, add, mul, t, t3, zero, ha.1, ha.2.1] using h0
  have hc1 : h2.c1 = 1 := by
    simpa [Primary, add, mul, t, t3, zero, ha.1, ha.2.1, ha.2.2, hb]
      using h1'
  exact ⟨hc0, hc1⟩

def Secondary (c1 h2 j1 a2 k1 k2 : B) : Prop :=
  add (mul t k2) (mul t3 k1) = add (mul c1 h2) (mul j1 a2)

theorem secondary_jet {a2 c1 h2 j1 k1 k2 : B}
    (ha : a2.c0 = 0 ∧ a2.c1 = 0)
    (hc : c1.c0 = 1)
    (hh : h2.c0 = 0 ∧ h2.c1 = 1)
    (h : Secondary c1 h2 j1 a2 k1 k2) :
    k2.c0 = 1 := by
  have h0 := congrArg B.c1 h
  simpa [Secondary, add, mul, t, t3, zero,
    ha.1, ha.2, hc, hh.1, hh.2] using h0

def Terminal (c1 k2 h1 j2 l1 a2 : B) : B :=
  add (mul c1 k2) (add (mul h1 j2) (mul l1 a2))

theorem terminal_constant {c1 k2 h1 j2 l1 a2 : B}
    (hc : c1.c0 = 1) (hk : k2.c0 = 1)
    (hj : j2.c0 = 0) (ha : a2.c0 = 0) :
    (Terminal c1 k2 h1 j2 l1 a2).c0 = 1 := by
  simp [Terminal, add, mul, hc, hk, hj, ha]

theorem boundary_constant_zero (f1 f2 : B) :
    (add (mul t f2) (mul t3 f1)).c0 = 0 := by
  simp [add, mul, t, t3]

/-- All low-degree representative/primary/secondary choices force residue one. -/
theorem universal_terminal_residue
    (a1 a2 b1 c1 h1 h2 j1 j2 k1 k2 l1 : B)
    (ha : Adjacent a1 a2)
    (hb : b1.c0 = 1)
    (hc : c1.c0 = 1)
    (hH : Primary b1 a2 h1 h2)
    (hJ : Primary b1 a2 j1 j2)
    (hK : Secondary c1 h2 j1 a2 k1 k2) :
    (Terminal c1 k2 h1 j2 l1 a2).c0 = 1 := by
  have a := adjacent_jet ha
  have h := primary_jet a hb hH
  have j := primary_jet a hb hJ
  have k := secondary_jet ⟨a.1, a.2.1⟩ hc h hK
  exact terminal_constant hc k j.1 a.1

/-- The terminal expression cannot equal a degree-two coboundary, for any
    admissible low-degree representative and filler coefficients. -/
theorem universal_terminal_not_boundary
    (a1 a2 b1 c1 h1 h2 j1 j2 k1 k2 l1 f1 f2 : B)
    (ha : Adjacent a1 a2) (hb : b1.c0 = 1) (hc : c1.c0 = 1)
    (hH : Primary b1 a2 h1 h2)
    (hJ : Primary b1 a2 j1 j2)
    (hK : Secondary c1 h2 j1 a2 k1 k2) :
    Terminal c1 k2 h1 j2 l1 a2 ≠
      add (mul t f2) (mul t3 f1) := by
  intro heq
  have ht := universal_terminal_residue
    a1 a2 b1 c1 h1 h2 j1 j2 k1 k2 l1 ha hb hc hH hJ hK
  have hf := boundary_constant_zero f1 f2
  have hcoef := congrArg B.c0 heq
  rw [ht, hf] at hcoef
  exact one_ne_zero hcoef


/-- The true fourfold low-degree residue with independent adjacent maps.
Only the first primary and first secondary equations are needed; the
remaining terminal factors are unrestricted. In particular no equality
between different primary right-hand sides is assumed. -/
theorem independent_terminal_residue
    (a1 a2 b1 c1 d1 h1 h2 j1 m1 k1 k2 l1 : B)
    (ha : Adjacent a1 a2)
    (hb : b1.c0 = 1) (hc : c1.c0 = 1) (hd : d1.c0 = 1)
    (hH : Primary b1 a2 h1 h2)
    (hK : Secondary c1 h2 j1 a2 k1 k2) :
    (Terminal d1 k2 m1 h2 l1 a2).c0 = 1 := by
  have a := adjacent_jet ha
  have h := primary_jet a hb hH
  have k := secondary_jet ⟨a.1, a.2.1⟩ hc h hK
  exact terminal_constant hd k h.1 a.1

theorem independent_terminal_not_boundary
    (a1 a2 b1 c1 d1 h1 h2 j1 m1 k1 k2 l1 f1 f2 : B)
    (ha : Adjacent a1 a2)
    (hb : b1.c0 = 1) (hc : c1.c0 = 1) (hd : d1.c0 = 1)
    (hH : Primary b1 a2 h1 h2)
    (hK : Secondary c1 h2 j1 a2 k1 k2) :
    Terminal d1 k2 m1 h2 l1 a2 ≠ add (mul t f2) (mul t3 f1) := by
  intro heq
  have ht := independent_terminal_residue
    a1 a2 b1 c1 d1 h1 h2 j1 m1 k1 k2 l1 ha hb hc hd hH hK
  have hf := boundary_constant_zero f1 f2
  have he := congrArg B.c0 heq
  rw [ht, hf] at he
  exact one_ne_zero he

/-- Exact coefficient description of ann(t). -/
theorem ann_t_coeffs (a : B) :
    mul t a = zero ↔ a.c0 = 0 ∧ a.c1 = 0 ∧ a.c2 = 0 := by
  cases a
  simp [mul, t, zero, B.mk.injEq]

/-- Exact coefficient description of ann(t³). -/
theorem ann_t3_coeffs (a : B) :
    mul t3 a = zero ↔ a.c0 = 0 := by
  cases a
  simp [mul, t3, zero, B.mk.injEq]

/-- The annihilator of t is precisely its t³-multiple ideal. -/
theorem ann_t (a : B) : mul t a = zero ↔ ∃ b : B, a = mul t3 b := by
  constructor
  · intro ha
    obtain ⟨h0, h1, h2⟩ := (ann_t_coeffs a).mp ha
    refine ⟨⟨a.c3, 0, 0, 0⟩, ?_⟩
    cases a
    dsimp at h0 h1 h2
    simp [mul, t3, B.mk.injEq, h0, h1, h2]
  · rintro ⟨b, rfl⟩
    simp [mul, t, t3, zero, B.mk.injEq]

/-- The annihilator of t³ is precisely its t-multiple ideal. -/
theorem ann_t3 (a : B) : mul t3 a = zero ↔ ∃ b : B, a = mul t b := by
  constructor
  · intro ha
    have h0 := (ann_t3_coeffs a).mp ha
    refine ⟨⟨a.c1, a.c2, a.c3, 0⟩, ?_⟩
    cases a
    dsimp at h0
    simp [mul, t, B.mk.injEq, h0]
  · rintro ⟨b, rfl⟩
    simp [mul, t3, t, zero, B.mk.injEq]

/-- Degree-two selected x, h, z witness equations and terminal unit.
These are exact coefficient identities, not yet the full infinite dg family. -/
theorem selected_degree_two :
    add (mul t t2) (mul t3 one) = zero ∧
    add (mul t t) (mul t3 zero) = mul one t2 ∧
    add (mul t one) (mul t3 zero) =
      add (mul one t) (mul zero t2) ∧
    Terminal one one zero t zero t2 = one := by
  decide


/-- Fixed parity identities; proved with exact finite coefficients before
exporting to all-degree proofs in C4.Periodic. -/
theorem parity_Dx_even :
    add (mul t t2) (mul one t3) = zero := by decide
theorem parity_Dx_odd :
    add (mul t3 one) (mul t2 t) = zero := by decide
theorem parity_Dh_even :
    add (mul t t) (mul zero t3) = mul one t2 := by decide
theorem parity_Dh_odd :
    add (mul t3 zero) (mul t t) = mul t2 one := by decide
theorem parity_Dz_even :
    add (mul t one) (mul zero t3) =
      add (mul one t) (mul zero t2) := by decide
theorem parity_Dz_odd :
    add (mul t3 zero) (mul one t) =
      add (mul t2 zero) (mul t one) := by decide
theorem parity_terminal_even :
    add (mul one one)
      (add (mul zero t) (mul zero t2)) = one := by decide
theorem parity_terminal_odd :
    add (mul t2 zero)
      (add (mul t zero) (mul one one)) = one := by decide

end C4
