module

public import OptionD.MatrixBridge

public section

/-!
# S123: exact rank of the centered Gram

The whole kernel is naturally linearly equivalent to the scalar field by
evaluation at vertex zero. Rank-nullity then proves the N−1 conclusion.
No finite upper bound on N and no further graph hypotheses are imposed.
-/

namespace OptionD

/-- Exact native Mathlib Matrix.rank for every undirected N-vertex graph. -/
theorem d1_centered_matrix_rank (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) :
    (d1CenteredGram N edge).rank = N - 1 := by
  let A : Matrix (Fin N) (Fin N) ℝ := d1CenteredGram N edge
  let i₀ : Fin N := ⟨0, by omega⟩
  let ev : LinearMap.ker A.mulVecLin →ₗ[ℝ] ℝ :=
    { toFun := fun v => v.1 i₀
      map_add' := by intro x y; rfl
      map_smul' := by intro c x; rfl }
  have hconst (v : LinearMap.ker A.mulVecLin) :
      ∀ i : Fin N, v.1 i = v.1 i₀ := by
    have hv : A.mulVec v.1 = 0 := by
      simpa only [Matrix.mulVecLin_apply] using (LinearMap.mem_ker.mp v.2)
    obtain ⟨c, hc⟩ :=
      (d1_centered_mulVec_kernel N hN edge hsym v.1).mp hv
    intro i
    rw [hc i, hc i₀]
  have hinj : Function.Injective ev := by
    intro u v huv
    apply Subtype.ext
    funext i
    calc
      u.1 i = u.1 i₀ := hconst u i
      _ = v.1 i₀ := huv
      _ = v.1 i := (hconst v i).symm
  have hsurj : Function.Surjective ev := by
    intro c
    let z : Fin N → ℝ := fun _ => c
    have hz : A.mulVec z = 0 := by
      apply (d1_centered_mulVec_kernel N hN edge hsym z).mpr
      exact ⟨c, fun _ => rfl⟩
    refine ⟨⟨z, ?_⟩, rfl⟩
    change A.mulVecLin z = 0
    simpa only [Matrix.mulVecLin_apply] using hz
  have hdim : Module.finrank ℝ (LinearMap.ker A.mulVecLin) = 1 := by
    have h := (LinearEquiv.ofBijective ev ⟨hinj, hsurj⟩).finrank_eq
    simpa using h
  have hnullity := LinearMap.finrank_range_add_finrank_ker A.mulVecLin
  have hNrange : A.rank + 1 = N := by
    simpa [Matrix.rank, hdim, Module.finrank_pi, Module.finrank_self,
      Fintype.card_fin] using hnullity
  omega

end OptionD
