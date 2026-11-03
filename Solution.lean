module

public import C4.Palomar.Bridge

/-!
# Solution

The advertised statement of `Challenge.lean`, proved from the certified library.

`C4.Palomar.Statement` reproduces the Challenge definitions verbatim, together with the proofs of
the two well-formedness lemmas `C4Separation.stageD_comp_stageD` and `C4Separation.xComp_comm`.
`C4.Palomar.Bridge` identifies the statement diagram and distances with the certified ones. It
transfers `C4.c4_distance_separation_groupAlgebra`, whose printed axioms are
`[propext, Classical.choice, Quot.sound]`.
-/

public section

namespace C4Separation

open CategoryTheory

universe w' w

theorem distance_separation {D : Type w} [Category.{w'} D]
    (L : (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) ⥤ D) [L.IsLocalization objectwiseQuasiIso] :
    homologyDistance F zeroDiagram = ENNReal.ofReal (1 / 2) ∧
    derivedDistance L F zeroDiagram = ENNReal.ofReal 1 ∧
    ENNReal.ofReal (5 / 4) ≤ homotopyDistance F zeroDiagram ∧
    homotopyDistance F zeroDiagram ≤ ENNReal.ofReal (5 / 2) ∧
    homologyDistance F zeroDiagram < derivedDistance L F zeroDiagram ∧
    derivedDistance L F zeroDiagram < ENNReal.ofReal (5 / 4) :=
  Bridge.separation L

end C4Separation

#print axioms C4Separation.distance_separation
#print axioms C4Separation.stageD_comp_stageD
#print axioms C4Separation.xComp_comm
