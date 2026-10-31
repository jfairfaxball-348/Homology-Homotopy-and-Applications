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


end C4
