module

public import OptionD.FiniteGram

public section

/-!
# D1: arbitrary-cardinality mean-zero distance form

This is a kernel-checkable slice of the two-distance Euclidean Gram step.
It proves strict control of the raw squared-distance quadratic on the
mean-zero subspace; it does NOT yet identify the double-centered matrix
quadratic, establish its full PSD/rank or construct Euclidean points.
-/

namespace OptionD

/-- If the coordinate sum vanishes, the equilateral hollow matrix has
quadratic form precisely minus the coordinate square sum. -/
theorem d1_equilateral_quadratic (N : ℕ) (x : Fin N → ℝ)
    (hx : (∑ i : Fin N, x i) = 0) :
    (∑ i : Fin N, ∑ j : Fin N,
      (if i = j then (0 : ℝ) else 1) * x i * x j) =
      -(∑ i : Fin N, x i ^ 2) := by
  classical
  have hrow (i : Fin N) :
      (∑ j : Fin N,
        (if i = j then (0 : ℝ) else 1) * x i * x j) =
      -(x i ^ 2) := by
    calc
      _ = ∑ j : Fin N, (x i * x j -
          if i = j then x i ^ 2 else 0) := by
            apply Finset.sum_congr rfl
            intro j hj
            by_cases hij : i = j
            · subst j
              simp
              ring
            · simp [hij]
      _ = (∑ j : Fin N, x i * x j) -
          (∑ j : Fin N, if i = j then x i ^ 2 else 0) := by
            rw [Finset.sum_sub_distrib]
      _ = x i * (∑ j : Fin N, x j) - x i ^ 2 := by
            simp [Finset.mul_sum]
      _ = -(x i ^ 2) := by
            rw [hx]
            ring
  calc
    _ = ∑ i : Fin N, -(x i ^ 2) := by
          apply Finset.sum_congr rfl
          intro i hi
          exact hrow i
    _ = -(∑ i : Fin N, x i ^ 2) := by
          rw [Finset.sum_neg_distrib]

/-- The S118 lower estimate, applied to the negative error matrix,
also gives a uniform upper estimate. No symmetry is required. -/
theorem d1_hollow_quadratic_upper (N : ℕ) (ε : ℝ)
    (hε : 0 ≤ ε) (a : Fin N → Fin N → ℝ) (x : Fin N → ℝ)
    (hdiag : ∀ i, a i i = 0)
    (hbound : ∀ i j, |a i j| ≤ ε) :
    (∑ i : Fin N, ∑ j : Fin N, a i j * x i * x j) ≤
      (ε * ((N : ℝ) - 1)) * (∑ i : Fin N, x i ^ 2) := by
  have hnegdiag : ∀ i, -(a i i) = 0 := by
    intro i
    simp [hdiag i]
  have hnegbound : ∀ i j, |-(a i j)| ≤ ε := by
    intro i j
    simpa only [abs_neg] using hbound i j
  have h := d1_hollow_quadratic_lower N ε hε
    (fun i j => -(a i j)) x hnegdiag hnegbound
  have hsum :
      (∑ i : Fin N, ∑ j : Fin N, -(a i j) * x i * x j) =
      -(∑ i : Fin N, ∑ j : Fin N, a i j * x i * x j) := by
    simp only [neg_mul, Finset.sum_neg_distrib]
  rw [hsum] at h
  linarith

theorem d1_perturbation_quadratic_upper (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ) :
    (∑ i : Fin N, ∑ j : Fin N,
      d1Perturbation N edge i j * x i * x j) ≤
        (d1Epsilon N * ((N : ℝ) - 1)) *
          (∑ i : Fin N, x i ^ 2) :=
  d1_hollow_quadratic_upper N (d1Epsilon N)
    (le_of_lt (d1Epsilon_pos N hN))
    (d1Perturbation N edge) x
    (d1_perturbation_diag N edge)
    (d1_perturbation_abs_le N hN edge)

/-- Exact negative-type quantitative bound for every mean-zero vector
and every directed edge predicate on N points. In the Euclidean application
the edge predicate will additionally be assumed symmetric. -/
theorem d1_squared_distance_mean_zero_upper (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ)
    (hx : (∑ i : Fin N, x i) = 0) :
    (∑ i : Fin N, ∑ j : Fin N,
      d1SquaredDistance N edge i j * x i * x j) ≤
        -((99 : ℝ) / 100) * (∑ i : Fin N, x i ^ 2) := by
  classical
  have hsplit :
      (∑ i : Fin N, ∑ j : Fin N,
        d1SquaredDistance N edge i j * x i * x j) =
      (∑ i : Fin N, ∑ j : Fin N,
        (if i = j then (0 : ℝ) else 1) * x i * x j) +
      (∑ i : Fin N, ∑ j : Fin N,
        d1Perturbation N edge i j * x i * x j) := by
    calc
      _ = ∑ i : Fin N, ∑ j : Fin N,
          ((if i = j then (0 : ℝ) else 1) * x i * x j +
            d1Perturbation N edge i j * x i * x j) := by
              apply Finset.sum_congr rfl
              intro i hi
              apply Finset.sum_congr rfl
              intro j hj
              simp only [d1SquaredDistance]
              ring
      _ = _ := by simp only [Finset.sum_add_distrib]
  have hrow :
      d1Epsilon N * ((N : ℝ) - 1) ≤ (1 : ℝ) / 100 := by
    have h := le_of_lt (d1_row_error_small N hN)
    simpa only [d1Epsilon, mul_comm] using h
  have hsq : 0 ≤ ∑ i : Fin N, x i ^ 2 :=
    Finset.sum_nonneg (fun i hi => sq_nonneg (x i))
  have hupper := d1_perturbation_quadratic_upper N hN edge x
  have hprod := mul_le_mul_of_nonneg_right hrow hsq
  rw [hsplit, d1_equilateral_quadratic N x hx]
  nlinarith

/-- Positivity of the mean-zero Gram *form* with explicit uniform margin.
Identification with d1CenteredGram is left as a separate matrix identity. -/
theorem d1_mean_zero_form_positive (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ)
    (hx : (∑ i : Fin N, x i) = 0) :
    ((99 : ℝ) / 200) * (∑ i : Fin N, x i ^ 2) ≤
      -((1 : ℝ) / 2) *
        (∑ i : Fin N, ∑ j : Fin N,
          d1SquaredDistance N edge i j * x i * x j) := by
  have h := d1_squared_distance_mean_zero_upper N hN edge x hx
  nlinarith

end OptionD
