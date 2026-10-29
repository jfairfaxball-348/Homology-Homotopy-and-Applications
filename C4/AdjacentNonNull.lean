module
public import C4.FiveStageTransfer
public import C4.GlobalObstruction

@[expose] public section

/-!
# Nonzero adjacent classes of global C4 fourfold data

A residue-one adjacent map is not chain-nullhomotopic. This is the
degree-one obstruction that can actually be transported through arbitrary
chain-homotopy equivalences. It is stronger than mere nonzero components
but does not claim a chosen residue on unrelated replacement modules.
-/

namespace C4

open CategoryTheory

/-- An arbitrary genuine shifted adjacent C4 map whose first regular
coefficient is a unit cannot be nullhomotopic. The homotopy equation at
the first available regular degree has zero constant coefficient. -/
theorem globalAdjacent_nonnull (s : ℤ)
    (f : integerShiftResolution s ⟶ integerShiftResolution (s + 1))
    (hf : (regularEval
      (positiveGlobalComponent s (s + 1) (s + 1)
        (by omega) (by omega) f)).c0 = 1) :
    ¬ Nonempty (Homotopy f 0) := by
  rintro ⟨h⟩
  have hd₀ : (s + 1 - 1 - s).toNat = 0 := by omega
  have hd₁ : (s + 1 - (s + 1)).toNat = 0 := by omega
  have hz : (regularEval
      (positiveGlobalComponent s (s + 1) (s + 1)
        (by omega) (by omega) f)).c0 = 0 := by
    rw [regularize_primary s (s + 1) (s + 1) (by omega) (by omega) h]
    simp [regularEval_add, regularEval_comp, regularEval_coefficient,
      hd₀, hd₁, Periodic.d, mul_is_truncated_convolution,
      add_is_coordinate_add, C4.mul, C4.add, C4.t]
  rw [hf] at hz
  exact one_ne_zero hz

/-- The same non-nullhomotopy test with an explicitly identified target
shift, avoiding dependent casts between s+1+1 and s+2. -/
theorem globalAdjacent_nonnull_of_shift (s t : ℤ) (hst : t = s + 1)
    (f : integerShiftResolution s ⟶ integerShiftResolution t)
    (hf : (regularEval
      (positiveGlobalComponent s t t
        (by omega) (by omega) f)).c0 = 1) :
    ¬ Nonempty (Homotopy f 0) := by
  subst t
  exact globalAdjacent_nonnull s f hf

/-- All four independent adjacent arrows in every genuine globally-indexed
C4 defining system represent nonzero homotopy classes. -/
theorem GlobalFourfoldDefiningSystem.adjacent_nonnull
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) :
    (¬ Nonempty (Homotopy q.x01 0)) ∧
    (¬ Nonempty (Homotopy q.x12 0)) ∧
    (¬ Nonempty (Homotopy q.x23 0)) ∧
    (¬ Nonempty (Homotopy q.x34 0)) := by
  exact ⟨globalAdjacent_nonnull_of_shift s (s+1) (by omega) q.x01 q.x01_unit,
    globalAdjacent_nonnull_of_shift (s+1) (s+2) (by omega) q.x12 q.x12_unit,
    globalAdjacent_nonnull_of_shift (s+2) (s+3) (by omega) q.x23 q.x23_unit,
    globalAdjacent_nonnull_of_shift (s+3) (s+4) (by omega) q.x34 q.x34_unit⟩

/-- Under any five genuine homotopy-equivalence comparisons, each of the
four transported adjacent arrows still represents a nonzero homotopy
class, independently of the chosen replacement complexes. -/
theorem GlobalFourfoldDefiningSystem.transferred_adjacent_nonnull
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s)
    {Q0 Q1 Q2 Q3 Q4 : C4Complex}
    (e0 : ChainHomotopyEquivalence (integerShiftResolution s) Q0)
    (e1 : ChainHomotopyEquivalence (integerShiftResolution (s + 1)) Q1)
    (e2 : ChainHomotopyEquivalence (integerShiftResolution (s + 2)) Q2)
    (e3 : ChainHomotopyEquivalence (integerShiftResolution (s + 3)) Q3)
    (e4 : ChainHomotopyEquivalence (integerShiftResolution (s + 4)) Q4) :
    (¬ Nonempty (Homotopy (e0.transportMap q.x01 e1) 0)) ∧
    (¬ Nonempty (Homotopy (e1.transportMap q.x12 e2) 0)) ∧
    (¬ Nonempty (Homotopy (e2.transportMap q.x23 e3) 0)) ∧
    (¬ Nonempty (Homotopy (e3.transportMap q.x34 e4) 0)) := by
  obtain ⟨h01, h12, h23, h34⟩ := q.adjacent_nonnull
  exact ⟨e0.transport_nonnull e1 q.x01 h01,
    e1.transport_nonnull e2 q.x12 h12,
    e2.transport_nonnull e3 q.x23 h23,
    e3.transport_nonnull e4 q.x34 h34⟩

end C4
