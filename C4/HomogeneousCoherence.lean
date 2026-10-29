module
public import C4.HomogeneousFamily

@[expose] public section

/-!
# Genuine homogeneous Hom differential of the two C4 secondary fillers

The original defining-system secondary equations really are equations
for the differential of all-integer degree-two component families, not
just selected scalar coefficients. This is a typed bridge to the
secondary transfer identities; it does not assert that transferred
fillers on arbitrary homotopy-equivalent replacements yet exist.
-/

namespace C4
open CategoryTheory

/-- The first actual degree-two family has exactly the expected true
homological differential, in every integer degree. -/
theorem FiveStageSecondaryData.firstSecondary_d
    (q : FiveStageSecondaryData) (n : ℤ) :
    (q.firstSecondaryFamily.d).hom n =
      q.primary.h02.hom n (n + 1) ≫ q.primary.x23.f (n + 1) +
      q.primary.x01.f n ≫ q.primary.h13.hom n (n + 1) := by
  have hn₁ : n + 2 - 1 = n + 1 := by omega
  have hn₂ : n - 1 + 2 = n + 1 := by omega
  have hn₃ : n + (2 - 1) = n + 1 := by omega
  simpa [HomogeneousFamily.d, FiveStageSecondaryData.firstSecondaryFamily,
    hn₁, hn₂, hn₃, add_comm] using q.z03_coherence n

/-- The second independent degree-two family has the other exact
secondary differential identity at every integer degree. -/
theorem FiveStageSecondaryData.secondSecondary_d
    (q : FiveStageSecondaryData) (n : ℤ) :
    (q.secondSecondaryFamily.d).hom n =
      q.primary.h13.hom n (n + 1) ≫ q.primary.x34.f (n + 1) +
      q.primary.x12.f n ≫ q.primary.h24.hom n (n + 1) := by
  have hn₁ : n + 2 - 1 = n + 1 := by omega
  have hn₂ : n - 1 + 2 = n + 1 := by omega
  have hn₃ : n + (2 - 1) = n + 1 := by omega
  simpa [HomogeneousFamily.d, FiveStageSecondaryData.secondSecondaryFamily,
    hn₁, hn₂, hn₃, add_comm] using q.z14_coherence n

end C4
