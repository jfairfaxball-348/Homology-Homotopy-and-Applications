module
public import C4.Jets

@[expose] public section

/-!
# Periodic cyclic-four resolution: identities in every positive degree

The concrete truncated coefficient algebra is C4.B (S138).
Index n here stands for homological degree n+1, so d n is the
differential P_(n+1) -> P_n in the proposed free resolution.

All the following statements quantify over ALL natural indices; none
is a finite-degree test. The named coefficient maps have not yet been
installed as a Mathlib ChainComplex or a quotient-ring module; this
file does NOT claim such a categorical construction.
-/

namespace C4

namespace Periodic

def d (n : ℕ) : B := if n % 2 = 0 then t else t3
def x (n : ℕ) : B := if n % 2 = 0 then one else t2
def h (n : ℕ) : B := if n % 2 = 0 then zero else t
def z (n : ℕ) : B := if n % 2 = 0 then zero else one

private theorem split (n : ℕ) : n % 2 = 0 ∨ n % 2 = 1 := by omega

private theorem next_odd {n : ℕ} (hn : n % 2 = 0) :
    (n+1) % 2 = 1 := by omega

private theorem next_even {n : ℕ} (hn : n % 2 = 1) :
    (n+1) % 2 = 0 := by omega

/-- Every pair of consecutive differentials composes to zero. -/
theorem d_squared (n : ℕ) : mul (d n) (d (n+1)) = zero := by
  rcases split n with p | p
  · have q := next_odd p
    simpa [d, p, q] using t_fourth
  · have q := next_even p
    simpa [d, p, q] using t3_t

/-- Exactness at EVERY positive degree, using the S138 annihilator identities.
This is an equality of coefficient kernels/images; installing it as homology
vanishing of actual modules/complexes remains a separate step. -/
theorem exact_positive (n : ℕ) (a : B) :
    mul (d n) a = zero ↔ ∃ b : B, a = mul (d (n+1)) b := by
  rcases split n with p | p
  · have q := next_odd p
    simpa [d, p, q] using (ann_t a)
  · have q := next_even p
    simpa [d, p, q] using (ann_t3 a)

/-- The adjacent family x is closed under the Hom differential at
every permitted positive component (homological degree n+2). -/
theorem Dx_zero (n : ℕ) :
    add (mul (d n) (x (n+1))) (mul (x n) (d (n+1))) = zero := by
  rcases split n with p | p
  · have q := next_odd p
    simpa [d, x, p, q] using
      parity_Dx_even
  · have q := next_even p
    simpa [d, x, p, q] using
      parity_Dx_odd

/-- The primary filler h satisfies Dh = x² at EVERY positive component. -/
theorem Dh_xx (n : ℕ) :
    add (mul (d n) (h (n+1))) (mul (h n) (d (n+1))) =
      mul (x n) (x (n+1)) := by
  rcases split n with p | p
  · have q := next_odd p
    simpa [d, x, h, p, q] using
      parity_Dh_even
  · have q := next_even p
    simpa [d, x, h, p, q] using
      parity_Dh_odd

/-- The secondary filler z satisfies Dz = xh+hx at EVERY positive component. -/
theorem Dz_xh_hx (n : ℕ) :
    add (mul (d n) (z (n+1))) (mul (z n) (d (n+1))) =
      add (mul (x n) (h (n+1))) (mul (h n) (x (n+1))) := by
  rcases split n with p | p
  · have q := next_odd p
    simpa [d, x, h, z, p, q] using
      parity_Dz_even
  · have q := next_even p
    simpa [d, x, h, z, p, q] using
      parity_Dz_odd

/-- The chosen fourfold terminal combination equals the unit in
every positive component. The ALL-CHOICE exclusion in Jets remains
a different theorem, not automatically a dg-Hom theorem. -/
def w (n : ℕ) : B :=
  add (mul (x n) (z (n+1)))
    (add (mul (h n) (h (n+1))) (mul (z n) (x (n+1))))

theorem terminal_unit (n : ℕ) : w n = one := by
  rcases split n with p | p
  · have q := next_odd p
    simpa [w, x, h, z, p, q] using
      parity_terminal_even
  · have q := next_even p
    simpa [w, x, h, z, p, q] using
      parity_terminal_odd

end Periodic
end C4
