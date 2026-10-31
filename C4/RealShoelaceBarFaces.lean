module
public import C4.RealShoelaceBarTerms

@[expose] public section

/-!
S174: generator-level simplicial face operators on the entire-real shoelace bar.
This builds the genuine weak-chain combinatorics, not yet the total differential.
-/
namespace C4

/-- Delete the i-th vertex of a weak (n+2)-vertex shoelace simplex. -/
def RealShoelaceBarSimplex.face
    {ε : ℝ} {hε : 0 ≤ ε} {p : RealShoelacePoint ε hε}
    {n : ℕ} (σ : RealShoelaceBarSimplex (n + 1) p)
    (i : Fin (n + 2)) : RealShoelaceBarSimplex n p where
  vertex := σ.vertex ∘ i.succAbove
  ordered := σ.ordered.comp (Fin.strictMono_succAbove i).monotone
  last_le := σ.vertex_le (i.succAbove (Fin.last n))

@[simp]
theorem RealShoelaceBarSimplex.face_vertex
    {ε : ℝ} {hε : 0 ≤ ε} {p : RealShoelacePoint ε hε}
    {n : ℕ} (σ : RealShoelaceBarSimplex (n + 1) p)
    (i : Fin (n + 2)) :
    (σ.face i).vertex = σ.vertex ∘ i.succAbove := rfl

/-- Face deletion commutes with all endpoint inclusions, including crossings. -/
theorem realShoelaceBarInclusion_face
    {ε : ℝ} {hε : 0 ≤ ε} {p q : RealShoelacePoint ε hε}
    {n : ℕ} (hpq : p ≤ q) (σ : RealShoelaceBarSimplex (n + 1) p)
    (i : Fin (n + 2)) :
    (realShoelaceBarInclusion hpq σ).face i =
      realShoelaceBarInclusion hpq (σ.face i) := by
  cases σ
  rfl

/-- The first bar face has the original coefficient transport q₀ → q₁. -/
theorem RealShoelaceBarSimplex.first_le_face_zero
    {ε : ℝ} {hε : 0 ≤ ε} {p : RealShoelacePoint ε hε}
    {n : ℕ} (σ : RealShoelaceBarSimplex (n + 1) p) :
    σ.first ≤ (σ.face (0 : Fin (n + 2))).first := by
  simpa only [RealShoelaceBarSimplex.first,
    RealShoelaceBarSimplex.face, Function.comp_apply,
    Fin.succAbove_zero_apply] using
    σ.ordered (Fin.zero_le (Fin.succ (0 : Fin (n + 1))))

/-- The dependent sigma index injection has no collisions across lengths. -/
theorem realShoelaceBarIndexInclusion_injective
    {ε : ℝ} {hε : 0 ≤ ε}
    {p q : RealShoelacePoint ε hε} (hpq : p ≤ q) :
    Function.Injective (realShoelaceBarIndexInclusion hpq) := by
  intro a b h
  rcases a with ⟨n, σ⟩
  rcases b with ⟨m, τ⟩
  change (⟨n, realShoelaceBarInclusion hpq σ⟩ : RealShoelaceBarIndex q) =
    ⟨m, realShoelaceBarInclusion hpq τ⟩ at h
  have hn : n = m := congrArg Sigma.fst h
  cases hn
  have hs : realShoelaceBarInclusion hpq σ =
      realShoelaceBarInclusion hpq τ := congrArg Sigma.snd h
  have hv : σ = τ := (realShoelaceBarInclusion_injective hpq) hs
  cases hv
  rfl

end C4
