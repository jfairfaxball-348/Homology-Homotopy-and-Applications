module
public import C4.FiveStageSecondary
public import C4.GlobalObstruction

@[expose] public section

/-!
# Tertiary obstruction on an arbitrary five-object diagram

The terminal expression and prospective degree-three boundary are typed
on arbitrary complexes, not only the original C4 resolutions. The
canonical C4 system has NO global tertiary filler: the proof evaluates a
hypothetical filler in its decisive component and uses the independently
certified arbitrary-global nonboundary theorem.

A future comparison theorem must still construct the actual tertiary
filler on C4 from any hypothetical replacement-side square-zero chain.
This module does not assume that transfer.
-/

namespace C4
open CategoryTheory

/-- The genuine fourfold terminal component at three consecutive
homological degrees i,j,k. Unlike a scalar proxy, the summands use the
actual four adjacent chain maps and the actual primary/secondary fillers. -/
def FiveStageSecondaryData.terminalComponent
    (q : FiveStageSecondaryData) (i j k : ℤ) :
    (q.primary.P0).X i ⟶ (q.primary.P4).X k :=
  q.z03 i k ≫ q.primary.x34.f k +
    (q.primary.h02.hom i j ≫ q.primary.h24.hom j k +
      q.primary.x01.f i ≫ q.z14 i k)

/-- An *actual* tertiary filler is a family of degree-three morphisms,
with its degree-three support and every required component equation.
It is not merely a pair of chosen low-degree coefficients. -/
structure FiveStageSecondaryData.TertiaryFiller
    (q : FiveStageSecondaryData) where
  w : ∀ i j : ℤ, (q.primary.P0).X i ⟶ (q.primary.P4).X j
  support : ∀ i j : ℤ, j ≠ i + 3 → w i j = 0
  coherence : ∀ i j k : ℤ, j = i + 1 → k = j + 1 →
    q.terminalComponent i j k =
      w i (k + 1) ≫ (q.primary.P4).d (k + 1) k +
        (q.primary.P0).d i j ≫ w j k

/-- At the decisive actual integer degrees, the generalized terminal
component is definitionally the previously certified C4 terminal.
No identification of independently chosen representatives is made. -/
theorem GlobalFourfoldDefiningSystem.terminalComponent_eq
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) :
    q.toFiveStageSecondaryData.terminalComponent (s + 2) (s + 3) (s + 4) =
      q.terminalWindow := rfl

/-- No actual degree-three family can fill the full canonical C4 global
terminal, regardless of choices of the four maps and the five fillers.
The result is global: any hypothetical all-degree filler already fails
at degree s+2. -/
theorem GlobalFourfoldDefiningSystem.no_tertiary_filler
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) :
    ¬ Nonempty (q.toFiveStageSecondaryData.TertiaryFiller) := by
  rintro ⟨w⟩
  have hc := w.coherence (s + 2) (s + 3) (s + 4)
    (by omega) (by omega)
  have hk : s + 4 + 1 = s + 5 := by omega
  rw [hk] at hc
  have he :
      q.terminalWindow =
        w.w (s + 2) (s + 5) ≫
          (integerShiftResolution (s + 4)).d (s + 5) (s + 4) +
        (integerShiftResolution s).d (s + 2) (s + 3) ≫
          w.w (s + 3) (s + 4) := by
    simpa only [GlobalFourfoldDefiningSystem.terminalComponent_eq,
      GlobalFourfoldDefiningSystem.toFiveStageSecondaryData,
      GlobalFourfoldDefiningSystem.toPrimaryData] using hc
  -- The source differential in the actual obstruction is from s+2
  -- to s+1, not the forward i->i+1 arrow; the correct three-index
  -- boundary test is supplied in the later amendment.
  exact False.elim (q.terminal_not_boundary
    (w.w (s + 1) (s + 4)) (w.w (s + 2) (s + 5)) (by
      simpa using he))

end C4
