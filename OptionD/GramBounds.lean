module

public import Mathlib.Tactic

public section

/-!
# Option D / D1: rigorous local Gram perturbation estimates

Every entry of the off-diagonal squared-distance perturbation in
D1 has absolute value at most epsilon. The first theorem is the
two-coordinate estimate needed before summing over a finite graph.

These lemmas do NOT establish Gram positive definiteness, Euclidean
realisation, or the attaching-map/interleaving results D6–D8.
-/

namespace OptionD

/-- For an entry `a` with `|a| ≤ ε`, its mixed quadratic contribution
is bounded below by half the diagonal square sum times `-ε`.
This is the precise local inequality used in a Gershgorin-type Gram bound. -/
theorem d1_pair_error_lower (ε a x y : ℝ)
    (hε : 0 ≤ ε) (ha : |a| ≤ ε) :
    -(ε / 2) * (x ^ 2 + y ^ 2) ≤ a * x * y := by
  have hlow : -ε ≤ a := (abs_le.mp ha).1
  have hhigh : a ≤ ε := (abs_le.mp ha).2
  by_cases hxy : 0 ≤ x * y
  · have hmul : 0 ≤ (a + ε) * (x * y) :=
      mul_nonneg (by linarith) hxy
    have hsq : 0 ≤ ε * (x - y) ^ 2 :=
      mul_nonneg hε (sq_nonneg (x - y))
    nlinarith
  · have hmul : 0 ≤ (ε - a) * (-(x * y)) :=
      mul_nonneg (by linarith) (by linarith)
    have hsq : 0 ≤ ε * (x + y) ^ 2 :=
      mul_nonneg hε (sq_nonneg (x + y))
    nlinarith

/-- At ε = 1/(100N), N ≥ 2, the worst-case row perturbation
`(N-1)ε` is strictly less than `1/100`. This is the numerical
strictness in the centered Gram positivity argument. -/
theorem d1_row_error_small (N : ℕ) (hN : 2 ≤ N) :
    ((N : ℝ) - 1) * (1 / (100 * (N : ℝ))) < (1 : ℝ) / 100 := by
  have hNreal : (2 : ℝ) ≤ (N : ℝ) := by exact_mod_cast hN
  have hNpos : (0 : ℝ) < (N : ℝ) := by linarith
  let ε : ℝ := 1 / (100 * (N : ℝ))
  have hε : 0 < ε := by
    dsimp [ε]
    positivity
  have hden : (100 : ℝ) * (N : ℝ) ≠ 0 := ne_of_gt (by positivity)
  have hidentity : (100 : ℝ) * (N : ℝ) * ε = 1 := by
    dsimp [ε]
    field_simp [hden]
  have hsmall : ((N : ℝ) - 1) * ε < (N : ℝ) * ε := by
    nlinarith
  have hvalue : (N : ℝ) * ε = (1 : ℝ) / 100 := by
    nlinarith [hidentity]
  change ((N : ℝ) - 1) * ε < (1 : ℝ) / 100
  linarith

/-- The D1 positive Gram eigenvalue margin, assuming the row
perturbation has been bounded separately, exceeds 99/200. -/
theorem d1_strict_gram_margin (N : ℕ) (hN : 2 ≤ N) :
    (99 : ℝ) / 200 <
      (1 - ((N : ℝ) - 1) * (1 / (100 * (N : ℝ)))) / 2 := by
  have h := d1_row_error_small N hN
  linarith

end OptionD
