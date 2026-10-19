module

public import OptionD.CenteredPSD

public section

/-!
# S122: strict centered-Gram kernel and D1 graph threshold

All statements work for every N ≥ 2 and every symmetric finite graph.
These results do not manufacture a Euclidean point configuration or a
Gram factorisation: the latter is an independent, still open Lean obligation.
-/

namespace OptionD

/-- Uniform strict coercivity on the mean-zero projection of every vector. -/
theorem d1_centered_quadratic_lower (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (x : Fin N → ℝ) :
    ((99 : ℝ) / 200) *
      (∑ i : Fin N, (x i - (∑ k : Fin N, x k) / (N : ℝ)) ^ 2) ≤
    ∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * x i * x j := by
  let z : Fin N → ℝ := fun i => x i - (∑ k : Fin N, x k) / (N : ℝ)
  have hz := d1_centered_vector_sum_zero N hN x
  have hlower := d1_centered_mean_zero_lower N hN edge z hz
  have hproj := d1_centered_quadratic_projection N hN edge hsym x
  change (∑ i : Fin N, ∑ j : Fin N,
    d1CenteredGram N edge i j * x i * x j) =
    (∑ i : Fin N, ∑ j : Fin N, d1CenteredGram N edge i j * z i * z j) at hproj
  rw [hproj]
  exact hlower

private theorem d1_sqsum_zero (N : ℕ) (z : Fin N → ℝ)
    (hz : (∑ i : Fin N, z i ^ 2) = 0) (i : Fin N) : z i = 0 := by
  have hle : z i ^ 2 ≤ ∑ j : Fin N, z j ^ 2 :=
    Finset.single_le_sum (fun j hj => sq_nonneg (z j)) (Finset.mem_univ i)
  rw [hz] at hle
  nlinarith [sq_nonneg (z i)]

/-- Equality in the full quadratic form occurs exactly on constant vectors.
In particular the nullspace has no additional exceptional vectors at N=2. -/
theorem d1_centered_zero_iff_constant (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (x : Fin N → ℝ) :
    (∑ i : Fin N, ∑ j : Fin N,
      d1CenteredGram N edge i j * x i * x j) = 0 ↔
    ∃ c : ℝ, ∀ i : Fin N, x i = c := by
  constructor
  · intro hq
    have hb := d1_centered_quadratic_lower N hN edge hsym x
    rw [hq] at hb
    have hsnonneg :
        0 ≤ (∑ i : Fin N,
          (x i - (∑ k : Fin N, x k) / (N : ℝ)) ^ 2) :=
      Finset.sum_nonneg (fun i hi => sq_nonneg _)
    have hsum :
        (∑ i : Fin N,
          (x i - (∑ k : Fin N, x k) / (N : ℝ)) ^ 2) = 0 := by
      nlinarith
    refine ⟨(∑ k : Fin N, x k) / (N : ℝ), ?_⟩
    intro i
    have hi := d1_sqsum_zero N
      (fun j => x j - (∑ k : Fin N, x k) / (N : ℝ)) hsum i
    exact sub_eq_zero.mp hi
  · rintro ⟨c, hx⟩
    calc
      (∑ i : Fin N, ∑ j : Fin N,
        d1CenteredGram N edge i j * x i * x j) =
        ∑ i : Fin N, (∑ j : Fin N, d1CenteredGram N edge i j) * c ^ 2 := by
          apply Finset.sum_congr rfl
          intro i hi
          rw [Finset.sum_mul]
          apply Finset.sum_congr rfl
          intro j hj
          rw [hx i, hx j]
          ring
      _ = 0 := by simp [d1_centered_row_sum N hN edge]

/-- Kernel of the centered matrix, expressed without any unproved
spectral decomposition: precisely the constant coordinate functions. -/
theorem d1_centered_coordinate_kernel (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (x : Fin N → ℝ) :
    (∀ i : Fin N,
        (∑ j : Fin N, d1CenteredGram N edge i j * x j) = 0) ↔
    ∃ c : ℝ, ∀ i : Fin N, x i = c := by
  constructor
  · intro hx
    apply (d1_centered_zero_iff_constant N hN edge hsym x).mp
    calc
      (∑ i : Fin N, ∑ j : Fin N,
        d1CenteredGram N edge i j * x i * x j) =
        ∑ i : Fin N, x i *
          (∑ j : Fin N, d1CenteredGram N edge i j * x j) := by
            apply Finset.sum_congr rfl
            intro i hi
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro j hj
            ring
      _ = 0 := by simp [hx]
  · rintro ⟨c, hx⟩ i
    calc
      (∑ j : Fin N, d1CenteredGram N edge i j * x j) =
        ∑ j : Fin N, d1CenteredGram N edge i j * c := by
          apply Finset.sum_congr rfl
          intro j hj
          rw [hx j]
      _ = (∑ j : Fin N, d1CenteredGram N edge i j) * c := by
            rw [Finset.sum_mul]
      _ = 0 := by rw [d1_centered_row_sum N hN edge i]; ring

/-- The squared threshold at 1 detects exactly the off-diagonal graph edges. -/
theorem d1_edge_iff_distance_lt_one (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (i j : Fin N) (hij : i ≠ j) :
    edge i j ↔ d1SquaredDistance N edge i j < 1 := by
  have hε := d1Epsilon_pos N hN
  constructor
  · intro he
    rw [d1_distance_of_edge N edge i j hij he]
    linarith
  · intro hd
    by_contra hn
    rw [d1_distance_of_nonedge N edge i j hij hn] at hd
    linarith

/-- A strict squared-distance value above 1 characterises nonedges. -/
theorem d1_nonedge_iff_distance_gt_one (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (i j : Fin N) (hij : i ≠ j) :
    ¬edge i j ↔ 1 < d1SquaredDistance N edge i j := by
  have hε := d1Epsilon_pos N hN
  constructor
  · intro he
    rw [d1_distance_of_nonedge N edge i j hij he]
    linarith
  · intro hd
    by_contra hn
    rw [d1_distance_of_edge N edge i j hij (by simpa using hn)] at hd
    linarith

end OptionD
