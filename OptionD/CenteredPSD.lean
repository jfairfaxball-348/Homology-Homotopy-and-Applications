module

public import OptionD.CenteredMatrix

public section

/-!
# S121: centered Gram row/column zero and full positive semidefiniteness

The zero-sum and projection calculations are finite, all-N algebra. Symmetry
of the underlying graph is explicitly required for matrix symmetry and for
the geometric interpretation; directed edges remain allowed in the row and
column cancellation statements. No Gram representation or rank is claimed.
-/

namespace OptionD

private theorem d1_row_centering_algebra (N : ℕ) (hN : 0 < N)
    (D : Fin N → Fin N → ℝ) (i : Fin N) :
    (∑ j : Fin N,
      (D i j - (∑ k : Fin N, D i k) / (N : ℝ)
        - (∑ k : Fin N, D k j) / (N : ℝ)
        + (∑ k : Fin N, ∑ t : Fin N, D k t) / ((N : ℝ) ^ 2))) = 0 := by
  have hn : (N : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hN)
  have hswap : (∑ j : Fin N, ∑ k : Fin N, D k j) =
      (∑ k : Fin N, ∑ j : Fin N, D k j) := Finset.sum_comm
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib,
    Finset.sum_div, Finset.sum_const, Finset.card_fin, nsmul_eq_mul]
  rw [hswap]
  field_simp
  ring

/-- Every row of the double-centered Gram sums to zero; this is independent
of graph symmetry. -/
theorem d1_centered_row_sum (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (i : Fin N) :
    (∑ j : Fin N, d1CenteredGram N edge i j) = 0 := by
  classical
  let D : Fin N → Fin N → ℝ := d1SquaredDistance N edge
  calc
    _ = -(1 / 2 : ℝ) *
      (∑ j : Fin N,
        (D i j - (∑ k : Fin N, D i k) / (N : ℝ)
          - (∑ k : Fin N, D k j) / (N : ℝ)
          + (∑ k : Fin N, ∑ t : Fin N, D k t) / ((N : ℝ) ^ 2))) := by
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro j hj
            rw [d1_centered_gram_formula]
    _ = 0 := by rw [d1_row_centering_algebra N (by omega) D i]; ring

/-- Explicit symmetry hypothesis for the Euclidean application. -/
theorem d1_centered_gram_symmetric (N : ℕ)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (i j : Fin N) :
    d1CenteredGram N edge i j = d1CenteredGram N edge j i := by
  have hrowcol (k : Fin N) :
      (∑ t : Fin N, d1SquaredDistance N edge k t) =
      (∑ t : Fin N, d1SquaredDistance N edge t k) := by
    apply Finset.sum_congr rfl
    intro t ht
    exact d1_squared_distance_symmetric N edge hsym k t
  rw [d1_centered_gram_formula, d1_centered_gram_formula]
  rw [d1_squared_distance_symmetric N edge hsym i j]
  rw [hrowcol i, ← hrowcol j]
  ring

/-- For symmetric edge data every column also sums to zero. -/
theorem d1_centered_column_sum (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (j : Fin N) :
    (∑ i : Fin N, d1CenteredGram N edge i j) = 0 := by
  calc
    _ = ∑ i : Fin N, d1CenteredGram N edge j i := by
      apply Finset.sum_congr rfl
      intro i hi
      exact d1_centered_gram_symmetric N edge hsym i j
    _ = 0 := d1_centered_row_sum N hN edge j

/-- The all-ones vector is an exact zero mode. -/
theorem d1_centered_ones_kernel (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (i : Fin N) :
    (∑ j : Fin N, d1CenteredGram N edge i j * (1 : ℝ)) = 0 := by
  simpa only [mul_one] using d1_centered_row_sum N hN edge i

private theorem d1_quadratic_shift (N : ℕ)
    (A : Fin N → Fin N → ℝ)
    (hrow : ∀ i, (∑ j : Fin N, A i j) = 0)
    (hcol : ∀ j, (∑ i : Fin N, A i j) = 0)
    (x : Fin N → ℝ) (m : ℝ) :
    (∑ i : Fin N, ∑ j : Fin N, A i j * x i * x j) =
    (∑ i : Fin N, ∑ j : Fin N,
      A i j * (x i - m) * (x j - m)) := by
  have hr : (∑ i : Fin N, ∑ j : Fin N, A i j * x i) = 0 := by
    calc
      _ = ∑ i : Fin N, x i * (∑ j : Fin N, A i j) := by
        apply Finset.sum_congr rfl
        intro i hi
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro j hj
        ring
      _ = 0 := by simp [hrow]
  have hc : (∑ i : Fin N, ∑ j : Fin N, A i j * x j) = 0 := by
    calc
      _ = ∑ j : Fin N, x j * (∑ i : Fin N, A i j) := by
        rw [Finset.sum_comm]
        apply Finset.sum_congr rfl
        intro j hj
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro i hi
        ring
      _ = 0 := by simp [hcol]
  have ht : (∑ i : Fin N, ∑ j : Fin N, A i j) = 0 := by
    calc
      _ = ∑ i : Fin N, (0 : ℝ) := by
        apply Finset.sum_congr rfl
        intro i hi
        exact hrow i
      _ = 0 := by simp
  symm
  calc
    _ = ∑ i : Fin N, ∑ j : Fin N,
        (A i j * x i * x j - m * (A i j * x i) -
          m * (A i j * x j) + m ^ 2 * A i j) := by
          apply Finset.sum_congr rfl
          intro i hi
          apply Finset.sum_congr rfl
          intro j hj
          ring
    _ = (∑ i : Fin N, ∑ j : Fin N, A i j * x i * x j) -
        m * (∑ i : Fin N, ∑ j : Fin N, A i j * x i) -
        m * (∑ i : Fin N, ∑ j : Fin N, A i j * x j) +
        m ^ 2 * (∑ i : Fin N, ∑ j : Fin N, A i j) := by
          simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib,
            Finset.mul_sum]
          ring
    _ = _ := by rw [hr, hc, ht]; ring

/-- Orthogonal-to-constants algebra: the coordinate-wise centered vector
has sum zero for every N≥2. -/
theorem d1_centered_vector_sum_zero (N : ℕ) (hN : 2 ≤ N)
    (x : Fin N → ℝ) :
    (∑ i : Fin N, (x i - (∑ j : Fin N, x j) / (N : ℝ))) = 0 := by
  have hn : (N : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt (by omega : 0 < N))
  simp only [Finset.sum_sub_distrib, Finset.sum_const, Finset.card_fin,
    nsmul_eq_mul]
  field_simp
  ring

/-- Exact invariance of the Gram quadratic under subtracting the mean. -/
theorem d1_centered_quadratic_projection (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (x : Fin N → ℝ) :
    (∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * x i * x j) =
    (∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j *
        (x i - (∑ k : Fin N, x k) / (N : ℝ)) *
        (x j - (∑ k : Fin N, x k) / (N : ℝ))) :=
  d1_quadratic_shift N (d1CenteredGram N edge)
    (d1_centered_row_sum N hN edge)
    (d1_centered_column_sum N hN edge hsym) x _

/-- Full positive semidefiniteness of the centered Gram, without a
mean-zero hypothesis on the test vector. No Euclidean representation
or rank conclusion is included in this theorem. -/
theorem d1_centered_quadratic_nonneg (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (x : Fin N → ℝ) :
    0 ≤ ∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * x i * x j := by
  let z : Fin N → ℝ := fun i => x i - (∑ k : Fin N, x k) / (N : ℝ)
  have hz : (∑ i : Fin N, z i) = 0 := d1_centered_vector_sum_zero N hN x
  have hpos : 0 ≤ ((99 : ℝ) / 200) * (∑ i : Fin N, z i ^ 2) :=
    mul_nonneg (by norm_num) (Finset.sum_nonneg (fun i hi => sq_nonneg (z i)))
  have hlower := d1_centered_mean_zero_lower N hN edge z hz
  have heq := d1_centered_quadratic_projection N hN edge hsym x
  change (∑ i : Fin N, ∑ j : Fin N,
    d1CenteredGram N edge i j * x i * x j) =
    (∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * z i * z j) at heq
  rw [heq]
  exact le_trans hpos hlower

end OptionD
