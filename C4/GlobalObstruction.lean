module
public import C4.GlobalDefining

@[expose] public section

namespace C4
open CategoryTheory

/-- Normalize any map between two regular terms, even at different degrees. -/
def regularize {P Q : ModuleCat B}
    (hp : P = ModuleCat.of B B) (hq : Q = ModuleCat.of B B) (f : P ⟶ Q) :
    ModuleCat.of B B ⟶ ModuleCat.of B B :=
  eqToHom hp.symm ≫ f ≫ eqToHom hq

@[simp] theorem regularize_add {P Q : ModuleCat B}
    (hp : P = ModuleCat.of B B) (hq : Q = ModuleCat.of B B) (f g : P ⟶ Q) :
    regularize hp hq (f + g) = regularize hp hq f + regularize hp hq g := by
  simp [regularize, Preadditive.comp_add, Preadditive.add_comp]

@[simp] theorem regularize_zero {P Q : ModuleCat B}
    (hp : P = ModuleCat.of B B) (hq : Q = ModuleCat.of B B) :
    regularize hp hq (0 : P ⟶ Q) = 0 := by simp [regularize]

theorem regularize_comp {P Q R : ModuleCat B}
    (hp : P = ModuleCat.of B B) (hq : Q = ModuleCat.of B B)
    (hr : R = ModuleCat.of B B) (f : P ⟶ Q) (g : Q ⟶ R) :
    regularize hp hr (f ≫ g) = regularize hp hq f ≫ regularize hq hr g := by
  simp [regularize, Category.assoc]

@[simp] theorem regularize_postcast {P Q R : ModuleCat B}
    (hp : P = ModuleCat.of B B) (hq : Q = ModuleCat.of B B)
    (hr : R = ModuleCat.of B B) (h : Q = R) (f : P ⟶ Q) :
    regularize hp hr (f ≫ eqToHom h) = regularize hp hq f := by
  simp [regularize, Category.assoc]

/-- Normalized components do not depend on the spelling of integer indices. -/
theorem regularize_family_congr {X Y : ℤ → ModuleCat B}
    (f : ∀ i j, X i ⟶ Y j) (i i' j j' : ℤ)
    (hi : i = i') (hj : j = j')
    (hxi : X i = ModuleCat.of B B) (hxi' : X i' = ModuleCat.of B B)
    (hyj : Y j = ModuleCat.of B B) (hyj' : Y j' = ModuleCat.of B B) :
    regularize hxi hyj (f i j) = regularize hxi' hyj' (f i' j') := by
  subst i'
  subst j'
  rfl

theorem regularize_map_congr {X Y : ℤ → ModuleCat B}
    (f : ∀ i, X i ⟶ Y i) (i i' : ℤ) (hi : i = i')
    (hxi : X i = ModuleCat.of B B) (hxi' : X i' = ModuleCat.of B B)
    (hyi : Y i = ModuleCat.of B B) (hyi' : Y i' = ModuleCat.of B B) :
    regularize hxi hyi (f i) = regularize hxi' hyi' (f i') := by
  subst i'
  rfl

/-- The normalized genuine differential in every regular degree. -/
theorem regularize_d (s i j : ℤ) (hij : i = j + 1) (hj : s ≤ j) :
    regularize (positiveShiftTerm_is_regular s i (by omega))
      (positiveShiftTerm_is_regular s j hj)
      ((integerShiftResolution s).d i j) =
    regularCoefficientHom (Periodic.d (j - s).toNat) := by
  rw [shiftedDifferential_regular_indices s i j hij hj]
  change eqToHom (integerObject_nonnegative (i - s) (by omega)).symm ≫
    (eqToHom (integerObject_nonnegative (i - s) (by omega)) ≫
      regularCoefficientHom (Periodic.d (j - s).toNat) ≫
      eqToHom (integerObject_nonnegative (j - s) (by omega)).symm) ≫
    eqToHom (integerObject_nonnegative (j - s) (by omega)) = _
  simp [Category.assoc]

/-- Normalize a genuine chain-homotopy equation, retaining independent maps
and the two different intermediate regular objects. -/
theorem regularize_primary
    (s t n : ℤ) (hs : s ≤ n - 1) (ht : t ≤ n)
    {f : integerShiftResolution s ⟶ integerShiftResolution t}
    (h : Homotopy f 0) :
    positiveGlobalComponent s t n (by omega) ht f =
    regularCoefficientHom (Periodic.d (n - 1 - s).toNat) ≫
      regularize (positiveShiftTerm_is_regular s (n - 1) hs)
        (positiveShiftTerm_is_regular t n ht) (h.hom (n - 1) n) +
    regularize (positiveShiftTerm_is_regular s n (by omega))
      (positiveShiftTerm_is_regular t (n + 1) (by omega)) (h.hom n (n + 1)) ≫
        regularCoefficientHom (Periodic.d (n - t).toNat) := by
  have hn : (ComplexShape.down ℤ).Rel n (n - 1) := by change n - 1 + 1 = n; omega
  have hp : (ComplexShape.down ℤ).Rel (n + 1) n := by rfl
  have hh := h.comm n
  rw [dNext_eq h.hom hn, prevD_eq h.hom hp, HomologicalComplex.zero_f, add_zero] at hh
  have hh' := congrArg
    (regularize (positiveShiftTerm_is_regular s n (by omega))
      (positiveShiftTerm_is_regular t n ht)) hh
  rw [regularize_add,
    regularize_comp _ (positiveShiftTerm_is_regular s (n - 1) hs) _,
    regularize_comp _ (positiveShiftTerm_is_regular t (n + 1) (by omega)) _,
    regularize_d s n (n - 1) (by omega) hs,
    regularize_d t (n + 1) n (by omega) ht] at hh'
  exact hh'

/-- Normalize the actual commuting square of any chain map. -/
theorem regularize_chain_comm
    (s t i j : ℤ) (hij : i = j + 1) (hs : s ≤ j) (ht : t ≤ j)
    (f : integerShiftResolution s ⟶ integerShiftResolution t) :
    positiveGlobalComponent s t i (by omega) (by omega) f ≫
      regularCoefficientHom (Periodic.d (j - t).toNat) =
    regularCoefficientHom (Periodic.d (j - s).toNat) ≫
      positiveGlobalComponent s t j hs ht f := by
  have hh := congrArg
    (regularize (positiveShiftTerm_is_regular s i (by omega))
      (positiveShiftTerm_is_regular t j ht)) (f.comm i j)
  rw [regularize_comp _ (positiveShiftTerm_is_regular t i (by omega)) _,
    regularize_comp _ (positiveShiftTerm_is_regular s j hs) _,
    regularize_d t i j hij ht, regularize_d s i j hij hs] at hh
  exact hh

/-- The first two coefficients extracted from an arbitrary global adjacent
map satisfy the genuine cocycle jet equation. -/
theorem global_adjacent_jet (s : ℤ)
    (f : integerShiftResolution s ⟶ integerShiftResolution (s + 1))
    (hu : (regularEval (positiveGlobalComponent s (s + 1) (s + 1)
      (by omega) (by omega) f)).c0 = 1) :
    Adjacent
      (regularEval (positiveGlobalComponent s (s + 1) (s + 1)
        (by omega) (by omega) f))
      (regularEval (positiveGlobalComponent s (s + 1) (s + 2)
        (by omega) (by omega) f)) := by
  refine ⟨hu, ?_⟩
  have hh := regularize_chain_comm s (s + 1) (s + 2) (s + 1)
    (by omega) (by omega) (by omega) f
  have hh' := congrArg regularEval hh
  simp only [regularEval_comp, regularEval_coefficient] at hh'
  have hd₀ : (s + 1 - (s + 1)).toNat = 0 := by omega
  have hd₁ : (s + 1 - s).toNat = 1 := by omega
  norm_num only [hd₀, hd₁, Periodic.d, Nat.reduceMod, ite_true, ite_false] at hh'
  change C4.t * _ + C4.t3 * _ = (0 : B)
  rw [hh', mul_comm C4.t3]
  change -_ + _ = (0 : B)
  exact neg_add_cancel _

/-- Coefficient of an arbitrary map between regular shifted terms. -/
def globalCoefficient (s t i j : ℤ) (hs : s ≤ i) (ht : t ≤ j)
    (f : (integerShiftResolution s).X i ⟶ (integerShiftResolution t).X j) : B :=
  regularEval (regularize (positiveShiftTerm_is_regular s i hs)
    (positiveShiftTerm_is_regular t j ht) f)

namespace GlobalFourfoldDefiningSystem

variable {s : ℤ} (q : GlobalFourfoldDefiningSystem s)

abbrev a1 := globalCoefficient s (s+1) (s+1) (s+1) (by omega) (by omega) (q.x01.f (s+1))
abbrev a2 := globalCoefficient s (s+1) (s+2) (s+2) (by omega) (by omega) (q.x01.f (s+2))
abbrev b1 := globalCoefficient (s+1) (s+2) (s+2) (s+2) (by omega) (by omega) (q.x12.f (s+2))
abbrev c1 := globalCoefficient (s+2) (s+3) (s+3) (s+3) (by omega) (by omega) (q.x23.f (s+3))
abbrev d1 := globalCoefficient (s+3) (s+4) (s+4) (s+4) (by omega) (by omega) (q.x34.f (s+4))
abbrev h1 := globalCoefficient s (s+2) (s+1) (s+2) (by omega) (by omega) (q.h02.hom (s+1) (s+2))
abbrev h2 := globalCoefficient s (s+2) (s+2) (s+3) (by omega) (by omega) (q.h02.hom (s+2) (s+3))
abbrev j1 := globalCoefficient (s+1) (s+3) (s+2) (s+3) (by omega) (by omega) (q.h13.hom (s+2) (s+3))
abbrev m1 := globalCoefficient (s+2) (s+4) (s+3) (s+4) (by omega) (by omega) (q.h24.hom (s+3) (s+4))
abbrev k1 := globalCoefficient s (s+3) (s+1) (s+3) (by omega) (by omega) (q.z03 (s+1) (s+3))
abbrev k2 := globalCoefficient s (s+3) (s+2) (s+4) (by omega) (by omega) (q.z03 (s+2) (s+4))
abbrev l1 := globalCoefficient (s+1) (s+4) (s+2) (s+4) (by omega) (by omega) (q.z14 (s+2) (s+4))

theorem adjacent_window : Adjacent q.a1 q.a2 :=
  global_adjacent_jet s q.x01 q.x01_unit

/-- Extract the primary jet from the actual Mathlib homotopy, with no
identification of the three independently chosen primary fillers. -/
theorem primary_window : Primary q.b1 q.a2 q.h1 q.h2 := by
  have hh := regularize_primary s (s+2) (s+2) (by omega) (by omega) q.h02
  rw [positiveGlobalComponent_comp s (s+1) (s+2) (s+2)
    (by omega) (by omega) (by omega) q.x01 q.x12] at hh
  have he := congrArg regularEval hh
  simp only [regularEval_comp, regularEval_add, regularEval_coefficient] at he
  have hds : (s + 2 - 1 - s).toNat = 1 := by omega
  have hdt : (s + 2 - (s + 2)).toNat = 0 := by omega
  have hi : s+2-1 = s+1 := by omega
  have hj : s+2+1 = s+3 := by omega
  norm_num only [hds, hdt, Periodic.d, Nat.reduceMod, ite_true, ite_false] at he
  have he₁ := congrArg regularEval (regularize_family_congr q.h02.hom
    (s+2-1) (s+1) (s+2) (s+2) hi rfl
    (positiveShiftTerm_is_regular s _ (by omega))
    (positiveShiftTerm_is_regular s _ (by omega))
    (positiveShiftTerm_is_regular (s+2) _ (by omega))
    (positiveShiftTerm_is_regular (s+2) _ (by omega)))
  have he₂ := congrArg regularEval (regularize_family_congr q.h02.hom
    (s+2) (s+2) (s+2+1) (s+3) rfl hj
    (positiveShiftTerm_is_regular s _ (by omega))
    (positiveShiftTerm_is_regular s _ (by omega))
    (positiveShiftTerm_is_regular (s+2) _ (by omega))
    (positiveShiftTerm_is_regular (s+2) _ (by omega)))
  rw [he₁, he₂] at he
  change C4.t * q.h2 + C4.t3 * q.h1 = q.b1 * q.a2
  change q.b1 * q.a2 = q.h1 * C4.t3 + C4.t * q.h2 at he
  simpa only [add_comm, mul_comm] using he.symm

/-- Extract the first secondary jet from global coherence. -/
theorem secondary_window : Secondary q.c1 q.h2 q.j1 q.a2 q.k1 q.k2 := by
  have hh := congrArg
    (regularize (positiveShiftTerm_is_regular s (s+2) (by omega))
      (positiveShiftTerm_is_regular (s+3) (s+2+1) (by omega)))
    (q.z03_coherence (s+2))
  simp only [regularize_add] at hh
  rw [regularize_comp _
    (positiveShiftTerm_is_regular (s+3) (s+2+2) (by omega)) _
    (q.z03 (s+2) (s+2+2)) ((integerShiftResolution (s+3)).d _ _)] at hh
  rw [regularize_postcast _
    (positiveShiftTerm_is_regular (s+3) (s+2-1+2) (by omega)) _ _
    ((integerShiftResolution s).d (s+2) (s+2-1) ≫
      q.z03 (s+2-1) (s+2-1+2))] at hh
  rw [regularize_comp _
    (positiveShiftTerm_is_regular s (s+2-1) (by omega)) _
    ((integerShiftResolution s).d _ _) (q.z03 _ _)] at hh
  rw [regularize_comp _
    (positiveShiftTerm_is_regular (s+2) (s+2+1) (by omega)) _
    (q.h02.hom _ _) (q.x23.f _)] at hh
  rw [regularize_comp _
    (positiveShiftTerm_is_regular (s+1) (s+2) (by omega)) _
    (q.x01.f _) (q.h13.hom _ _)] at hh
  rw [regularize_d (s+3) (s+2+2) (s+2+1) (by omega) (by omega),
    regularize_d s (s+2) (s+2-1) (by omega) (by omega)] at hh
  have he := congrArg regularEval hh
  simp only [regularEval_add, regularEval_comp, regularEval_coefficient] at he
  have heK2 := congrArg regularEval (regularize_family_congr q.z03
    (s+2) (s+2) (s+2+2) (s+4) (by omega) (by omega)
    (positiveShiftTerm_is_regular (s) _ (by omega))
    (positiveShiftTerm_is_regular (s) _ (by omega))
    (positiveShiftTerm_is_regular (s+3) _ (by omega))
    (positiveShiftTerm_is_regular (s+3) _ (by omega)))
  have heK1 := congrArg regularEval (regularize_family_congr q.z03
    (s+2-1) (s+1) (s+2-1+2) (s+3) (by omega) (by omega)
    (positiveShiftTerm_is_regular (s) _ (by omega))
    (positiveShiftTerm_is_regular (s) _ (by omega))
    (positiveShiftTerm_is_regular (s+3) _ (by omega))
    (positiveShiftTerm_is_regular (s+3) _ (by omega)))
  have heH2 := congrArg regularEval (regularize_family_congr q.h02.hom
    (s+2) (s+2) (s+2+1) (s+3) (by omega) (by omega)
    (positiveShiftTerm_is_regular (s) _ (by omega))
    (positiveShiftTerm_is_regular (s) _ (by omega))
    (positiveShiftTerm_is_regular (s+2) _ (by omega))
    (positiveShiftTerm_is_regular (s+2) _ (by omega)))
  have heJ1 := congrArg regularEval (regularize_family_congr q.h13.hom
    (s+2) (s+2) (s+2+1) (s+3) (by omega) (by omega)
    (positiveShiftTerm_is_regular (s+1) _ (by omega))
    (positiveShiftTerm_is_regular (s+1) _ (by omega))
    (positiveShiftTerm_is_regular (s+3) _ (by omega))
    (positiveShiftTerm_is_regular (s+3) _ (by omega)))
  have heC1 := congrArg regularEval (regularize_map_congr q.x23.f
    (s+2+1) (s+3) (by omega)
    (positiveShiftTerm_is_regular (s+2) _ (by omega))
    (positiveShiftTerm_is_regular (s+2) _ (by omega))
    (positiveShiftTerm_is_regular (s+3) _ (by omega))
    (positiveShiftTerm_is_regular (s+3) _ (by omega)))
  rw [heK2, heK1, heH2, heJ1, heC1] at he
  have hdt : (s+2+1-(s+3)).toNat = 0 := by omega
  have hds : (s+2-1-s).toNat = 1 := by omega
  norm_num only [hdt, hds, Periodic.d, Nat.reduceMod, ite_true, ite_false] at he
  change C4.t * q.k2 + C4.t3 * q.k1 = q.c1 * q.h2 + q.j1 * q.a2
  change C4.t * q.k2 + q.k1 * C4.t3 = q.c1 * q.h2 + q.j1 * q.a2 at he
  simpa only [mul_comm] using he

/-- The actual degree-two terminal component of an arbitrary global system. -/
def terminalWindow :
    (integerShiftResolution s).X (s+2) ⟶
      (integerShiftResolution (s+4)).X (s+4) :=
  q.z03 (s+2) (s+4) ≫ q.x34.f (s+4) +
    (q.h02.hom (s+2) (s+3) ≫ q.h24.hom (s+3) (s+4) +
      q.x01.f (s+2) ≫ q.z14 (s+2) (s+4))

/-- The terminal of EVERY genuine global defining system has residue one. -/
theorem terminal_residue :
    (globalCoefficient s (s+4) (s+2) (s+4) (by omega) (by omega)
      q.terminalWindow).c0 = 1 := by
  have ht := independent_terminal_residue
    q.a1 q.a2 q.b1 q.c1 q.d1 q.h1 q.h2 q.j1 q.m1 q.k1 q.k2 q.l1
    q.adjacent_window q.x12_unit q.x23_unit q.x34_unit
    q.primary_window q.secondary_window
  unfold globalCoefficient terminalWindow
  simp only [regularize_add]
  rw [regularize_comp _
    (positiveShiftTerm_is_regular (s+3) (s+4) (by omega)) _
    (q.z03 _ _) (q.x34.f _)]
  rw [regularize_comp _
    (positiveShiftTerm_is_regular (s+2) (s+3) (by omega)) _
    (q.h02.hom _ _) (q.h24.hom _ _)]
  rw [regularize_comp _
    (positiveShiftTerm_is_regular (s+1) (s+2) (by omega)) _
    (q.x01.f _) (q.z14 _ _)]
  simpa only [Terminal, regularEval_add, regularEval_comp,
    a1, a2, b1, c1, d1, h1, h2, j1, m1, k1, k2, l1,
    globalCoefficient, mul_is_truncated_convolution, add_is_coordinate_add] using ht

/-- Every possible degree-three filler has zero boundary residue in the
same actual shifted-complex component. No support or higher equation is
imposed on its two relevant components. -/
theorem boundary_residue_zero
    (f1 : (integerShiftResolution s).X (s+1) ⟶
      (integerShiftResolution (s+4)).X (s+4))
    (f2 : (integerShiftResolution s).X (s+2) ⟶
      (integerShiftResolution (s+4)).X (s+5)) :
    (globalCoefficient s (s+4) (s+2) (s+4) (by omega) (by omega)
      (f2 ≫ (integerShiftResolution (s+4)).d (s+5) (s+4) +
        (integerShiftResolution s).d (s+2) (s+1) ≫ f1)).c0 = 0 := by
  unfold globalCoefficient
  rw [regularize_add,
    regularize_comp _ (positiveShiftTerm_is_regular (s+4) (s+5) (by omega)) _ f2 _,
    regularize_comp _ (positiveShiftTerm_is_regular s (s+1) (by omega)) _ _ f1,
    regularize_d (s+4) (s+5) (s+4) (by omega) (by omega),
    regularize_d s (s+2) (s+1) (by omega) (by omega)]
  have hdt : (s+4-(s+4)).toNat = 0 := by omega
  have hds : (s+1-s).toNat = 1 := by omega
  simp [regularEval_add, regularEval_comp, hdt, hds, Periodic.d,
    mul_is_truncated_convolution, add_is_coordinate_add, C4.mul, C4.add, C4.t, C4.t3]

/-- Universal GLOBAL obstruction: for every global defining system and
any two components of a prospective tertiary filler, the actual terminal
component differs from its differential. This is not a chosen-system or
finite-search assertion. -/
theorem terminal_not_boundary
    (f1 : (integerShiftResolution s).X (s+1) ⟶
      (integerShiftResolution (s+4)).X (s+4))
    (f2 : (integerShiftResolution s).X (s+2) ⟶
      (integerShiftResolution (s+4)).X (s+5)) :
    q.terminalWindow ≠
      (f2 ≫ (integerShiftResolution (s+4)).d (s+5) (s+4) +
        (integerShiftResolution s).d (s+2) (s+1) ≫ f1) := by
  intro he
  have hc := congrArg
    (fun f => (globalCoefficient s (s+4) (s+2) (s+4)
      (by omega) (by omega) f).c0) he
  rw [q.terminal_residue, boundary_residue_zero f1 f2] at hc
  exact one_ne_zero hc

end GlobalFourfoldDefiningSystem

end C4

