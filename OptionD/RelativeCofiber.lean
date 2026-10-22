module

public import OptionD.AttachingBoundary

public section

/-!
# S130: point-set cofibers and functoriality for ordinary Rips attaching maps

The cofiber is a quotient with its genuine quotient topology. A *point-set*
cofiber is not silently identified with a homotopy cofiber. No assertion of
a homotopy pushout, cofibration, weak equivalence or D6 distance is made.
-/

namespace OptionD

/-- Collapse precisely the points of A into a single equivalence class. -/
def d3CollapseSetoid {X : Type*} (A : Set X) : Setoid X where
  r x y := x = y ∨ (x ∈ A ∧ y ∈ A)
  iseqv := ⟨
    (fun _ => Or.inl rfl),
    (by
      intro x y h
      rcases h with h | ⟨hx, hy⟩
      · exact Or.inl h.symm
      · exact Or.inr ⟨hy, hx⟩),
    (by
      intro x y z hxy hyz
      rcases hxy with hxy | ⟨hx, hy⟩
      · subst y
        exact hyz
      · rcases hyz with hyz | ⟨hy', hz⟩
        · subst z
          exact Or.inr ⟨hx, hy⟩
        · exact Or.inr ⟨hx, hz⟩)⟩

/-- The point-set quotient X/A, with quotient (coinduced) topology. -/
abbrev d3CollapseSpace {X : Type*} (A : Set X) :=
  Quotient (d3CollapseSetoid A)

/-- The topological quotient projection. -/
def d3CollapseProjection {X : Type*} [TopologicalSpace X]
    (A : Set X) : C(X, d3CollapseSpace A) where
  toFun := Quotient.mk'
  continuous_toFun := continuous_quotient_mk'

private theorem d3_collapse_respects {X Y : Type*} [TopologicalSpace X]
    [TopologicalSpace Y] (A : Set X) (B : Set Y)
    (f : C(X, Y)) (hA : ∀ x, x ∈ A → f x ∈ B) :
    ∀ x y, (d3CollapseSetoid A).r x y →
      (Quotient.mk' (f x) : d3CollapseSpace B) =
        Quotient.mk' (f y) := by
  intro x y hxy
  apply Quotient.sound
  rcases hxy with h | ⟨hx, hy⟩
  · exact Or.inl (congrArg f h)
  · exact Or.inr ⟨hA x hx, hA y hy⟩

/-- A continuous map of pairs induces an actual continuous map of quotients. -/
def d3CollapseMap {X Y : Type*} [TopologicalSpace X]
    [TopologicalSpace Y] (A : Set X) (B : Set Y)
    (f : C(X, Y)) (hA : ∀ x, x ∈ A → f x ∈ B) :
    C(d3CollapseSpace A, d3CollapseSpace B) where
  toFun := Quotient.lift (fun x => (Quotient.mk' (f x) : d3CollapseSpace B))
    (d3_collapse_respects A B f hA)
  continuous_toFun :=
    (continuous_quotient_mk'.comp f.continuous).quotient_lift
      (d3_collapse_respects A B f hA)

/-- A point-set cofiber includes a *new basepoint*, even when the
domain or image of the attaching map is empty. -/
def d3PointCofiberCollapsed {X Y : Type*} [TopologicalSpace X]
    [TopologicalSpace Y] (f : C(X, Y)) : Set (Y ⊕ PUnit) :=
  fun z => z = Sum.inr PUnit.unit ∨ ∃ x : X, z = Sum.inl (f x)

/-- Ordinary point-set cofiber: (Y ⊔ {*})/(f(X) identified with {*}).
Its topology is the actual quotient topology, not a discrete surrogate. -/
abbrev d3PointCofiber {X Y : Type*} [TopologicalSpace X]
    [TopologicalSpace Y] (f : C(X, Y)) :=
  d3CollapseSpace (d3PointCofiberCollapsed f)

/-- Canonical quotient map Y ⊔ {*} → Cofib(f), continuous by construction. -/
def d3PointCofiberProjection {X Y : Type*} [TopologicalSpace X]
    [TopologicalSpace Y] (f : C(X, Y)) :
    C(Y ⊕ PUnit, d3PointCofiber f) :=
  d3CollapseProjection _

/-- A strict commuting map of arrows induces an honest continuous map
of the ordinary cofibers. The construction uses the WHOLE commutative
square, not four unrelated maps in the homotopy category. -/
def d3PointCofiberMap {X Y W Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace W] [TopologicalSpace Z]
    (f : C(X, Y)) (g : C(W, Z))
    (u : C(X, W)) (v : C(Y, Z))
    (h : ∀ x, v (f x) = g (u x)) :
    C(d3PointCofiber f, d3PointCofiber g) :=
  d3CollapseMap (d3PointCofiberCollapsed f) (d3PointCofiberCollapsed g)
    { toFun := Sum.map v (id : PUnit → PUnit)
      continuous_toFun := v.continuous.sumMap continuous_id }
    (by
      intro z hz
      rcases hz with hs | ⟨x, hx⟩
      · left
        rw [hs]
        rfl
      · right
        refine ⟨u x, ?_⟩
        rw [hx]
        exact congrArg Sum.inl (h x))

/-- The strict Rips two-corner attachment has an actual ordinary
point-set cofiber as a topological quotient. No S¹ equivalence asserted. -/
abbrev d3AttachingPointCofiber {N : ℕ}
    (B C D : d3FiniteComplex N)
    (hBD : B ≤ D) (hCD : C ≤ D) :=
  d3PointCofiber (d3OrdinaryAttachingComparison B C D hBD hCD)

/-- The example from S129 has a genuine quotient topology and basepoint. -/
abbrev d3TwoPointCofiber :=
  d3AttachingPointCofiber d3TwoFirst d3TwoSecond d3TwoEdge
    d3_two_first_le_edge d3_two_second_le_edge

/-- The strict middle-radius complexes are equal at *any* two
radii in (a,b], at every fixed real birth height. -/
theorem d3_middle_complex_constant (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q) (w : Fin N → d2Grade)
    (height : Fin 2 → ℝ) (r t : ℝ)
    (hra : d3LowerRadius N < r) (hrb : r ≤ d3UpperRadius N)
    (hta : d3LowerRadius N < t) (htb : t ≤ d3UpperRadius N) :
    d3RipsComplex N q w (height, r) =
      d3RipsComplex N q w (height, t) := by
  apply d3FiniteComplex.ext
  ext s
  change d3StrictRips N q w height r s ↔
    d3StrictRips N q w height t s
  rw [d3_middle_flag_iff N hN edge hsym q hq w height r hra hrb s]
  rw [d3_middle_flag_iff N hN edge hsym q hq w height t hta htb s]

/-- The endpoint-corrected interior clock exists for every nonnegative
delta with 2delta below the strict open radius gap. -/
theorem d3_interior_radius_sample (a b δ : ℝ)
    (hδ : 0 ≤ δ) (hgap : 2 * δ < b - a) :
    ∃ r : ℝ, a < r ∧ r + δ ≤ r + 2 * δ ∧ r + 2 * δ < b := by
  refine ⟨a + (b - a - 2 * δ) / 2, ?_, ?_, ?_⟩ <;> linarith

end OptionD
