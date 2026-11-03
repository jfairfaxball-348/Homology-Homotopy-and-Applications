module

public import C4.Palomar.Statement
public import C4.GroupAlgebraDistance
import all C4.GroupAlgebraDistance
import all C4.GroupAlgebra

/-!
# Bridge from the Palomar statement to the certified C4 theorem

`C4.Palomar.Statement` is a verbatim copy of the Mathlib-only definitions in the root
`Challenge.lean`. This module proves that those definitions agree with the certified library:

* the statement diagram `C4Separation.F` is isomorphic to `C4.groupAlgebraDiagram`, and the
  statement zero diagram is isomorphic to `C4.groupAlgebraZeroDiagram`;
* the three statement distances are the library distances, and each library distance is
  unchanged when either argument is replaced by an isomorphic diagram.

`separation` then transfers `C4.c4_distance_separation_groupAlgebra` to the statement.
-/

public section

namespace C4Separation.Bridge

open CategoryTheory CategoryTheory.Limits
open scoped ENNReal

noncomputable section

/-! ## Coefficients -/

/-- The certified presentation `𝔽₂[t]/(t⁴) ≃ 𝔽₂[C₄]`, sending `t` to `1 + g`. -/
abbrev e : C4.B ≃+* kC4 := C4.groupAlgebraEquiv

theorem e_t : e C4.t = t := C4.groupAlgebraEquiv_t

theorem e_t2 : e C4.t2 = t ^ 2 := by
  have h : C4.t2 = C4.t * C4.t := C4.t_sq.symm
  rw [h, map_mul, e_t, sq]

theorem e_t3 : e C4.t3 = t ^ 3 := by
  have h : C4.t3 = C4.t * C4.t2 := C4.t_cube.symm
  rw [h, map_mul, e_t, e_t2, pow_succ' t 2]

theorem e_one : e C4.one = 1 := by
  rw [← C4.one_is_coordinate_one, map_one]

theorem e_d (m : ℕ) : e (C4.Periodic.d m) = dCoeff m := by
  unfold C4.Periodic.d dCoeff
  split_ifs
  · exact e_t
  · exact e_t3

theorem e_x (m : ℕ) : e (C4.Periodic.x m) = xCoeff m := by
  unfold C4.Periodic.x xCoeff
  split_ifs
  · exact e_one
  · exact e_t2

/-! ## Modules -/

/-- Restriction of scalars from `C4.B` to `𝔽₂[C₄]` along the presentation. -/
abbrev Φ : ModuleCat.{0} C4.B ⥤ ModuleCat.{0} kC4 := C4.groupAlgebraModules.functor

/-- The same functor on chain complexes. -/
abbrev Ψ : ChainComplex (ModuleCat.{0} C4.B) ℤ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ :=
  Φ.mapHomologicalComplex (ComplexShape.down ℤ)

/-- The regular `C4.B`-module, viewed over `𝔽₂[C₄]`, is the regular `𝔽₂[C₄]`-module. -/
def regEquiv : Φ.obj (ModuleCat.of C4.B C4.B) ≃ₗ[kC4] kC4 where
  toFun b := e b
  invFun a := e.symm a
  map_add' := map_add e
  map_smul' a b := by
    change e (e.symm a * (show C4.B from b)) = a * e b
    rw [map_mul, RingEquiv.apply_symm_apply]
  left_inv := e.symm_apply_apply
  right_inv := e.apply_symm_apply

def regIso : Φ.obj (ModuleCat.of C4.B C4.B) ≅ ModuleCat.of kC4 kC4 := regEquiv.toModuleIso

@[reassoc]
theorem coeff_square (b : C4.B) :
    Φ.map (C4.regularCoefficientHom b) ≫ regIso.hom = regIso.hom ≫ mul (e b) :=
  ModuleCat.hom_ext (LinearMap.ext fun x => map_mul e b x)

theorem stageObj_isZero {s n : ℤ} (h : ¬ s ≤ n) : IsZero (stageObj s n) := by
  rw [stageObj, ite_eq_right h]
  exact ModuleCat.isZero_of_subsingleton _

/-- Degreewise identification of the shifted resolutions. -/
def objIso (s n : ℤ) : Φ.obj ((C4.integerShiftResolution s).X n) ≅ stageObj s n :=
  if h : s ≤ n then
    eqToIso (congrArg Φ.obj (C4.integerObject_nonnegative (n - s) (by omega))) ≪≫ regIso ≪≫
      eqToIso (stageObj_of_le h).symm
  else
    IsZero.iso (show IsZero (Φ.obj ((C4.integerShiftResolution s).X n)) from
      Φ.map_isZero (C4.integerObject_isZero_negative (n - s) (by omega))) (stageObj_isZero h)

theorem objIso_hom_of_le {s n : ℤ} (h : s ≤ n) :
    (objIso s n).hom =
      eqToHom (congrArg Φ.obj (C4.integerObject_nonnegative (n - s) (by omega))) ≫
        regIso.hom ≫ eqToHom (stageObj_of_le h).symm := by
  rw [objIso, dite_eq_left h]
  rfl

/-! ## Complexes and the stage maps -/

/-- A regular-module square survives transport of all four corners along equalities. -/
theorem cast_square {P Q : ModuleCat.{0} C4.B} {P' Q' : ModuleCat.{0} kC4}
    (hP : P = ModuleCat.of C4.B C4.B) (hQ : Q = ModuleCat.of C4.B C4.B)
    (hP' : P' = ModuleCat.of kC4 kC4) (hQ' : Q' = ModuleCat.of kC4 kC4) (b : C4.B) :
    (eqToHom (congrArg Φ.obj hP) ≫ regIso.hom ≫ eqToHom hP'.symm) ≫
        (eqToHom hP' ≫ mul (e b) ≫ eqToHom hQ'.symm) =
      Φ.map (eqToHom hP ≫ C4.regularCoefficientHom b ≫ eqToHom hQ.symm) ≫
        (eqToHom (congrArg Φ.obj hQ) ≫ regIso.hom ≫ eqToHom hQ'.symm) := by
  subst hP hQ hP' hQ'
  simp [coeff_square]

theorem d_square (s j : ℤ) :
    (objIso s (j + 1)).hom ≫ stageD s j =
      Φ.map ((C4.integerShiftResolution s).d (j + 1) j) ≫ (objIso s j).hom := by
  by_cases h : s ≤ j
  · have h1 : s ≤ j + 1 := Int.le_add_one h
    have hc := cast_square (C4.integerObject_nonnegative (j + 1 - s) (by omega))
      (C4.integerObject_nonnegative (j - s) (by omega)) (stageObj_of_le h1) (stageObj_of_le h)
      (C4.Periodic.d (j - s).toNat)
    rw [e_d] at hc
    rw [C4.shiftedDifferential_regular s j h, objIso_hom_of_le h1, objIso_hom_of_le h]
    simp only [stageD, dite_eq_left h]
    exact hc
  · exact (stageObj_isZero h).eq_of_tgt _ _

/-- The shifted resolution, transported to `𝔽₂[C₄]`, is the statement stage `P[s]`. -/
def shiftIso (s : ℤ) : Ψ.obj (C4.integerShiftResolution s) ≅ X s :=
  HomologicalComplex.Hom.isoOfComponents (fun n => objIso s n) (by
    rintro i j (rfl : j + 1 = i)
    have e0 : (X s).d (j + 1) j = stageD s j := ChainComplex.of_d _ _ j
    rw [e0]
    exact d_square s j)

theorem x_square (s n : ℤ) :
    Φ.map (C4.globalXComponent s n) ≫ (objIso (s + 1) n).hom =
      (objIso s n).hom ≫ xComp s n := by
  by_cases h : s + 1 ≤ n
  · have h0 : s ≤ n := Int.le_of_lt h
    have hc := cast_square (C4.integerObject_nonnegative (n - s) (by omega))
      (C4.integerObject_nonnegative (n - (s + 1)) (by omega)) (stageObj_of_le h0)
      (stageObj_of_le h) (C4.Periodic.x (n - (s + 1)).toNat)
    rw [e_x] at hc
    rw [C4.globalXComponent_regular s n h, objIso_hom_of_le h, objIso_hom_of_le h0]
    simp only [xComp, dite_eq_left h]
    exact hc.symm
  · exact (stageObj_isZero h).eq_of_tgt _ _

theorem xMap_square (s : ℤ) :
    Ψ.map (C4.globalXChainMap s) ≫ (shiftIso (s + 1)).hom = (shiftIso s).hom ≫ xMap s := by
  refine HomologicalComplex.hom_ext _ _ fun n => ?_
  exact x_square s n

/-- The two zero complexes. -/
def zeroIso : Ψ.obj C4.zeroComplex ≅ HomologicalComplex.zero :=
  IsZero.iso (Ψ.map_isZero HomologicalComplex.isZero_zero) HomologicalComplex.isZero_zero

/-- Objectwise identification of the seven stages. -/
def stagesApp : ∀ k : Fin 7, (C4.c4Stages ⋙ Ψ).obj k ≅ stages.obj k
  | ⟨0, _⟩ => zeroIso
  | ⟨1, _⟩ => shiftIso 0
  | ⟨2, _⟩ => shiftIso 1
  | ⟨3, _⟩ => shiftIso 2
  | ⟨4, _⟩ => shiftIso 3
  | ⟨5, _⟩ => shiftIso 4
  | ⟨6, _⟩ => zeroIso

/-- The transported library stages are the statement stages. -/
def stagesIso : C4.c4Stages ⋙ Ψ ≅ stages :=
  ComposableArrows.isoMk stagesApp (by
    intro i hi
    interval_cases i
    · exact (Ψ.map_isZero HomologicalComplex.isZero_zero).eq_of_src _ _
    · exact xMap_square 0
    · change Ψ.map (C4.canonicalX12 0) ≫ (shiftIso 2).hom = (shiftIso 1).hom ≫ xMap 1
      simp only [C4.canonicalX12, Functor.map_comp, eqToHom_map, Category.assoc]
      simpa using xMap_square 1
    · change Ψ.map (C4.canonicalX23 0) ≫ (shiftIso 3).hom = (shiftIso 2).hom ≫ xMap 2
      simp only [C4.canonicalX23, Functor.map_comp, eqToHom_map, Category.assoc]
      simpa using xMap_square 2
    · change Ψ.map (C4.canonicalX34 0) ≫ (shiftIso 4).hom = (shiftIso 3).hom ≫ xMap 3
      simp only [C4.canonicalX34, Functor.map_comp, eqToHom_map, Category.assoc]
      simpa using xMap_square 3
    · exact HomologicalComplex.isZero_zero.eq_of_tgt _ _)

/-- The statement diagram is the certified group-algebra diagram. -/
def diagramIso : C4.groupAlgebraDiagram ≅ F :=
  Functor.isoWhiskerLeft C4.realStage_monotone.functor stagesIso

/-- The statement zero diagram is the certified zero diagram over the group algebra. -/
def zeroDiagramIso : C4.groupAlgebraZeroDiagram ≅ zeroDiagram :=
  NatIso.ofComponents
    (fun u => (C4.groupAlgebraZeroDiagram_isZero u).iso HomologicalComplex.isZero_zero)
    (fun _ => (C4.groupAlgebraZeroDiagram_isZero _).eq_of_src _ _)

end

/-! ## The statement distances are the library distances -/

theorem interleavingDistance_eq {C : Type*} [Category C] (M N : ℝ ⥤ C) :
    interleavingDistance M N = C4.persistenceInterleavingDistance M N := by
  have h : {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (Interleaving M N ε hε)} =
      {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (C4.PersistenceInterleaving M N ε hε)} := by
    ext ε
    exact exists_congr fun hε =>
      ⟨fun ⟨I⟩ => ⟨⟨I.forward, I.backward, I.forward_backward, I.backward_forward⟩⟩,
        fun ⟨I⟩ => ⟨⟨I.forward, I.backward, I.forward_backward, I.backward_forward⟩⟩⟩
  unfold interleavingDistance C4.persistenceInterleavingDistance
  rw [h]

theorem homologyDistance_eq (A A' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) :
    homologyDistance A A' = C4.homologyInterleavingDistanceOver C4.groupAlgebraScalar A A' := by
  unfold homologyDistance C4.homologyInterleavingDistanceOver
  exact iSup_congr fun n => interleavingDistance_eq _ _

theorem homotopyParameters_eq (A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) :
    homotopyParameters A B = C4.homotopyInterleavingParameters A B := by
  ext ε
  exact exists_congr fun hε => exists_congr fun A' => exists_congr fun B' =>
    and_congr Iff.rfl (and_congr Iff.rfl
      ⟨fun ⟨I⟩ => ⟨⟨I.forward, I.backward, I.forward_backward, I.backward_forward⟩⟩,
        fun ⟨I⟩ => ⟨⟨I.forward, I.backward, I.forward_backward, I.backward_forward⟩⟩⟩)

theorem homotopyDistance_eq (A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) :
    homotopyDistance A B = C4.homotopyInterleavingDistance A B := by
  unfold homotopyDistance C4.homotopyInterleavingDistance
  rw [homotopyParameters_eq]

section Derived

universe w' w

variable {D : Type w} [Category.{w'} D] (L : (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) ⥤ D)

theorem derivedDistance_eq [L.IsLocalization objectwiseQuasiIso]
    (A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) :
    letI : L.IsLocalization (C4.objectwiseQuasiIsoOver kC4) := ‹_›
    derivedDistance L A B = C4.derivedInterleavingDistance L A B := by
  let _ : L.IsLocalization (C4.objectwiseQuasiIsoOver kC4) := ‹_›
  have h : {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (DerivedInterleaving L A B ε hε)} =
      {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (C4.DerivedRealInterleaving L A B ε hε)} := by
    ext ε
    exact exists_congr fun hε =>
      ⟨fun ⟨I⟩ => ⟨⟨I.forward, I.backward, I.forward_backward, I.backward_forward⟩⟩,
        fun ⟨I⟩ => ⟨⟨I.forward, I.backward, I.forward_backward, I.backward_forward⟩⟩⟩
  unfold derivedDistance C4.derivedInterleavingDistance
  rw [h]

variable [L.IsLocalization (C4.objectwiseQuasiIsoOver kC4)]

theorem derivedTranslateMap_comp (δ : ℝ) {A B C : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ}
    (ψ : L.obj A ⟶ L.obj B) (φ : L.obj B ⟶ L.obj C) :
    C4.derivedTranslateMap L δ (ψ ≫ φ) =
      C4.derivedTranslateMap L δ ψ ≫ C4.derivedTranslateMap L δ φ := by
  have h := Iso.homCongr_comp ((C4.derivedTranslateIso L δ).app A)
    ((C4.derivedTranslateIso L δ).app B) ((C4.derivedTranslateIso L δ).app C)
    ((C4.derivedTranslate L δ).map ψ) ((C4.derivedTranslate L δ).map φ)
  rw [← (C4.derivedTranslate L δ).map_comp] at h
  exact h

/-- Translation of a morphism of diagrams, typed with `C4.translateDiagram`. -/
noncomputable def tmap (ε : ℝ) {A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ} (f : A ⟶ B) :
    C4.translateDiagram A ε ⟶ C4.translateDiagram B ε :=
  (C4.translateFunctor ε).map f

theorem tmap_hom_inv (ε : ℝ) {A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ} (e : A ≅ B) :
    tmap ε e.hom ≫ tmap ε e.inv = 𝟙 _ := by
  refine NatTrans.ext (funext fun u => ?_)
  change e.hom.app _ ≫ e.inv.app _ = 𝟙 _
  exact e.hom_inv_id_app _

theorem dtm_map (ε : ℝ) {A B : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ} (f : A ⟶ B) :
    C4.derivedTranslateMap L ε (L.map f) = L.map (tmap ε f) :=
  C4.derivedTranslateMap_map L ε f

theorem twoShift_naturality {A A' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ} (f : A ⟶ A')
    (ε : ℝ) (hε : 0 ≤ ε) :
    C4.twoShift A ε hε ≫ tmap ε (tmap ε f) = f ≫ C4.twoShift A' ε hε := by
  refine NatTrans.ext (funext fun u => ?_)
  change A.map _ ≫ f.app _ = f.app u ≫ A'.map _
  exact f.naturality _

/-- Derived interleavings transfer along isomorphisms of both diagrams. -/
noncomputable def derivedTransfer {A A' B B' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ} (eA : A ≅ A')
    (eB : B ≅ B') {ε : ℝ} {hε : 0 ≤ ε} (I : C4.DerivedRealInterleaving L A B ε hε) :
    C4.DerivedRealInterleaving L A' B' ε hε where
  forward := L.map eA.inv ≫ I.forward ≫ L.map (tmap ε eB.hom)
  backward := L.map eB.inv ≫ I.backward ≫ L.map (tmap ε eA.hom)
  forward_backward := by
    rw [derivedTranslateMap_comp, derivedTranslateMap_comp, dtm_map, dtm_map, Category.assoc,
      Category.assoc, ← L.map_comp_assoc, tmap_hom_inv, L.map_id, Category.id_comp,
      reassoc_of% I.forward_backward, ← L.map_comp, ← L.map_comp, twoShift_naturality,
      Iso.inv_hom_id_assoc]
  backward_forward := by
    rw [derivedTranslateMap_comp, derivedTranslateMap_comp, dtm_map, dtm_map, Category.assoc,
      Category.assoc, ← L.map_comp_assoc, tmap_hom_inv, L.map_id, Category.id_comp,
      reassoc_of% I.backward_forward, ← L.map_comp, ← L.map_comp, twoShift_naturality,
      Iso.inv_hom_id_assoc]

theorem derived_congr {A A' B B' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ} (eA : A ≅ A')
    (eB : B ≅ B') :
    C4.derivedInterleavingDistance L A B = C4.derivedInterleavingDistance L A' B' := by
  have h : {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (C4.DerivedRealInterleaving L A B ε hε)} =
      {ε : ℝ | ∃ hε : 0 ≤ ε, Nonempty (C4.DerivedRealInterleaving L A' B' ε hε)} := by
    ext ε
    exact exists_congr fun hε =>
      ⟨fun ⟨I⟩ => ⟨derivedTransfer L eA eB I⟩, fun ⟨I⟩ => ⟨derivedTransfer L eA.symm eB.symm I⟩⟩
  unfold C4.derivedInterleavingDistance
  rw [h]

end Derived

/-! ## The library distances are invariant under isomorphisms -/

theorem homology_congr {A₁ A₂ Z₁ Z₂ : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ}
    (eA : A₁ ≅ A₂) (eZ : Z₁ ≅ Z₂) (hZ : ∀ u, IsZero (Z₂.obj u)) :
    C4.homologyInterleavingDistanceOver C4.groupAlgebraScalar A₁ Z₁ =
      C4.homologyInterleavingDistanceOver C4.groupAlgebraScalar A₂ Z₂ := by
  unfold C4.homologyInterleavingDistanceOver
  refine iSup_congr fun n => ?_
  let H := HomologicalComplex.homologyFunctor (ModuleCat.{0} kC4) (ComplexShape.down ℤ) n ⋙
    ModuleCat.restrictScalars C4.groupAlgebraScalar
  exact C4.persistenceInterleavingDistance_zero_iso (Functor.isoWhiskerRight eA H)
    (Functor.isoWhiskerRight eZ H) (fun u => H.map_isZero (hZ u))

theorem isoStep {A A' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ} (e : A ≅ A') :
    C4.ObjectwiseQuasiIsoStep A A' :=
  ⟨e.hom, fun _ => inferInstance⟩

theorem homotopyParameters_subset {A A' B B' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ}
    (eA : A ≅ A') (eB : B ≅ B') :
    C4.homotopyInterleavingParameters A B ⊆ C4.homotopyInterleavingParameters A' B' := by
  rintro ε ⟨hε, A'', B'', hA, hB, hI⟩
  exact ⟨hε, A'', B'', .trans _ _ _ (.symm _ _ (.rel _ _ (isoStep eA))) hA,
    .trans _ _ _ (.symm _ _ (.rel _ _ (isoStep eB))) hB, hI⟩

theorem homotopy_congr {A A' B B' : ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ}
    (eA : A ≅ A') (eB : B ≅ B') :
    C4.homotopyInterleavingDistance A B = C4.homotopyInterleavingDistance A' B' := by
  unfold C4.homotopyInterleavingDistance
  rw [(homotopyParameters_subset eA eB).antisymm (homotopyParameters_subset eA.symm eB.symm)]

/-! ## The transferred theorem -/

universe w' w

/-- The statement theorem, transferred from `C4.c4_distance_separation_groupAlgebra`. -/
theorem separation {D : Type w} [Category.{w'} D]
    (L : (ℝ ⥤ ChainComplex (ModuleCat.{0} kC4) ℤ) ⥤ D) [L.IsLocalization objectwiseQuasiIso] :
    homologyDistance F zeroDiagram = ENNReal.ofReal (1 / 2) ∧
    derivedDistance L F zeroDiagram = ENNReal.ofReal 1 ∧
    ENNReal.ofReal (5 / 4) ≤ homotopyDistance F zeroDiagram ∧
    homotopyDistance F zeroDiagram ≤ ENNReal.ofReal (5 / 2) ∧
    homologyDistance F zeroDiagram < derivedDistance L F zeroDiagram ∧
    derivedDistance L F zeroDiagram < ENNReal.ofReal (5 / 4) := by
  let _ : L.IsLocalization (C4.objectwiseQuasiIsoOver C4.GroupAlgebra) := ‹_›
  have hZ : ∀ u, IsZero (zeroDiagram.obj u) := fun _ => HomologicalComplex.isZero_zero
  have hH : homologyDistance F zeroDiagram =
      C4.homologyInterleavingDistanceOver C4.groupAlgebraScalar C4.groupAlgebraDiagram
        C4.groupAlgebraZeroDiagram := by
    rw [homologyDistance_eq, homology_congr diagramIso zeroDiagramIso hZ]
  have hD : derivedDistance L F zeroDiagram =
      C4.derivedInterleavingDistance L C4.groupAlgebraDiagram C4.groupAlgebraZeroDiagram := by
    rw [derivedDistance_eq, derived_congr L diagramIso zeroDiagramIso]
  have hHI : homotopyDistance F zeroDiagram =
      C4.homotopyInterleavingDistance C4.groupAlgebraDiagram C4.groupAlgebraZeroDiagram := by
    rw [homotopyDistance_eq, homotopy_congr diagramIso zeroDiagramIso]
  rw [hH, hD, hHI]
  exact C4.c4_distance_separation_groupAlgebra L

end C4Separation.Bridge
