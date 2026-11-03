module

public import Mathlib

/-!
# A quantitative homotopy-interleaving gap over `𝔽₂[C₄]`

This file is the complete statement of the result, using only Mathlib.

Let `k = 𝔽₂`, let `C₄ = ⟨g ∣ g⁴ = 1⟩`, and let `t = 1 + g ∈ k[C₄]`. In characteristic two,
`k[C₄] ≅ k[t]/(t⁴)`.

**The diagram.** `P` is the periodic free resolution of the trivial module `k`:
`⋯ → k[C₄] --t³--> k[C₄] --t--> k[C₄] → 0`. Here `t³ = 1 + g + g² + g³` is the norm element.
For `s = 0, …, 4`, the stage `X s` is the shifted complex `P[s]`, with `(P[s])ₙ = P_{n-s}`.
The chain map `xMap s : P[s] ⟶ P[s+1]` is a degree-`(-1)` self-map of `P`. In each degree it is
multiplication by `1` or by `t²`.

The real-indexed diagram `F : ℝ ⥤ Ch(k[C₄])` has five stages:
* `F u = 0` for `u < 0`;
* `F u = P[i]` for `i ≤ u < i + 1`, where `i = 0, …, 4`;
* `F u = 0` for `u ≥ 5`.

Each structure map is the composite of the stage maps it crosses. Maps into and out of the zero
stages are zero.

**The three distances to the zero diagram.** All three take values in `[0, ∞]`. An infimum over
an empty set is `∞`.
* `homologyDistance`, written `d_CohI`, is the supremum over all homological degrees `n ∈ ℤ` of
  the interleaving distances between the degree-`n` homology persistence modules. Homology is
  taken as `𝔽₂`-vector spaces.
* `derivedDistance L`, written `d_IHC`, is the interleaving distance in an *arbitrary*
  localisation `L` of the category of whole real diagrams at the objectwise
  quasi-isomorphisms. Translations are lifted to the localisation.
* `homotopyDistance`, written `d_HI`, is the infimum of strict interleaving parameters after
  *arbitrary* finite zigzags of objectwise quasi-isomorphisms of entire real diagrams. Both lanes
  may be replaced, so the zero lane may be replaced by a nonzero acyclic diagram.

**Theorem** (`distance_separation`).
`d_CohI(F, 0) = 1/2 < d_IHC(F, 0) = 1 < 5/4 ≤ d_HI(F, 0) ≤ 5/2`.
The equality `d_IHC(F, 0) = 1` holds in every localisation.
-/

@[expose] public section

namespace C4Separation

open CategoryTheory CategoryTheory.Limits
open scoped ENNReal

noncomputable section

/-! ## The coefficient ring `𝔽₂[C₄]` -/

/-- The group algebra `𝔽₂[C₄]`: the monoid algebra over `𝔽₂ = ZMod 2` of the cyclic group of
order four, written multiplicatively as `Multiplicative (ZMod 4)`. -/
abbrev kC4 := MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))

/-- The generator `g` of `C₄`, as a basis element of `𝔽₂[C₄]`. -/
def g : kC4 := MonoidAlgebra.of (ZMod 2) (Multiplicative (ZMod 4)) (Multiplicative.ofAdd 1)

/-- The element `t = 1 + g`. In characteristic two `t² = 1 + g²`, `t³ = 1 + g + g² + g³` is
the norm element, and `t⁴ = 0`. -/
def t : kC4 := 1 + g

/-- The coefficient of the differential `P_{m+1} ⟶ P_m`, for `m ≥ 0`. It is `t` if `m` is even
and `t³` if `m` is odd. -/
def dCoeff (m : ℕ) : kC4 := if m % 2 = 0 then t else t ^ 3

/-- The coefficient of the stage map in a degree whose target is `P_m`. It is `1` if `m` is even
and `t²` if `m` is odd. -/
def xCoeff (m : ℕ) : kC4 := if m % 2 = 0 then 1 else t ^ 2

/-- Multiplication by `a` on the free module of rank one. -/
def mul (a : kC4) : ModuleCat.of kC4 kC4 ⟶ ModuleCat.of kC4 kC4 :=
  ModuleCat.ofHom
    { toFun := fun x => a * x
      map_add' := mul_add a
      map_smul' := fun c x => mul_left_comm a c x }

/-! ## The five stages `P[s]` and the stage maps -/

/-- The degree-`n` term of `P[s]`. It is `𝔽₂[C₄]` if `s ≤ n` and the zero module otherwise. -/
def stageObj (s n : ℤ) : ModuleCat.{0} kC4 :=
  if s ≤ n then ModuleCat.of kC4 kC4 else ModuleCat.of kC4 PUnit

theorem stageObj_of_le {s n : ℤ} (h : s ≤ n) : stageObj s n = ModuleCat.of kC4 kC4 :=
  ite_eq_left h

/-- The differential `(P[s])_{n+1} ⟶ (P[s])_n`. It is multiplication by `dCoeff (n - s)` if
`s ≤ n` and zero otherwise. -/
def stageD (s n : ℤ) : stageObj s (n + 1) ⟶ stageObj s n :=
  if h : s ≤ n then
    eqToHom (stageObj_of_le (Int.le_add_one h)) ≫ mul (dCoeff (n - s).toNat) ≫
      eqToHom (stageObj_of_le h).symm
  else 0

theorem g_pow_four : g ^ 4 = 1 := by
  rw [g, ← map_pow]
  exact map_one (MonoidAlgebra.of (ZMod 2) (Multiplicative (ZMod 4)))

theorem two_eq_zero : (2 : kC4) = 0 := by
  rw [← map_ofNat (algebraMap (ZMod 2) kC4) 2]
  exact map_zero (algebraMap (ZMod 2) kC4)

theorem t_pow_four : t ^ 4 = 0 := by
  rw [t]
  linear_combination (1 + 2 * g + 3 * g ^ 2 + 2 * g ^ 3) * two_eq_zero + g_pow_four

@[reassoc]
theorem mul_comp_mul (a b : kC4) : mul a ≫ mul b = mul (b * a) :=
  ModuleCat.hom_ext (LinearMap.ext fun x => (mul_assoc b a x).symm)

theorem mul_zero_eq : mul 0 = 0 :=
  ModuleCat.hom_ext (LinearMap.ext fun x => zero_mul x)

theorem dCoeff_mul_dCoeff (m : ℕ) : dCoeff m * dCoeff (m + 1) = 0 := by
  unfold dCoeff
  rcases Nat.mod_two_eq_zero_or_one m with h | h
  · rw [ite_eq_left h, ite_eq_right (by omega), ← pow_succ']
    exact t_pow_four
  · rw [ite_eq_right (by omega), ite_eq_left (by omega), ← pow_succ]
    exact t_pow_four

/-- `d ∘ d = 0` in every `P[s]`. -/
theorem stageD_comp_stageD (s n : ℤ) : stageD s (n + 1) ≫ stageD s n = 0 := by
  by_cases h : s ≤ n
  · have h1 : s ≤ n + 1 := Int.le_add_one h
    have hm : (n + 1 - s).toNat = (n - s).toNat + 1 := by omega
    simp only [stageD, dite_eq_left h, dite_eq_left h1, Category.assoc, eqToHom_trans_assoc,
      eqToHom_refl, Category.id_comp, hm, mul_comp_mul_assoc, dCoeff_mul_dCoeff, mul_zero_eq,
      zero_comp, comp_zero]
  · simp only [stageD, dite_eq_right h, comp_zero]

/-- The stage `P[s]`, a chain complex of `𝔽₂[C₄]`-modules indexed by `ℤ`, with differentials
lowering the degree. -/
def X (s : ℤ) : ChainComplex (ModuleCat.{0} kC4) ℤ :=
  ChainComplex.of (stageObj s) (stageD s) (stageD_comp_stageD s)

/-- The degree-`n` component of the stage map `P[s] ⟶ P[s+1]`. It is multiplication by
`xCoeff (n - (s + 1))` if `s + 1 ≤ n` and zero otherwise. -/
def xComp (s n : ℤ) : stageObj s n ⟶ stageObj (s + 1) n :=
  if h : s + 1 ≤ n then
    eqToHom (stageObj_of_le (Int.le_of_lt h)) ≫ mul (xCoeff (n - (s + 1)).toNat) ≫
      eqToHom (stageObj_of_le h).symm
  else 0

theorem dCoeff_xCoeff (m : ℕ) : dCoeff m * xCoeff (m + 1) = xCoeff m * dCoeff (m + 1) := by
  unfold xCoeff dCoeff
  rcases Nat.mod_two_eq_zero_or_one m with h | h
  · rw [ite_eq_left h, ite_eq_right (by omega), ite_eq_left h, ite_eq_right (by omega)]
    ring
  · rw [ite_eq_right (by omega), ite_eq_left (by omega), ite_eq_right (by omega),
      ite_eq_left (by omega)]
    ring

theorem xComp_stageD (s n : ℤ) :
    xComp s (n + 1) ≫ stageD (s + 1) n = stageD s n ≫ xComp s n := by
  by_cases h : s + 1 ≤ n
  · have h0 : s ≤ n := Int.le_of_lt h
    have h1 : s + 1 ≤ n + 1 := Int.le_add_one h
    have ha : (n + 1 - (s + 1)).toNat = (n - (s + 1)).toNat + 1 := by omega
    have hb : (n - s).toNat = (n - (s + 1)).toNat + 1 := by omega
    simp only [xComp, stageD, dite_eq_left h, dite_eq_left h0, dite_eq_left h1, Category.assoc,
      eqToHom_trans_assoc, eqToHom_refl, Category.id_comp, mul_comp_mul_assoc, ha, hb,
      dCoeff_xCoeff]
  · have hz : IsZero (stageObj (s + 1) n) := by
      rw [stageObj, ite_eq_right h]
      exact ModuleCat.isZero_of_subsingleton _
    exact hz.eq_of_tgt _ _

/-- The stage maps commute with the differentials. -/
theorem xComp_comm (s n : ℤ) :
    xComp s (n + 1) ≫ (X (s + 1)).d (n + 1) n = (X s).d (n + 1) n ≫ xComp s n := by
  have e1 : (X (s + 1)).d (n + 1) n = stageD (s + 1) n := ChainComplex.of_d _ _ n
  have e0 : (X s).d (n + 1) n = stageD s n := ChainComplex.of_d _ _ n
  rw [e1, e0]
  exact xComp_stageD s n

/-- The stage map `P[s] ⟶ P[s+1]`. -/
def xMap (s : ℤ) : X s ⟶ X (s + 1) :=
  ChainComplex.ofHom (xComp s) (xComp_comm s)

/-- The seven objects `0, P[0], …, P[4], 0` with the stage maps and the two zero maps. -/
def stages : ComposableArrows (ChainComplex (ModuleCat.{0} kC4) ℤ) 6 :=
  (ComposableArrows.mk₅ (xMap 0) (xMap 1) (xMap 2) (xMap 3)
    (0 : X 4 ⟶ HomologicalComplex.zero)).precomp (0 : HomologicalComplex.zero ⟶ X 0)

/-- The stage containing a real time `u`, with half-open intervals `[i, i + 1)`. The zero
stages are `u < 0` and `u ≥ 5`. -/
def realStage (u : ℝ) : Fin 7 :=
  if u < 0 then 0 else
  if u < 1 then 1 else
  if u < 2 then 2 else
  if u < 3 then 3 else
  if u < 4 then 4 else
  if u < 5 then 5 else 6

theorem realStage_monotone : Monotone realStage := by
  intro u v huv
  unfold realStage
  split_ifs <;> first | exact le_refl _ | decide | (exfalso; linarith)

/-- The five-stage diagram `F : ℝ ⥤ Ch(𝔽₂[C₄])`. Its structure maps are the composites of the
stage maps. -/
def F : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ := realStage_monotone.functor ⋙ stages

/-- The zero diagram: the zero complex at every real time. -/
def zeroDiagram : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ :=
  (Functor.const ℝ).obj HomologicalComplex.zero

/-! ## Interleavings of real-indexed diagrams -/

/-- Translation `u ↦ u + δ` of the real line, as a functor of the poset `ℝ`. -/
def realTranslation (δ : ℝ) : ℝ ⥤ ℝ :=
  (show Monotone (fun u : ℝ => u + δ) from fun _ _ h => add_le_add h (le_refl δ)).functor

/-- The translate `M^δ = M(· + δ)` of a real-indexed diagram. -/
def translateDiagram {C : Type*} [Category C] (M : ℝ ⥤ C) (δ : ℝ) : ℝ ⥤ C :=
  realTranslation δ ⋙ M

theorem le_two_step (u : ℝ) {ε : ℝ} (hε : 0 ≤ ε) : u ≤ u + ε + ε :=
  le_add_of_le_of_nonneg (le_add_of_nonneg_right hε) hε

/-- A strict `ε`-interleaving of real-indexed diagrams `M` and `N`. It consists of natural maps
`M ⟶ N^ε` and `N ⟶ M^ε` whose composites `M(u) ⟶ M(u + 2ε)` and `N(u) ⟶ N(u + 2ε)` are the
structure maps of `M` and `N`, at every real `u`. -/
structure Interleaving {C : Type*} [Category C] (M N : ℝ ⥤ C) (ε : ℝ) (hε : 0 ≤ ε) where
  forward : M ⟶ translateDiagram N ε
  backward : N ⟶ translateDiagram M ε
  forward_backward : ∀ u : ℝ,
    forward.app u ≫ backward.app (u + ε) = M.map (homOfLE (le_two_step u hε))
  backward_forward : ∀ u : ℝ,
    backward.app u ≫ forward.app (u + ε) = N.map (homOfLE (le_two_step u hε))

/-- The interleaving distance `inf {ε ≥ 0 | M and N are ε-interleaved}` in `[0, ∞]`. -/
def interleavingDistance {C : Type*} [Category C] (M N : ℝ ⥤ C) : ℝ≥0∞ :=
  ⨅ ε ∈ {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (Interleaving M N ε hε)}, ENNReal.ofReal ε

/-! ## `d_CohI`: the homology interleaving distance -/

/-- The degree-`n` homology of a real diagram of complexes, as a persistence module of
`𝔽₂`-vector spaces (restriction of scalars along `𝔽₂ ⟶ 𝔽₂[C₄]`). -/
def homologyPersistence (A : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) (n : ℤ) :
    ℝ ⥤ ModuleCat (ZMod 2) :=
  A ⋙ HomologicalComplex.homologyFunctor (ModuleCat kC4) (ComplexShape.down ℤ) n ⋙
    ModuleCat.restrictScalars (algebraMap (ZMod 2) kC4)

/-- `d_CohI(A, A')`: the supremum over all degrees `n ∈ ℤ` of the interleaving distances of the
homology persistence modules. -/
def homologyDistance (A A' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) : ℝ≥0∞ :=
  ⨆ n : ℤ, interleavingDistance (homologyPersistence A n) (homologyPersistence A' n)

/-! ## `d_IHC`: the interleaving distance in the derived category of real diagrams -/

/-- The objectwise quasi-isomorphisms of entire real diagrams. -/
def objectwiseQuasiIso : MorphismProperty (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) :=
  fun _ _ w => ∀ u : ℝ, QuasiIso (w.app u)

/-- Translation `A ↦ A^δ` of entire real diagrams, as a functor. -/
def translateFunctor (δ : ℝ) :
    (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) ⥤ (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) :=
  (Functor.whiskeringLeft ℝ ℝ (ChainComplex (ModuleCat.{0} kC4) ℤ)).obj (realTranslation δ)

/-- The structure transformation `A ⟶ (A^ε)^ε`, with component `A(u) ⟶ A(u + 2ε)`. -/
def twoShift (A : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) (ε : ℝ) (hε : 0 ≤ ε) :
    A ⟶ translateDiagram (translateDiagram A ε) ε where
  app u := A.map (homOfLE (le_two_step u hε))
  naturality u v f := by
    change A.map f ≫ A.map _ = A.map _ ≫ A.map _
    rw [← A.map_comp, ← A.map_comp]
    rfl

section Localization

universe w' w

variable {D : Type w} [Category.{w'} D] (L : (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) ⥤ D)
  [L.IsLocalization objectwiseQuasiIso]

/-- Translation preserves objectwise quasi-isomorphisms, so `L ∘ translateFunctor δ` inverts
them. -/
theorem translate_inverts (δ : ℝ) :
    objectwiseQuasiIso.IsInvertedBy (translateFunctor δ ⋙ L) :=
  fun _ _ _ hw => Localization.inverts L objectwiseQuasiIso _ (fun u => hw (u + δ))

/-- The translation of the localised category induced by `translateFunctor δ`. -/
def derivedTranslate (δ : ℝ) : D ⥤ D :=
  Localization.lift (translateFunctor δ ⋙ L) (translate_inverts L δ) L

/-- The canonical isomorphism `L ∘ derivedTranslate δ ≅ translateFunctor δ ∘ L`. -/
def derivedTranslateIso (δ : ℝ) : L ⋙ derivedTranslate L δ ≅ translateFunctor δ ⋙ L :=
  Localization.fac (translateFunctor δ ⋙ L) (translate_inverts L δ) L

/-- The translate of a morphism of the localised category between images of diagrams. -/
def derivedTranslateMap (δ : ℝ) {A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ}
    (ψ : L.obj A ⟶ L.obj B) : L.obj (translateDiagram A δ) ⟶ L.obj (translateDiagram B δ) :=
  (derivedTranslateIso L δ).inv.app A ≫ (derivedTranslate L δ).map ψ ≫
    (derivedTranslateIso L δ).hom.app B

/-- An `ε`-interleaving of entire real diagrams in the localisation `L`. -/
structure DerivedInterleaving (A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) (ε : ℝ)
    (hε : 0 ≤ ε) where
  forward : L.obj A ⟶ L.obj (translateDiagram B ε)
  backward : L.obj B ⟶ L.obj (translateDiagram A ε)
  forward_backward : forward ≫ derivedTranslateMap L ε backward = L.map (twoShift A ε hε)
  backward_forward : backward ≫ derivedTranslateMap L ε forward = L.map (twoShift B ε hε)

/-- `d_IHC(A, B)` in the localisation `L`, in `[0, ∞]`. -/
def derivedDistance (A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) : ℝ≥0∞ :=
  ⨅ ε ∈ {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (DerivedInterleaving L A B ε hε)}, ENNReal.ofReal ε

end Localization

/-! ## `d_HI`: the strict homotopy-interleaving distance -/

/-- One zigzag step: a natural transformation of entire real diagrams that is a
quasi-isomorphism at every real time. -/
def ObjectwiseQuasiIsoStep (A A' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) : Prop :=
  ∃ w : A ⟶ A', ∀ u : ℝ, QuasiIso (w.app u)

/-- Arbitrary finite zigzags of objectwise quasi-isomorphisms: the equivalence relation they
generate. -/
def WeakZigzag :
    (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) → (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) → Prop :=
  Relation.EqvGen ObjectwiseQuasiIsoStep

/-- Admissible parameters: strict interleavings after arbitrary zigzag replacements of BOTH
diagrams. -/
def homotopyParameters (A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) : Set ℝ :=
  {ε | ∃ hε : 0 ≤ ε, ∃ A' B' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ,
    WeakZigzag A A' ∧ WeakZigzag B B' ∧ Nonempty (Interleaving A' B' ε hε)}

/-- `d_HI(A, B)`, in `[0, ∞]`. -/
def homotopyDistance (A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) : ℝ≥0∞ :=
  ⨅ ε ∈ homotopyParameters A B, ENNReal.ofReal ε

/-! ## The advertised theorem -/

universe w' w

/-- **The separation theorem.** For the five-stage diagram `F` over `𝔽₂[C₄]` and the zero
diagram, `d_CohI = 1/2 < d_IHC = 1 < 5/4 ≤ d_HI ≤ 5/2`. The equality `d_IHC = 1` holds in every
localisation `L` of the category of whole real diagrams at the objectwise
quasi-isomorphisms. -/
theorem distance_separation {D : Type w} [Category.{w'} D]
    (L : (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) ⥤ D) [L.IsLocalization objectwiseQuasiIso] :
    homologyDistance F zeroDiagram = ENNReal.ofReal (1 / 2) ∧
    derivedDistance L F zeroDiagram = ENNReal.ofReal 1 ∧
    ENNReal.ofReal (5 / 4) ≤ homotopyDistance F zeroDiagram ∧
    homotopyDistance F zeroDiagram ≤ ENNReal.ofReal (5 / 2) ∧
    homologyDistance F zeroDiagram < derivedDistance L F zeroDiagram ∧
    derivedDistance L F zeroDiagram < ENNReal.ofReal (5 / 4) := by
  sorry

end

end C4Separation
