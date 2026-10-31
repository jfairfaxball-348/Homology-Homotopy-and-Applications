module
public import C4.AcyclicCokernelQuasiIso

@[expose] public section

/-!
# S173: the genuine unbounded, entire-real two-lane shoelace preorder

The parameter set has two *distinct* real lanes. An order comparison across
lanes incorporates the interleaving shift epsilon. This gives the actual
index category on which the missing diagram-level replacement must act.
No finite sampling, zero-lane identification, or model-category existence
is asserted here.
-/

namespace C4
open CategoryTheory

/-- Points of the two-lane shoelace index category for an epsilon shift. -/
structure RealShoelacePoint (ε : ℝ) (hε : 0 ≤ ε) where
  time : ℝ
  lane : Bool

/-- A morphism is permitted along the same lane whenever time increases,
and across lanes only after at least epsilon units of time. -/
instance realShoelacePreorder (ε : ℝ) (hε : 0 ≤ ε) :
    Preorder (RealShoelacePoint ε hε) where
  le p q :=
    if p.lane = q.lane then p.time ≤ q.time
    else p.time + ε ≤ q.time
  le_refl p := by
    change (if p.lane = p.lane then p.time ≤ p.time else p.time + ε ≤ p.time)
    simp
  le_trans p q r hpq hqr := by
    change (if p.lane = r.lane then p.time ≤ r.time
      else p.time + ε ≤ r.time)
    change (if p.lane = q.lane then p.time ≤ q.time
      else p.time + ε ≤ q.time) at hpq
    change (if q.lane = r.lane then q.time ≤ r.time
      else q.time + ε ≤ r.time) at hqr
    cases hp : p.lane <;> cases hq : q.lane <;> cases hr : r.lane <;>
      simp_all <;> linarith

/-- The two lanes remain distinct even when epsilon is zero. -/
def realShoelaceLeft (ε : ℝ) (hε : 0 ≤ ε) (u : ℝ) :
    RealShoelacePoint ε hε := ⟨u, false⟩

def realShoelaceRight (ε : ℝ) (hε : 0 ≤ ε) (u : ℝ) :
    RealShoelacePoint ε hε := ⟨u, true⟩

theorem realShoelace_left_le_left_iff
    (ε : ℝ) (hε : 0 ≤ ε) (u v : ℝ) :
    realShoelaceLeft ε hε u ≤ realShoelaceLeft ε hε v ↔ u ≤ v := by
  rfl

theorem realShoelace_right_le_right_iff
    (ε : ℝ) (hε : 0 ≤ ε) (u v : ℝ) :
    realShoelaceRight ε hε u ≤ realShoelaceRight ε hε v ↔ u ≤ v := by
  rfl

theorem realShoelace_left_le_right_iff
    (ε : ℝ) (hε : 0 ≤ ε) (u v : ℝ) :
    realShoelaceLeft ε hε u ≤ realShoelaceRight ε hε v ↔ u + ε ≤ v := by
  rfl

theorem realShoelace_right_le_left_iff
    (ε : ℝ) (hε : 0 ≤ ε) (u v : ℝ) :
    realShoelaceRight ε hε u ≤ realShoelaceLeft ε hε v ↔ u + ε ≤ v := by
  rfl

/-- Every original real index enters the *entire* left shoelace lane. -/
noncomputable def realShoelaceLeftInclusion (ε : ℝ) (hε : 0 ≤ ε) :
    ℝ ⥤ RealShoelacePoint ε hε where
  obj := realShoelaceLeft ε hε
  map := fun f => homOfLE ((realShoelace_left_le_left_iff ε hε _ _).2 (leOfHom f))
  map_id := by intros; apply Subsingleton.elim
  map_comp := by intros; apply Subsingleton.elim

/-- Every original real index enters the *entire* right shoelace lane. -/
noncomputable def realShoelaceRightInclusion (ε : ℝ) (hε : 0 ≤ ε) :
    ℝ ⥤ RealShoelacePoint ε hε where
  obj := realShoelaceRight ε hε
  map := fun f => homOfLE ((realShoelace_right_le_right_iff ε hε _ _).2 (leOfHom f))
  map_id := by intros; apply Subsingleton.elim
  map_comp := by intros; apply Subsingleton.elim

/-- The genuine backward crossing at *every* real parameter. -/
theorem realShoelace_backward_le
    (ε : ℝ) (hε : 0 ≤ ε) (u : ℝ) :
    realShoelaceRight ε hε u ≤ realShoelaceLeft ε hε (u + ε) := by
  exact (realShoelace_right_le_left_iff ε hε u (u + ε)).2 le_rfl

/-- The genuine forward crossing at *every* real parameter. -/
theorem realShoelace_forward_le
    (ε : ℝ) (hε : 0 ≤ ε) (u : ℝ) :
    realShoelaceLeft ε hε u ≤ realShoelaceRight ε hε (u + ε) := by
  exact (realShoelace_left_le_right_iff ε hε u (u + ε)).2 le_rfl

/-- The two crossings compose in the ACTUAL two-lane index category,
not in a selected finite grid. -/
theorem realShoelace_two_crossings_le
    (ε : ℝ) (hε : 0 ≤ ε) (u : ℝ) :
    realShoelaceLeft ε hε u ≤ realShoelaceLeft ε hε ((u + ε) + ε) :=
  le_trans (realShoelace_forward_le ε hε u)
    (realShoelace_backward_le ε hε (u + ε))

end C4
