module

public import OptionD.RelativeCofiber

public section

/-!
# S131: strict functor laws for actual topological quotient/cofiber maps

The maps below are equal as continuous maps, not merely homotopy classes.
Derived homotopy cofibers are NOT identified with ordinary quotients.
-/

namespace OptionD

/-- Every quotient-map square commutes with the canonical projections. -/
theorem d3_collapse_map_projection {X Y : Type*}
    [TopologicalSpace X] [TopologicalSpace Y]
    (A : Set X) (B : Set Y)
    (f : C(X, Y)) (hA : ∀ x, x ∈ A → f x ∈ B) :
    (d3CollapseMap A B f hA).comp (d3CollapseProjection A) =
      (d3CollapseProjection B).comp f := by
  ext x
  simp only [ContinuousMap.comp_apply, d3_collapse_projection_mk,
    d3_collapse_map_apply_mk]

/-- Identity on a pair induces identity on its quotient, on the nose. -/
theorem d3_collapse_map_id {X : Type*} [TopologicalSpace X]
    (A : Set X) :
    d3CollapseMap A A (ContinuousMap.id X) (fun x hx => hx) =
      ContinuousMap.id (d3CollapseSpace A) := by
  ext q
  refine Quotient.inductionOn q ?_
  intro x
  change d3CollapseMap A A (ContinuousMap.id X) (fun x hx => hx)
    (Quotient.mk (d3CollapseSetoid A) x) =
      Quotient.mk (d3CollapseSetoid A) x
  exact d3_collapse_map_id_apply_mk A x

/-- Composite maps of pairs induce the composite continuous quotient map. -/
theorem d3_collapse_map_comp {X Y Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    (A : Set X) (B : Set Y) (C : Set Z)
    (f : C(X, Y)) (g : C(Y, Z))
    (hAB : ∀ x, x ∈ A → f x ∈ B)
    (hBC : ∀ y, y ∈ B → g y ∈ C) :
    (d3CollapseMap B C g hBC).comp (d3CollapseMap A B f hAB) =
      d3CollapseMap A C (g.comp f)
        (fun x hx => hBC (f x) (hAB x hx)) := by
  ext q
  refine Quotient.inductionOn q ?_
  intro x
  simp only [ContinuousMap.id_apply, ContinuousMap.comp_apply,
    d3_collapse_map_apply_mk]

/-- The cofiber map commutes with its canonical quotient projection. -/
theorem d3_point_cofiber_map_projection {X Y W Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace W] [TopologicalSpace Z]
    (f : C(X, Y)) (g : C(W, Z))
    (u : C(X, W)) (v : C(Y, Z))
    (h : ∀ x, v (f x) = g (u x)) :
    (d3PointCofiberMap f g u v h).comp
        (d3PointCofiberProjection f) =
      (d3PointCofiberProjection g).comp
        ({ toFun := Sum.map v (id : PUnit → PUnit)
           continuous_toFun := v.continuous.sumMap continuous_id } :
          C(Y ⊕ PUnit, Z ⊕ PUnit)) := by
  ext z
  simp only [ContinuousMap.comp_apply, d3_point_cofiber_projection_mk,
    d3_point_cofiber_map_apply_mk]
  rfl

/-- The identity commuting square induces the identity cofiber map. -/
theorem d3_point_cofiber_map_id {X Y : Type*}
    [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) :
    d3PointCofiberMap f f (ContinuousMap.id X) (ContinuousMap.id Y)
        (by intro x; rfl) =
      ContinuousMap.id (d3PointCofiber f) := by
  ext q
  refine Quotient.inductionOn q ?_
  intro z
  cases z with
  | inl y =>
    simp only [ContinuousMap.comp_apply, ContinuousMap.id_apply,
      d3_point_cofiber_map_apply_mk, Sum.map_inl]
  | inr p =>
    cases p
    simp only [ContinuousMap.comp_apply, ContinuousMap.id_apply,
      d3_point_cofiber_map_apply_mk, Sum.map_inr]

/-- Composing strictly commuting arrow squares agrees with the
composition of their induced actual continuous cofiber maps. -/
theorem d3_point_cofiber_map_comp {X Y W Z U V : Type*}
    [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace W] [TopologicalSpace Z]
    [TopologicalSpace U] [TopologicalSpace V]
    (f : C(X, Y)) (g : C(W, Z)) (k : C(U, V))
    (u₁ : C(X, W)) (v₁ : C(Y, Z))
    (u₂ : C(W, U)) (v₂ : C(Z, V))
    (h₁ : ∀ x, v₁ (f x) = g (u₁ x))
    (h₂ : ∀ x, v₂ (g x) = k (u₂ x)) :
    (d3PointCofiberMap g k u₂ v₂ h₂).comp
        (d3PointCofiberMap f g u₁ v₁ h₁) =
      d3PointCofiberMap f k (u₂.comp u₁) (v₂.comp v₁)
        (by
          intro x
          calc
            v₂ (v₁ (f x)) = v₂ (g (u₁ x)) := congrArg v₂ (h₁ x)
            _ = k (u₂ (u₁ x)) := h₂ (u₁ x)) := by
  ext q
  refine Quotient.inductionOn q ?_
  intro z
  cases z with
  | inl y =>
    simp only [ContinuousMap.comp_apply, ContinuousMap.id_apply,
      d3_point_cofiber_map_apply_mk, Sum.map_inl]
  | inr p =>
    cases p
    simp only [ContinuousMap.comp_apply, ContinuousMap.id_apply,
      d3_point_cofiber_map_apply_mk, Sum.map_inr]

/-- Facewise inclusions induce the inclusion of the two corner unions. -/
theorem d3_corner_union_mono {N : ℕ}
    (B C B' C' : d3FiniteComplex N)
    (hB : B ≤ B') (hC : C ≤ C') :
    d3CornerUnion B C ≤ d3CornerUnion B' C' := by
  intro s hs
  rcases (d3_corner_union_mem_iff B C s).mp hs with hb | hc
  · exact (d3_corner_union_mem_iff B' C' s).mpr (Or.inl (hB hb))
  · exact (d3_corner_union_mem_iff B' C' s).mpr (Or.inr (hC hc))

/-- The union-to-terminal attachment is natural under inclusions of
all three complexes. This is equality of actual continuous maps. -/
theorem d3_attaching_comparison_natural {N : ℕ}
    (B C D B' C' D' : d3FiniteComplex N)
    (hBD : B ≤ D) (hCD : C ≤ D)
    (hB'D' : B' ≤ D') (hC'D' : C' ≤ D')
    (hB : B ≤ B') (hC : C ≤ C') (hD : D ≤ D') :
    (d3BarycentricInclusion D D' hD).comp
        (d3OrdinaryAttachingComparison B C D hBD hCD) =
      (d3OrdinaryAttachingComparison B' C' D' hB'D' hC'D').comp
        (d3BarycentricInclusion (d3CornerUnion B C)
          (d3CornerUnion B' C') (d3_corner_union_mono B C B' C' hB hC)) := by
  apply ContinuousMap.ext
  intro x
  apply Subtype.ext
  simp only [ContinuousMap.comp_apply, d3_barycentric_inclusion_val,
    d3_ordinary_attaching_val]

/-- A triple of nested corner inclusions yields the actual continuous
cofiber comparison with the canonical quotient topology. -/
def d3AttachingPointCofiberInclusion {N : ℕ}
    (B C D B' C' D' : d3FiniteComplex N)
    (hBD : B ≤ D) (hCD : C ≤ D)
    (hB'D' : B' ≤ D') (hC'D' : C' ≤ D')
    (hB : B ≤ B') (hC : C ≤ C') (hD : D ≤ D') :
    C(d3AttachingPointCofiber B C D hBD hCD,
      d3AttachingPointCofiber B' C' D' hB'D' hC'D') :=
  d3PointCofiberMap
    (d3OrdinaryAttachingComparison B C D hBD hCD)
    (d3OrdinaryAttachingComparison B' C' D' hB'D' hC'D')
    (d3BarycentricInclusion _ _ (d3_corner_union_mono B C B' C' hB hC))
    (d3BarycentricInclusion D D' hD)
    (by
      intro x
      apply Subtype.ext
      simp only [d3_barycentric_inclusion_val, d3_ordinary_attaching_val])

end OptionD
