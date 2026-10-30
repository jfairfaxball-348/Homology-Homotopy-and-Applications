module
public import C4.HomDifferentialLemmas

@[expose] public section

/-!
# Homogeneous B-linear composition is additive in each input

These are actual all-integer graded-component identities in arbitrary
chain complexes, preserving the explicit target equality casts.
-/

namespace C4
open CategoryTheory

theorem HomogeneousFamily.compAs_add_left_component
    {P Q R : C4Complex} {p q r : ℤ}
    (f g : HomogeneousFamily P Q p)
    (h : HomogeneousFamily Q R q)
    (hpq : p + q = r) (n : ℤ) :
    ((f + g).compAs h hpq).hom n =
      (f.compAs h hpq).hom n + (g.compAs h hpq).hom n := by
  simp [HomogeneousFamily.compAs, HomogeneousFamily.add_hom,
    Preadditive.add_comp, Preadditive.comp_add]

theorem HomogeneousFamily.compAs_add_right_component
    {P Q R : C4Complex} {p q r : ℤ}
    (f : HomogeneousFamily P Q p)
    (g h : HomogeneousFamily Q R q)
    (hpq : p + q = r) (n : ℤ) :
    (f.compAs (g + h) hpq).hom n =
      (f.compAs g hpq).hom n + (f.compAs h hpq).hom n := by
  simp [HomogeneousFamily.compAs, HomogeneousFamily.add_hom,
    Preadditive.add_comp, Preadditive.comp_add]

end C4
