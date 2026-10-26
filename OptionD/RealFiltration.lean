module

public import OptionD.BirthGrades

public section

/-!
# S127: genuine real-height, real-radius finite strict Rips filtration

The object is a downward-closed family of *finite vertex sets*, not an
assertion of a topological functor or a homotopy-coherent interleaving.
There are two independent real birth heights and one real unsquared radius.
-/

namespace OptionD

/-- The real height of a Boolean two-bit grade. -/
def d3BooleanHeight (p : d2Grade) : Fin 2 → ℝ :=
  fun k => ((p k).val : ℝ)

/-- Exact two-real-height birth condition for a vertex. -/
def d3Born (N : ℕ) (w : Fin N → d2Grade)
    (h : Fin 2 → ℝ) (v : Fin N) : Prop :=
  ∀ k : Fin 2, ((w v k).val : ℝ) ≤ h k

/-- A native (unsquared) strict Rips simplex, at all real heights and radii. -/
def d3StrictRips (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (h : Fin 2 → ℝ) (r : ℝ)
    (s : Finset (Fin N)) : Prop :=
  (∀ v ∈ s, d3Born N w h v) ∧
    (∀ i ∈ s, ∀ j ∈ s, i ≠ j → ‖q i - q j‖ < r)

/-- The concrete parameter order on R² × R, without hiding any coordinates. -/
def d3ParameterLE (u v : (Fin 2 → ℝ) × ℝ) : Prop :=
  (∀ k : Fin 2, u.1 k ≤ v.1 k) ∧ u.2 ≤ v.2

/-- The actual (set-valued) finite-simplex filtration. -/
def d3SimplexFamily (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (u : (Fin 2 → ℝ) × ℝ) :
    Set (Finset (Fin N)) :=
  fun s => d3StrictRips N q w u.1 u.2 s

theorem d3_born_mono (N : ℕ) (w : Fin N → d2Grade)
    (h t : Fin 2 → ℝ) (hht : ∀ k, h k ≤ t k)
    (v : Fin N) (hv : d3Born N w h v) :
    d3Born N w t v := by
  intro k
  exact le_trans (hv k) (hht k)

theorem d3_faces (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (h : Fin 2 → ℝ) (r : ℝ)
    (s t : Finset (Fin N)) (hst : s ⊆ t)
    (ht : d3StrictRips N q w h r t) :
    d3StrictRips N q w h r s := by
  rcases ht with ⟨hv, hr⟩
  exact ⟨(fun v hs => hv v (hst hs)),
    (fun i hi j hj hij => hr i (hst hi) j (hst hj) hij)⟩

theorem d3_parameter_refl (u : (Fin 2 → ℝ) × ℝ) :
    d3ParameterLE u u := by
  exact ⟨fun _ => le_refl _, le_refl _⟩

theorem d3_parameter_trans (u v t : (Fin 2 → ℝ) × ℝ)
    (huv : d3ParameterLE u v) (hvt : d3ParameterLE v t) :
    d3ParameterLE u t := by
  exact ⟨(fun k => le_trans (huv.1 k) (hvt.1 k)),
    le_trans huv.2 hvt.2⟩

theorem d3_family_mono (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (u v : (Fin 2 → ℝ) × ℝ)
    (huv : d3ParameterLE u v) :
    d3SimplexFamily N q w u ⊆ d3SimplexFamily N q w v := by
  intro s hs
  rcases hs with ⟨hv, hr⟩
  exact ⟨(fun i hi => d3_born_mono N w u.1 v.1 huv.1 i (hv i hi)),
    (fun i hi j hj hij => lt_of_lt_of_le (hr i hi j hj hij) huv.2)⟩

/-- The parameter identity inclusion and composition are literal inclusions. -/
theorem d3_family_id (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (u : (Fin 2 → ℝ) × ℝ) :
    d3SimplexFamily N q w u ⊆ d3SimplexFamily N q w u :=
  d3_family_mono N q w u u (d3_parameter_refl u)

theorem d3_family_comp (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (u v t : (Fin 2 → ℝ) × ℝ)
    (huv : d3ParameterLE u v) (hvt : d3ParameterLE v t) :
    d3SimplexFamily N q w u ⊆ d3SimplexFamily N q w t :=
  d3_family_mono N q w u t (d3_parameter_trans u v t huv hvt)

theorem d3_boolean_birth_iff (N : ℕ) (w : Fin N → d2Grade)
    (p : d2Grade) (v : Fin N) :
    d3Born N w (d3BooleanHeight p) v ↔ d2GradeLE (w v) p := by
  constructor
  · intro h
    apply d2_grade_le_of_forall
    intro k
    have hk := h k
    change ((w v k).val : ℝ) ≤ ((p k).val : ℝ) at hk
    exact_mod_cast hk
  · intro h k
    change ((w v k).val : ℝ) ≤ ((p k).val : ℝ)
    exact_mod_cast d2_grade_le_forall (w v) p h k

/-- Every real Boolean slice agrees with the exact S126 selected flag. -/
theorem d3_boolean_slice (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (p : d2Grade) (r : ℝ)
    (s : Finset (Fin N)) :
    d3StrictRips N q w (d3BooleanHeight p) r s ↔
      d2StrictRips N q w p r s := by
  constructor
  · rintro ⟨hv, hr⟩
    apply d2_strict_rips_of_conditions
    exact ⟨(fun v hs => (d3_boolean_birth_iff N w p v).mp (hv v hs)), hr⟩
  · intro hs
    obtain ⟨hv, hr⟩ := d2_strict_rips_conditions N q w p r s hs
    exact ⟨(fun v hs => (d3_boolean_birth_iff N w p v).mpr (hv v hs)), hr⟩

/-- The two exact critical values of the UNSQUARED metric radius. -/
noncomputable def d3LowerRadius (N : ℕ) : ℝ :=
  Real.sqrt (1 - d1Epsilon N)

noncomputable def d3UpperRadius (N : ℕ) : ℝ :=
  Real.sqrt (1 + d1Epsilon N)

theorem d3_lower_sq (N : ℕ) (hN : 2 ≤ N) :
    d3LowerRadius N ^ 2 = 1 - d1Epsilon N := by
  exact Real.sq_sqrt (by linarith [d1_epsilon_lt_one N hN])

theorem d3_upper_sq (N : ℕ) (hN : 2 ≤ N) :
    d3UpperRadius N ^ 2 = 1 + d1Epsilon N := by
  exact Real.sq_sqrt (by linarith [d1Epsilon_pos N hN])

theorem d3_lower_lt_one (N : ℕ) (hN : 2 ≤ N) :
    d3LowerRadius N < 1 := by
  have hsq := d3_lower_sq N hN
  have hz : 0 ≤ d3LowerRadius N := Real.sqrt_nonneg _
  have hε := d1Epsilon_pos N hN
  nlinarith

theorem d3_one_lt_upper (N : ℕ) (hN : 2 ≤ N) :
    1 < d3UpperRadius N := by
  have hsq := d3_upper_sq N hN
  have hz : 0 ≤ d3UpperRadius N := Real.sqrt_nonneg _
  have hε := d1Epsilon_pos N hN
  nlinarith

theorem d3_lower_lt_upper (N : ℕ) (hN : 2 ≤ N) :
    d3LowerRadius N < d3UpperRadius N :=
  lt_trans (d3_lower_lt_one N hN) (d3_one_lt_upper N hN)

theorem d3_edge_norm (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q) (i j : Fin N)
    (hij : i ≠ j) (he : edge i j) :
    ‖q i - q j‖ = d3LowerRadius N := by
  have hh := d1_gram_points_norm_sq N edge hsym q hq i j
  rw [d1_distance_of_edge N edge i j hij he] at hh
  have hsq := d3_lower_sq N hN
  have hn := norm_nonneg (q i - q j)
  have ha : 0 ≤ d3LowerRadius N := Real.sqrt_nonneg _
  nlinarith

theorem d3_nonedge_norm (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q) (i j : Fin N)
    (hij : i ≠ j) (he : ¬edge i j) :
    ‖q i - q j‖ = d3UpperRadius N := by
  have hh := d1_gram_points_norm_sq N edge hsym q hq i j
  rw [d1_distance_of_nonedge N edge i j hij he] at hh
  have hsq := d3_upper_sq N hN
  have hn := norm_nonneg (q i - q j)
  have hb : 0 ≤ d3UpperRadius N := Real.sqrt_nonneg _
  nlinarith

/-- Every distinct pair has *exactly one* critical radius; in (a,b] the
strict Rips edge predicate equals the graph edge predicate. -/
theorem d3_middle_pair_iff (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q) (i j : Fin N)
    (hij : i ≠ j) (r : ℝ)
    (ha : d3LowerRadius N < r) (hb : r ≤ d3UpperRadius N) :
    ‖q i - q j‖ < r ↔ edge i j := by
  by_cases he : edge i j
  · rw [d3_edge_norm N hN edge hsym q hq i j hij he]
    exact ⟨fun _ => he, fun _ => ha⟩
  · rw [d3_nonedge_norm N hN edge hsym q hq i j hij he]
    exact ⟨(fun h => (not_lt_of_ge hb h).elim), (fun h => (he h).elim)⟩

/-- At the left endpoint, even graph edges are excluded by strict radius. -/
theorem d3_at_lower_no_pairs (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q) (i j : Fin N) (hij : i ≠ j) :
    ¬ ‖q i - q j‖ < d3LowerRadius N := by
  intro hr
  by_cases he : edge i j
  · rw [d3_edge_norm N hN edge hsym q hq i j hij he] at hr
    exact (lt_irrefl _ hr)
  · rw [d3_nonedge_norm N hN edge hsym q hq i j hij he] at hr
    exact (not_lt_of_ge (le_of_lt (d3_lower_lt_upper N hN)) hr)

/-- Just above the right endpoint, every distinct pair is present. -/
theorem d3_above_upper_all_pairs (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q) (i j : Fin N) (hij : i ≠ j)
    (r : ℝ) (hr : d3UpperRadius N < r) :
    ‖q i - q j‖ < r := by
  by_cases he : edge i j
  · rw [d3_edge_norm N hN edge hsym q hq i j hij he]
    exact lt_trans (d3_lower_lt_upper N hN) hr
  · rw [d3_nonedge_norm N hN edge hsym q hq i j hij he]
    exact hr

/-- On every real-height slice, throughout (a,b], all simplices are
exactly the selected graph cliques, including the empty simplex. -/
theorem d3_middle_flag_iff (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q)
    (w : Fin N → d2Grade) (h : Fin 2 → ℝ)
    (r : ℝ) (ha : d3LowerRadius N < r)
    (hb : r ≤ d3UpperRadius N) (s : Finset (Fin N)) :
    d3StrictRips N q w h r s ↔
      (∀ v ∈ s, d3Born N w h v) ∧ d1IsClique N edge s := by
  constructor
  · rintro ⟨hv, hr⟩
    refine ⟨hv, ?_⟩
    apply d1_strict_rips_iff_clique N hN edge hsym q hq s |>.mp
    apply d1_strict_rips_of_forall
    intro i hi j hj hij
    exact (d1_gram_points_norm_lt_one_iff N hN edge hsym q hq i j hij).mpr
      ((d3_middle_pair_iff N hN edge hsym q hq i j hij r ha hb).mp
        (hr i hi j hj hij))
  · rintro ⟨hv, hc⟩
    refine ⟨hv, ?_⟩
    intro i hi j hj hij
    have he := (d1_strict_rips_iff_clique N hN edge hsym q hq s).mpr hc
    have hn := d1_strict_rips_forall N q s he i hi j hj hij
    exact (d3_middle_pair_iff N hN edge hsym q hq i j hij r ha hb).mpr
      ((d1_gram_points_norm_lt_one_iff N hN edge hsym q hq i j hij).mp hn)

/-- The four Boolean grade fibres identify the exact induced flag at
every real r in (a,b], not only at radius one. -/
theorem d3_middle_boolean_iff_induced (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q)
    (w : Fin N → d2Grade) (p : d2Grade)
    (r : ℝ) (ha : d3LowerRadius N < r)
    (hb : r ≤ d3UpperRadius N) (s : Finset (Fin N)) :
    d3StrictRips N q w (d3BooleanHeight p) r s ↔
      d2InducedClique N edge w p s := by
  rw [d3_middle_flag_iff N hN edge hsym q hq w (d3BooleanHeight p) r ha hb s]
  rw [d2_induced_clique_vertices]
  constructor
  · rintro ⟨hv, hc⟩
    exact ⟨(fun v hs => (d2_mem_vertices_iff N w p v).mpr
      ((d3_boolean_birth_iff N w p v).mp (hv v hs))), hc⟩
  · rintro ⟨hv, hc⟩
    exact ⟨(fun v hs => (d3_boolean_birth_iff N w p v).mpr
      ((d2_mem_vertices_iff N w p v).mp (hv hs))), hc⟩

/-- The geometric construction exists uniformly for every symmetric
finite graph and every assignment of simultaneous or distinct births. -/
theorem d3_exists_real_middle_flag (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (w : Fin N → d2Grade) :
    ∃ q : Fin N → EuclideanSpace ℝ (Fin (N - 1)),
      (∀ i j, ‖q i - q j‖ ^ 2 = d1SquaredDistance N edge i j) ∧
      (∀ (h : Fin 2 → ℝ) (r : ℝ),
        d3LowerRadius N < r → r ≤ d3UpperRadius N →
        ∀ s : Finset (Fin N),
          d3StrictRips N q w h r s ↔
            (∀ v ∈ s, d3Born N w h v) ∧ d1IsClique N edge s) := by
  obtain ⟨q, hq⟩ := d1_exists_minimal_gram_points N hN edge hsym
  exact ⟨q, d1_gram_points_norm_sq N edge hsym q hq,
    (fun h r ha hb s => d3_middle_flag_iff N hN edge hsym q hq w h r ha hb s)⟩


/-- The empty simplex survives at every real parameter, including negatives. -/
theorem d3_empty_simplex (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (h : Fin 2 → ℝ) (r : ℝ) :
    d3StrictRips N q w h r ∅ := by
  constructor <;> simp

/-- If either height is negative, no vertex can have been born. -/
theorem d3_no_birth_below_zero (N : ℕ)
    (w : Fin N → d2Grade) (h : Fin 2 → ℝ)
    (k : Fin 2) (hk : h k < 0) (v : Fin N) :
    ¬ d3Born N w h v := by
  intro hv
  have hnonneg : (0 : ℝ) ≤ ((w v k).val : ℝ) := by positivity
  have hborn := hv k
  linarith

/-- Exactly at the left critical radius, strict Rips has no two-point
simplex. Only empty and singleton finite subsets pass the pair condition. -/
theorem d3_lower_flag_iff (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q)
    (w : Fin N → d2Grade) (h : Fin 2 → ℝ)
    (s : Finset (Fin N)) :
    d3StrictRips N q w h (d3LowerRadius N) s ↔
      (∀ v ∈ s, d3Born N w h v) ∧
        (∀ i ∈ s, ∀ j ∈ s, i = j) := by
  constructor
  · rintro ⟨hv, hr⟩
    refine ⟨hv, ?_⟩
    intro i hi j hj
    by_contra hij
    exact d3_at_lower_no_pairs N hN edge hsym q hq i j hij (hr i hi j hj hij)
  · rintro ⟨hv, heq⟩
    refine ⟨hv, ?_⟩
    intro i hi j hj hij
    exact (hij (heq i hi j hj)).elim

/-- At the *closed* right endpoint, nonedges have distance exactly b,
so the strict flag is still precisely the original graph flag. -/
theorem d3_upper_flag_iff (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q)
    (w : Fin N → d2Grade) (h : Fin 2 → ℝ)
    (s : Finset (Fin N)) :
    d3StrictRips N q w h (d3UpperRadius N) s ↔
      (∀ v ∈ s, d3Born N w h v) ∧ d1IsClique N edge s :=
  d3_middle_flag_iff N hN edge hsym q hq w h (d3UpperRadius N)
    (d3_lower_lt_upper N hN) (le_refl _) s

/-- Above b every available finite vertex subset is a simplex, even if
the original graph was empty. -/
theorem d3_above_upper_flag_iff (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q)
    (w : Fin N → d2Grade) (h : Fin 2 → ℝ)
    (r : ℝ) (hr : d3UpperRadius N < r)
    (s : Finset (Fin N)) :
    d3StrictRips N q w h r s ↔ ∀ v ∈ s, d3Born N w h v := by
  constructor
  · exact And.left
  · intro hv
    exact ⟨hv, (fun i hi j hj hij =>
      d3_above_upper_all_pairs N hN edge hsym q hq i j hij r hr)⟩

end OptionD

public section
namespace OptionD

/-- Exported bridge between S127 finite-simplex sets and its strict
Rips predicate, whose definition is opaque after a public import. -/
theorem d3_family_mem_iff (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (u : (Fin 2 → ℝ) × ℝ)
    (s : Finset (Fin N)) :
    s ∈ d3SimplexFamily N q w u ↔
      d3StrictRips N q w u.1 u.2 s := Iff.rfl

/-- Explicit constructor for the all-real product parameter order. -/
theorem d3_parameter_le_of_components (u v : (Fin 2 → ℝ) × ℝ)
    (hh : ∀ k : Fin 2, u.1 k ≤ v.1 k) (hr : u.2 ≤ v.2) :
    d3ParameterLE u v := ⟨hh, hr⟩


/-! S134: Boolean births are stable under an interior real shift. -/

/-- A perturbation by 0 ≤ δ < 1 cannot change an inequality between two bits. -/
theorem d3_bit_shift_iff (a b : Fin 2) (δ : ℝ)
    (hδ : 0 ≤ δ) (hlt : δ < 1) :
    ((a.val : ℝ) ≤ (b.val : ℝ) + δ) ↔ a ≤ b := by
  fin_cases a <;> fin_cases b <;> norm_num <;> linarith

/-- The exact real-height plateau for all vertices, including those born
at zero and at one, is unchanged by the same shift 0 ≤ δ < 1. -/
theorem d3_born_boolean_shift_iff (N : ℕ)
    (w : Fin N → d2Grade) (p : d2Grade) (δ : ℝ)
    (hδ : 0 ≤ δ) (hlt : δ < 1) (v : Fin N) :
    d3Born N w (fun k => ((p k).val : ℝ) + δ) v ↔
      d2GradeLE (w v) p := by
  constructor
  · intro hv
    apply d2_grade_le_of_forall
    intro k
    exact (d3_bit_shift_iff (w v k) (p k) δ hδ hlt).mp (hv k)
  · intro hp k
    exact (d3_bit_shift_iff (w v k) (p k) δ hδ hlt).mpr
      (d2_grade_le_forall (w v) p hp k)

end OptionD
