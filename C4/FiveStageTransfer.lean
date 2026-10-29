module
public import C4.HomotopyTransfer

@[expose] public section

/-!
# Transfer of the complete five-object primary part of a C4 defining system

This provides all four adjacent chain maps and all THREE primary Mathlib
homotopies on arbitrary chain-homotopy-equivalent replacement complexes.
The secondary degree-two fillers and the final tertiary boundary are
separate, still-open transfer obligations.
-/

namespace C4

open CategoryTheory

/-- A strict five-object chain equipped with all three primary homotopies.
There is no requirement that its objects be the canonical C4 resolutions. -/
structure FiveStagePrimaryData where
  P0 : C4Complex
  P1 : C4Complex
  P2 : C4Complex
  P3 : C4Complex
  P4 : C4Complex
  x01 : P0 ⟶ P1
  x12 : P1 ⟶ P2
  x23 : P2 ⟶ P3
  x34 : P3 ⟶ P4
  h02 : Homotopy (x01 ≫ x12) 0
  h13 : Homotopy (x12 ≫ x23) 0
  h24 : Homotopy (x23 ≫ x34) 0

/-- Every genuine global C4 defining system has a five-object primary
part, retaining its independently chosen arrows and homotopies. -/
def GlobalFourfoldDefiningSystem.toPrimaryData
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) : FiveStagePrimaryData where
  P0 := integerShiftResolution s
  P1 := integerShiftResolution (s + 1)
  P2 := integerShiftResolution (s + 2)
  P3 := integerShiftResolution (s + 3)
  P4 := integerShiftResolution (s + 4)
  x01 := q.x01
  x12 := q.x12
  x23 := q.x23
  x34 := q.x34
  h02 := q.h02
  h13 := q.h13
  h24 := q.h24

/-- Transfer ALL four maps and ALL three primary homotopies through FIVE
independent genuine chain-homotopy equivalences. The middle retract
corrections are incorporated into the transported primary homotopies. -/
def FiveStagePrimaryData.transport
    (q : FiveStagePrimaryData)
    {Q0 Q1 Q2 Q3 Q4 : C4Complex}
    (e0 : ChainHomotopyEquivalence q.P0 Q0)
    (e1 : ChainHomotopyEquivalence q.P1 Q1)
    (e2 : ChainHomotopyEquivalence q.P2 Q2)
    (e3 : ChainHomotopyEquivalence q.P3 Q3)
    (e4 : ChainHomotopyEquivalence q.P4 Q4) :
    FiveStagePrimaryData where
  P0 := Q0
  P1 := Q1
  P2 := Q2
  P3 := Q3
  P4 := Q4
  x01 := e0.transportMap q.x01 e1
  x12 := e1.transportMap q.x12 e2
  x23 := e2.transportMap q.x23 e3
  x34 := e3.transportMap q.x34 e4
  h02 := e0.transportPrimary e1 e2 q.x01 q.x12 q.h02
  h13 := e1.transportPrimary e2 e3 q.x12 q.x23 q.h13
  h24 := e2.transportPrimary e3 e4 q.x23 q.x34 q.h24

/-- The actual canonical C4 fourfold data admits a genuine five-stage
primary transfer to any chosen homotopy-equivalent replacement complexes. -/
def canonicalTransferredPrimaries (s : ℤ)
    {Q0 Q1 Q2 Q3 Q4 : C4Complex}
    (e0 : ChainHomotopyEquivalence (integerShiftResolution s) Q0)
    (e1 : ChainHomotopyEquivalence (integerShiftResolution (s + 1)) Q1)
    (e2 : ChainHomotopyEquivalence (integerShiftResolution (s + 2)) Q2)
    (e3 : ChainHomotopyEquivalence (integerShiftResolution (s + 3)) Q3)
    (e4 : ChainHomotopyEquivalence (integerShiftResolution (s + 4)) Q4) :
    FiveStagePrimaryData :=
  ((canonicalGlobalFourfold s).toPrimaryData).transport e0 e1 e2 e3 e4

end C4
