module
public import C4.HomogeneousCoherence

@[expose] public section

/-!
# Actual candidates for both secondary transfers

The degree-two correction formula is instantiated on actual full-integer
chain-complex components, with both intermediate Mathlib retract
homotopies. This module constructs CANDIDATES, not a proof that the
candidates satisfy the required secondary differential coherences.
That verification is a remaining theorem obligation.
-/

namespace C4
open CategoryTheory

/-- Compose actual B-linear homogeneous families while fixing the
intended total homological degree. This directly constructs component
maps and avoids casting a whole family with an opaque degree equality. -/
def HomogeneousFamily.compAs {P Q R : C4Complex}
    {p q r : ℤ} (f : HomogeneousFamily P Q p)
    (g : HomogeneousFamily Q R q) (hpq : p + q = r) :
    HomogeneousFamily P R r where
  hom n := (f.hom n ≫ g.hom (n + p)) ≫
    eqToHom (congrArg R.X (by omega : (n + p) + q = n + r))

/-- The characteristic-two secondary correction at four successive
objects, ordered exactly as in the manuscript-level DG argument.
Each of the FOUR summands is a true degree-two family with no finite
degree cutoff. -/
def correctedSecondaryCore
    {P0 P1 P2 P3 : C4Complex}
    (x0 : P0 ⟶ P1) (x1 : P1 ⟶ P2) (x2 : P2 ⟶ P3)
    (h0 : HomogeneousFamily P0 P2 1)
    (h1 : HomogeneousFamily P1 P3 1)
    (z : HomogeneousFamily P0 P3 2)
    (k1 : HomogeneousFamily P1 P1 1)
    (k2 : HomogeneousFamily P2 P2 1) :
    HomogeneousFamily P0 P3 2 := by
  let X0 := HomogeneousFamily.ofChainMap x0
  let X1 := HomogeneousFamily.ofChainMap x1
  let X2 := HomogeneousFamily.ofChainMap x2
  let t1 : HomogeneousFamily P0 P3 2 :=
    (h0.compAs k2 (by omega : (1 : ℤ) + 1 = 2)).compAs X2
      (by omega : (2 : ℤ) + 0 = 2)
  let t2 : HomogeneousFamily P0 P3 2 :=
    (X0.compAs k1 (by omega : (0 : ℤ) + 1 = 1)).compAs h1
      (by omega : (1 : ℤ) + 1 = 2)
  let t3 : HomogeneousFamily P0 P3 2 :=
    ((((X0.compAs k1 (by omega : (0 : ℤ) + 1 = 1)).compAs X1
      (by omega : (1 : ℤ) + 0 = 1)).compAs k2
      (by omega : (1 : ℤ) + 1 = 2)).compAs X2
      (by omega : (2 : ℤ) + 0 = 2))
  exact z + t1 + t2 + t3

/-- The first FULLY TYPED candidate secondary transfer: from replacement
stage zero to replacement stage three, with both inverse-homotopy
corrections K1 and K2. This is not yet a certified coherence equation. -/
def FiveStageSecondaryData.candidateZ03
    (q : FiveStageSecondaryData)
    {Q0 Q1 Q2 Q3 : C4Complex}
    (e0 : ChainHomotopyEquivalence q.primary.P0 Q0)
    (e1 : ChainHomotopyEquivalence q.primary.P1 Q1)
    (e2 : ChainHomotopyEquivalence q.primary.P2 Q2)
    (e3 : ChainHomotopyEquivalence q.primary.P3 Q3) :
    HomogeneousFamily Q0 Q3 2 := by
  let core := correctedSecondaryCore q.primary.x01 q.primary.x12
    q.primary.x23 (HomogeneousFamily.ofHomotopy q.primary.h02)
    (HomogeneousFamily.ofHomotopy q.primary.h13)
    q.firstSecondaryFamily
    (HomogeneousFamily.ofHomotopy e1.original_retract)
    (HomogeneousFamily.ofHomotopy e2.original_retract)
  exact ((HomogeneousFamily.ofChainMap e0.toOriginal).compAs core
    (by omega : (0 : ℤ) + 2 = 2)).compAs
      (HomogeneousFamily.ofChainMap e3.fromOriginal)
      (by omega : (2 : ℤ) + 0 = 2)

/-- The independent FULLY TYPED second candidate uses intermediate K2
and K3 and maps replacement stage one to replacement stage four. -/
def FiveStageSecondaryData.candidateZ14
    (q : FiveStageSecondaryData)
    {Q1 Q2 Q3 Q4 : C4Complex}
    (e1 : ChainHomotopyEquivalence q.primary.P1 Q1)
    (e2 : ChainHomotopyEquivalence q.primary.P2 Q2)
    (e3 : ChainHomotopyEquivalence q.primary.P3 Q3)
    (e4 : ChainHomotopyEquivalence q.primary.P4 Q4) :
    HomogeneousFamily Q1 Q4 2 := by
  let core := correctedSecondaryCore q.primary.x12 q.primary.x23
    q.primary.x34 (HomogeneousFamily.ofHomotopy q.primary.h13)
    (HomogeneousFamily.ofHomotopy q.primary.h24)
    q.secondSecondaryFamily
    (HomogeneousFamily.ofHomotopy e2.original_retract)
    (HomogeneousFamily.ofHomotopy e3.original_retract)
  exact ((HomogeneousFamily.ofChainMap e1.toOriginal).compAs core
    (by omega : (0 : ℤ) + 2 = 2)).compAs
      (HomogeneousFamily.ofChainMap e4.fromOriginal)
      (by omega : (2 : ℤ) + 0 = 2)

end C4
