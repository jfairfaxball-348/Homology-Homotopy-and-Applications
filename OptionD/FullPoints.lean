module

public import OptionD.SpectralRoot
public import OptionD.RealizedFlag
public import Mathlib.Analysis.InnerProductSpace.PiL2

public section

open scoped InnerProductSpace

/-!
# S124: concrete Euclidean Gram points in ambient dimension N

This actual construction uses the symmetric square root of the PSD centered
Gram matrix, yielding p : Fin N → EuclideanSpace ℝ (Fin N).
The prescribed *minimal* target is dimension N-1, not N; dimension
compression is still an explicit outstanding proof obligation.
-/

namespace OptionD

/-- Actual Euclidean column points associated to a real symmetric factor. -/
noncomputable def d1FullSpacePoints (N : ℕ)
    (B : Matrix (Fin N) (Fin N) ℝ) :
    Fin N → EuclideanSpace ℝ (Fin N) :=
  fun i => WithLp.toLp 2 (fun k : Fin N => B k i)

/-- Exported coordinate access for the canonical Euclidean columns. -/
theorem d1_full_space_points_coord (N : ℕ)
    (B : Matrix (Fin N) (Fin N) ℝ) (i k : Fin N) :
    (d1FullSpacePoints N B i) k = B k i := rfl

/-- A symmetric factor B with B²=G supplies a genuine Euclidean point
configuration realising every entry of the Gram matrix in dimension N. -/
theorem d1_full_space_points_gram (N : ℕ)
    (edge : Fin N → Fin N → Prop)
    (B : Matrix (Fin N) (Fin N) ℝ)
    (hB : B.IsHermitian)
    (hBB : B * B = d1CenteredGram N edge)
    (i j : Fin N) :
    ⟪d1FullSpacePoints N B i, d1FullSpacePoints N B j⟫_ℝ =
      d1CenteredGram N edge i j := by
  rw [← hBB, EuclideanSpace.inner_eq_star_dotProduct]
  simp only [dotProduct, Pi.star_apply, star_trivial]
  change (∑ k : Fin N, B k j * B k i) = (B * B) i j
  rw [Matrix.mul_apply]
  apply Finset.sum_congr rfl
  intro k hk
  have hsym : B k i = B i k := by
    simpa only [star_trivial] using hB.apply i k
  rw [hsym]
  ring

/-- There are genuine Gram-realising Euclidean points in the ambient
dimension N (one dimension higher than the session's final target). -/
theorem d1_exists_full_space_gram_points (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) :
    ∃ p : Fin N → EuclideanSpace ℝ (Fin N),
      ∀ i j, ⟪p i, p j⟫_ℝ = d1CenteredGram N edge i j := by
  obtain ⟨B, hB, hBB⟩ :=
    d1_centered_symmetric_square_root N hN edge hsym
  exact ⟨d1FullSpacePoints N B, d1_full_space_points_gram N edge B hB hBB⟩


/-- The actual N-coordinate Euclidean embedding recovers all squared distances,
including the zero diagonal. -/
theorem d1_full_space_norm_sq (N : ℕ)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (B : Matrix (Fin N) (Fin N) ℝ)
    (hB : B.IsHermitian) (hBB : B * B = d1CenteredGram N edge)
    (i j : Fin N) :
    ‖d1FullSpacePoints N B i - d1FullSpacePoints N B j‖ ^ 2 =
      d1SquaredDistance N edge i j := by
  calc
    ‖d1FullSpacePoints N B i - d1FullSpacePoints N B j‖ ^ 2 =
        ⟪d1FullSpacePoints N B i, d1FullSpacePoints N B i⟫_ℝ -
        2 * ⟪d1FullSpacePoints N B i, d1FullSpacePoints N B j⟫_ℝ +
        ⟪d1FullSpacePoints N B j, d1FullSpacePoints N B j⟫_ℝ := by
      rw [norm_sub_sq_real,
          real_inner_self_eq_norm_sq, real_inner_self_eq_norm_sq]
    _ = d1CenteredGram N edge i i - 2 * d1CenteredGram N edge i j +
        d1CenteredGram N edge j j := by
      rw [d1_full_space_points_gram N edge B hB hBB i i,
          d1_full_space_points_gram N edge B hB hBB i j,
          d1_full_space_points_gram N edge B hB hBB j j]
    _ = d1SquaredDistance N edge i j := by
      have h := d1_centered_distance_recovery N edge hsym i j
      linarith

/-- Every abstract two-height symmetric graph has an ACTUAL ambient
N-dimensional Euclidean strict radius-one realisation. This is not yet
the requested minimal dimension N-1. -/
theorem d1_exists_full_space_rips (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) :
    ∃ p : Fin N → EuclideanSpace ℝ (Fin N),
      (∀ i j, ‖p i - p j‖ ^ 2 = d1SquaredDistance N edge i j) ∧
      (∀ i j, i ≠ j → (‖p i - p j‖ < 1 ↔ edge i j)) := by
  obtain ⟨B, hB, hBB⟩ :=
    d1_centered_symmetric_square_root N hN edge hsym
  let p := d1FullSpacePoints N B
  refine ⟨p, ?_, ?_⟩
  · intro i j
    exact d1_full_space_norm_sq N edge hsym B hB hBB i j
  · intro i j hij
    have hn : 0 ≤ ‖p i - p j‖ := norm_nonneg _
    have hs := d1_full_space_norm_sq N edge hsym B hB hBB i j
    have ht := d1_squared_distance_lt_one_iff N hN edge i j hij
    constructor
    · intro h
      apply ht.mp
      rw [← hs]
      nlinarith
    · intro h
      have hh := ht.mpr h
      rw [← hs] at hh
      nlinarith

/-- An honest Euclidean radius-one Vietoris–Rips flag in ambient dimension N
equals the graph's clique complex, including empty and singleton sets. -/
theorem d1_exists_full_space_rips_flag (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) :
    ∃ p : Fin N → EuclideanSpace ℝ (Fin N),
      ∀ s : Finset (Fin N),
        (∀ i ∈ s, ∀ j ∈ s, i ≠ j → ‖p i - p j‖ < 1) ↔
          (∀ i ∈ s, ∀ j ∈ s, i ≠ j → edge i j) := by
  obtain ⟨p, -, hp⟩ := d1_exists_full_space_rips N hN edge hsym
  refine ⟨p, ?_⟩
  intro s
  constructor
  · intro h i hi j hj hij
    exact (hp i j hij).mp (h i hi j hj hij)
  · intro h i hi j hj hij
    exact (hp i j hij).mpr (h i hi j hj hij)

end OptionD
