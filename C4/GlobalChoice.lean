module
public import C4.ShiftedDG

@[expose] public section

/-!
# C4 arbitrary-choice obstruction on actual positive shifted terms

This bridge transports the S149 arbitrary categorical fourfold obstruction
from the standard regular B-module to any object *equal* to that regular
module, including every positive term of the actual integer-shifted
resolution. It does not claim global dg-Hom admissibility, invariance under
arbitrary homotopy equivalences, or real-indexed metric inequalities.
-/

namespace C4

open CategoryTheory

/-- Coefficient multiplication, transported to a genuine category object
identified with the regular B-module. -/
def transportedCoefficient {P : ModuleCat B}
    (hp : P = ModuleCat.of B B) (b : B) : P ⟶ P :=
  eqToHom hp ≫ regularCoefficientHom b ≫ eqToHom hp.symm

/-- Evaluation at one, after transporting an arbitrary endomorphism of P
back to the actual regular B-module. -/
def transportedEval {P : ModuleCat B}
    (hp : P = ModuleCat.of B B) (f : P ⟶ P) : B :=
  regularEval (eqToHom hp.symm ≫ f ≫ eqToHom hp)

/-- The all-choice local fourfold obstruction is invariant under any
equality of a ModuleCat object with the regular module: no selected x/h/z
coefficients are assumed and all equations are at actual morphism level. -/
theorem transportedAllChoice_terminal_not_boundary
    {P : ModuleCat B} (hp : P = ModuleCat.of B B)
    (a1 a2 b1 c1 h1 h2 j1 j2 k1 k2 l1 f1 f2 : P ⟶ P)
    (ha1 : (transportedEval hp a1).c0 = 1)
    (hb : (transportedEval hp b1).c0 = 1)
    (hc : (transportedEval hp c1).c0 = 1)
    (hA :
      a2 ≫ transportedCoefficient hp C4.t +
      a1 ≫ transportedCoefficient hp C4.t3 = 0)
    (hH :
      h2 ≫ transportedCoefficient hp C4.t +
      h1 ≫ transportedCoefficient hp C4.t3 = a2 ≫ b1)
    (hJ :
      j2 ≫ transportedCoefficient hp C4.t +
      j1 ≫ transportedCoefficient hp C4.t3 = a2 ≫ b1)
    (hK :
      k2 ≫ transportedCoefficient hp C4.t +
      k1 ≫ transportedCoefficient hp C4.t3 =
      h2 ≫ c1 + a2 ≫ j1) :
    (k2 ≫ c1 + (j2 ≫ h1 + a2 ≫ l1)) ≠
      (f2 ≫ transportedCoefficient hp C4.t +
       f1 ≫ transportedCoefficient hp C4.t3) := by
  cases hp
  apply regularAllChoice_terminal_not_boundary
    a1 a2 b1 c1 h1 h2 j1 j2 k1 k2 l1 f1 f2
  · simpa [transportedEval] using ha1
  · simpa [transportedEval] using hb
  · simpa [transportedEval] using hc
  · simpa [transportedCoefficient] using hA
  · simpa [transportedCoefficient] using hH
  · simpa [transportedCoefficient] using hJ
  · simpa [transportedCoefficient] using hK

/-- Every nonnegative shifted term is the genuine regular B-module, and
hence admits the all-choice transport theorem. -/
theorem positiveShiftTerm_is_regular
    (s n : ℤ) (hn : s ≤ n) :
    (integerShiftResolution s).X n = ModuleCat.of B B :=
  integerObject_nonnegative (n - s) (by omega)

/-- An arbitrary categorical defining-system low-degree window on a
genuine positive term of an integer-shifted C4 resolution. All thirteen
variables are unrestricted module morphisms of that actual object; the
four displayed equations are mandatory conditions, not inferred from
the existence of the structure. -/
structure PositiveShiftChoice (s n : ℤ) (hn : s ≤ n) where
  a1 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  a2 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  b1 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  c1 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  h1 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  h2 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  j1 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  j2 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  k1 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  k2 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  l1 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  f1 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  f2 : (integerShiftResolution s).X n ⟶ (integerShiftResolution s).X n
  ha1 : (transportedEval (positiveShiftTerm_is_regular s n hn) a1).c0 = 1
  hb : (transportedEval (positiveShiftTerm_is_regular s n hn) b1).c0 = 1
  hc : (transportedEval (positiveShiftTerm_is_regular s n hn) c1).c0 = 1
  hA :
    a2 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t +
    a1 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t3 = 0
  hH :
    h2 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t +
    h1 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t3 =
      a2 ≫ b1
  hJ :
    j2 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t +
    j1 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t3 =
      a2 ≫ b1
  hK :
    k2 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t +
    k1 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t3 =
      h2 ≫ c1 + a2 ≫ j1

/-- Any such arbitrary low-degree window on an actual positive shifted
term has a fourfold terminal outside the genuine local boundary image. -/
theorem PositiveShiftChoice.terminal_not_boundary
    {s n : ℤ} {hn : s ≤ n} (q : PositiveShiftChoice s n hn) :
    (q.k2 ≫ q.c1 + (q.j2 ≫ q.h1 + q.a2 ≫ q.l1)) ≠
      (q.f2 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t +
       q.f1 ≫ transportedCoefficient (positiveShiftTerm_is_regular s n hn) C4.t3) :=
  transportedAllChoice_terminal_not_boundary
    (positiveShiftTerm_is_regular s n hn)
    q.a1 q.a2 q.b1 q.c1 q.h1 q.h2 q.j1 q.j2 q.k1 q.k2 q.l1 q.f1 q.f2
    q.ha1 q.hb q.hc q.hA q.hH q.hJ q.hK


/-! ### Arbitrary isomorphic regular-module presentations -/

/-- A coefficient endomorphism transported along an arbitrary *categorical
isomorphism*, not only a definitional/equality cast. -/
def isoCoefficient {P : ModuleCat B}
    (e : P ≅ ModuleCat.of B B) (b : B) : P ⟶ P :=
  e.hom ≫ regularCoefficientHom b ≫ e.inv

/-- Transport an arbitrary endomorphism of a regular-module presentation
back to the standard object. -/
def isoConj {P : ModuleCat B}
    (e : P ≅ ModuleCat.of B B) (f : P ⟶ P) :
    ModuleCat.of B B ⟶ ModuleCat.of B B :=
  e.inv ≫ f ≫ e.hom

@[simp]
theorem isoConj_add {P : ModuleCat B}
    (e : P ≅ ModuleCat.of B B) (f g : P ⟶ P) :
    isoConj e (f + g) = isoConj e f + isoConj e g := by
  simp [isoConj, Preadditive.add_comp, Preadditive.comp_add]

@[simp]
theorem isoConj_comp {P : ModuleCat B}
    (e : P ≅ ModuleCat.of B B) (f g : P ⟶ P) :
    isoConj e (f ≫ g) = isoConj e f ≫ isoConj e g := by
  simp [isoConj, Category.assoc]

@[simp]
theorem isoConj_coefficient {P : ModuleCat B}
    (e : P ≅ ModuleCat.of B B) (b : B) :
    isoConj e (isoCoefficient e b) = regularCoefficientHom b := by
  simp [isoConj, isoCoefficient, Category.assoc]

@[simp]
theorem isoConj_zero {P : ModuleCat B}
    (e : P ≅ ModuleCat.of B B) :
    isoConj e 0 = 0 := by
  simp [isoConj]

/-- The arbitrary-choice obstruction survives an *arbitrary isomorphism*
of positive projective terms, which is stronger than literal equality of
their presentation. This does not assert preservation under general
chain-homotopy equivalences or quasi-isomorphism zigzags. -/
theorem isoAllChoice_terminal_not_boundary
    {P : ModuleCat B} (e : P ≅ ModuleCat.of B B)
    (a1 a2 b1 c1 h1 h2 j1 j2 k1 k2 l1 f1 f2 : P ⟶ P)
    (ha1 : (regularEval (isoConj e a1)).c0 = 1)
    (hb : (regularEval (isoConj e b1)).c0 = 1)
    (hc : (regularEval (isoConj e c1)).c0 = 1)
    (hA :
      a2 ≫ isoCoefficient e C4.t +
      a1 ≫ isoCoefficient e C4.t3 = 0)
    (hH :
      h2 ≫ isoCoefficient e C4.t +
      h1 ≫ isoCoefficient e C4.t3 = a2 ≫ b1)
    (hJ :
      j2 ≫ isoCoefficient e C4.t +
      j1 ≫ isoCoefficient e C4.t3 = a2 ≫ b1)
    (hK :
      k2 ≫ isoCoefficient e C4.t +
      k1 ≫ isoCoefficient e C4.t3 =
      h2 ≫ c1 + a2 ≫ j1) :
    (k2 ≫ c1 + (j2 ≫ h1 + a2 ≫ l1)) ≠
      (f2 ≫ isoCoefficient e C4.t +
       f1 ≫ isoCoefficient e C4.t3) := by
  have hA' :
      isoConj e a2 ≫ regularCoefficientHom C4.t +
      isoConj e a1 ≫ regularCoefficientHom C4.t3 = 0 := by
    have hh := congrArg (isoConj e) hA
    simpa only [isoConj_add, isoConj_comp, isoConj_coefficient,
      isoConj_zero] using hh
  have hH' :
      isoConj e h2 ≫ regularCoefficientHom C4.t +
      isoConj e h1 ≫ regularCoefficientHom C4.t3 =
      isoConj e a2 ≫ isoConj e b1 := by
    have hh := congrArg (isoConj e) hH
    simpa only [isoConj_add, isoConj_comp, isoConj_coefficient] using hh
  have hJ' :
      isoConj e j2 ≫ regularCoefficientHom C4.t +
      isoConj e j1 ≫ regularCoefficientHom C4.t3 =
      isoConj e a2 ≫ isoConj e b1 := by
    have hh := congrArg (isoConj e) hJ
    simpa only [isoConj_add, isoConj_comp, isoConj_coefficient] using hh
  have hK' :
      isoConj e k2 ≫ regularCoefficientHom C4.t +
      isoConj e k1 ≫ regularCoefficientHom C4.t3 =
      isoConj e h2 ≫ isoConj e c1 +
      isoConj e a2 ≫ isoConj e j1 := by
    have hh := congrArg (isoConj e) hK
    simpa only [isoConj_add, isoConj_comp, isoConj_coefficient] using hh
  have hne := regularAllChoice_terminal_not_boundary
    (isoConj e a1) (isoConj e a2) (isoConj e b1) (isoConj e c1)
    (isoConj e h1) (isoConj e h2) (isoConj e j1) (isoConj e j2)
    (isoConj e k1) (isoConj e k2) (isoConj e l1)
    (isoConj e f1) (isoConj e f2) ha1 hb hc hA' hH' hJ' hK'
  intro heq
  apply hne
  have hh := congrArg (isoConj e) heq
  simpa only [isoConj_add, isoConj_comp, isoConj_coefficient] using hh


end C4
