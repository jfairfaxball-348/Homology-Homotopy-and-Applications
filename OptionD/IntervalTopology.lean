module

public import OptionD.TwoVertexTopology
public import Mathlib.Topology.Instances.AddCircle.Defs

public section

/-!
# S135: genuine two-vertex barycentric interval
This module proves coordinate bounds and constructs the explicit affine inverse.
-/

namespace OptionD

theorem d3_two_edge_coordinates (x : d3BarycentricSpace d3TwoEdge) :
    0 ≤ x.val 1 ∧ x.val 1 ≤ 1 ∧ x.val 0 = 1 - x.val 1 := by
  obtain ⟨hpos, hsum, s, hs, hsupport⟩ :=
    (d3_barycentric_carrier_iff d3TwoEdge x.val).mp x.property
  have heq : x.val 0 + x.val 1 = 1 := by
    simpa [Fin.sum_univ_two] using hsum
  refine ⟨hpos 1, ?_, ?_⟩ <;> linarith [hpos 0]

theorem d3_two_edge_coord_ext (x y : d3BarycentricSpace d3TwoEdge)
    (h : x.val 1 = y.val 1) : x = y := by
  apply Subtype.ext
  ext i
  fin_cases i
  · change x.val 0 = y.val 0
    have hx := (d3_two_edge_coordinates x).2.2
    have hy := (d3_two_edge_coordinates y).2.2
    linarith
  · change x.val 1 = y.val 1
    exact h

noncomputable def d3TwoEdgeOfIcc (t : Set.Icc (0 : ℝ) 1) :
    d3BarycentricSpace d3TwoEdge := by
  let v : EuclideanSpace ℝ (Fin 2) :=
    (1 - (t : ℝ)) • d3TwoEndpoint 0 + (t : ℝ) • d3TwoEndpoint 1
  have h0 : v 0 = 1 - (t : ℝ) := by
    simp [v, d3_two_endpoint_00, d3_two_endpoint_10]
  have h1 : v 1 = (t : ℝ) := by
    simp [v, d3_two_endpoint_01, d3_two_endpoint_11]
  refine ⟨v, ?_⟩
  apply (d3_barycentric_carrier_iff d3TwoEdge v).mpr
  refine ⟨?_, ?_, Finset.univ, d3_two_edge_mem _, ?_⟩
  · intro i
    fin_cases i
    · change 0 ≤ v 0
      rw [h0]
      exact sub_nonneg.mpr t.property.2
    · change 0 ≤ v 1
      rw [h1]
      exact t.property.1
  · simp only [Fin.sum_univ_two, h0, h1]
    ring
  · intro i hi
    exact Finset.mem_univ i

noncomputable def d3TwoEdgeToIcc (x : d3BarycentricSpace d3TwoEdge) :
    Set.Icc (0 : ℝ) 1 :=
  ⟨x.val 1, (d3_two_edge_coordinates x).1,
    (d3_two_edge_coordinates x).2.1⟩

theorem d3_two_edge_ofIcc_second (t : Set.Icc (0 : ℝ) 1) :
    (d3TwoEdgeOfIcc t).val 1 = (t : ℝ) := by
  simp [d3TwoEdgeOfIcc, d3_two_endpoint_01, d3_two_endpoint_11]

noncomputable def d3TwoEdgeHomeoIcc :
    d3BarycentricSpace d3TwoEdge ≃ₜ Set.Icc (0 : ℝ) 1 where
  toFun := d3TwoEdgeToIcc
  invFun := d3TwoEdgeOfIcc
  left_inv := by
    intro x
    apply d3_two_edge_coord_ext
    exact d3_two_edge_ofIcc_second _
  right_inv := by
    intro t
    apply Subtype.ext
    exact d3_two_edge_ofIcc_second t
  continuous_toFun := by
    apply Continuous.subtype_mk
    exact (EuclideanSpace.proj (1 : Fin 2)).continuous.comp
      continuous_subtype_val
  continuous_invFun := by
    have ht : Continuous (fun t : Set.Icc (0 : ℝ) 1 => (t : ℝ)) :=
      continuous_subtype_val
    have h0 : Continuous
        (fun t : Set.Icc (0 : ℝ) 1 =>
          (1 - (t : ℝ)) • d3TwoEndpoint 0) :=
      (continuous_const.sub ht).smul continuous_const
    have h1 : Continuous
        (fun t : Set.Icc (0 : ℝ) 1 =>
          (t : ℝ) • d3TwoEndpoint 1) :=
      ht.smul continuous_const
    apply Continuous.subtype_mk
    change Continuous (fun t : Set.Icc (0 : ℝ) 1 =>
      (1 - (t : ℝ)) • d3TwoEndpoint 0 + (t : ℝ) • d3TwoEndpoint 1)
    fun_prop

/-! S136: the actual two-point attaching locus and its existing quotient. -/

/-- A barycentric point in the union of the two singleton corners is
literally one of the two Euclidean endpoints. -/
theorem d3_two_corner_union_second
    (x : d3BarycentricSpace (d3CornerUnion d3TwoFirst d3TwoSecond)) :
    x.val 1 = 0 ∨ x.val 1 = 1 := by
  have hx : x.val ∈ d3BarycentricCarrier d3TwoFirst ∪
      d3BarycentricCarrier d3TwoSecond := by
    rw [← d3_barycentric_union_carrier]
    exact x.property
  rcases hx with hfirst | hsecond
  · exact Or.inl (d3_two_first_coordinates ⟨x.val, hfirst⟩).2
  · exact Or.inr (d3_two_second_coordinates ⟨x.val, hsecond⟩).2

/-- Characterise the image of the ACTUAL ordinary attaching arrow
as the two endpoints of the genuine barycentric terminal interval. -/
theorem d3_two_attaching_image_iff (z : d3BarycentricSpace d3TwoEdge) :
    (∃ x : d3BarycentricSpace (d3CornerUnion d3TwoFirst d3TwoSecond),
        d3OrdinaryAttachingComparison d3TwoFirst d3TwoSecond d3TwoEdge
          d3_two_first_le_edge d3_two_second_le_edge x = z) ↔
      z.val 1 = 0 ∨ z.val 1 = 1 := by
  constructor
  · rintro ⟨x, hx⟩
    have hh : x.val 1 = z.val 1 := by
      have he := congrArg (fun w : d3BarycentricSpace d3TwoEdge => w.val 1) hx
      simpa only [d3_ordinary_attaching_val] using he
    rcases d3_two_corner_union_second x with h0 | h1
    · exact Or.inl (hh ▸ h0)
    · exact Or.inr (hh ▸ h1)
  · intro h
    rcases h with h0 | h1
    · refine ⟨⟨d3TwoEndpoint 0, ?_⟩, ?_⟩
      · rw [d3_barycentric_union_carrier]
        exact Or.inl d3_two_first_endpoint_mem
      · apply d3_two_edge_coord_ext
        rw [d3_ordinary_attaching_val]
        simpa only [d3_two_endpoint_01] using h0.symm
    · refine ⟨⟨d3TwoEndpoint 1, ?_⟩, ?_⟩
      · rw [d3_barycentric_union_carrier]
        exact Or.inr d3_two_second_endpoint_mem
      · apply d3_two_edge_coord_ext
        rw [d3_ordinary_attaching_val]
        simpa only [d3_two_endpoint_11] using h1.symm

/-- Points of the closed interval map into the already-defined genuine
point-set cofiber, with its coinduced quotient topology. -/
noncomputable def d3TwoCofiberAt (t : Set.Icc (0 : ℝ) 1) :
    d3TwoPointCofiber :=
  d3PointCofiberProjection
    (d3OrdinaryAttachingComparison d3TwoFirst d3TwoSecond d3TwoEdge
      d3_two_first_le_edge d3_two_second_le_edge)
    (Sum.inl (d3TwoEdgeOfIcc t))

/-- The new cofiber basepoint, rather than an artificially chosen endpoint. -/
noncomputable def d3TwoCofiberBase : d3TwoPointCofiber :=
  d3PointCofiberProjection
    (d3OrdinaryAttachingComparison d3TwoFirst d3TwoSecond d3TwoEdge
      d3_two_first_le_edge d3_two_second_le_edge)
    (Sum.inr PUnit.unit)

/-- Both actual endpoints become the actual adjoined basepoint in the
existing point-set cofiber quotient. -/
theorem d3_two_cofiber_boundary_base (t : Set.Icc (0 : ℝ) 1)
    (ht : (t : ℝ) = 0 ∨ (t : ℝ) = 1) :
    d3TwoCofiberAt t = d3TwoCofiberBase := by
  have ht' : (d3TwoEdgeOfIcc t).val 1 = 0 ∨
      (d3TwoEdgeOfIcc t).val 1 = 1 := by
    simpa only [d3_two_edge_ofIcc_second] using ht
  obtain ⟨a, ha⟩ := (d3_two_attaching_image_iff (d3TwoEdgeOfIcc t)).mpr ht'
  unfold d3TwoCofiberAt d3TwoCofiberBase
  rw [d3_point_cofiber_projection_mk, d3_point_cofiber_projection_mk]
  apply Quotient.sound
  apply (d3_collapse_rel_iff _ _ _).2
  right
  constructor
  · apply (d3_point_cofiber_collapsed_iff _ _).2
    exact Or.inr ⟨a, congrArg Sum.inl ha.symm⟩
  · apply (d3_point_cofiber_collapsed_iff _ _).2
    exact Or.inl rfl


/-- The fibres of the genuine existing two-point cofiber projection
are exactly singletons in the interval interior and the common
two-endpoint equivalence class.  No substitute quotient is introduced. -/
theorem d3_two_cofiber_fiber_iff
    (s t : Set.Icc (0 : ℝ) 1) :
    d3TwoCofiberAt s = d3TwoCofiberAt t ↔
      s = t ∨
        (((s : ℝ) = 0 ∨ (s : ℝ) = 1) ∧
         ((t : ℝ) = 0 ∨ (t : ℝ) = 1)) := by
  constructor
  · intro h
    unfold d3TwoCofiberAt at h
    rw [d3_point_cofiber_projection_mk, d3_point_cofiber_projection_mk] at h
    rcases (d3_collapse_rel_iff _ _ _).mp (Quotient.exact h) with he | ⟨hs, ht⟩
    · left
      have he' : d3TwoEdgeOfIcc s = d3TwoEdgeOfIcc t := Sum.inl_injective he
      apply Subtype.ext
      calc
        (s : ℝ) = (d3TwoEdgeOfIcc s).val 1 := (d3_two_edge_ofIcc_second s).symm
        _ = (d3TwoEdgeOfIcc t).val 1 :=
          congrArg (fun z : d3BarycentricSpace d3TwoEdge => z.val 1) he'
        _ = (t : ℝ) := d3_two_edge_ofIcc_second t
    · right
      have hs' : ∃ a : d3BarycentricSpace
          (d3CornerUnion d3TwoFirst d3TwoSecond),
          d3OrdinaryAttachingComparison d3TwoFirst d3TwoSecond d3TwoEdge
            d3_two_first_le_edge d3_two_second_le_edge a =
              d3TwoEdgeOfIcc s := by
        rcases (d3_point_cofiber_collapsed_iff _ _).mp hs with he | ⟨a, ha⟩
        · cases he
        · exact ⟨a, (Sum.inl_injective ha).symm⟩
      have ht' : ∃ a : d3BarycentricSpace
          (d3CornerUnion d3TwoFirst d3TwoSecond),
          d3OrdinaryAttachingComparison d3TwoFirst d3TwoSecond d3TwoEdge
            d3_two_first_le_edge d3_two_second_le_edge a =
              d3TwoEdgeOfIcc t := by
        rcases (d3_point_cofiber_collapsed_iff _ _).mp ht with he | ⟨a, ha⟩
        · cases he
        · exact ⟨a, (Sum.inl_injective ha).symm⟩
      constructor
      · simpa only [d3_two_edge_ofIcc_second] using
          (d3_two_attaching_image_iff (d3TwoEdgeOfIcc s)).mp hs'
      · simpa only [d3_two_edge_ofIcc_second] using
          (d3_two_attaching_image_iff (d3TwoEdgeOfIcc t)).mp ht'
  · intro h
    rcases h with h | ⟨hs, ht⟩
    · exact congrArg d3TwoCofiberAt h
    · exact (d3_two_cofiber_boundary_base s hs).trans
        (d3_two_cofiber_boundary_base t ht).symm


/-- The actual interval-to-cofiber quotient map is continuous. -/
theorem d3_two_cofiber_at_continuous : Continuous d3TwoCofiberAt := by
  have hInv : Continuous d3TwoEdgeOfIcc :=
    d3TwoEdgeHomeoIcc.symm.continuous
  have hSum : Continuous (fun t : Set.Icc (0 : ℝ) 1 =>
      (Sum.inl (d3TwoEdgeOfIcc t) :
        d3BarycentricSpace d3TwoEdge ⊕ PUnit)) :=
    continuous_inl.comp hInv
  change Continuous (fun t : Set.Icc (0 : ℝ) 1 =>
    d3PointCofiberProjection
      (d3OrdinaryAttachingComparison d3TwoFirst d3TwoSecond d3TwoEdge
        d3_two_first_le_edge d3_two_second_le_edge)
      (Sum.inl (d3TwoEdgeOfIcc t)))
  exact (d3PointCofiberProjection
    (d3OrdinaryAttachingComparison d3TwoFirst d3TwoSecond d3TwoEdge
      d3_two_first_le_edge d3_two_second_le_edge)).continuous.comp hSum

/-- Every point of the genuine cofiber has an interval representative.
This includes the actual adjoined basepoint, via an endpoint. -/
theorem d3_two_cofiber_at_surjective : Function.Surjective d3TwoCofiberAt := by
  intro q
  refine Quotient.inductionOn q ?_
  intro z
  cases z with
  | inl x =>
    refine ⟨d3TwoEdgeToIcc x, ?_⟩
    have hx : d3TwoEdgeOfIcc (d3TwoEdgeToIcc x) = x :=
      d3TwoEdgeHomeoIcc.left_inv x
    unfold d3TwoCofiberAt
    rw [d3_point_cofiber_projection_mk, hx]
  | inr p =>
    cases p
    let t : Set.Icc (0 : ℝ) 1 := ⟨0, by norm_num, by norm_num⟩
    refine ⟨t, ?_⟩
    rw [d3_two_cofiber_boundary_base t (Or.inl rfl)]
    unfold d3TwoCofiberBase
    rw [d3_point_cofiber_projection_mk]

/-! S137: genuine final topology of the cofiber and pinned circle API. -/

/-- The actual endpoint-to-cofiber map is a topological quotient map.
The extra adjoined point is discrete and already identified with an
interval endpoint, so its presence does not alter the final topology. -/
theorem d3_two_cofiber_at_isQuotientMap :
    Topology.IsQuotientMap d3TwoCofiberAt := by
  let f := d3OrdinaryAttachingComparison d3TwoFirst d3TwoSecond d3TwoEdge
    d3_two_first_le_edge d3_two_second_le_edge
  let p := d3PointCofiberProjection f
  have hcomm (x : d3BarycentricSpace d3TwoEdge) :
      p (Sum.inl x) = d3TwoCofiberAt (d3TwoEdgeToIcc x) := by
    change p (Sum.inl x) =
      p (Sum.inl (d3TwoEdgeOfIcc (d3TwoEdgeToIcc x)))
    have hx : d3TwoEdgeOfIcc (d3TwoEdgeToIcc x) = x :=
      d3TwoEdgeHomeoIcc.left_inv x
    rw [hx]
  refine ⟨Topology.IsCoinducing.of_isOpen_preimage_iff_isOpen (fun U => ?_),
    d3_two_cofiber_at_surjective⟩
  constructor
  · intro h
    have hsub : IsOpen (d3TwoEdgeToIcc ⁻¹' (d3TwoCofiberAt ⁻¹' U)) :=
      h.preimage d3TwoEdgeHomeoIcc.continuous
    have heq : Sum.inl ⁻¹' (p ⁻¹' U) =
        d3TwoEdgeToIcc ⁻¹' (d3TwoCofiberAt ⁻¹' U) := by
      ext x
      simp only [Set.mem_preimage]
      rw [hcomm x]
    have hl : IsOpen (Sum.inl ⁻¹' (p ⁻¹' U)) :=
      heq.symm ▸ hsub
    have hr : IsOpen (Sum.inr ⁻¹' (p ⁻¹' U)) := isOpen_discrete _
    have hp : IsOpen (p ⁻¹' U) := isOpen_sum_iff.mpr ⟨hl, hr⟩
    have hp' : IsOpen
        ((Quotient.mk (d3CollapseSetoid (d3PointCofiberCollapsed f))) ⁻¹' U) := by
      have heq' : (fun z : d3BarycentricSpace d3TwoEdge ⊕ PUnit => p z) =
          Quotient.mk (d3CollapseSetoid (d3PointCofiberCollapsed f)) := by
        funext z
        exact d3_point_cofiber_projection_mk f z
      simpa only [heq'] using hp
    have hquot : Topology.IsQuotientMap (Quotient.mk (d3CollapseSetoid (d3PointCofiberCollapsed f))) :=
      isQuotientMap_quotient_mk'
    exact hquot.isCoinducing.isOpen_preimage.mp hp'
  · intro h
    exact h.preimage d3_two_cofiber_at_continuous

/-- The precise pinned Mathlib endpoint-identified quotient API type-check. -/
noncomputable def d3_two_mathlib_circle_homeo :
    AddCircle (1 : ℝ) ≃ₜ Quot (AddCircle.EndpointIdent (1 : ℝ) (0 : ℝ)) := by
  letI : Fact ((0 : ℝ) < 1) := ⟨by norm_num⟩
  exact AddCircle.homeoIccQuot (1 : ℝ) (0 : ℝ)

/-! The endpoint-identification quotient of the ACTUAL interval domain. -/

/-- The precise two-element endpoint set in the genuine interval. -/
def d3TwoEndSet : Set (Set.Icc (0 : ℝ) 1) :=
  fun t => (t : ℝ) = 0 ∨ (t : ℝ) = 1

/-- The interval modulo exactly the two ends, with its quotient topology. -/
abbrev d3TwoEndQuotient := d3CollapseSpace d3TwoEndSet

/-- Descend the *actual* point-cofiber map to the endpoint interval quotient. -/
noncomputable def d3TwoEndQuotToCofiber :
    d3TwoEndQuotient → d3TwoPointCofiber :=
  Quotient.lift d3TwoCofiberAt (by
    intro s t h
    exact (d3_two_cofiber_fiber_iff s t).mpr
      ((d3_collapse_rel_iff d3TwoEndSet s t).mp h))

theorem d3_two_end_quot_to_cofiber_mk (t : Set.Icc (0 : ℝ) 1) :
    d3TwoEndQuotToCofiber (Quotient.mk (d3CollapseSetoid d3TwoEndSet) t) =
      d3TwoCofiberAt t := rfl

theorem d3_two_end_quot_to_cofiber_continuous :
    Continuous d3TwoEndQuotToCofiber := by
  apply d3_two_cofiber_at_continuous.quotient_lift
  intro s t h
  exact (d3_two_cofiber_fiber_iff s t).mpr
    ((d3_collapse_rel_iff d3TwoEndSet s t).mp h)

theorem d3_two_end_quot_to_cofiber_injective :
    Function.Injective d3TwoEndQuotToCofiber := by
  intro s t h
  refine Quotient.inductionOn₂ s t ?_
  intro x y hxy
  apply Quotient.sound
  exact (d3_collapse_rel_iff d3TwoEndSet x y).mpr
    ((d3_two_cofiber_fiber_iff x y).mp hxy)

theorem d3_two_end_quot_to_cofiber_surjective :
    Function.Surjective d3TwoEndQuotToCofiber := by
  intro z
  obtain ⟨t, ht⟩ := d3_two_cofiber_at_surjective z
  exact ⟨Quotient.mk _ t, ht⟩

theorem d3_two_end_quot_to_cofiber_isQuotientMap :
    Topology.IsQuotientMap d3TwoEndQuotToCofiber := by
  have hp : Topology.IsQuotientMap
      (Quotient.mk' : Set.Icc (0 : ℝ) 1 → d3TwoEndQuotient) :=
    isQuotientMap_quotient_mk'
  have hc : Topology.IsQuotientMap
      (d3TwoEndQuotToCofiber ∘
        (Quotient.mk' : Set.Icc (0 : ℝ) 1 → d3TwoEndQuotient)) := by
    simpa only [Function.comp_def, d3_two_end_quot_to_cofiber_mk] using
      d3_two_cofiber_at_isQuotientMap
  exact hp.of_comp_isQuotientMap hc

/-- The genuine Rips two-point cofiber is homeomorphic to the interval
with just its endpoints identified, not merely in bijection with it. -/
noncomputable def d3TwoCofiberHomeoEndQuotient :
    d3TwoPointCofiber ≃ₜ d3TwoEndQuotient :=
  ((isHomeomorph_iff_isQuotientMap_injective).mpr
    ⟨d3_two_end_quot_to_cofiber_isQuotientMap,
      d3_two_end_quot_to_cofiber_injective⟩).homeomorph.symm

end OptionD
