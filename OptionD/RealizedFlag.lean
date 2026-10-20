module

public import OptionD.Rank
public import Mathlib.Analysis.InnerProductSpace.PiL2

public section

open scoped InnerProductSpace

/-!
# S124: exact norm and radius-one strict Rips transfer

All theorems in this file are uniformly quantified over symmetric finite
graphs with N ≥ 2, with no bound on N or graph restrictions.

The Euclidean point family is a HYPOTHESIS in the geometric transfer
theorems; S123 PSD/rank do not yet construct it. This is a formally
verified dependency reduction, NOT a certified Euclidean factorisation.
-/

namespace OptionD

/-- The exact perturbation is strictly smaller than one at every N ≥ 2. -/
theorem d1_epsilon_lt_one (N : ℕ) (hN : 2 ≤ N) :
    d1Epsilon N < 1 := by
  have hn : (2 : ℝ) ≤ (N : ℝ) := by exact_mod_cast hN
  have hd : (0 : ℝ) < 100 * (N : ℝ) := by positivity
  rw [d1_epsilon_formula]
  apply (div_lt_iff₀ hd).2
  nlinarith

/-- Every diagonal entry is zero; every off-diagonal squared distance is
positive, including edges in a graph with any number of vertices. -/
theorem d1_squared_distance_nonneg (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (i j : Fin N) :
    0 ≤ d1SquaredDistance N edge i j := by
  by_cases hij : i = j
  · subst j
    rw [d1_distance_diag]
  · by_cases he : edge i j
    · rw [d1_distance_of_edge N edge i j hij he]
      have hε := d1_epsilon_lt_one N hN
      linarith
    · rw [d1_distance_of_nonedge N edge i j hij he]
      have hε := d1Epsilon_pos N hN
      linarith

/-- For distinct vertices, the strict squared threshold exactly detects
the input edge predicate, without requiring any geometry hypothesis. -/
theorem d1_squared_distance_lt_one_iff (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (i j : Fin N) (hij : i ≠ j) :
    d1SquaredDistance N edge i j < 1 ↔ edge i j := by
  by_cases he : edge i j
  · rw [d1_distance_of_edge N edge i j hij he]
    have hε := d1Epsilon_pos N hN
    constructor
    · intro _
      exact he
    · intro _
      linarith
  · rw [d1_distance_of_nonedge N edge i j hij he]
    have hε := d1Epsilon_pos N hN
    constructor
    · intro h
      exfalso
      linarith
    · intro h
      exact (he h).elim

/-- Nonedges sit strictly outside the unit squared-distance threshold. -/
theorem d1_squared_distance_gt_one_iff (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop) (i j : Fin N) (hij : i ≠ j) :
    1 < d1SquaredDistance N edge i j ↔ ¬ edge i j := by
  by_cases he : edge i j
  · rw [d1_distance_of_edge N edge i j hij he]
    have hε := d1Epsilon_pos N hN
    constructor
    · intro h
      exfalso
      linarith
    · intro h
      exact (h he).elim
  · rw [d1_distance_of_nonedge N edge i j hij he]
    have hε := d1Epsilon_pos N hN
    constructor
    · intro _
      exact he
    · intro _
      linarith

/-- Hypothetical exact Gram-realising points. This is not asserted to
exist by this definition; producing such points in dimension N-1 remains
the constructive factorisation target. -/
def d1HasGramPoints (N : ℕ) (edge : Fin N → Fin N → Prop)
    (p : Fin N → EuclideanSpace ℝ (Fin (N - 1))) : Prop :=
  ∀ i j, ⟪p i, p j⟫_ℝ = d1CenteredGram N edge i j

/-- Exported constructor for the Gram-point predicate. The module system
keeps the definition abstract in importing files, so clients use this bridge. -/
theorem d1_hasGramPoints_of_inner (N : ℕ)
    (edge : Fin N → Fin N → Prop)
    (p : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hp : ∀ i j, ⟪p i, p j⟫_ℝ = d1CenteredGram N edge i j) :
    d1HasGramPoints N edge p := hp

/-- Exact recovery of the squared Euclidean norm from a Gram witness.
No incorrect identification of squared radius with radius is made. -/
theorem d1_gram_points_norm_sq (N : ℕ)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (p : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hp : d1HasGramPoints N edge p) (i j : Fin N) :
    ‖p i - p j‖ ^ 2 = d1SquaredDistance N edge i j := by
  calc
    ‖p i - p j‖ ^ 2 =
        ⟪p i, p i⟫_ℝ - 2 * ⟪p i, p j⟫_ℝ + ⟪p j, p j⟫_ℝ := by
      rw [norm_sub_sq_real,
          real_inner_self_eq_norm_sq, real_inner_self_eq_norm_sq]
    _ = d1CenteredGram N edge i i - 2 * d1CenteredGram N edge i j +
          d1CenteredGram N edge j j := by
      rw [hp i i, hp i j, hp j j]
    _ = d1SquaredDistance N edge i j := by
      have h := d1_centered_distance_recovery N edge hsym i j
      linarith

/-- Norm, rather than its square, is strictly below unit radius exactly
at the edges of any Gram-realising configuration. -/
theorem d1_gram_points_norm_lt_one_iff (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (p : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hp : d1HasGramPoints N edge p) (i j : Fin N) (hij : i ≠ j) :
    ‖p i - p j‖ < 1 ↔ edge i j := by
  have hnorm := d1_gram_points_norm_sq N edge hsym p hp i j
  have hthreshold := d1_squared_distance_lt_one_iff N hN edge i j hij
  have hn : 0 ≤ ‖p i - p j‖ := norm_nonneg _
  constructor
  · intro h
    apply hthreshold.mp
    rw [← hnorm]
    nlinarith
  · intro h
    have hh := hthreshold.mpr h
    rw [← hnorm] at hh
    nlinarith

/-- A graph clique is a finite set whose distinct vertices are adjacent. -/
def d1IsClique (N : ℕ) (edge : Fin N → Fin N → Prop)
    (s : Finset (Fin N)) : Prop :=
  ∀ i ∈ s, ∀ j ∈ s, i ≠ j → edge i j

/-- Strict radius-one Rips simplex on a fixed family of Euclidean points. -/
def d1StrictRipsSimplex (N : ℕ)
    (p : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (s : Finset (Fin N)) : Prop :=
  ∀ i ∈ s, ∀ j ∈ s, i ≠ j → ‖p i - p j‖ < 1

/-- Conditional exact equality of ALL graph cliques and strict radius-one
Vietoris–Rips simplices (including empty and singleton simplices). -/
theorem d1_strict_rips_iff_clique (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (p : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hp : d1HasGramPoints N edge p) (s : Finset (Fin N)) :
    d1StrictRipsSimplex N p s ↔ d1IsClique N edge s := by
  constructor
  · intro h i hi j hj hij
    exact (d1_gram_points_norm_lt_one_iff N hN edge hsym p hp i j hij).mp
      (h i hi j hj hij)
  · intro h i hi j hj hij
    exact (d1_gram_points_norm_lt_one_iff N hN edge hsym p hp i j hij).mpr
      (h i hi j hj hij)


/-- Export the defining-module constructor for the native strict Rips predicate. -/
theorem d1_strict_rips_of_forall (N : ℕ)
    (p : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (s : Finset (Fin N))
    (h : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → ‖p i - p j‖ < 1) :
    d1StrictRipsSimplex N p s := h

/-- Export the defining-module eliminator for the native strict Rips predicate. -/
theorem d1_strict_rips_forall (N : ℕ)
    (p : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (s : Finset (Fin N)) (h : d1StrictRipsSimplex N p s) :
    ∀ i ∈ s, ∀ j ∈ s, i ≠ j → ‖p i - p j‖ < 1 := h

end OptionD
