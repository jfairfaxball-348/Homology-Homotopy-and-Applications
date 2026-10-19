module

public import OptionD.GramBounds

public section

/-!
# Option D, D1: finite hollow quadratic bound and centered Gram data

This upgrades S117's two-coordinate estimate to an arbitrary finite
labelled set. Defines actual distances and the double-centered Gram matrix.
This does not yet prove Gram positivity/rank or Euclidean realisation.
-/

namespace OptionD

/-- Exact squared-distance perturbation scale. -/
noncomputable def d1Epsilon (N : ℕ) : ℝ := 1 / (100 * (N : ℝ))

theorem d1Epsilon_pos (N : ℕ) (hN : 2 ≤ N) : 0 < d1Epsilon N := by
  have hNreal : (2 : ℝ) ≤ (N : ℝ) := by exact_mod_cast hN
  unfold d1Epsilon
  positivity

/-- Signed off-diagonal error, zero on the diagonal. -/
noncomputable def d1Perturbation (N : ℕ)
    (edge : Fin N → Fin N → Prop) (i j : Fin N) : ℝ := by
  classical
  exact if i = j then 0 else if edge i j then -(d1Epsilon N) else d1Epsilon N

/-- Two-distance squared-distance matrix, symmetric for symmetric graph data. -/
noncomputable def d1SquaredDistance (N : ℕ)
    (edge : Fin N → Fin N → Prop) (i j : Fin N) : ℝ :=
  (if i = j then 0 else 1) + d1Perturbation N edge i j

/-- Explicit double-centered matrix G = -J D J / 2. -/
noncomputable def d1CenteredGram (N : ℕ)
    (edge : Fin N → Fin N → Prop) : Matrix (Fin N) (Fin N) ℝ :=
  fun i j =>
    -(1 / 2 : ℝ) *
      (d1SquaredDistance N edge i j
        - (∑ k : Fin N, d1SquaredDistance N edge i k) / (N : ℝ)
        - (∑ k : Fin N, d1SquaredDistance N edge k j) / (N : ℝ)
        + (∑ k : Fin N, ∑ l : Fin N, d1SquaredDistance N edge k l) /
            ((N : ℝ) ^ 2))

theorem d1_perturbation_diag (N : ℕ) (edge : Fin N → Fin N → Prop)
    (i : Fin N) : d1Perturbation N edge i i = 0 := by
  simp [d1Perturbation]

theorem d1_perturbation_abs_le (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (i j : Fin N) :
    |d1Perturbation N edge i j| ≤ d1Epsilon N := by
  have hε : 0 ≤ d1Epsilon N := le_of_lt (d1Epsilon_pos N hN)
  by_cases hij : i = j
  · simp [d1Perturbation, hij, hε]
  · by_cases hedge : edge i j
    · simp [d1Perturbation, hij, hedge, abs_of_nonneg hε]
    · simp [d1Perturbation, hij, hedge, abs_of_nonneg hε]

theorem d1_distance_diag (N : ℕ) (edge : Fin N → Fin N → Prop)
    (i : Fin N) : d1SquaredDistance N edge i i = 0 := by
  simp [d1SquaredDistance, d1_perturbation_diag]

theorem d1_distance_of_edge (N : ℕ) (edge : Fin N → Fin N → Prop)
    (i j : Fin N) (hij : i ≠ j) (hedge : edge i j) :
    d1SquaredDistance N edge i j = 1 - d1Epsilon N := by
  simp [d1SquaredDistance, d1Perturbation, hij, hedge]
  ring

theorem d1_distance_of_nonedge (N : ℕ) (edge : Fin N → Fin N → Prop)
    (i j : Fin N) (hij : i ≠ j) (hedge : ¬edge i j) :
    d1SquaredDistance N edge i j = 1 + d1Epsilon N := by
  simp [d1SquaredDistance, d1Perturbation, hij, hedge]

/-- For any hollow N-by-N matrix bounded entrywise by epsilon, its
quadratic perturbation is bounded below by -(N-1)epsilon times sum of
squares, with no symmetry assumption required for this algebraic bound. -/
theorem d1_hollow_quadratic_lower (N : ℕ) (ε : ℝ) (hε : 0 ≤ ε)
    (a : Fin N → Fin N → ℝ) (x : Fin N → ℝ)
    (hdiag : ∀ i, a i i = 0)
    (hbound : ∀ i j, |a i j| ≤ ε) :
    -(ε * ((N : ℝ) - 1)) * (∑ i : Fin N, x i ^ 2) ≤
      ∑ i : Fin N, ∑ j : Fin N, a i j * x i * x j := by
  classical
  have hentry (i j : Fin N) :
      -(ε / 2) * (x i ^ 2 + x j ^ 2) +
        (if i = j then ε * x i ^ 2 else 0) ≤
          a i j * x i * x j := by
    by_cases hij : i = j
    · subst j
      simp [hdiag]
      nlinarith
    · simp only [if_neg hij, add_zero]
      exact d1_pair_error_lower ε (a i j) (x i) (x j) hε (hbound i j)
  have hsum :
      (∑ i : Fin N, ∑ j : Fin N,
        (-(ε / 2) * (x i ^ 2 + x j ^ 2) +
          (if i = j then ε * x i ^ 2 else 0))) ≤
        ∑ i : Fin N, ∑ j : Fin N, a i j * x i * x j := by
    apply Finset.sum_le_sum
    intro i hi
    apply Finset.sum_le_sum
    intro j hj
    exact hentry i j
  have hleft :
      (∑ i : Fin N, ∑ j : Fin N, x i ^ 2) =
        (N : ℝ) * (∑ i : Fin N, x i ^ 2) := by
    simp [Finset.sum_const, nsmul_eq_mul, ← Finset.mul_sum, mul_comm]
  have hright :
      (∑ i : Fin N, ∑ j : Fin N, x j ^ 2) =
        (N : ℝ) * (∑ i : Fin N, x i ^ 2) := by
    simp [Finset.sum_const, nsmul_eq_mul, mul_comm]
  have hdiagSum :
      (∑ i : Fin N, ∑ j : Fin N,
        if i = j then ε * x i ^ 2 else 0) =
        ε * (∑ i : Fin N, x i ^ 2) := by
    simp [← Finset.mul_sum]
  have hbase :
      (∑ i : Fin N, ∑ j : Fin N,
          -(ε / 2) * (x i ^ 2 + x j ^ 2)) =
        -(ε * (N : ℝ)) * (∑ i : Fin N, x i ^ 2) := by
    calc
      _ = (∑ i : Fin N, ∑ j : Fin N,
              (-(ε / 2) * x i ^ 2 + -(ε / 2) * x j ^ 2)) := by
            apply Finset.sum_congr rfl
            intro i hi
            apply Finset.sum_congr rfl
            intro j hj
            ring
      _ = (∑ i : Fin N, ∑ j : Fin N, -(ε / 2) * x i ^ 2) +
            (∑ i : Fin N, ∑ j : Fin N, -(ε / 2) * x j ^ 2) := by
            simp only [Finset.sum_add_distrib]
      _ = (-(ε / 2)) *
          (∑ i : Fin N, ∑ j : Fin N, x i ^ 2) +
            (-(ε / 2)) *
          (∑ i : Fin N, ∑ j : Fin N, x j ^ 2) := by
            simp only [Finset.mul_sum]
      _ = _ := by rw [hleft, hright]; ring
  have hform :
      (∑ i : Fin N, ∑ j : Fin N,
        (-(ε / 2) * (x i ^ 2 + x j ^ 2) +
          (if i = j then ε * x i ^ 2 else 0))) =
        -(ε * ((N : ℝ) - 1)) * (∑ i : Fin N, x i ^ 2) := by
    simp only [Finset.sum_add_distrib]
    rw [hbase, hdiagSum]
    ring
  rw [← hform]
  exact hsum

/-- The exact D1 off-diagonal error quadratic bound. -/
theorem d1_perturbation_quadratic_lower (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ) :
    -(d1Epsilon N * ((N : ℝ) - 1)) *
        (∑ i : Fin N, x i ^ 2) ≤
      ∑ i : Fin N, ∑ j : Fin N,
        d1Perturbation N edge i j * x i * x j :=
  d1_hollow_quadratic_lower N (d1Epsilon N)
    (le_of_lt (d1Epsilon_pos N hN))
    (d1Perturbation N edge) x
    (d1_perturbation_diag N edge)
    (d1_perturbation_abs_le N hN edge)

end OptionD
