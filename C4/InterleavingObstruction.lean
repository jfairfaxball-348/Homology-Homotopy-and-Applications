module
public import C4.InterleavingTransfer
public import C4.DirectObstruction

@[expose] public section

/-!
# The reversed canonical C4 maps admit no tertiary-filled cochain system

A `FourfoldCochainSystem` on the reversed canonical shifted resolutions is
converted, through the checked chain/cochain bridge, into a genuine
`GlobalFourfoldDefiningSystem` together with an actual `TertiaryFiller`. Its
four adjacent maps are the canonical ones, so all four unit residues are the
certified canonical residues. The certified arbitrary-global obstruction then
gives a contradiction.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory
open CochainComplex.HomComplex

/-- The canonical C4 adjacent maps at shift `s`, in reversed (cochain) grading,
admit no complete fourfold cochain system with a tertiary filler. -/
theorem canonical_no_fourfoldCochainSystem (s : ℤ) :
    ¬ Nonempty (FourfoldCochainSystem
      (reverseMap (canonicalGlobalFourfold s).x01)
      (reverseMap (canonicalGlobalFourfold s).x12)
      (reverseMap (canonicalGlobalFourfold s).x23)
      (reverseMap (canonicalGlobalFourfold s).x34)) := by
  rintro ⟨S⟩
  let c := canonicalGlobalFourfold s
  let a : CochainFourfoldData (integerShiftResolution s) (integerShiftResolution (s + 1))
      (integerShiftResolution (s + 2)) (integerShiftResolution (s + 3))
      (integerShiftResolution (s + 4)) :=
    { x01 := c.x01
      x12 := c.x12
      x23 := c.x23
      x34 := c.x34
      h02 := S.h02
      h13 := S.h13
      h24 := S.h24
      d02 := S.d02
      d13 := S.d13
      d24 := S.d24
      z03 := S.z03
      z14 := S.z14
      d03 := S.d03
      d14 := S.d14 }
  let b := a.secondary
  let g : GlobalFourfoldDefiningSystem s :=
    { x01 := c.x01
      x12 := c.x12
      x23 := c.x23
      x34 := c.x34
      x01_unit := c.x01_unit
      x12_unit := c.x12_unit
      x23_unit := c.x23_unit
      x34_unit := c.x34_unit
      h02 := b.primary.h02
      h13 := b.primary.h13
      h24 := b.primary.h24
      z03 := b.z03
      z14 := b.z14
      z03_zero := b.z03_zero
      z14_zero := b.z14_zero
      z03_coherence := b.z03_coherence
      z14_coherence := b.z14_coherence }
  exact g.no_tertiary_filler ⟨a.tertiary S.w S.dw⟩

/-- The original shifted C4 resolutions, reversed, are K-projective. -/
instance (s : ℤ) : (reverseComplex (integerShiftResolution s)).IsKProjective :=
  reverseResolution_isKProjective s

/-- **The weak-data obstruction.** No interleaving-ladder datum exists over
the reversed canonical C4 maps: an interleaving of five sampled stages with an
ACYCLIC opposite lane, receiving a homotopy-commutative quasi-isomorphism
ladder from the original resolutions, is impossible. -/
theorem canonical_no_interleavingLadder (s : ℤ) :
    IsEmpty (CochainInterleavingLadder
      (reverseMap (canonicalGlobalFourfold s).x01)
      (reverseMap (canonicalGlobalFourfold s).x12)
      (reverseMap (canonicalGlobalFourfold s).x23)
      (reverseMap (canonicalGlobalFourfold s).x34)) :=
  ⟨fun L => canonical_no_fourfoldCochainSystem s L.nonempty_fourfold⟩

#print axioms canonical_no_fourfoldCochainSystem
#print axioms canonical_no_interleavingLadder

end C4
