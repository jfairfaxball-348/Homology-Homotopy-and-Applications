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
    by simpa only [realShoelaceBarInclusion_vertex] using
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


/-- Inclusion on dependent bar indices also preserves the length n. -/
@[simp] theorem realShoelaceBarIndexInclusion_fst
    {ε : ℝ} {hε : 0 ≤ ε}
    {p q : RealShoelacePoint ε hε}
    (hpq : p ≤ q) (i : RealShoelaceBarIndex p) :
    (realShoelaceBarIndexInclusion hpq i).1 = i.1 := by
  cases i with
  | mk n σ => rfl

/-- The full dependent-sum bar index embedding is injective, not
merely its restriction to a fixed simplicial degree. This is the
set-level foundation of degreewise monomorphism of the bar arrows. -/
theorem realShoelaceBarIndexInclusion_injective
    {ε : ℝ} {hε : 0 ≤ ε}
    {p q : RealShoelacePoint ε hε}
    (hpq : p ≤ q) :
    Function.Injective (realShoelaceBarIndexInclusion hpq) := by
  intro a b hab
  rcases a with ⟨n, σ⟩
  rcases b with ⟨m, τ⟩
  have hn : n = m := congrArg Sigma.fst hab
  cases hn
  have hs : realShoelaceBarInclusion hpq σ =
      realShoelaceBarInclusion hpq τ := by
    injection hab with _ h
    exact h
  have hστ : σ = τ :=
    realShoelaceBarInclusion_injective hpq hs
  cases hστ
  rfl

/-- The entire-dependent-index embedding is the identity at a
reflexive comparison, including proof-irrelevant endpoint bounds. -/
@[simp] theorem realShoelaceBarIndexInclusion_refl
    {ε : ℝ} {hε : 0 ≤ ε}
    (p : RealShoelacePoint ε hε) (i : RealShoelaceBarIndex p) :
    realShoelaceBarIndexInclusion (le_refl p) i = i := by
  rcases i with ⟨n, σ⟩
  cases σ
  rfl

/-- The complete dependent index embedding obeys functor composition
at all simplicial degrees and all entire-real shoelace points. -/
theorem realShoelaceBarIndexInclusion_comp
    {ε : ℝ} {hε : 0 ≤ ε}
    {p q r : RealShoelacePoint ε hε}
    (hpq : p ≤ q) (hqr : q ≤ r)
    (i : RealShoelaceBarIndex p) :
    realShoelaceBarIndexInclusion hqr
      (realShoelaceBarIndexInclusion hpq i) =
    realShoelaceBarIndexInclusion (hpq.trans hqr) i := by
  rcases i with ⟨n, σ⟩
  exact congrArg (Sigma.mk n) (realShoelaceBarInclusion_comp hpq hqr σ)

end C4
