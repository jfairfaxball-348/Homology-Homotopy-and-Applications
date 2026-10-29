module
public import C4.CanonicalGlobal
public import Mathlib.CategoryTheory.ComposableArrows.Basic

@[expose] public section

namespace C4
open CategoryTheory CategoryTheory.Limits
noncomputable section

abbrev C4Complex := ChainComplex (ModuleCat B) ℤ

def zeroComplex : C4Complex := HomologicalComplex.zero

/-- The five genuine shifted complexes and both zero ends form a strict
finite chain, including the essential final arrow into zero. -/
def c4Stages : ComposableArrows C4Complex 6 :=
  (ComposableArrows.mk₅ (globalXChainMap 0) (canonicalX12 0)
    (canonicalX23 0) (canonicalX34 0)
    (0 : integerShiftResolution 4 ⟶ zeroComplex)).precomp
      (0 : zeroComplex ⟶ integerShiftResolution 0)

/-- The exact half-open stage containing a real time, with zero ends. -/
def realStage (u : ℝ) : Fin 7 :=
  if u < 0 then 0 else
  if u < 1 then 1 else
  if u < 2 then 2 else
  if u < 3 then 3 else
  if u < 4 then 4 else
  if u < 5 then 5 else 6

theorem realStage_monotone : Monotone realStage := by
  intro u v huv
  unfold realStage
  split_ifs <;> norm_num at * <;> linarith

/-- The actual full real-indexed C4 persistence functor. Its functor laws
come from genuine composition of the finite chain and the monotone clock. -/
def realDiagram : ℝ ⥤ C4Complex := realStage_monotone.functor ⋙ c4Stages

def zeroDiagram : ℝ ⥤ C4Complex := (Functor.const ℝ).obj zeroComplex

theorem realStage_before (u : ℝ) (h : u < 0) : realStage u = 0 := by
  simp [realStage, h]

theorem realStage_after (u : ℝ) (h : 5 ≤ u) : realStage u = 6 := by
  unfold realStage
  split_ifs <;> norm_num at * <;> linarith

theorem realDiagram_obj_before (u : ℝ) (h : u < 0) :
    realDiagram.obj u = zeroComplex := by
  change c4Stages.obj (realStage u) = _
  rw [realStage_before u h]
  rfl

theorem realDiagram_obj_after (u : ℝ) (h : 5 ≤ u) :
    realDiagram.obj u = zeroComplex := by
  change c4Stages.obj (realStage u) = _
  rw [realStage_after u h]
  rfl

theorem realStage_on_interval (i : Fin 5) (u : ℝ)
    (hlo : (i.val : ℝ) ≤ u) (hhi : u < (i.val : ℝ)+1) :
    realStage u = ⟨i.val+1, by omega⟩ := by
  fin_cases i <;> unfold realStage <;> split_ifs <;> norm_num at * <;> linarith

/-- Every full half-open stage has exactly the manuscript's shifted object. -/
theorem realDiagram_obj_on_interval (i : Fin 5) (u : ℝ)
    (hlo : (i.val : ℝ) ≤ u) (hhi : u < (i.val : ℝ)+1) :
    realDiagram.obj u = integerShiftResolution (i.val : ℤ) := by
  change c4Stages.obj (realStage u) = _
  rw [realStage_on_interval i u hlo hhi]
  fin_cases i <;> rfl

/-- Every real arrow spanning five units is literally zero, including all
half-open boundary cases. This does not use a finite sampling argument. -/
theorem realDiagram_map_zero_of_five (u v : ℝ) (huv : u ≤ v) (hgap : 5 ≤ v-u) :
    realDiagram.map (homOfLE huv) = 0 := by
  by_cases hu : u < 0
  · have hz : IsZero (realDiagram.obj u) := by
      rw [realDiagram_obj_before u hu]
      exact HomologicalComplex.isZero_zero
    exact hz.eq_of_src _ _
  · have hv : 5 ≤ v := by linarith
    have hz : IsZero (realDiagram.obj v) := by
      rw [realDiagram_obj_after v hv]
      exact HomologicalComplex.isZero_zero
    exact hz.eq_of_tgt _ _

/-- Translation of the whole real indexing category. -/
def realTranslation (δ : ℝ) : ℝ ⥤ ℝ :=
  (show Monotone (fun u : ℝ => u+δ) from by
    intro a b h
    dsimp
    linarith).functor

def translateDiagram (F : ℝ ⥤ C4Complex) (δ : ℝ) : ℝ ⥤ C4Complex :=
  realTranslation δ ⋙ F

/-- The genuine natural time-shift map, for every real time. -/
def realShiftMorphism (F : ℝ ⥤ C4Complex) (δ : ℝ) (hδ : 0 ≤ δ) :
    F ⟶ translateDiagram F δ where
  app u := F.map (homOfLE (show u ≤ u+δ by linarith))
  naturality u v f := by
    dsimp [translateDiagram, realTranslation]
    rw [← F.map_comp, ← F.map_comp]
    congr 1

/-- Kernel-certified literal vanishing of the entire five-unit shift.
The derived two-unit nullhomotopy and the metric lower bound remain separate. -/
theorem realDiagram_shift_five_zero :
    realShiftMorphism realDiagram 5 (by norm_num) = 0 := by
  apply NatTrans.ext
  funext u
  change realDiagram.map (homOfLE (show u ≤ u+5 by linarith)) = 0
  exact realDiagram_map_zero_of_five u (u+5) (by linarith) (by linarith)

end
end C4
