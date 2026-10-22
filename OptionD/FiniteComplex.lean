module

public import OptionD.RealFiltration
public import Mathlib.CategoryTheory.Category.Preorder
public import Mathlib.Topology.Category.TopCat.Basic

public section

/-!
# S128: finite simplicial complexes and actual topological realisations

Every complex includes the empty face and is closed under taking faces.
The realisation is the standard barycentric subspace of the finite real
coordinate product; its topology is the inherited subspace topology.
The resulting all-real R² × R diagram lands in ordinary TopCat.
No derived cofiber or homotopy-interleaving assertion is made here.
-/

namespace OptionD

open CategoryTheory

/-- A finite abstract simplicial complex on the fixed vertex set Fin N. -/
structure d3FiniteComplex (N : ℕ) where
  faces : Set (Finset (Fin N))
  empty_mem : (∅ : Finset (Fin N)) ∈ faces
  downward : ∀ {s t : Finset (Fin N)}, s ⊆ t → t ∈ faces → s ∈ faces

theorem d3FiniteComplex.ext {N : ℕ} {K L : d3FiniteComplex N}
    (h : K.faces = L.faces) : K = L := by
  cases K with
  | mk f fe fd =>
    cases L with
    | mk g ge gd =>
      dsimp at h
      cases h
      rfl

instance (N : ℕ) : PartialOrder (d3FiniteComplex N) where
  le K L := K.faces ⊆ L.faces
  le_refl _ := Set.Subset.rfl
  le_trans _ _ _ hKL hLM := Set.Subset.trans hKL hLM
  le_antisymm K L hKL hLK :=
    d3FiniteComplex.ext (Set.Subset.antisymm hKL hLK)

/-- The S127 strict Rips simplex predicate packaged as a genuine finite
complex. No topology is built into this definition. -/
def d3RipsComplex (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (u : (Fin 2 → ℝ) × ℝ) :
    d3FiniteComplex N where
  faces := d3SimplexFamily N q w u
  empty_mem := d3_empty_simplex N q w u.1 u.2
  downward := by
    intro s t hst ht
    exact d3_faces N q w u.1 u.2 s t hst ht

theorem d3_rips_complex_faces (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (u : (Fin 2 → ℝ) × ℝ)
    (s : Finset (Fin N)) :
    s ∈ (d3RipsComplex N q w u).faces ↔
      d3StrictRips N q w u.1 u.2 s := Iff.rfl

theorem d3_rips_complex_mono (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade)
    (u v : (Fin 2 → ℝ) × ℝ) (huv : d3ParameterLE u v) :
    d3RipsComplex N q w u ≤ d3RipsComplex N q w v :=
  d3_family_mono N q w u v huv

/-- An honest covariant functor of thin categories on all real parameters.
Objects are finite abstract simplicial complexes, not merely sets. -/
def d3ComplexDiagram (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) :
    ((Fin 2 → ℝ) × ℝ) ⥤ d3FiniteComplex N :=
  (show Monotone (d3RipsComplex N q w) from by
    intro u v huv
    apply d3_rips_complex_mono
    exact ⟨(fun k => huv.1 k), huv.2⟩).functor

/-- A barycentric point: nonnegative real weights summing to one, supported
in at least one face. The existential support avoids a noncomputable
decidable equality test for real coefficients. -/
def d3BarycentricCarrier {N : ℕ} (K : d3FiniteComplex N) :
    Set (Fin N → ℝ) :=
  fun x =>
    (∀ i, 0 ≤ x i) ∧ (∑ i : Fin N, x i) = 1 ∧
      ∃ s : Finset (Fin N), s ∈ K.faces ∧
        ∀ i : Fin N, x i ≠ 0 → i ∈ s

/-- Geometric realisation in the ordinary point-set topology of ℝ^N. -/
def d3BarycentricSpace {N : ℕ} (K : d3FiniteComplex N) :=
  { x : Fin N → ℝ // x ∈ d3BarycentricCarrier K }

/-- Every simplicial inclusion acts as a continuous inclusion on
barycentric realisations, with the *same* ambient coordinate map. -/
def d3BarycentricInclusion {N : ℕ}
    (K L : d3FiniteComplex N) (hKL : K ≤ L) :
    C(d3BarycentricSpace K, d3BarycentricSpace L) where
  toFun := fun x => ⟨x.1, by
    rcases x.2 with ⟨hpos, hsum, s, hs, hsupport⟩
    exact ⟨hpos, hsum, s, hKL hs, hsupport⟩⟩
  continuous_toFun := by
    apply continuous_subtype_mk
    exact continuous_subtype_val

theorem d3_barycentric_inclusion_id {N : ℕ}
    (K : d3FiniteComplex N) :
    d3BarycentricInclusion K K (le_refl K) =
      ContinuousMap.id (d3BarycentricSpace K) := by
  ext x
  rfl

theorem d3_barycentric_inclusion_comp {N : ℕ}
    (K L M : d3FiniteComplex N)
    (hKL : K ≤ L) (hLM : L ≤ M) :
    (d3BarycentricInclusion L M hLM).comp
        (d3BarycentricInclusion K L hKL) =
      d3BarycentricInclusion K M (le_trans hKL hLM) := by
  ext x
  rfl

/-- A functor from finite abstract complexes into ordinary topological
spaces, not an objectwise homotopy-category surrogate. -/
def d3RealisationFunctor (N : ℕ) : d3FiniteComplex N ⥤ TopCat where
  obj K := TopCat.of (d3BarycentricSpace K)
  map f := ⟨d3BarycentricInclusion _ _ (leOfHom f)⟩
  map_id := by
    intro K
    rfl
  map_comp := by
    intro K L M f g
    rfl

/-- The full ordinary topological R³ persistence functor obtained via
finite-complex realisation, for every (possibly negative) real parameter. -/
def d3TopologicalDiagram (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) :
    ((Fin 2 → ℝ) × ℝ) ⥤ TopCat :=
  d3ComplexDiagram N q w ⋙ d3RealisationFunctor N

/-- Literal equality with the S127 simplex predicate at every parameter. -/
theorem d3_topological_faces (N : ℕ)
    (q : Fin N → EuclideanSpace ℝ (Fin (N - 1)))
    (w : Fin N → d2Grade) (u : (Fin 2 → ℝ) × ℝ)
    (s : Finset (Fin N)) :
    s ∈ (d3RipsComplex N q w u).faces ↔
      d3StrictRips N q w u.1 u.2 s :=
  d3_rips_complex_faces N q w u s

/-- Any Boolean square of four comparable finite complex inclusions
commutes STRICTLY as maps of topological spaces. This does not by itself
certify D6 attaching maps or derived cofibers. -/
theorem d3_realisations_square_commutes {N : ℕ}
    (A B C D : d3FiniteComplex N)
    (hAB : A ≤ B) (hAC : A ≤ C) (hBD : B ≤ D) (hCD : C ≤ D) :
    (d3BarycentricInclusion B D hBD).comp
        (d3BarycentricInclusion A B hAB) =
      (d3BarycentricInclusion C D hCD).comp
        (d3BarycentricInclusion A C hAC) := by
  ext x
  rfl

end OptionD
