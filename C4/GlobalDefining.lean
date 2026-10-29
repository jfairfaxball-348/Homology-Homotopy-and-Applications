module
public import C4.GlobalChoice

@[expose] public section

/-!
# Genuine all-integer C4 fourfold defining-system data

The adjacent maps, three primary homotopies and two secondary degree-two
fillers are arbitrary but correctly typed on the actual shifted chain
complexes. This is the GLOBAL dg-Hom admissibility interface, not the
low-degree nonboundary theorem. No claim about the terminal's nonboundary
or its preservation by arbitrary weak equivalences follows from the mere
existence of this data type.
-/

namespace C4

open CategoryTheory

/-- A fully globally-indexed, arbitrary fourfold defining-system candidate.
Its three primary fillers are genuine Mathlib chain homotopies; its two
secondary fillers have homological degree TWO with explicitly required
differential coherence at EVERY integer degree. -/
structure GlobalFourfoldDefiningSystem (s : ℤ) where
  x01 : integerShiftResolution s ⟶ integerShiftResolution (s + 1)
  x12 : integerShiftResolution (s + 1) ⟶ integerShiftResolution (s + 2)
  x23 : integerShiftResolution (s + 2) ⟶ integerShiftResolution (s + 3)
  x34 : integerShiftResolution (s + 3) ⟶ integerShiftResolution (s + 4)
  h02 : Homotopy (x01 ≫ x12) 0
  h13 : Homotopy (x12 ≫ x23) 0
  h24 : Homotopy (x23 ≫ x34) 0
  z03 : ∀ i j : ℤ,
    (integerShiftResolution s).X i ⟶
      (integerShiftResolution (s + 3)).X j
  z14 : ∀ i j : ℤ,
    (integerShiftResolution (s + 1)).X i ⟶
      (integerShiftResolution (s + 4)).X j
  z03_zero : ∀ i j : ℤ, j ≠ i + 2 → z03 i j = 0
  z14_zero : ∀ i j : ℤ, j ≠ i + 2 → z14 i j = 0
  z03_coherence : ∀ n : ℤ,
    z03 n (n + 2) ≫
      (integerShiftResolution (s + 3)).d (n + 2) (n + 1) +
    (((integerShiftResolution s).d n (n - 1) ≫ z03 (n - 1) ((n - 1) + 2)) ≫
      eqToHom (congrArg (integerShiftResolution (s + 3)).X
        (by omega : n - 1 + 2 = n + 1))) =
    h02.hom n (n + 1) ≫ x23.f (n + 1) +
    x01.f n ≫ h13.hom n (n + 1)
  z14_coherence : ∀ n : ℤ,
    z14 n (n + 2) ≫
      (integerShiftResolution (s + 4)).d (n + 2) (n + 1) +
    (((integerShiftResolution (s + 1)).d n (n - 1) ≫
      z14 (n - 1) ((n - 1) + 2)) ≫
      eqToHom (congrArg (integerShiftResolution (s + 4)).X
        (by omega : n - 1 + 2 = n + 1))) =
    h13.hom n (n + 1) ≫ x34.f (n + 1) +
    x12.f n ≫ h24.hom n (n + 1)

/-- The primary equations for ANY admissible global system are actual
homotopies in the category of shifted chain complexes, not approximations
by coefficient equations. -/
theorem GlobalFourfoldDefiningSystem.primary_zero
    {s : ℤ} (q : GlobalFourfoldDefiningSystem s) :
    Nonempty (Homotopy (q.x01 ≫ q.x12) 0) ∧
    Nonempty (Homotopy (q.x12 ≫ q.x23) 0) ∧
    Nonempty (Homotopy (q.x23 ≫ q.x34) 0) :=
  ⟨⟨q.h02⟩, ⟨q.h13⟩, ⟨q.h24⟩⟩

end C4
