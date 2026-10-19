module

public import OptionD.CenteredSums

public section

/-!
# D1: quadratic positivity of the entire centered Gram matrix

The exact row/column cancellations reduce an arbitrary vector to its
mean-zero projection, where S120 gives a quantitative 99/200 bound.
This stage does not assert rank or a Euclidean Gram factorisation.
-/

namespace OptionD

theorem d1_projection_sum_zero (N : ℕ) (hN : 2 ≤ N)
    (x : Fin N → ℝ) :
    (∑ i : Fin N, (x i - (∑ j : Fin N, x j) / (N : ℝ))) = 0 := by
  classical
  have hN0 : (N : ℝ) ≠ 0 := by
    have hn : N ≠ 0 := by omega
    exact_mod_cast hn
  calc
    _ = (∑ i : Fin N, x i) -
        (∑ i : Fin N, (∑ j : Fin N, x j) / (N : ℝ)) := by
          rw [Finset.sum_sub_distrib]
    _ = (∑ i : Fin N, x i) -
        (N : ℝ) * ((∑ j : Fin N, x j) / (N : ℝ)) := by
          simp [Finset.sum_const, nsmul_eq_mul]
    _ = 0 := by field_simp [hN0]; ring

/-- Double centering makes the quadratic form invariant under adding
a common real scalar to every coordinate. No graph symmetry is needed. -/
theorem d1_centered_quadratic_shift (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ) (c : ℝ) :
    (∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * (x i + c) * (x j + c)) =
    (∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * x i * x j) := by
  classical
  let G := d1CenteredGram N edge
  have hrow : (∑ i : Fin N, ∑ j : Fin N, G i j * x i) = 0 := by
    calc
      _ = ∑ i : Fin N, x i * (∑ j : Fin N, G i j) := by
            apply Finset.sum_congr rfl
            intro i hi
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro j hj
            ring
      _ = 0 := by simp [G, d1_centered_row_sum_zero N hN edge]
  have hcol : (∑ i : Fin N, ∑ j : Fin N, G i j * x j) = 0 := by
    calc
      _ = ∑ j : Fin N, ∑ i : Fin N, G i j * x j := Finset.sum_comm
      _ = ∑ j : Fin N, x j * (∑ i : Fin N, G i j) := by
            apply Finset.sum_congr rfl
            intro j hj
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro i hi
            ring
      _ = 0 := by simp [G, d1_centered_column_sum_zero N hN edge]
  have htotal : (∑ i : Fin N, ∑ j : Fin N, G i j) = 0 := by
    simp [G, d1_centered_row_sum_zero N hN edge]
  calc
    _ = (∑ i : Fin N, ∑ j : Fin N, G i j * x i * x j) +
        c * (∑ i : Fin N, ∑ j : Fin N, G i j * x i) +
        c * (∑ i : Fin N, ∑ j : Fin N, G i j * x j) +
        c ^ 2 * (∑ i : Fin N, ∑ j : Fin N, G i j) := by
          calc
            _ = ∑ i : Fin N, ∑ j : Fin N,
                (G i j * x i * x j + c * (G i j * x i) +
                  c * (G i j * x j) + c ^ 2 * G i j) := by
                    apply Finset.sum_congr rfl
                    intro i hi
                    apply Finset.sum_congr rfl
                    intro j hj
                    dsimp only [G]
                    ring
            _ = _ := by
                  simp only [Finset.sum_add_distrib]
                  ring_nf
    _ = _ := by rw [hrow, hcol, htotal]; ring

/-- Actual all-vector double-centered quadratic bound, for any N>=2.
For a directed label relation this is a bound on the real quadratic form,
not a claim that the matrix is symmetric. -/
theorem d1_centered_all_quadratic_lower (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ) :
    ((99 : ℝ) / 200) *
      (∑ i : Fin N, (x i - (∑ k : Fin N, x k) / (N : ℝ)) ^ 2) ≤
    ∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * x i * x j := by
  let m : ℝ := (∑ k : Fin N, x k) / (N : ℝ)
  let z : Fin N → ℝ := fun i => x i - m
  have hz : (∑ i : Fin N, z i) = 0 := by
    simpa only [z, m] using d1_projection_sum_zero N hN x
  have hplus (i : Fin N) : z i + m = x i := by
    dsimp only [z]
    ring
  have heq :
      (∑ i : Fin N, ∑ j : Fin N,
        d1CenteredGram N edge i j * x i * x j) =
      (∑ i : Fin N, ∑ j : Fin N,
        d1CenteredGram N edge i j * z i * z j) := by
          simpa only [hplus] using d1_centered_quadratic_shift N hN edge z m
  change ((99 : ℝ) / 200) * (∑ i : Fin N, z i ^ 2) ≤
    ∑ i : Fin N, ∑ j : Fin N, d1CenteredGram N edge i j * x i * x j
  rw [heq]
  exact d1_centered_mean_zero_lower N hN edge z hz

/-- The centered Gram quadratic is nonnegative on ALL real vectors,
not only those whose coordinate sum is zero. -/
theorem d1_centered_quadratic_nonneg (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ) :
    0 ≤ ∑ i : Fin N, ∑ j : Fin N,
        d1CenteredGram N edge i j * x i * x j := by
  have h := d1_centered_all_quadratic_lower N hN edge x
  have hs : 0 ≤
      (∑ i : Fin N, (x i - (∑ k : Fin N, x k) / (N : ℝ)) ^ 2) :=
    Finset.sum_nonneg (fun i hi => sq_nonneg _)
  nlinarith

end OptionD
