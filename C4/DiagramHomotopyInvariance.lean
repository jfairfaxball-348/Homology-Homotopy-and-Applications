module
public import C4.DerivedInterleavingDistance
public import Mathlib.Algebra.Homology.Functor
public import Mathlib.Algebra.Homology.HomotopyCofiber

@[expose] public section

/-!
# Natural chain homotopies are identified by every localisation

A diagram `X : T ⥤ C4Complex` is the same as a chain complex of `T`-indexed
persistence modules (`diagramComplex X`, the inverse of Mathlib's
`complexOfFunctorsToFunctorToComplex` on objects and maps, by structure eta).
A *natural* chain homotopy is a Mathlib `Homotopy` in that category of
complexes. Using Mathlib's cylinder lemma, any functor out of `T ⥤ C4Complex`
inverting objectwise quasi-isomorphisms sends naturally homotopic maps to the
same morphism.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits

universe u v
variable {T : Type u} [Category.{v} T]

/-- A diagram of chain complexes, read as a chain complex of diagrams. -/
def diagramComplex (X : T ⥤ C4Complex) :
    HomologicalComplex (T ⥤ ModuleCat B) (ComplexShape.down ℤ) where
  X i := X ⋙ HomologicalComplex.eval (ModuleCat B) (ComplexShape.down ℤ) i
  d i j :=
    { app := fun t => (X.obj t).d i j
      naturality := fun _ _ a => (X.map a).comm i j }
  shape i j hij := NatTrans.ext (funext fun t => (X.obj t).shape i j hij)
  d_comp_d' i j k _ _ := NatTrans.ext (funext fun t => (X.obj t).d_comp_d i j k)

/-- A natural transformation of diagrams, read as a chain map of complexes of
diagrams. -/
def diagramComplexMap {X Y : T ⥤ C4Complex} (f : X ⟶ Y) :
    diagramComplex X ⟶ diagramComplex Y where
  f i :=
    { app := fun t => (f.app t).f i
      naturality := fun _ _ a => by
        change (X.map a).f i ≫ (f.app _).f i = (f.app _).f i ≫ (Y.map a).f i
        rw [← HomologicalComplex.comp_f, ← HomologicalComplex.comp_f, f.naturality] }
  comm' i j _ := NatTrans.ext (funext fun t => (f.app t).comm i j)

theorem asFunctor_diagramComplexMap {X Y : T ⥤ C4Complex} (f : X ⟶ Y) :
    HomologicalComplex.complexOfFunctorsToFunctorToComplex.map (diagramComplexMap f) = f :=
  rfl

/-- **Homotopy invariance.** Every functor inverting objectwise
quasi-isomorphisms identifies naturally homotopic natural transformations. -/
theorem map_eq_of_naturalHomotopy {E : Type*} [Category E] (G : (T ⥤ C4Complex) ⥤ E)
    (hG : ∀ {X Y : T ⥤ C4Complex} (w : X ⟶ Y), (∀ t, QuasiIso (w.app t)) → IsIso (G.map w))
    {X Y : T ⥤ C4Complex} {f g : X ⟶ Y}
    (H : Homotopy (diagramComplexMap f) (diagramComplexMap g)) :
    G.map f = G.map g := by
  have h := H.map_eq_of_inverts_homotopyEquivalences (fun j => ⟨j + 1, rfl⟩)
    (HomologicalComplex.complexOfFunctorsToFunctorToComplex ⋙ G) (by
      intro K L e he
      apply hG
      intro t
      have he' := Functor.homotopyEquivalences_mapHomologicalComplex_map
        ((evaluation T (ModuleCat B)).obj t) e he
      exact (HomologicalComplex.mem_quasiIso_iff _).1
        (homotopyEquivalences_le_quasiIso _ _ _ he'))
  exact h

#print axioms map_eq_of_naturalHomotopy

end C4
