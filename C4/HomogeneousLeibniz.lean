module
public import C4.HomDifferentialLemmas

@[expose] public section

/-!
# S168: graded Hom composition differential

All terms are components of actual shifted chain-complex morphism
families on every integer degree. The unsigned form of the Leibniz
identity requires characteristic two of the coefficient B.
-/

namespace C4
open CategoryTheory

/-- Target homogeneous Hom differential Leibniz identity with all
integer-shift casts explicit and no assumed coherence fields. -/
theorem HomogeneousFamily.d_compAs_component
    {P Q R : C4Complex} {p q r : ℤ}
    (f : HomogeneousFamily P Q p)
    (g : HomogeneousFamily Q R q)
    (hpq : p + q = r) (n : ℤ) :
    ((f.compAs g hpq).d).hom n =
      (((f.d).compAs g (by omega : (p - 1) + q = r - 1)) +
       (f.compAs g.d (by omega : p + (q - 1) = r - 1))).hom n := by
  subst r
  simp [HomogeneousFamily.d, HomogeneousFamily.compAs,
    HomogeneousFamily.add_hom, Category.assoc,
    Preadditive.add_comp, Preadditive.comp_add,
    sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  abel

end C4
