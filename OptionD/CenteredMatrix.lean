module

public import OptionD.MeanZero

public section

/-!
# D1: exact centered Gram quadratic on the zero-mean subspace

The double-centering correction has zero quadratic pairing with a
mean-zero vector. This is an exact finite-dimensional identity, not a
numerical or spectral approximation. The positivity theorem imports S119.
The statements here alone do not yield full PSD, exact kernel/rank, or an
Euclidean point configuration.
-/

namespace OptionD

/-- A rank-one row correction vanishes when the right vector sums to zero. -/
private theorem d1_row_correction_zero (N : ℕ)
    (x r : Fin N → ℝ) (hx : (∑ i : Fin N, x i) = 0) :
    (∑ i : Fin N, ∑ j : Fin N, r i * x i * x j) = 0 := by
  calc
    _ = ∑ i : Fin N, (r i * x i) * (∑ j : Fin N, x j) := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [Finset.mul_sum]
    _ = 0 := by simp [hx]

/-- A rank-one column correction vanishes when the left vector sums to zero. -/
private theorem d1_column_correction_zero (N : ℕ)
    (x c : Fin N → ℝ) (hx : (∑ i : Fin N, x i) = 0) :
    (∑ i : Fin N, ∑ j : Fin N, c j * x i * x j) = 0 := by
  calc
    _ = ∑ i : Fin N, x i * (∑ j : Fin N, c j * x j) := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j hj
      ring
    _ = (∑ i : Fin N, x i) * (∑ j : Fin N, c j * x j) := by
      rw [Finset.sum_mul]
    _ = 0 := by rw [hx]; ring

/-- The double-centered Gram matrix has exactly the raw negative
half squared-distance quadratic on all and only mean-zero inputs. The
algebraic identity itself needs no symmetry hypothesis. -/
theorem d1_centered_mean_zero_identity (N : ℕ)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ)
    (hx : (∑ i : Fin N, x i) = 0) :
    (∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * x i * x j) =
    -(1 / 2 : ℝ) *
      (∑ i : Fin N, ∑ j : Fin N,
        d1SquaredDistance N edge i j * x i * x j) := by
  classical
  let D : Fin N → Fin N → ℝ := d1SquaredDistance N edge
  let row : Fin N → ℝ := fun i => ∑ k : Fin N, D i k
  let col : Fin N → ℝ := fun j => ∑ k : Fin N, D k j
  let grand : ℝ := ∑ k : Fin N, ∑ t : Fin N, D k t
  let a : Fin N → ℝ := fun i => row i / (N : ℝ)
  let b : Fin N → ℝ := fun j => col j / (N : ℝ)
  let c : ℝ := grand / ((N : ℝ) ^ 2)
  have hrow : (∑ i : Fin N, ∑ j : Fin N,
      a i * x i * x j) = 0 := d1_row_correction_zero N x a hx
  have hcol : (∑ i : Fin N, ∑ j : Fin N,
      b j * x i * x j) = 0 := d1_column_correction_zero N x b hx
  have hconst : (∑ i : Fin N, ∑ j : Fin N,
      c * x i * x j) = 0 :=
    d1_row_correction_zero N x (fun _ => c) hx
  have hentry (i j : Fin N) :
      d1CenteredGram N edge i j =
        -(1 / 2 : ℝ) * (D i j - a i - b j + c) := by
    rw [d1_centered_gram_formula]
  have hsplit :
      (∑ i : Fin N, ∑ j : Fin N,
        (D i j - a i - b j + c) * x i * x j) =
      (∑ i : Fin N, ∑ j : Fin N, D i j * x i * x j) -
      (∑ i : Fin N, ∑ j : Fin N, a i * x i * x j) -
      (∑ i : Fin N, ∑ j : Fin N, b j * x i * x j) +
      (∑ i : Fin N, ∑ j : Fin N, c * x i * x j) := by
    calc
      _ = ∑ i : Fin N, ∑ j : Fin N,
        (D i j * x i * x j -
          a i * x i * x j -
          b j * x i * x j +
          c * x i * x j) := by
            apply Finset.sum_congr rfl
            intro i hi
            apply Finset.sum_congr rfl
            intro j hj
            ring
      _ = _ := by simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib]
  calc
    _ = -(1 / 2 : ℝ) *
      (∑ i : Fin N, ∑ j : Fin N,
        (D i j - a i - b j + c) * x i * x j) := by
          rw [Finset.mul_sum]
          apply Finset.sum_congr rfl
          intro i hi
          rw [Finset.mul_sum]
          apply Finset.sum_congr rfl
          intro j hj
          rw [hentry]
          ring
    _ = -(1 / 2 : ℝ) *
        (∑ i : Fin N, ∑ j : Fin N,
          D i j * x i * x j) := by
            rw [hsplit, hrow, hcol, hconst]
            ring
    _ = _ := by rfl

/-- Strict lower bound on the actual double-centered Gram quadratic
restricted to zero-mean vectors; margin 99/200 for arbitrary N≥2. -/
theorem d1_centered_mean_zero_lower (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (x : Fin N → ℝ)
    (hx : (∑ i : Fin N, x i) = 0) :
    ((99 : ℝ) / 200) * (∑ i : Fin N, x i ^ 2) ≤
      ∑ i : Fin N, ∑ j : Fin N,
        d1CenteredGram N edge i j * x i * x j := by
  rw [d1_centered_mean_zero_identity N edge x hx]
  exact d1_mean_zero_form_positive N hN edge x hx

end OptionD
