module

public import OptionD.CenteredMatrix

public section

/-!
# D1: the exact double-centered matrix annihilates constants

These cancellation identities are valid even for directed labels. Symmetry
of the Gram matrix is separate and requires symmetric graph data.
-/

namespace OptionD

theorem d1_centered_row_sum_zero (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (i : Fin N) :
    (∑ j : Fin N, d1CenteredGram N edge i j) = 0 := by
  classical
  have hN0 : (N : ℝ) ≠ 0 := by
    have hn : N ≠ 0 := by omega
    exact_mod_cast hn
  let D : Fin N → Fin N → ℝ := d1SquaredDistance N edge
  have hswap :
      (∑ j : Fin N, ∑ k : Fin N, D k j) =
      (∑ k : Fin N, ∑ j : Fin N, D k j) := Finset.sum_comm
  calc
    _ = -(1 / 2 : ℝ) *
      ((∑ j : Fin N, D i j)
        - (N : ℝ) * ((∑ k : Fin N, D i k) / (N : ℝ))
        - ((∑ j : Fin N, ∑ k : Fin N, D k j) / (N : ℝ))
        + (N : ℝ) * ((∑ k : Fin N, ∑ t : Fin N, D k t) /
            ((N : ℝ) ^ 2))) := by
              simp_rw [d1_centered_gram_formula]
              rw [← Finset.mul_sum]
              simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib,
                Finset.sum_div, Finset.sum_const, nsmul_eq_mul]
              ring
    _ = 0 := by
      rw [hswap]
      field_simp [hN0]
      ring

theorem d1_centered_column_sum_zero (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (j : Fin N) :
    (∑ i : Fin N, d1CenteredGram N edge i j) = 0 := by
  classical
  have hN0 : (N : ℝ) ≠ 0 := by
    have hn : N ≠ 0 := by omega
    exact_mod_cast hn
  let D : Fin N → Fin N → ℝ := d1SquaredDistance N edge
  calc
    _ = -(1 / 2 : ℝ) *
      ((∑ i : Fin N, D i j)
        - ((∑ i : Fin N, ∑ k : Fin N, D i k) / (N : ℝ))
        - (N : ℝ) * ((∑ k : Fin N, D k j) / (N : ℝ))
        + (N : ℝ) * ((∑ k : Fin N, ∑ t : Fin N, D k t) /
            ((N : ℝ) ^ 2))) := by
              simp_rw [d1_centered_gram_formula]
              rw [← Finset.mul_sum]
              simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib,
                Finset.sum_div, Finset.sum_const, nsmul_eq_mul]
              ring
    _ = 0 := by
      field_simp [hN0]
      ring

theorem d1_centered_gram_symmetric (N : ℕ)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (i j : Fin N) :
    d1CenteredGram N edge i j = d1CenteredGram N edge j i := by
  classical
  have hrow (k : Fin N) :
      (∑ t : Fin N, d1SquaredDistance N edge k t) =
      (∑ t : Fin N, d1SquaredDistance N edge t k) := by
    apply Finset.sum_congr rfl
    intro t ht
    exact d1_squared_distance_symmetric N edge hsym k t
  rw [d1_centered_gram_formula, d1_centered_gram_formula]
  rw [d1_squared_distance_symmetric N edge hsym i j,
    hrow i, hrow j]
  ring

end OptionD
