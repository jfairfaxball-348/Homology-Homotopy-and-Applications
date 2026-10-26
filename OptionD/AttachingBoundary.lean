module

public import OptionD.FiniteComplex

public section

/-!
# S129: the ordinary attaching comparison for a two-height Rips square

The union of the two one-height corners is a genuine subcomplex of the
terminal complex; its barycentric realisation maps continuously to the
terminal realisation. In general this map is NOT a weak equivalence.
This module makes no assertion about a derived homotopy pushout or cone.
-/

namespace OptionD

/-- The ordinary union of two subcomplexes, with the shared faces
counted once. This union need not fill the terminal complex. -/
def d3CornerUnion {N : ℕ}
    (B C : d3FiniteComplex N) : d3FiniteComplex N where
  faces := B.faces ∪ C.faces
  empty_mem := Or.inl B.empty_mem
  downward := by
    intro s t hst ht
    rcases ht with ht | ht
    · exact Or.inl (B.downward hst ht)
    · exact Or.inr (C.downward hst ht)

/-- The literal intersection of two finite simplicial subcomplexes. -/
def d3CornerIntersection {N : ℕ}
    (B C : d3FiniteComplex N) : d3FiniteComplex N where
  faces := B.faces ∩ C.faces
  empty_mem := ⟨B.empty_mem, C.empty_mem⟩
  downward := by
    intro s t hst ht
    exact ⟨B.downward hst ht.1, C.downward hst ht.2⟩

theorem d3_corner_union_mem_iff {N : ℕ}
    (B C : d3FiniteComplex N) (s : Finset (Fin N)) :
    s ∈ (d3CornerUnion B C).faces ↔
      s ∈ B.faces ∨ s ∈ C.faces := Iff.rfl

theorem d3_corner_intersection_mem_iff {N : ℕ}
    (B C : d3FiniteComplex N) (s : Finset (Fin N)) :
    s ∈ (d3CornerIntersection B C).faces ↔
      s ∈ B.faces ∧ s ∈ C.faces := Iff.rfl

/-- Given a commuting square, its ordinary union maps into the
terminal corner by an actual simplicial inclusion. -/
theorem d3_corner_union_le {N : ℕ}
    (B C D : d3FiniteComplex N)
    (hBD : B ≤ D) (hCD : C ≤ D) :
    d3CornerUnion B C ≤ D := by
  intro s hs
  rcases (d3_corner_union_mem_iff B C s).mp hs with hs | hs
  · exact hBD hs
  · exact hCD hs

/-- The underlying continuous map from the ordinary union of corner
realisations to the terminal barycentric Rips realisation. -/
def d3OrdinaryAttachingComparison {N : ℕ}
    (B C D : d3FiniteComplex N)
    (hBD : B ≤ D) (hCD : C ≤ D) :
    C(d3BarycentricSpace (d3CornerUnion B C),
      d3BarycentricSpace D) :=
  d3BarycentricInclusion _ _ (d3_corner_union_le B C D hBD hCD)

/-- At the level of the ambient Euclidean coordinates, realisation
commutes with the union of finite simplicial subcomplexes. -/
theorem d3_barycentric_union_carrier {N : ℕ}
    (B C : d3FiniteComplex N) :
    d3BarycentricCarrier (d3CornerUnion B C) =
      d3BarycentricCarrier B ∪ d3BarycentricCarrier C := by
  ext x
  constructor
  · intro hx
    rcases (d3_barycentric_carrier_iff _ x).mp hx with
      ⟨hpos, hsum, s, hs, hsup⟩
    rcases (d3_corner_union_mem_iff B C s).mp hs with hB | hC
    · exact Or.inl ((d3_barycentric_carrier_iff B x).mpr
        ⟨hpos, hsum, s, hB, hsup⟩)
    · exact Or.inr ((d3_barycentric_carrier_iff C x).mpr
        ⟨hpos, hsum, s, hC, hsup⟩)
  · intro hx
    rcases hx with hx | hx
    · rcases (d3_barycentric_carrier_iff B x).mp hx with
        ⟨hpos, hsum, s, hs, hsup⟩
      exact (d3_barycentric_carrier_iff _ x).mpr
        ⟨hpos, hsum, s,
          (d3_corner_union_mem_iff B C s).mpr (Or.inl hs), hsup⟩
    · rcases (d3_barycentric_carrier_iff C x).mp hx with
        ⟨hpos, hsum, s, hs, hsup⟩
      exact (d3_barycentric_carrier_iff _ x).mpr
        ⟨hpos, hsum, s,
          (d3_corner_union_mem_iff B C s).mpr (Or.inr hs), hsup⟩

/-- A simplex at the terminal vertex which is in neither one-height
corner is exactly the obstruction to union filling the terminal complex. -/
theorem d3_missing_simplex_obstructs_union {N : ℕ}
    (B C D : d3FiniteComplex N) (s : Finset (Fin N))
    (hs : s ∈ D.faces) (hB : s ∉ B.faces) (hC : s ∉ C.faces) :
    d3CornerUnion B C ≠ D := by
  intro heq
  have hu : s ∈ (d3CornerUnion B C).faces := by
    rw [heq]
    exact hs
  rcases (d3_corner_union_mem_iff B C s).mp hu with h | h
  · exact hB h
  · exact hC h

/-- The first single-vertex corner of the two-opposite-birth test. -/
def d3TwoFirst : d3FiniteComplex 2 where
  faces := fun s => s ⊆ ({0} : Finset (Fin 2))
  empty_mem := Finset.empty_subset _
  downward := by
    intro s t hst ht
    exact hst.trans ht

/-- The other single-vertex corner. -/
def d3TwoSecond : d3FiniteComplex 2 where
  faces := fun s => s ⊆ ({1} : Finset (Fin 2))
  empty_mem := Finset.empty_subset _
  downward := by
    intro s t hst ht
    exact hst.trans ht

/-- The terminal edge complex; its geometric realisation is an interval. -/
def d3TwoEdge : d3FiniteComplex 2 where
  faces := Set.univ
  empty_mem := Set.mem_univ _
  downward := by
    intro s t hst ht
    exact Set.mem_univ _

theorem d3_two_first_le_edge : d3TwoFirst ≤ d3TwoEdge := by
  intro s hs
  exact Set.mem_univ _

theorem d3_two_second_le_edge : d3TwoSecond ≤ d3TwoEdge := by
  intro s hs
  exact Set.mem_univ _

/-- The joining edge is not in the two disjoint one-vertex corners.
This is a kernel-level finite-face certificate, NOT a pi_0 or
homotopy-cofiber computation. -/
theorem d3_two_joining_edge_missing :
    ({0, 1} : Finset (Fin 2)) ∉
      (d3CornerUnion d3TwoFirst d3TwoSecond).faces := by
  change ¬(({0, 1} : Finset (Fin 2)) ⊆ ({0} : Finset (Fin 2)) ∨
    ({0, 1} : Finset (Fin 2)) ⊆ ({1} : Finset (Fin 2)))
  decide

theorem d3_two_ordinary_comparison_not_full :
    d3CornerUnion d3TwoFirst d3TwoSecond ≠ d3TwoEdge := by
  intro h
  apply d3_two_joining_edge_missing
  rw [h]
  exact Set.mem_univ _


/-- S131 evaluation of the ordinary attaching inclusion. -/
theorem d3_ordinary_attaching_val {N : ℕ}
    (B C D : d3FiniteComplex N)
    (hB : B ≤ D) (hC : C ≤ D)
    (x : d3BarycentricSpace (d3CornerUnion B C)) :
    ((d3OrdinaryAttachingComparison B C D hB hC) x).val = x.val := by
  exact d3_barycentric_inclusion_val _ _ _ x


/-- Exported face-characterisation of the first singleton corner. -/
theorem d3_two_first_mem_iff (s : Finset (Fin 2)) :
    s ∈ d3TwoFirst.faces ↔ s ⊆ ({0} : Finset (Fin 2)) := Iff.rfl

/-- Exported face-characterisation of the other singleton corner. -/
theorem d3_two_second_mem_iff (s : Finset (Fin 2)) :
    s ∈ d3TwoSecond.faces ↔ s ⊆ ({1} : Finset (Fin 2)) := Iff.rfl

/-- All finite subsets of the terminal two-vertex edge are simplices. -/
theorem d3_two_edge_mem (s : Finset (Fin 2)) : s ∈ d3TwoEdge.faces :=
  Set.mem_univ _

end OptionD
