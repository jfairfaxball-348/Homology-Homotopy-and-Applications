module

public import OptionD.MinimalPoints

public section

/-!
# S126: Boolean births and native two-height strict Rips simplices

All constructions work for every finite vertex type `Fin N`. The input
birth labels are literal two-bit vectors; no diagonal-edge, graph-size,
or general-position hypotheses are imposed on these combinatorial lemmas.
-/

namespace OptionD

/-- Literal two-coordinate Boolean birth grades, encoded by `Fin 2` bits. -/
abbrev d2Grade := Fin 2 → Fin 2

/-- Coordinatewise order on Boolean grades. -/
def d2GradeLE (p q : d2Grade) : Prop := ∀ k : Fin 2, p k ≤ q k

/-- Coordinatewise Boolean meet. -/
def d2Meet (p q : d2Grade) : d2Grade := fun k => min (p k) (q k)

theorem d2_grade_refl (p : d2Grade) : d2GradeLE p p := by
  intro k
  exact le_refl _

theorem d2_grade_trans (p q t : d2Grade)
    (hpq : d2GradeLE p q) (hqt : d2GradeLE q t) :
    d2GradeLE p t := by
  intro k
  exact le_trans (hpq k) (hqt k)

theorem d2_grade_meet_iff (a p q : d2Grade) :
    d2GradeLE a (d2Meet p q) ↔
      d2GradeLE a p ∧ d2GradeLE a q := by
  constructor
  · intro h
    exact ⟨(fun k => le_trans (h k) (min_le_left _ _)),
      (fun k => le_trans (h k) (min_le_right _ _))⟩
  · rintro ⟨hp, hq⟩
    intro k
    exact le_min (hp k) (hq k)

/-- Vertices born by grade p, using a genuine finite subset. -/
noncomputable def d2Vertices (N : ℕ) (w : Fin N → d2Grade)
    (p : d2Grade) : Finset (Fin N) := by
  classical
  exact Finset.univ.filter (fun v => d2GradeLE (w v) p)

theorem d2_mem_vertices_iff (N : ℕ) (w : Fin N → d2Grade)
    (p : d2Grade) (v : Fin N) :
    v ∈ d2Vertices N w p ↔ d2GradeLE (w v) p := by
  classical
  simp [d2Vertices]

theorem d2_vertices_mono (N : ℕ) (w : Fin N → d2Grade)
    (p q : d2Grade) (hpq : d2GradeLE p q) :
    d2Vertices N w p ⊆ d2Vertices N w q := by
  intro v hv
  apply (d2_mem_vertices_iff N w q v).mpr
  exact d2_grade_trans (w v) p q
    ((d2_mem_vertices_iff N w p v).mp hv) hpq

theorem d2_vertices_meet (N : ℕ) (w : Fin N → d2Grade)
    (p q : d2Grade) (v : Fin N) :
    v ∈ d2Vertices N w (d2Meet p q) ↔
      v ∈ d2Vertices N w p ∧ v ∈ d2Vertices N w q := by
  rw [d2_mem_vertices_iff, d2_mem_vertices_iff, d2_mem_vertices_iff]
  exact d2_grade_meet_iff (w v) p q

/-- The birth grade of a vertex is its unique least admissible grade. -/
theorem d2_vertex_birth_minimal (N : ℕ) (w : Fin N → d2Grade)
    (v : Fin N) :
    v ∈ d2Vertices N w (w v) ∧
      ∀ p : d2Grade, v ∈ d2Vertices N w p → d2GradeLE (w v) p := by
  constructor
  · exact (d2_mem_vertices_iff N w (w v) v).mpr (d2_grade_refl _)
  · intro p hv
    exact (d2_mem_vertices_iff N w p v).mp hv

/-- A selected graph clique is an induced flag simplex. -/
def d2InducedClique (N : ℕ) (edge : Fin N → Fin N → Prop)
    (w : Fin N → d2Grade) (p : d2Grade)
    (s : Finset (Fin N)) : Prop :=
  (∀ v ∈ s, d2GradeLE (w v) p) ∧ d1IsClique N edge s

/-- The native strict Euclidean Rips predicate with two height coordinates
and one genuine (unsquared) radius. -/
def d2StrictRips (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (p : d2Grade) (r : ℝ)
    (s : Finset (Fin N)) : Prop :=
  (∀ v ∈ s, d2GradeLE (w v) p) ∧
    (∀ i ∈ s, ∀ j ∈ s, i ≠ j → ‖q i - q j‖ < r)

theorem d2_induced_clique_vertices (N : ℕ)
    (edge : Fin N → Fin N → Prop) (w : Fin N → d2Grade)
    (p : d2Grade) (s : Finset (Fin N)) :
    d2InducedClique N edge w p s ↔
      s ⊆ d2Vertices N w p ∧ d1IsClique N edge s := by
  constructor
  · rintro ⟨hv, hc⟩
    exact ⟨(fun v hs => (d2_mem_vertices_iff N w p v).mpr (hv v hs)), hc⟩
  · rintro ⟨hv, hc⟩
    exact ⟨(fun v hs => (d2_mem_vertices_iff N w p v).mp (hv hs)), hc⟩

/-- Native strict Rips equals the induced graph flag at the exact radius one,
for ALL finite simplices, even empty and singleton ones. -/
theorem d2_strict_rips_unit_iff_induced (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (hq : d1HasGramPoints N edge q)
    (w : Fin N → d2Grade) (p : d2Grade)
    (s : Finset (Fin N)) :
    d2StrictRips N q w p 1 s ↔ d2InducedClique N edge w p s := by
  constructor
  · rintro ⟨hv, hr⟩
    exact ⟨hv, (d1_strict_rips_iff_clique N hN edge hsym q hq s).mp
      (d1_strict_rips_of_forall N q s hr)⟩
  · rintro ⟨hv, hc⟩
    exact ⟨hv, d1_strict_rips_forall N q s
      ((d1_strict_rips_iff_clique N hN edge hsym q hq s).mpr hc)⟩

theorem d2_strict_rips_height_mono (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (p t : d2Grade)
    (hpt : d2GradeLE p t) (r : ℝ) (s : Finset (Fin N)) :
    d2StrictRips N q w p r s → d2StrictRips N q w t r s := by
  rintro ⟨hv, hr⟩
  exact ⟨(fun v hs => d2_grade_trans (w v) p t (hv v hs) hpt), hr⟩

theorem d2_strict_rips_radius_mono (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (p : d2Grade)
    (r t : ℝ) (hrt : r ≤ t) (s : Finset (Fin N)) :
    d2StrictRips N q w p r s → d2StrictRips N q w p t s := by
  rintro ⟨hv, hr⟩
  exact ⟨hv, (fun i hi j hj hij => lt_of_lt_of_le (hr i hi j hj hij) hrt)⟩

theorem d2_strict_rips_meet (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (p t : d2Grade)
    (r : ℝ) (s : Finset (Fin N)) :
    d2StrictRips N q w (d2Meet p t) r s ↔
      d2StrictRips N q w p r s ∧ d2StrictRips N q w t r s := by
  constructor
  · rintro ⟨hv, hr⟩
    exact ⟨⟨(fun v hs => ((d2_grade_meet_iff (w v) p t).mp (hv v hs)).1), hr⟩,
      ⟨(fun v hs => ((d2_grade_meet_iff (w v) p t).mp (hv v hs)).2), hr⟩⟩
  · rintro ⟨⟨hvp, hr⟩, ⟨hvt, _⟩⟩
    exact ⟨(fun v hs => (d2_grade_meet_iff (w v) p t).mpr
      ⟨hvp v hs, hvt v hs⟩), hr⟩

theorem d2_strict_rips_faces (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (p : d2Grade) (r : ℝ)
    (s t : Finset (Fin N)) (hst : s ⊆ t) :
    d2StrictRips N q w p r t → d2StrictRips N q w p r s := by
  rintro ⟨hv, hr⟩
  exact ⟨(fun v hs => hv v (hst hs)),
    (fun i hi j hj hij => hr i (hst hi) j (hst hj) hij)⟩

/-- Every symmetric graph has ACTUAL points in R^(N-1), and at every Boolean
grade its native radius-one strict Rips flag equals the selected graph flag. -/
theorem d2_exists_minimal_induced_rips (N : ℕ) (hN : 2 ≤ N)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i)
    (w : Fin N → d2Grade) :
    ∃ q : Fin N → EuclideanSpace ℝ (Fin (N - 1)),
      (∀ i j, ‖q i - q j‖ ^ 2 = d1SquaredDistance N edge i j) ∧
      (∀ p : d2Grade, ∀ s : Finset (Fin N),
        d2StrictRips N q w p 1 s ↔ d2InducedClique N edge w p s) := by
  obtain ⟨q, hq⟩ := d1_exists_minimal_gram_points N hN edge hsym
  exact ⟨q, d1_gram_points_norm_sq N edge hsym q hq,
    (fun p s => d2_strict_rips_unit_iff_induced N hN edge hsym q hq w p s)⟩

end OptionD
