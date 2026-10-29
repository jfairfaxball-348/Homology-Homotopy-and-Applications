module
public import C4.AdjacentNonNull

@[expose] public section

/-!
# Five-object secondary defining systems

The source C4 GlobalFourfoldDefiningSystem uses five shifted resolutions.
This module places its actual two degree-TWO secondary fillers, their
off-degree vanishing, and BOTH coherence equations into an arbitrary
five-object chain-complex interface. The interface does not assume a
secondary filler exists on arbitrary replacement objects.

The canonical C4 system gives a verified inhabitant of this general
interface; transferring secondary fillers through chain-homotopy
equivalences is a separate mathematical construction.
-/

namespace C4

open CategoryTheory

/-- Full primary-and-secondary defining-system data on five arbitrary
chain complexes. The three primary fillers are Mathlib homotopies,
and both secondary maps have homological degree two. -/
structure FiveStageSecondaryData where
  primary : FiveStagePrimaryData
  z03 : ∀ i j : ℤ, (primary.P0).X i ⟶ (primary.P3).X j
  z14 : ∀ i j : ℤ, (primary.P1).X i ⟶ (primary.P4).X j
  z03_zero : ∀ i j : ℤ, j ≠ i + 2 → z03 i j = 0
  z14_zero : ∀ i j : ℤ, j ≠ i + 2 → z14 i j = 0
  z03_coherence : ∀ n : ℤ,
    z03 n (n + 2) ≫ (primary.P3).d (n + 2) (n + 1) +
    (((primary.P0).d n (n - 1) ≫ z03 (n - 1) ((n - 1) + 2)) ≫
      eqToHom (congrArg (primary.P3).X
        (by omega : n - 1 + 2 = n + 1))) =
    primary.h02.hom n (n + 1) ≫ primary.x23.f (n + 1) +
    primary.x01.f n ≫ primary.h13.hom n (n + 1)
  z14_coherence : ∀ n : ℤ,
    z14 n (n + 2) ≫ (primary.P4).d (n + 2) (n + 1) +
    (((primary.P1).d n (n - 1) ≫ z14 (n - 1) ((n - 1) + 2)) ≫
      eqToHom (congrArg (primary.P4).X
        (by omega : n - 1 + 2 = n + 1))) =
    primary.h13.hom n (n + 1) ≫ primary.x34.f (n + 1) +
    primary.x12.f n ≫ primary.h24.hom n (n + 1)

/-- Every genuine C4 global fourfold system supplies BOTH exact
secondary coherences in the general five-object interface. This
construction retains all independently chosen arrows and fillers. -/
def GlobalFourfoldDefiningSystem.toFiveStageSecondaryData
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) :
    FiveStageSecondaryData where
  primary := q.toPrimaryData
  z03 := q.z03
  z14 := q.z14
  z03_zero := q.z03_zero
  z14_zero := q.z14_zero
  z03_coherence := q.z03_coherence
  z14_coherence := q.z14_coherence

/-- The generalized data projection is definitionally the SAME primary
system already used by S165. -/
theorem GlobalFourfoldDefiningSystem.secondary_primary_eq
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) :
    q.toFiveStageSecondaryData.primary = q.toPrimaryData := rfl

/-- The generalized first secondary is precisely the original actual
degree-two family, not an independently postulated filler. -/
theorem GlobalFourfoldDefiningSystem.secondary_z03_eq
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) (i j : ℤ) :
    q.toFiveStageSecondaryData.z03 i j = q.z03 i j := rfl

/-- Likewise for the second degree-two coherence. -/
theorem GlobalFourfoldDefiningSystem.secondary_z14_eq
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) (i j : ℤ) :
    q.toFiveStageSecondaryData.z14 i j = q.z14 i j := rfl

/-- The actual globally constructed canonical C4 system is an inhabitant,
with no assumed existence of general secondary transfer. -/
def canonicalFiveStageSecondary (s : ℤ) : FiveStageSecondaryData :=
  (canonicalGlobalFourfold s).toFiveStageSecondaryData

end C4
