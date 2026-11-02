module
public import C4.ChainCochainBridge

@[expose] public section

/-! # Actual cochain defining systems produce the existing chain interfaces -/
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true
namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex.HomComplex

/-- The complete primary/secondary input in the checked HomComplex representation.
The coherence fields will be discharged by the actual strict-zero words. -/
structure CochainFourfoldData (P0 P1 P2 P3 P4 : C4Complex) where
  x01 : P0 ⟶ P1
  x12 : P1 ⟶ P2
  x23 : P2 ⟶ P3
  x34 : P3 ⟶ P4
  h02 : Cochain (reverseComplex P0) (reverseComplex P2) (-1)
  h13 : Cochain (reverseComplex P1) (reverseComplex P3) (-1)
  h24 : Cochain (reverseComplex P2) (reverseComplex P4) (-1)
  d02 : δ (-1) 0 h02 = Cochain.ofHom (reverseMap (x01 ≫ x12))
  d13 : δ (-1) 0 h13 = Cochain.ofHom (reverseMap (x12 ≫ x23))
  d24 : δ (-1) 0 h24 = Cochain.ofHom (reverseMap (x23 ≫ x34))
  z03 : Cochain (reverseComplex P0) (reverseComplex P3) (-2)
  z14 : Cochain (reverseComplex P1) (reverseComplex P4) (-2)
  d03 : δ (-2) (-1) z03 =
    h02.comp (Cochain.ofHom (reverseMap x23)) (by decide) +
      (Cochain.ofHom (reverseMap x01)).comp h13 (by decide)
  d14 : δ (-2) (-1) z14 =
    h13.comp (Cochain.ofHom (reverseMap x34)) (by decide) +
      (Cochain.ofHom (reverseMap x12)).comp h24 (by decide)

variable {P0 P1 P2 P3 P4 : C4Complex}

/-- The primary cochains construct actual Mathlib chain homotopies. -/
def CochainFourfoldData.primary (q : CochainFourfoldData P0 P1 P2 P3 P4) :
    FiveStagePrimaryData where
  P0 := P0
  P1 := P1
  P2 := P2
  P3 := P3
  P4 := P4
  x01 := q.x01
  x12 := q.x12
  x23 := q.x23
  x34 := q.x34
  h02 := chainHomotopyOfCochain _ 0 q.h02 (by simpa using q.d02)
  h13 := chainHomotopyOfCochain _ 0 q.h13 (by simpa using q.d13)
  h24 := chainHomotopyOfCochain _ 0 q.h24 (by simpa using q.d24)

/-- A secondary cochain boundary is the exact chain equation, including its
required target-index transport at every integer degree. -/
theorem chainFamily_secondary
    (x : P0 ⟶ P1) (y : P2 ⟶ P3)
    (h : Cochain (reverseComplex P0) (reverseComplex P2) (-1))
    (h' : Cochain (reverseComplex P1) (reverseComplex P3) (-1))
    (z : Cochain (reverseComplex P0) (reverseComplex P3) (-2))
    (hz : δ (-2) (-1) z =
      h.comp (Cochain.ofHom (reverseMap y)) (by decide) +
        (Cochain.ofHom (reverseMap x)).comp h' (by decide)) (n : ℤ) :
    chainFamily (k := 2) z n (n+2) ≫ P3.d (n+2) (n+1) +
      ((P0.d n (n-1) ≫ chainFamily (k := 2) z (n-1) ((n-1)+2)) ≫
        eqToHom (congrArg P3.X (by omega : n-1+2=n+1))) =
      chainFamily (k := 1) h n (n+1) ≫ y.f (n+1) +
        x.f n ≫ chainFamily (k := 1) h' n (n+1) := by
  have hd := chainFamily_d_between (k := 2) (l := 1) z (by decide) n (n-1) (n+2) (n+1)
    (by omega) rfl (by omega)
  have hc : chainFamily (k := 1) (δ (-2) (-1) z) n (n+1) =
      chainFamily (k := 1) h n (n+1) ≫ y.f (n+1) +
        x.f n ≫ chainFamily (k := 1) h' n (n+1) := by
    rw [hz, chainFamily_add (k := 1),
      chainFamily_comp_at (k := 1) (l := 0) (n := 1) h _ (by decide) n (n+1) (n+1) (by omega) (by omega),
      chainFamily_comp_at (k := 0) (l := 1) (n := 1) _ h' (by decide) n n (n+1) (by omega) (by omega),
      chainFamily_ofHom, chainFamily_ofHom]
  rw [Category.assoc, chainFamily_target]
  exact hd.symm.trans hc

/-- Both secondary families and ALL support/coherence fields of the existing
chain interface are constructed from the cochain equations. -/
def CochainFourfoldData.secondary (q : CochainFourfoldData P0 P1 P2 P3 P4) :
    FiveStageSecondaryData where
  primary := q.primary
  z03 := chainFamily (k := 2) q.z03
  z14 := chainFamily (k := 2) q.z14
  z03_zero := chainFamily_off q.z03
  z14_zero := chainFamily_off q.z14
  z03_coherence := chainFamily_secondary q.x01 q.x23 q.h02 q.h13 q.z03 q.d03
  z14_coherence := chainFamily_secondary q.x12 q.x34 q.h13 q.h24 q.z14 q.d14

/-- The actual degree-three cochain equation constructs a tertiary filler
in the previously certified chain interface, at every integer degree. -/
def CochainFourfoldData.tertiary (q : CochainFourfoldData P0 P1 P2 P3 P4)
    (w : Cochain (reverseComplex P0) (reverseComplex P4) (-3))
    (hw : δ (-3) (-2) w =
      q.z03.comp (Cochain.ofHom (reverseMap q.x34)) (by decide) +
        (q.h02.comp q.h24 (by decide) +
          (Cochain.ofHom (reverseMap q.x01)).comp q.z14 (by decide))) :
    q.secondary.TertiaryFiller where
  w := chainFamily (k := 3) w
  support := chainFamily_off w
  coherence i j k hj hk := by
    have hd := chainFamily_d_between (k := 3) (l := 2) w (by decide)
      i (i-1) (k+1) k (by omega) rfl rfl
    have hc : chainFamily (k := 2) (δ (-3) (-2) w) i k =
        chainFamily (k := 2) q.z03 i k ≫ q.x34.f k +
          (chainFamily (k := 1) q.h02 i j ≫ chainFamily (k := 1) q.h24 j k +
            q.x01.f i ≫ chainFamily (k := 2) q.z14 i k) := by
      rw [hw, chainFamily_add (k := 2), chainFamily_add (k := 2),
        chainFamily_comp_at (k := 2) (l := 0) (n := 2) q.z03 _ (by decide) i k k (by omega) (by omega),
        chainFamily_comp_at (k := 1) (l := 1) (n := 2) q.h02 q.h24 (by decide) i j k (by omega) (by omega),
        chainFamily_comp_at (k := 0) (l := 2) (n := 2) _ q.z14 (by decide) i i k (by omega) (by omega),
        chainFamily_ofHom, chainFamily_ofHom]
    exact hc.symm.trans hd

#print axioms CochainFourfoldData.secondary
#print axioms CochainFourfoldData.tertiary
end C4
