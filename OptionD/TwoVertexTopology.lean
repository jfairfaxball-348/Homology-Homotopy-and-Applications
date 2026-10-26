module

public import OptionD.ArrowCofiber

public section

/-!
# S133: the genuine empty corner and two endpoint vertices

These statements concern the point-set barycentric realisations.
They are not claims about a homotopy pushout, a circle homeomorphism,
or weak equivalences of R³-filtrations.
-/

namespace OptionD

/-- The empty-face-only two-vertex complex: it has no nonempty simplex. -/
def d3TwoVoid : d3FiniteComplex 2 where
  faces := fun s => s = ∅
  empty_mem := rfl
  downward := by
    intro s t hst ht
    change s = ∅
    change t = ∅ at ht
    subst t
    simpa using hst

/-- Its standard barycentric realisation is genuinely empty, not a point. -/
theorem d3_two_void_isEmpty : IsEmpty (d3BarycentricSpace d3TwoVoid) := by
  constructor
  intro x
  obtain ⟨_, hsum, s, hs, hsupport⟩ :=
    (d3_barycentric_carrier_iff d3TwoVoid x.val).mp x.property
  change s = ∅ at hs
  have hzero : ∀ i : Fin 2, x.val i = 0 := by
    intro i
    by_contra hxi
    have hi := hsupport i hxi
    rw [hs] at hi
    simpa [hs] using hi
  have hzsum : (∑ i : Fin 2, x.val i) = 0 := by
    apply Finset.sum_eq_zero
    intro i hi
    exact hzero i
  linarith

/-- Any point in the first singleton realisation is the first endpoint
in ambient Euclidean coordinates. -/
theorem d3_two_first_coordinates
    (x : d3BarycentricSpace d3TwoFirst) :
    x.val 0 = 1 ∧ x.val 1 = 0 := by
  obtain ⟨_, hsum, s, hs, hsupport⟩ :=
    (d3_barycentric_carrier_iff d3TwoFirst x.val).mp x.property
  have hs' : s ⊆ ({0} : Finset (Fin 2)) :=
    (d3_two_first_mem_iff s).mp hs
  have h1 : x.val 1 = 0 := by
    by_contra h
    have hm : (1 : Fin 2) ∈ ({0} : Finset (Fin 2)) :=
      hs' (hsupport 1 h)
    exact (show (1 : Fin 2) ∉ ({0} : Finset (Fin 2)) by decide) hm
  have hsum2 : x.val 0 + x.val 1 = 1 := by
    simpa [Fin.sum_univ_two] using hsum
  exact ⟨by linarith, h1⟩

/-- Any point in the second singleton realisation is the other endpoint. -/
theorem d3_two_second_coordinates
    (x : d3BarycentricSpace d3TwoSecond) :
    x.val 0 = 0 ∧ x.val 1 = 1 := by
  obtain ⟨_, hsum, s, hs, hsupport⟩ :=
    (d3_barycentric_carrier_iff d3TwoSecond x.val).mp x.property
  have hs' : s ⊆ ({1} : Finset (Fin 2)) :=
    (d3_two_second_mem_iff s).mp hs
  have h0 : x.val 0 = 0 := by
    by_contra h
    have hm : (0 : Fin 2) ∈ ({1} : Finset (Fin 2)) :=
      hs' (hsupport 0 h)
    exact (show (0 : Fin 2) ∉ ({1} : Finset (Fin 2)) by decide) hm
  have hsum2 : x.val 0 + x.val 1 = 1 := by
    simpa [Fin.sum_univ_two] using hsum
  exact ⟨h0, by linarith⟩

/-- The first endpoint realisation contains at most one point. -/
theorem d3_two_first_unique
    (x y : d3BarycentricSpace d3TwoFirst) : x = y := by
  apply Subtype.ext
  ext i
  fin_cases i
  · exact (d3_two_first_coordinates x).1.trans
      (d3_two_first_coordinates y).1.symm
  · exact (d3_two_first_coordinates x).2.trans
      (d3_two_first_coordinates y).2.symm

/-- The second endpoint realisation contains at most one point. -/
theorem d3_two_second_unique
    (x y : d3BarycentricSpace d3TwoSecond) : x = y := by
  apply Subtype.ext
  ext i
  fin_cases i
  · exact (d3_two_second_coordinates x).1.trans
      (d3_two_second_coordinates y).1.symm
  · exact (d3_two_second_coordinates x).2.trans
      (d3_two_second_coordinates y).2.symm

/-! S134: inhabited, geometrically distinct barycentric endpoints. -/

/-- The literal ambient standard basis vector, not an abstract unique point. -/
def d3TwoEndpoint (i : Fin 2) : EuclideanSpace ℝ (Fin 2) :=
  EuclideanSpace.single i 1

/-- The first standard basis vector lies in the first singleton corner. -/
theorem d3_two_first_endpoint_mem :
    d3TwoEndpoint 0 ∈ d3BarycentricCarrier d3TwoFirst := by
  apply (d3_barycentric_carrier_iff d3TwoFirst (d3TwoEndpoint 0)).mpr
  refine ⟨?_, ?_, {0}, (d3_two_first_mem_iff _).mpr (by simp), ?_⟩
  · intro i
    fin_cases i <;> simp [d3TwoEndpoint]
  · simp [Fin.sum_univ_two, d3TwoEndpoint]
  · intro i hi
    fin_cases i <;> simp_all [d3TwoEndpoint]

/-- The second standard basis vector lies in the second singleton corner. -/
theorem d3_two_second_endpoint_mem :
    d3TwoEndpoint 1 ∈ d3BarycentricCarrier d3TwoSecond := by
  apply (d3_barycentric_carrier_iff d3TwoSecond (d3TwoEndpoint 1)).mpr
  refine ⟨?_, ?_, {1}, (d3_two_second_mem_iff _).mpr (by simp), ?_⟩
  · intro i
    fin_cases i <;> simp [d3TwoEndpoint]
  · simp [Fin.sum_univ_two, d3TwoEndpoint]
  · intro i hi
    fin_cases i <;> simp_all [d3TwoEndpoint]

/-- The explicit, inhabited first endpoint. -/
def d3TwoFirstPoint : d3BarycentricSpace d3TwoFirst :=
  ⟨d3TwoEndpoint 0, d3_two_first_endpoint_mem⟩

/-- The explicit, inhabited second endpoint. -/
def d3TwoSecondPoint : d3BarycentricSpace d3TwoSecond :=
  ⟨d3TwoEndpoint 1, d3_two_second_endpoint_mem⟩

theorem d3_two_first_nonempty :
    Nonempty (d3BarycentricSpace d3TwoFirst) :=
  ⟨d3TwoFirstPoint⟩

theorem d3_two_second_nonempty :
    Nonempty (d3BarycentricSpace d3TwoSecond) :=
  ⟨d3TwoSecondPoint⟩

/-- First corner is genuinely a one-point *topological* space. -/
def d3TwoFirstHomeoPUnit : d3BarycentricSpace d3TwoFirst ≃ₜ PUnit where
  toFun := fun _ => PUnit.unit
  invFun := fun _ => d3TwoFirstPoint
  left_inv := fun x => d3_two_first_unique _ _
  right_inv := by intro x; cases x; rfl
  continuous_toFun := continuous_const
  continuous_invFun := continuous_const

/-- Second corner is genuinely a one-point *topological* space. -/
def d3TwoSecondHomeoPUnit : d3BarycentricSpace d3TwoSecond ≃ₜ PUnit where
  toFun := fun _ => PUnit.unit
  invFun := fun _ => d3TwoSecondPoint
  left_inv := fun x => d3_two_second_unique _ _
  right_inv := by intro x; cases x; rfl
  continuous_toFun := continuous_const
  continuous_invFun := continuous_const

/-- The two explicitly constructed endpoints have distinct ambient coordinates. -/
theorem d3_two_endpoints_ne :
    d3TwoEndpoint 0 ≠ d3TwoEndpoint 1 := by
  intro h
  have h0 := congrArg (fun x : EuclideanSpace ℝ (Fin 2) => x 0) h
  simp [d3TwoEndpoint] at h0

end OptionD
