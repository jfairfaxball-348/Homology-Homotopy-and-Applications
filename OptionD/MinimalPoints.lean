module

public import OptionD.FullPoints

public section

open scoped InnerProductSpace

/-!
# S125: minimal-dimensional Gram geometry

We first establish a polynomial kernel fact that does not require a new
functional-calculus lemma: when a square B² has one-dimensional constant
kernel, B itself annihilates the constants.
-/

namespace OptionD

/-- The square-root factor annihilates the constant vector. In fact,
symmetry of B is not needed for this kernel argument: the kernel of B² is
one-dimensional, which excludes a length-two Jordan chain at eigenvalue 0. -/
theorem d1_factor_row_sum_zero (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (B : Matrix (Fin N) (Fin N) ℝ)
    (hBB : B * B = d1CenteredGram N edge) (i : Fin N) :
    (∑ j : Fin N, B i j) = 0 := by
  let u : Fin N → ℝ := fun _ => 1
  let y : Fin N → ℝ := B.mulVec u
  have hGu : (d1CenteredGram N edge).mulVec u = 0 := by
    apply (d1_centered_mulVec_kernel N hN edge hsym u).mpr
    exact ⟨1, fun _ => rfl⟩
  have hBy : B.mulVec y = 0 := by
    have h : (B * B).mulVec u = 0 := by simpa only [hBB] using hGu
    simpa only [Matrix.mulVec_mulVec, y] using h
  have hGy : (d1CenteredGram N edge).mulVec y = 0 := by
    rw [← hBB, Matrix.mulVec_mulVec, hBy, Matrix.mulVec_zero]
  obtain ⟨c, hc⟩ := (d1_centered_mulVec_kernel N hN edge hsym y).mp hGy
  have hy : y = c • u := by
    funext k
    simpa [u, Pi.smul_apply, smul_eq_mul] using hc k
  have hcy : c * c = 0 := by
    have h := congrFun hBy i
    rw [hy, Matrix.mulVec_smul] at h
    have hic : y i = c := hc i
    change c * (B.mulVec u) i = 0 at h
    simpa only [← y, hic] using h
  have hc0 : c = 0 := by nlinarith [sq_nonneg c]
  have hBu : B.mulVec u = 0 := by
    change y = 0
    funext k
    simp [hc k, hc0]
  have h := congrFun hBu i
  simpa only [Matrix.mulVec, dotProduct, Pi.zero_apply, u, mul_one] using h

/-- Symmetric factor points lie in the orthogonal hyperplane to the all-ones
vector, hence their intrinsic dimension is at most N-1. -/
theorem d1_exists_minimal_gram_points (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) :
    ∃ q : Fin N → EuclideanSpace ℝ (Fin (N - 1)),
      d1HasGramPoints N edge q := by
  obtain ⟨B, hB, hBB⟩ :=
    d1_centered_symmetric_square_root N hN edge hsym
  let p := d1FullSpacePoints N B
  let v : EuclideanSpace ℝ (Fin N) :=
    WithLp.toLp 2 (fun _ : Fin N => (1 : ℝ))
  let i₀ : Fin N := ⟨0, by omega⟩
  have hv : v ≠ 0 := by
    intro h
    have hcoord := congrArg (fun w : EuclideanSpace ℝ (Fin N) => w i₀) h
    simp [v] at hcoord
  have hp (i : Fin N) : p i ∈ (ℝ ∙ v)ᗮ := by
    apply Submodule.mem_orthogonal_singleton_iff_inner_right.mpr
    have hinner : ⟪v, p i⟫_ℝ = ∑ k : Fin N, B k i := by
      rw [EuclideanSpace.inner_eq_star_dotProduct]
      simp [dotProduct, v, p, d1FullSpacePoints]
    rw [hinner]
    calc
      (∑ k : Fin N, B k i) = ∑ k : Fin N, B i k := by
        apply Finset.sum_congr rfl
        intro k hk
        simpa only [star_trivial] using hB.apply i k
      _ = 0 := d1_factor_row_sum_zero N hN edge hsym B hBB i
  letI : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin N)) = (N - 1) + 1) :=
    ⟨by simp; omega⟩
  let U : (ℝ ∙ v)ᗮ ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin (N - 1)) :=
    (OrthonormalBasis.fromOrthogonalSpanSingleton (N - 1) hv).repr
  let q : Fin N → EuclideanSpace ℝ (Fin (N - 1)) :=
    fun i => U ⟨p i, hp i⟩
  refine ⟨q, ?_⟩
  intro i j
  calc
    ⟪q i, q j⟫_ℝ =
        ⟪(⟨p i, hp i⟩ : (ℝ ∙ v)ᗮ), (⟨p j, hp j⟩ : (ℝ ∙ v)ᗮ)⟫_ℝ := by
      exact LinearIsometryEquiv.inner_map_map U _ _
    _ = ⟪p i, p j⟫_ℝ := rfl
    _ = d1CenteredGram N edge i j :=
      d1_full_space_points_gram N edge B hB hBB i j

/-- The exact squared norms and strict flag equivalence now have a genuine
minimal-dimensional Euclidean witness, rather than a conditional one. -/
theorem d1_exists_minimal_rips_flag (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) :
    ∃ q : Fin N → EuclideanSpace ℝ (Fin (N - 1)),
      (∀ i j, ‖q i - q j‖ ^ 2 = d1SquaredDistance N edge i j) ∧
      (∀ s : Finset (Fin N),
        d1StrictRipsSimplex N q s ↔ d1IsClique N edge s) := by
  obtain ⟨q, hq⟩ := d1_exists_minimal_gram_points N hN edge hsym
  exact ⟨q, d1_gram_points_norm_sq N edge hsym q hq,
    d1_strict_rips_iff_clique N hN edge hsym q hq⟩

end OptionD
