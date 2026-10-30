module
public import C4.StrictRealInterleaving

@[expose] public section

/-!
# S169: entire-real C4 five-cut extraction

The cuts used in the paper's strict lower-bound argument are genuine
REAL parameters, not a finite substitute for the real diagram.
The reduction below applies to ANY entire-real diagram whose
(2+alpha)-shift structure morphisms all vanish. It extracts the three
strict consecutive-composite equations needed by a five-stage chain.
It DOES NOT construct the arbitrary two-lane shoelace quotient that
would produce such a diagram from an arbitrary zigzag.
-/

namespace C4
open CategoryTheory

/-- Any two consecutive arrows on a full real diagram compose to zero
when the corresponding whole two-step structure map vanishes. -/
theorem real_two_step_zero_of_shift
    (G : ℝ ⥤ C4Complex) (u v w δ : ℝ)
    (hδ : 0 ≤ δ) (huv : u ≤ v) (hvw : v ≤ w)
    (hw : w = u + δ)
    (hz : G.map (homOfLE (show u ≤ u + δ by linarith)) = 0) :
    G.map (homOfLE huv) ≫ G.map (homOfLE hvw) = 0 := by
  subst w
  rw [← G.map_comp]
  have hcomp :
      (homOfLE huv ≫ homOfLE hvw) =
        (homOfLE (show u ≤ u + δ by linarith)) := Subsingleton.elim _ _
  rw [hcomp]
  exact hz

/-- The five proposed real cuts are in the five correct ORIGINAL
half-open stages of F, even for alpha approaching 1/2 from below. -/
theorem realDiagram_five_cut_objects
    (α : ℝ) (hα : 0 ≤ α) (hαlt : α < 1 / 2) :
    (realDiagram.obj 0 = integerShiftResolution 0) ∧
    (realDiagram.obj 1 = integerShiftResolution 1) ∧
    (realDiagram.obj (2 + α) = integerShiftResolution 2) ∧
    (realDiagram.obj (3 + α) = integerShiftResolution 3) ∧
    (realDiagram.obj (4 + 2 * α) = integerShiftResolution 4) := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · simpa using realDiagram_obj_on_interval (0 : Fin 5) (0 : ℝ)
      (by norm_num) (by norm_num)
  · simpa using realDiagram_obj_on_interval (1 : Fin 5) (1 : ℝ)
      (by norm_num) (by norm_num)
  · simpa using realDiagram_obj_on_interval (2 : Fin 5) (2 + α)
      (by norm_num; linarith) (by norm_num; linarith)
  · simpa using realDiagram_obj_on_interval (3 : Fin 5) (3 + α)
      (by norm_num; linarith) (by norm_num; linarith)
  · simpa using realDiagram_obj_on_interval (4 : Fin 5) (4 + 2 * α)
      (by norm_num; linarith) (by norm_num; linarith)

/-- A TRUE whole-real shift-zero condition on any replacement diagram
forces all three consecutive composites at the specified five cuts
to vanish strictly, not merely in a homotopy category. -/
theorem real_five_cut_three_composites_zero
    (G : ℝ ⥤ C4Complex) (α : ℝ) (hα : 0 ≤ α)
    (hz : ∀ u : ℝ,
      G.map (homOfLE (show u ≤ u + (2 + α) by linarith)) = 0) :
    (G.map (homOfLE (show (0 : ℝ) ≤ 1 by norm_num)) ≫
      G.map (homOfLE (show (1 : ℝ) ≤ 2 + α by linarith)) = 0) ∧
    (G.map (homOfLE (show (1 : ℝ) ≤ 2 + α by linarith)) ≫
      G.map (homOfLE (show 2 + α ≤ 3 + α by linarith)) = 0) ∧
    (G.map (homOfLE (show 2 + α ≤ 3 + α by linarith)) ≫
      G.map (homOfLE (show 3 + α ≤ 4 + 2 * α by linarith)) = 0) := by
  refine ⟨?_, ?_, ?_⟩
  · exact real_two_step_zero_of_shift G 0 1 (2 + α) (2 + α)
      (by linarith) (by norm_num) (by linarith) (by ring) (hz 0)
  · exact real_two_step_zero_of_shift G 1 (2 + α) (3 + α) (2 + α)
      (by linarith) (by linarith) (by linarith) (by ring) (hz 1)
  · exact real_two_step_zero_of_shift G (2 + α) (3 + α) (4 + 2 * α) (2 + α)
      (by linarith) (by linarith) (by linarith) (by ring) (hz (2 + α))

end C4
