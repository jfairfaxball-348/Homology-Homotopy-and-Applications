module
public import C4.RealShoelaceInterpretation

@[expose] public section

/-!
# S174: simplices of the entire-real two-lane shoelace bar

For an arbitrary point p of the genuine shoelace preorder, a degree-n
bar generator is a weakly increasing (n+1)-tuple whose final entry is
below p. This is the indexing used by the full direct-sum bar, *not*
yet its differential or quasi-isomorphic augmentation.

All definitions below quantify over EVERY real point and BOTH lanes.
-/

namespace C4

/-- A weak chain q₀ ≤ ⋯ ≤ qₙ ≤ p in the actual entire-real
two-lane shoelace preorder. Repeated vertices are allowed. -/
structure RealShoelaceBarSimplex
    {ε : ℝ} {hε : 0 ≤ ε}
    (n : ℕ) (p : RealShoelacePoint ε hε) where
  vertex : Fin (n + 1) → RealShoelacePoint ε hε
  ordered : Monotone vertex
  last_le : vertex (Fin.last n) ≤ p

/-- Every vertex of a bar simplex is below its parameter. -/
theorem RealShoelaceBarSimplex.vertex_le
    {ε : ℝ} {hε : 0 ≤ ε}
    {n : ℕ} {p : RealShoelacePoint ε hε}
    (σ : RealShoelaceBarSimplex n p) (i : Fin (n + 1)) :
    σ.vertex i ≤ p :=
  (σ.ordered (Fin.le_last i)).trans σ.last_le

/-- The source object of the coefficient summand D(q₀). -/
def RealShoelaceBarSimplex.first
    {ε : ℝ} {hε : 0 ≤ ε}
    {n : ℕ} {p : RealShoelacePoint ε hε}
    (σ : RealShoelaceBarSimplex n p) :
    RealShoelacePoint ε hε :=
  σ.vertex 0

/-- Parameter enlargement changes ONLY the upper bound, not any
vertex or coefficient summand. -/
def realShoelaceBarInclusion
    {ε : ℝ} {hε : 0 ≤ ε} {n : ℕ}
    {p q : RealShoelacePoint ε hε}
    (hpq : p ≤ q) (σ : RealShoelaceBarSimplex n p) :
    RealShoelaceBarSimplex n q :=
  ⟨σ.vertex, σ.ordered, σ.last_le.trans hpq⟩

@[simp]
theorem realShoelaceBarInclusion_vertex
    {ε : ℝ} {hε : 0 ≤ ε} {n : ℕ}
    {p q : RealShoelacePoint ε hε}
    (hpq : p ≤ q) (σ : RealShoelaceBarSimplex n p) :
    (realShoelaceBarInclusion hpq σ).vertex = σ.vertex := rfl

/-- Every map of bar-index sets is injective, including both crossing
arrows and all order arrows of the entire real shoelace category. -/
theorem realShoelaceBarInclusion_injective
    {ε : ℝ} {hε : 0 ≤ ε} {n : ℕ}
    {p q : RealShoelacePoint ε hε}
    (hpq : p ≤ q) :
    Function.Injective (realShoelaceBarInclusion (n := n) hpq) := by
  intro σ τ h
  have hv : σ.vertex = τ.vertex :=
    congrArg RealShoelaceBarSimplex.vertex h
  cases σ with
  | mk v vo vl =>
    cases τ with
    | mk w wo wl =>
      dsimp at hv
      cases hv
      rfl

/-- Enlarging the endpoint twice agrees with one direct enlargement. -/
theorem realShoelaceBarInclusion_comp
    {ε : ℝ} {hε : 0 ≤ ε} {n : ℕ}
    {p q r : RealShoelacePoint ε hε}
    (hpq : p ≤ q) (hqr : q ≤ r)
    (σ : RealShoelaceBarSimplex n p) :
    realShoelaceBarInclusion hqr (realShoelaceBarInclusion hpq σ) =
      realShoelaceBarInclusion (hpq.trans hqr) σ := by
  cases σ
  rfl

/-- A vertex itself gives the degree-zero bar simplex at that vertex. -/
def realShoelaceBarSingleton
    {ε : ℝ} {hε : 0 ≤ ε}
    (p : RealShoelacePoint ε hε) :
    RealShoelaceBarSimplex 0 p where
  vertex := fun _ => p
  ordered := by
    intro _ _ _
    exact le_rfl
  last_le := le_rfl

/-- The complete bar indexing type across ALL nonnegative simplicial
degrees; the coefficient at a simplex is D(σ.first). -/
abbrev RealShoelaceBarIndex
    {ε : ℝ} {hε : 0 ≤ ε}
    (p : RealShoelacePoint ε hε) :=
  (n : ℕ) × RealShoelaceBarSimplex n p

/-- Enlargement on ALL simplicial degrees at once. -/
def realShoelaceBarIndexInclusion
    {ε : ℝ} {hε : 0 ≤ ε}
    {p q : RealShoelacePoint ε hε}
    (hpq : p ≤ q) :
    RealShoelaceBarIndex p → RealShoelaceBarIndex q
  | ⟨n, σ⟩ => ⟨n, realShoelaceBarInclusion hpq σ⟩

theorem realShoelaceBarIndexInclusion_injective
    {ε : ℝ} {hε : 0 ≤ ε}
    {p q : RealShoelacePoint ε hε}
    (hpq : p ≤ q) :
    Function.Injective (realShoelaceBarIndexInclusion hpq) := by
  intro ⟨n, σ⟩ ⟨m, τ⟩ h
  cases hnm : n with
  | zero =>
    cases m with
    | zero =>
      have he : realShoelaceBarInclusion hpq σ =
          realShoelaceBarInclusion hpq τ := by
        simpa [realShoelaceBarIndexInclusion] using h
      have := realShoelaceBarInclusion_injective hpq he
      cases this
      rfl
    | succ m =>
      simp [realShoelaceBarIndexInclusion] at h
  | succ n =>
    cases m with
    | zero => simp [realShoelaceBarIndexInclusion] at h
    | succ m =>
      have hn : Nat.succ n = Nat.succ m := by
        exact congrArg Prod.fst h
      cases Nat.succ.inj hn
      have he : realShoelaceBarInclusion hpq σ =
          realShoelaceBarInclusion hpq τ := by
        simpa [realShoelaceBarIndexInclusion] using h
      have := realShoelaceBarInclusion_injective hpq he
      cases this
      rfl

end C4
