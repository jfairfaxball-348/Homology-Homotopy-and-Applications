module
public import C4.DerivedStageResolution

@[expose] public section

/-!
# The derived two-unit shift of `F` vanishes: `dIHC(F, 0) = 1`

The seven-stage resolution `R → c4Stages` and the natural nullhomotopy of the
stage two-shift on `R`, assembled from the canonical C4 fillers. By homotopy
invariance and the stage reduction, the whole-real two-unit shift of `F`
equals zero in every localisation of whole real diagrams at objectwise
quasi-isomorphisms; hence `F` and zero are derived `1`-interleaved and, with
the evaluation lower bound, `dIHC(F, 0) = 1`.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits HomologicalComplex

noncomputable section

/-! ### Stage data -/

abbrev st1 : C4Complex := integerShiftResolution 0
abbrev st2 : C4Complex := integerShiftResolution (0 + 1)
abbrev st3 : C4Complex := integerShiftResolution (0 + 2)
abbrev st4 : C4Complex := integerShiftResolution (0 + 3)
abbrev st5 : C4Complex := integerShiftResolution (0 + 4)

abbrev sx01 : st1 ⟶ st2 := (canonicalGlobalFourfold 0).x01
abbrev sx12 : st2 ⟶ st3 := (canonicalGlobalFourfold 0).x12
abbrev sx23 : st3 ⟶ st4 := (canonicalGlobalFourfold 0).x23
abbrev sx34 : st4 ⟶ st5 := (canonicalGlobalFourfold 0).x34

abbrev R2 : C4Complex := coneOf st1 ⊞ st2
abbrev R3 : C4Complex := (coneOf st1 ⊞ coneOf st2) ⊞ st3

def r12 : st1 ⟶ R2 := biprod.lift (homotopyCofiber.inr (𝟙 st1)) sx01
def r23 : R2 ⟶ R3 :=
  biprod.lift (biprod.map (𝟙 _) (homotopyCofiber.inr (𝟙 st2))) (biprod.snd ≫ sx12)
def r34 : R3 ⟶ st4 := biprod.snd ≫ sx23

/-- The seven-stage resolution of `c4Stages`. -/
def stageResolution : ComposableArrows C4Complex 6 :=
  (ComposableArrows.mk₅ r12 r23 r34 sx34 (0 : st5 ⟶ zeroComplex)).precomp
    (0 : zeroComplex ⟶ st1)

/-- Its projection to `c4Stages`. -/
def stageResolutionπApp : ∀ k : Fin 7, stageResolution.obj k ⟶ c4Stages.obj k
  | ⟨0, _⟩ => 𝟙 zeroComplex
  | ⟨1, _⟩ => 𝟙 st1
  | ⟨2, _⟩ => (biprod.snd : R2 ⟶ st2)
  | ⟨3, _⟩ => (biprod.snd : R3 ⟶ st3)
  | ⟨4, _⟩ => 𝟙 st4
  | ⟨5, _⟩ => 𝟙 st5
  | ⟨6, _⟩ => 𝟙 zeroComplex

def stageResolutionπ : stageResolution ⟶ c4Stages :=
  ComposableArrows.homMk stageResolutionπApp (by
    intro m hm
    interval_cases m
    · exact (HomologicalComplex.isZero_zero).eq_of_src _ _
    · change r12 ≫ biprod.snd = 𝟙 st1 ≫ sx01
      simp [r12]
    · change r23 ≫ biprod.snd = biprod.snd ≫ sx12
      simp [r23]
    · change r34 ≫ 𝟙 st4 = biprod.snd ≫ sx23
      simp [r34]
    · change sx34 ≫ 𝟙 st5 = 𝟙 st4 ≫ sx34
      simp
    · exact (HomologicalComplex.isZero_zero).eq_of_tgt _ _)

theorem stageResolutionπ_quasiIso (k : Fin 7) : QuasiIso (stageResolutionπ.app k) := by
  match k with
  | ⟨0, _⟩ => change QuasiIso (𝟙 zeroComplex); infer_instance
  | ⟨1, _⟩ => change QuasiIso (𝟙 st1); infer_instance
  | ⟨2, _⟩ => change QuasiIso (biprod.snd : R2 ⟶ st2); infer_instance
  | ⟨3, _⟩ => change QuasiIso (biprod.snd : R3 ⟶ st3); infer_instance
  | ⟨4, _⟩ => change QuasiIso (𝟙 st4); infer_instance
  | ⟨5, _⟩ => change QuasiIso (𝟙 st5); infer_instance
  | ⟨6, _⟩ => change QuasiIso (𝟙 zeroComplex); infer_instance

#print axioms stageResolutionπ_quasiIso

/-! ### Canonical fillers and cone cycles -/

abbrev sh02 : Homotopy (sx01 ≫ sx12) 0 := (canonicalGlobalFourfold 0).h02
abbrev sh13 : Homotopy (sx12 ≫ sx23) 0 := (canonicalGlobalFourfold 0).h13
abbrev sh24 : Homotopy (sx23 ≫ sx34) 0 := (canonicalGlobalFourfold 0).h24
abbrev sz03 : ∀ i j : ℤ, st1.X i ⟶ st4.X j := (canonicalGlobalFourfold 0).z03
abbrev sz14 : ∀ i j : ℤ, st2.X i ⟶ st5.X j := (canonicalGlobalFourfold 0).z14

theorem family_eqToHom {P Q : C4Complex} (f : ∀ i j : ℤ, P.X i ⟶ Q.X j) (i : ℤ) {j j' : ℤ}
    (h : j = j') : f i j ≫ eqToHom (congrArg Q.X h) = f i j' := by
  subst h
  simp

def mu03 (i j : ℤ) : st1.X i ⟶ st4.X j := sh02.hom i j ≫ sx23.f j + sx01.f i ≫ sh13.hom i j
def mu14 (i j : ℤ) : st2.X i ⟶ st5.X j := sh13.hom i j ≫ sx34.f j + sx12.f i ≫ sh24.hom i j

theorem mu03_cyc (a b c d : ℤ) (hb : b = a + 1) (hc : c = a - 1) (hd : d = a + 2) :
    mu03 a b = st1.d a c ≫ sz03 c b + sz03 a d ≫ st4.d d b := by
  subst hb hc hd
  have h := (canonicalGlobalFourfold 0).z03_coherence a
  rw [Category.assoc, family_eqToHom _ _ (by omega : a - 1 + 2 = a + 1)] at h
  rw [mu03, ← h]
  exact add_comm _ _

theorem mu14_cyc (a b c d : ℤ) (hb : b = a + 1) (hc : c = a - 1) (hd : d = a + 2) :
    mu14 a b = st2.d a c ≫ sz14 c b + sz14 a d ≫ st5.d d b := by
  subst hb hc hd
  have h := (canonicalGlobalFourfold 0).z14_coherence a
  rw [Category.assoc, family_eqToHom _ _ (by omega : a - 1 + 2 = a + 1)] at h
  rw [mu14, ← h]
  exact add_comm _ _

def cyc1 : Homotopy (0 : coneOf st1 ⟶ st4) 0 := coneCycle sz03 mu03 mu03_cyc

def cyc1' : Homotopy (0 : coneOf st1 ⟶ st5) 0 :=
  coneCycle (fun i j => sz03 i j ≫ sx34.f j) (fun i j => mu03 i j ≫ sx34.f j) (by
    intro a b c d hb hc hd
    rw [mu03_cyc a b c d hb hc hd, Preadditive.add_comp, Category.assoc, Category.assoc,
      Category.assoc, ← sx34.comm d b])

def cyc2 : Homotopy (0 : coneOf st2 ⟶ st5) 0 := coneCycle sz14 mu14 mu14_cyc

/-! ### The stagewise nullhomotopies -/

theorem c4Stages_map_two {a b c : Fin 7} (hab : a ≤ b) (hbc : b ≤ c) :
    c4Stages.map (homOfLE (hab.trans hbc)) = c4Stages.map (homOfLE hab) ≫ c4Stages.map (homOfLE hbc) := by
  rw [← Functor.map_comp]
  rfl

def stageK0 : Homotopy ((stageResolutionπ ≫ stageTwoShift).app 0) 0 :=
  Homotopy.ofEq ((show IsZero (stageResolution.obj 0) from HomologicalComplex.isZero_zero).eq_of_src _ _)

def stageK1 : Homotopy ((stageResolutionπ ≫ stageTwoShift).app 1) 0 :=
  relabelHomotopy sh02 (by
    change 𝟙 st1 ≫ c4Stages.map (homOfLE ((show (1 : Fin 7) ≤ 2 by decide).trans
      (show (2 : Fin 7) ≤ 3 by decide))) = sx01 ≫ sx12
    rw [Category.id_comp, c4Stages_map_two (show (1 : Fin 7) ≤ 2 by decide)
      (show (2 : Fin 7) ≤ 3 by decide)]
    rfl) rfl

def stageK2 : Homotopy ((stageResolutionπ ≫ stageTwoShift).app 2) 0 :=
  relabelHomotopy ((sh13.compLeft (biprod.snd : R2 ⟶ st2)).add
      (cyc1.compLeft (biprod.fst : R2 ⟶ coneOf st1))) (by
    change (biprod.snd : R2 ⟶ st2) ≫ c4Stages.map (homOfLE ((show (2 : Fin 7) ≤ 3 by decide).trans
      (show (3 : Fin 7) ≤ 4 by decide))) = _
    rw [c4Stages_map_two (show (2 : Fin 7) ≤ 3 by decide) (show (3 : Fin 7) ≤ 4 by decide),
      comp_zero, add_zero]
    rfl) (by simp)

def stageK3 : Homotopy ((stageResolutionπ ≫ stageTwoShift).app 3) 0 :=
  relabelHomotopy ((sh24.compLeft (biprod.snd : R3 ⟶ st3)).add
      (((cyc1'.compLeft (biprod.fst : coneOf st1 ⊞ coneOf st2 ⟶ coneOf st1)).add
        (cyc2.compLeft (biprod.snd : coneOf st1 ⊞ coneOf st2 ⟶ coneOf st2))).compLeft
          (biprod.fst : R3 ⟶ coneOf st1 ⊞ coneOf st2))) (by
    change (biprod.snd : R3 ⟶ st3) ≫ c4Stages.map (homOfLE ((show (3 : Fin 7) ≤ 4 by decide).trans
      (show (4 : Fin 7) ≤ 5 by decide))) = _
    rw [c4Stages_map_two (show (3 : Fin 7) ≤ 4 by decide) (show (4 : Fin 7) ≤ 5 by decide)]
    simp only [comp_zero, add_zero]
    rfl) (by simp)

theorem zeroEnd_isZero : IsZero (c4Stages.obj 6) := HomologicalComplex.isZero_zero

def stageK4 : Homotopy ((stageResolutionπ ≫ stageTwoShift).app 4) 0 :=
  Homotopy.ofEq (zeroEnd_isZero.eq_of_tgt _ _)

def stageK5 : Homotopy ((stageResolutionπ ≫ stageTwoShift).app 5) 0 :=
  Homotopy.ofEq (zeroEnd_isZero.eq_of_tgt _ _)

def stageK6 : Homotopy ((stageResolutionπ ≫ stageTwoShift).app 6) 0 :=
  Homotopy.ofEq (zeroEnd_isZero.eq_of_tgt _ _)

#print axioms stageK3

/-! ### Naturality of the stagewise nullhomotopies -/

theorem stageK2_hom_precomp {A : C4Complex} (X : A ⟶ R2) (i j : ℤ) :
    X.f i ≫ stageK2.hom i j =
      (X ≫ biprod.snd).f i ≫ sh13.hom i j + (X ≫ biprod.fst).f i ≫ cyc1.hom i j := by
  change X.f i ≫ ((biprod.snd : R2 ⟶ st2).f i ≫ sh13.hom i j +
    (biprod.fst : R2 ⟶ coneOf st1).f i ≫ cyc1.hom i j) = _
  simp only [Preadditive.comp_add, HomologicalComplex.comp_f, Category.assoc]

theorem stageK3_hom_precomp {A : C4Complex} (X : A ⟶ R3) (i j : ℤ) :
    X.f i ≫ stageK3.hom i j =
      (X ≫ biprod.snd).f i ≫ sh24.hom i j +
        ((X ≫ biprod.fst ≫ biprod.fst).f i ≫ cyc1'.hom i j +
          (X ≫ biprod.fst ≫ biprod.snd).f i ≫ cyc2.hom i j) := by
  change X.f i ≫ ((biprod.snd : R3 ⟶ st3).f i ≫ sh24.hom i j +
    (biprod.fst : R3 ⟶ coneOf st1 ⊞ coneOf st2).f i ≫
      ((biprod.fst : coneOf st1 ⊞ coneOf st2 ⟶ coneOf st1).f i ≫ cyc1'.hom i j +
        (biprod.snd : coneOf st1 ⊞ coneOf st2 ⟶ coneOf st2).f i ≫ cyc2.hom i j)) = _
  simp only [Preadditive.comp_add, HomologicalComplex.comp_f, Category.assoc]

theorem cyc1'_hom (i j : ℤ) : cyc1'.hom i j = cyc1.hom i j ≫ sx34.f j := by
  change (if h : (ComplexShape.down ℤ).Rel j i then _ else 0) =
    (if h : (ComplexShape.down ℤ).Rel j i then _ else 0) ≫ _
  split_ifs
  · simp only [Preadditive.add_comp, Category.assoc]
  · simp

theorem stage_nat_one (i j : ℤ) :
    r12.f i ≫ stageK2.hom i j = stageK1.hom i j ≫ sx23.f j := by
  rw [stageK2_hom_precomp]
  simp only [r12, biprod.lift_snd, biprod.lift_fst]
  change sx01.f i ≫ sh13.hom i j + homotopyCofiber.inrX (𝟙 st1) i ≫ cyc1.hom i j =
    sh02.hom i j ≫ sx23.f j
  by_cases hij : (ComplexShape.down ℤ).Rel j i
  · obtain rfl : j = i + 1 := hij.symm
    rw [cyc1, coneCycle_inr, mu03, add_comm (sh02.hom i (i + 1) ≫ _), ← add_assoc,
      moduleHom_add_self_zero, zero_add]
  · rw [sh13.zero i j hij, cyc1.zero i j hij, sh02.zero i j hij]
    simp

theorem stage_nat_two (i j : ℤ) :
    r23.f i ≫ stageK3.hom i j = stageK2.hom i j ≫ sx34.f j := by
  apply HomologicalComplex.biprodX_ext_from
  · have e1 : (biprod.inl : coneOf st1 ⟶ R2) ≫ r23 ≫ biprod.snd = 0 := by simp [r23]
    have e2 : (biprod.inl : coneOf st1 ⟶ R2) ≫ r23 ≫ biprod.fst ≫ biprod.fst = 𝟙 _ := by
      simp [r23]
    have e3 : (biprod.inl : coneOf st1 ⟶ R2) ≫ r23 ≫ biprod.fst ≫ biprod.snd = 0 := by
      simp [r23]
    calc (biprod.inl : coneOf st1 ⟶ R2).f i ≫ r23.f i ≫ stageK3.hom i j
        = ((biprod.inl : coneOf st1 ⟶ R2) ≫ r23).f i ≫ stageK3.hom i j := by
          rw [HomologicalComplex.comp_f, Category.assoc]
      _ = cyc1.hom i j ≫ sx34.f j := by
          rw [stageK3_hom_precomp]
          simp only [Category.assoc, e1, e2, e3, HomologicalComplex.zero_f,
            HomologicalComplex.id_f, zero_comp, Category.id_comp, zero_add, add_zero, cyc1'_hom]
      _ = (biprod.inl : coneOf st1 ⟶ R2).f i ≫ stageK2.hom i j ≫ sx34.f j := by
          rw [← Category.assoc, stageK2_hom_precomp]
          simp
  · have e1 : (biprod.inr : st2 ⟶ R2) ≫ r23 ≫ biprod.snd = sx12 := by simp [r23]
    have e2 : (biprod.inr : st2 ⟶ R2) ≫ r23 ≫ biprod.fst ≫ biprod.fst = 0 := by simp [r23]
    have e3 : (biprod.inr : st2 ⟶ R2) ≫ r23 ≫ biprod.fst ≫ biprod.snd =
        homotopyCofiber.inr (𝟙 st2) := by simp [r23]
    calc (biprod.inr : st2 ⟶ R2).f i ≫ r23.f i ≫ stageK3.hom i j
        = ((biprod.inr : st2 ⟶ R2) ≫ r23).f i ≫ stageK3.hom i j := by
          rw [HomologicalComplex.comp_f, Category.assoc]
      _ = sx12.f i ≫ sh24.hom i j + homotopyCofiber.inrX (𝟙 st2) i ≫ cyc2.hom i j := by
          rw [stageK3_hom_precomp]
          simp only [Category.assoc, e1, e2, e3, HomologicalComplex.zero_f, zero_comp,
            zero_add]
          rfl
      _ = sh13.hom i j ≫ sx34.f j := by
          by_cases hij : (ComplexShape.down ℤ).Rel j i
          · obtain rfl : j = i + 1 := hij.symm
            rw [cyc2, coneCycle_inr, mu14, add_comm (sh13.hom i (i + 1) ≫ _), ← add_assoc,
              moduleHom_add_self_zero, zero_add]
          · rw [sh24.zero i j hij, cyc2.zero i j hij, sh13.zero i j hij]
            simp
      _ = (biprod.inr : st2 ⟶ R2).f i ≫ stageK2.hom i j ≫ sx34.f j := by
          rw [← Category.assoc, stageK2_hom_precomp]
          simp

#print axioms stage_nat_two

/-! ### Assembly into a natural homotopy -/

/-- A natural homotopy of stage diagrams from stagewise homotopies whose
components commute with every consecutive structure map. -/
def stageNaturalHomotopy {n : ℕ} {F G : ComposableArrows C4Complex n} {f g : F ⟶ G}
    (K : ∀ k, Homotopy (f.app k) (g.app k))
    (hK : ∀ (m : ℕ) (hm : m < n) (i j : ℤ),
      (F.map' m (m + 1)).f i ≫ (K ⟨m + 1, by omega⟩).hom i j =
        (K ⟨m, by omega⟩).hom i j ≫ (G.map' m (m + 1)).f j) :
    Homotopy (diagramComplexMap f) (diagramComplexMap g) where
  hom i j := ComposableArrows.homMk (F := (diagramComplex F).X i) (G := (diagramComplex G).X j)
    (fun k => (K k).hom i j) (fun m hm => hK m hm i j)
  zero i j hij := NatTrans.ext (funext fun k => (K k).zero i j hij)
  comm i := by
    rw [dNext_eq _ (down_rel i), prevD_eq _ (down_rel' i)]
    apply NatTrans.ext
    funext k
    have hk := (K k).comm i
    rw [dNext_eq _ (down_rel i), prevD_eq _ (down_rel' i)] at hk
    simp only [NatTrans.app_add, NatTrans.comp_app]
    exact hk

/-- The stagewise nullhomotopies. -/
def stageK : ∀ k : Fin 7,
    Homotopy ((stageResolutionπ ≫ stageTwoShift).app k)
      ((0 : stageResolution ⟶ stageAdvanceFunctor ⋙ c4Stages).app k)
  | ⟨0, _⟩ => stageK0
  | ⟨1, _⟩ => stageK1
  | ⟨2, _⟩ => stageK2
  | ⟨3, _⟩ => stageK3
  | ⟨4, _⟩ => stageK4
  | ⟨5, _⟩ => stageK5
  | ⟨6, _⟩ => stageK6

theorem stageK_nat (m : ℕ) (hm : m < 6) (i j : ℤ) :
    (stageResolution.map' m (m + 1)).f i ≫ (stageK ⟨m + 1, by omega⟩).hom i j =
      (stageK ⟨m, by omega⟩).hom i j ≫
        (ComposableArrows.map' (stageAdvanceFunctor ⋙ c4Stages : ComposableArrows C4Complex 6)
          m (m + 1)).f j := by
  interval_cases m
  · exact (isZero_zero (ModuleCat B)).eq_of_src _ _
  · exact stage_nat_one i j
  · exact stage_nat_two i j
  · exact (isZero_zero (ModuleCat B)).eq_of_tgt _ _
  · exact (isZero_zero (ModuleCat B)).eq_of_tgt _ _
  · exact (isZero_zero (ModuleCat B)).eq_of_tgt _ _

/-- **The stage two-shift vanishes** after every functor inverting stagewise
quasi-isomorphisms. -/
theorem stageTwoShift_vanishes {E : Type*} [Category E] (G : (Fin 7 ⥤ C4Complex) ⥤ E)
    (hG : ∀ {X Y : Fin 7 ⥤ C4Complex} (w : X ⟶ Y), (∀ k, QuasiIso (w.app k)) →
      IsIso (G.map w)) :
    G.map stageTwoShift = G.map 0 := by
  have hπ : IsIso (G.map stageResolutionπ) := hG _ stageResolutionπ_quasiIso
  have h := map_eq_of_naturalHomotopy G hG (stageNaturalHomotopy stageK stageK_nat)
  have h0 : (0 : stageResolution ⟶ stageAdvanceFunctor ⋙ c4Stages) =
      stageResolutionπ ≫ 0 := comp_zero.symm
  rw [h0, G.map_comp, G.map_comp] at h
  exact (cancel_epi (G.map stageResolutionπ)).1 h

/-- **The whole-real two-unit shift of `F` is zero in every localisation of
whole real diagrams at objectwise quasi-isomorphisms.** -/
theorem localized_twoShift_eq_zero {D : Type*} [Category D] (L : (ℝ ⥤ C4Complex) ⥤ D)
    [L.IsLocalization objectwiseQuasiIso] :
    L.map (twoShift realDiagram 1 (by norm_num)) = L.map 0 :=
  localized_twoShift_eq_zero_of_stage L
    (stageTwoShift_vanishes (stagePullback ⋙ L) (fun w hw => stagePullback_comp_inverts L w hw))

universe w' w

/-- `dIHC(F, 0) ≤ 1`. -/
theorem derivedInterleavingDistance_le_one {D : Type w} [Category.{w'} D]
    (L : (ℝ ⥤ C4Complex) ⥤ D) [L.IsLocalization objectwiseQuasiIso] :
    derivedInterleavingDistance L realDiagram zeroDiagram ≤ ENNReal.ofReal 1 :=
  iInf₂_le 1 ⟨by norm_num, ⟨derivedInterleaving_one_of_twoShift L (localized_twoShift_eq_zero L)⟩⟩

/-- **`dIHC(F, 0) = 1`**, in every localisation of whole real diagrams at
objectwise quasi-isomorphisms. -/
theorem derivedInterleavingDistance_eq_one {D : Type w} [Category.{w'} D]
    (L : (ℝ ⥤ C4Complex) ⥤ D) [L.IsLocalization objectwiseQuasiIso] :
    derivedInterleavingDistance L realDiagram zeroDiagram = ENNReal.ofReal 1 :=
  le_antisymm (derivedInterleavingDistance_le_one L) (one_le_derivedInterleavingDistance L)

#print axioms localized_twoShift_eq_zero
#print axioms derivedInterleavingDistance_eq_one




end

end C4
