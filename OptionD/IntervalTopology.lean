module

public import OptionD.TwoVertexTopology

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
    simpa only [d3TwoEdgeOfIcc, Pi.add_apply] using h0.add h1

end OptionD
