module

public import OptionD.CofiberNaturality
public import Mathlib.CategoryTheory.Comma.Arrow

public section

/-!
# S132: honest arrow-category functor for ordinary point-set cofibers

The domain is the Mathlib arrow category of TopCat: morphisms are actual
strictly commuting continuous squares. This functor concerns ordinary
point-set cofibers; it does not identify a quotient with a homotopy cofiber
or assert any homotopy-cocartesian square.
-/

namespace OptionD

open CategoryTheory

/-- A morphism in the arrow category commutes pointwise as actual
continuous maps, not just up to homotopy. -/
theorem d3_arrow_square_commutes (f g : Arrow TopCat) (sq : f ⟶ g)
    (x : f.left) :
    (Arrow.Hom.right sq).hom (f.hom.hom x) =
      g.hom.hom ((Arrow.Hom.left sq).hom x) := by
  have hw : (Arrow.Hom.left sq) ≫ g.hom =
      f.hom ≫ (Arrow.Hom.right sq) := sq.w
  have hx := congrArg (fun h : f.left ⟶ g.right => h.hom x) hw
  simpa only [TopCat.comp_app] using hx.symm

/-- The ordinary point-set cofiber construction is a genuine covariant
functor on the category of topological arrows and commuting squares. -/
def d3PointCofiberArrowFunctor : Arrow TopCat ⥤ TopCat where
  obj f := TopCat.of (d3PointCofiber f.hom.hom)
  map {f g} sq := TopCat.ofHom
    (d3PointCofiberMap f.hom.hom g.hom.hom
      (Arrow.Hom.left sq).hom (Arrow.Hom.right sq).hom
      (d3_arrow_square_commutes f g sq))
  map_id := by
    intro f
    apply TopCat.hom_ext
    simpa only [TopCat.hom_ofHom, TopCat.hom_id, Arrow.id_left,
      Arrow.id_right] using (d3_point_cofiber_map_id f.hom.hom)
  map_comp := by
    intro f g k sq₁ sq₂
    apply TopCat.hom_ext
    simpa only [TopCat.hom_comp, TopCat.hom_ofHom,
      Arrow.comp_left, Arrow.comp_right] using
      (d3_point_cofiber_map_comp f.hom.hom g.hom.hom k.hom.hom
        (Arrow.Hom.left sq₁).hom (Arrow.Hom.right sq₁).hom
        (Arrow.Hom.left sq₂).hom (Arrow.Hom.right sq₂).hom
        (d3_arrow_square_commutes f g sq₁)
        (d3_arrow_square_commutes g k sq₂)).symm

end OptionD
