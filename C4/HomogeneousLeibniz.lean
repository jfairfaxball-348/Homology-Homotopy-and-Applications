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
  let A : P.X n ⟶ R.X (n + (p + q - 1)) :=
    (P.d n (n - 1) ≫ f.hom (n - 1) ≫ g.hom (n - 1 + p)) ≫
      eqToHom (congrArg R.X
        (by omega : (n - 1 + p) + q = n + (p + q - 1)))
  let B' : P.X n ⟶ R.X (n + (p + q - 1)) :=
    (f.hom n ≫ g.hom (n + p) ≫
      R.d (n + p + q) (n + p + q - 1)) ≫
      eqToHom (congrArg R.X
        (by omega : n + p + q - 1 = n + (p + q - 1)))
  let C : P.X n ⟶ R.X (n + (p + q - 1)) :=
    (f.hom n ≫ Q.d (n + p) (n + p - 1) ≫
      g.hom (n + p - 1)) ≫
      eqToHom (congrArg R.X
        (by omega : (n + p - 1) + q = n + (p + q - 1)))
  have h₁ : n - 1 + p = n + p - 1 := by omega
  have h₂ : n + (p - 1) = n + p - 1 := by omega
  have h₃ : n + p + q - 1 = n + (p + q - 1) := by omega
  have h₄ : n + p + q = n + (p + q) := by omega
  have lhs : ((f.compAs g rfl).d).hom n = A + B' := by
    simp [A, B', HomogeneousFamily.d, HomogeneousFamily.compAs,
      Category.assoc, h₁, h₂, h₃, h₄, add_assoc, sub_eq_add_neg]
  have rhs :
      (((f.d).compAs g (by omega : (p - 1) + q = p + q - 1)) +
       (f.compAs g.d (by omega : p + (q - 1) = p + q - 1))).hom n =
        (A + C) + (C + B') := by
    simp [A, B', C, HomogeneousFamily.d, HomogeneousFamily.compAs,
      HomogeneousFamily.add_hom, Preadditive.comp_add, Preadditive.add_comp,
      Category.assoc, add_assoc, sub_eq_add_neg]
  calc
    ((f.compAs g rfl).d).hom n = A + B' := lhs
    _ = (A + C) + (C + B') := moduleHom_middle_cancel A B' C
    _ = _ := rhs.symm

end C4
