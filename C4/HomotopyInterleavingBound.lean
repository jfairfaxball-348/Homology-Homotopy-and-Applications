module
public import C4.RealLadderTransport
public import Mathlib.Basic.ENNReal.Real

@[expose] public section

/-!
# The strict homotopy-interleaving distance of the C4 diagram: `5/4 ≤ dHI ≤ 5/2`

`homotopyInterleavingDistance F G` is the infimum, in `ℝ≥0∞`, of all `ε ≥ 0`
for which there are arbitrary whole-real weak zigzags `F ⇝ F'`, `G ⇝ G'` of
BOTH lanes and a strict `ε`-interleaving of the ENTIRE real diagrams `F'`,
`G'`. The zero lane may be replaced by any (possibly nonzero) diagram reached
by a zigzag. If no parameter exists the infimum is `∞`; no convention hides an
empty set.

Lower bound (`strictInterleaving_ge_five_fourths`): enlarge `ε < 5/4` to
`e = max 1 ε`, sample the five real cuts `0, 1, 2e, 2e+1, 4e`, transport the
original comparison ladder from `realDiagram` along the zigzag, and feed the
interleaving with the acyclic opposite lane to the weak-data obstruction.

Upper bound: the certified literal strict `5/2`-interleaving with zero.
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
open scoped ENNReal

/-! ### The genuine diagram along its stages -/

/-- A structure arrow of `realDiagram` is the stage arrow of `c4Stages`,
transported along the stage identification of its two real endpoints. -/
theorem realDiagram_map_eq_stage {u v : ℝ} (huv : u ≤ v) {a b : Fin 7} (hab : a ≤ b)
    (ha : realStage u = a) (hb : realStage v = b) :
    realDiagram.map (homOfLE huv) =
      eqToHom (congrArg c4Stages.obj ha) ≫ c4Stages.map (homOfLE hab) ≫
        eqToHom (congrArg c4Stages.obj hb).symm := by
  subst ha hb
  simp only [eqToHom_refl, Category.id_comp, Category.comp_id]
  rfl

theorem realDiagram_square {u v : ℝ} (huv : u ≤ v) {a b : Fin 7} (hab : a ≤ b)
    (ha : realStage u = a) (hb : realStage v = b) :
    c4Stages.map (homOfLE hab) ≫ eqToHom (congrArg c4Stages.obj hb).symm =
      eqToHom (congrArg c4Stages.obj ha).symm ≫ realDiagram.map (homOfLE huv) := by
  rw [realDiagram_map_eq_stage huv hab ha hb]
  simp

/-- The original comparison ladder of `realDiagram` itself, at the five cuts
`0, 1, 2e, 2e+1, 4e`, for every `1 ≤ e < 5/4`. Its rungs are identities up to
the stage identifications and its squares commute strictly. -/
theorem realDiagram_hasRevLadder (e : ℝ) (he1 : 1 ≤ e) (he : e < 5 / 4) :
    HasRevLadder realDiagram 0 1 (0 + e + e) (1 + e + e) (0 + e + e + e + e)
      (by norm_num) (by linarith) (by linarith) (by linarith) := by
  have h0 : realStage 0 = 1 := by
    rw [realStage_on_interval (0 : Fin 5) 0 (by norm_num) (by norm_num)]
    rfl
  have h1 : realStage 1 = 2 := by
    rw [realStage_on_interval (1 : Fin 5) 1 (by norm_num) (by norm_num)]
    rfl
  have h2 : realStage (0 + e + e) = 3 := by
    rw [realStage_on_interval (2 : Fin 5) (0 + e + e) (by norm_num; linarith)
      (by norm_num; linarith)]
    rfl
  have h3 : realStage (1 + e + e) = 4 := by
    rw [realStage_on_interval (3 : Fin 5) (1 + e + e) (by norm_num; linarith)
      (by norm_num; linarith)]
    rfl
  have h4 : realStage (0 + e + e + e + e) = 5 := by
    rw [realStage_on_interval (4 : Fin 5) (0 + e + e + e + e) (by norm_num; linarith)
      (by norm_num; linarith)]
    rfl
  refine ⟨reverseMap (eqToHom (congrArg c4Stages.obj h0).symm),
    reverseMap (eqToHom (congrArg c4Stages.obj h1).symm),
    reverseMap (eqToHom (congrArg c4Stages.obj h2).symm),
    reverseMap (eqToHom (congrArg c4Stages.obj h3).symm),
    reverseMap (eqToHom (congrArg c4Stages.obj h4).symm),
    inferInstance, inferInstance, inferInstance, inferInstance, inferInstance,
    ?_, ?_, ?_, ?_⟩
  · exact congrArg homotopyQuotient.map (congrArg reverseMap
      (realDiagram_square (show (0 : ℝ) ≤ 1 by norm_num) (show (1 : Fin 7) ≤ 2 by decide) h0 h1))
  · exact congrArg homotopyQuotient.map (congrArg reverseMap
      (realDiagram_square (show (1 : ℝ) ≤ 0 + e + e by linarith)
        (show (2 : Fin 7) ≤ 3 by decide) h1 h2))
  · exact congrArg homotopyQuotient.map (congrArg reverseMap
      (realDiagram_square (show 0 + e + e ≤ 1 + e + e by linarith)
        (show (3 : Fin 7) ≤ 4 by decide) h2 h3))
  · exact congrArg homotopyQuotient.map (congrArg reverseMap
      (realDiagram_square (show 1 + e + e ≤ 0 + e + e + e + e by linarith)
        (show (4 : Fin 7) ≤ 5 by decide) h3 h4))

/-! ### Monotonicity of strict interleavings -/

/-- The natural comparison between two translates of an entire real diagram. -/
def translateShift (G : ℝ ⥤ C4Complex) {a b : ℝ} (hab : a ≤ b) :
    translateDiagram G a ⟶ translateDiagram G b where
  app u := G.map (homOfLE (show u + a ≤ u + b by linarith))
  naturality u v f := by
    dsimp [translateDiagram, realTranslation]
    rw [← G.map_comp, ← G.map_comp]
    congr 1

/-- A strict `ε`-interleaving of entire real diagrams gives a strict
`e`-interleaving for every `e ≥ ε`. -/
def StrictRealInterleaving.mono {F G : ℝ ⥤ C4Complex} {ε : ℝ} {hε : 0 ≤ ε}
    (I : StrictRealInterleaving F G ε hε) (e : ℝ) (he : ε ≤ e) :
    StrictRealInterleaving F G e (by linarith) where
  forward := I.forward ≫ translateShift G he
  backward := I.backward ≫ translateShift F he
  forward_backward u := by
    have hn := I.backward.naturality (homOfLE (show u + ε ≤ u + e by linarith))
    simp only [NatTrans.comp_app, translateShift, Category.assoc]
    rw [reassoc_of% hn, ← Category.assoc, I.forward_backward u]
    dsimp [translateDiagram, realTranslation]
    rw [← F.map_comp, ← F.map_comp]
    congr 1
  backward_forward u := by
    have hn := I.forward.naturality (homOfLE (show u + ε ≤ u + e by linarith))
    simp only [NatTrans.comp_app, translateShift, Category.assoc]
    rw [reassoc_of% hn, ← Category.assoc, I.backward_forward u]
    dsimp [translateDiagram, realTranslation]
    rw [← G.map_comp, ← G.map_comp]
    congr 1

/-! ### The lower bound -/

/-- **No strict homotopy interleaving below `5/4`.** For ARBITRARY whole-real
weak zigzag replacements `F'` of `realDiagram` and `O'` of the zero diagram
(the latter possibly nonzero), every strict `ε`-interleaving of the entire
real diagrams `F'` and `O'` has `5/4 ≤ ε`. -/
theorem strictInterleaving_ge_five_fourths
    {F' O' : ℝ ⥤ C4Complex} (hF : WeakZigzag realDiagram F')
    (hO : WeakZigzag zeroDiagram O')
    {ε : ℝ} {hε : 0 ≤ ε} (I : StrictRealInterleaving F' O' ε hε) : 5 / 4 ≤ ε := by
  by_contra hlt
  replace hlt : ε < 5 / 4 := not_le.mp hlt
  obtain ⟨e, he1, heε, he54⟩ : ∃ e : ℝ, 1 ≤ e ∧ ε ≤ e ∧ e < 5 / 4 :=
    ⟨max 1 ε, le_max_left _ _, le_max_right _ _, max_lt (by norm_num) hlt⟩
  let J := I.mono e heε
  have h01 : (0 : ℝ) ≤ 1 := by norm_num
  have h12 : (1 : ℝ) ≤ 0 + e + e := by linarith
  have h23 : 0 + e + e ≤ 1 + e + e := by linarith
  have h34 : 1 + e + e ≤ 0 + e + e + e + e := by linarith
  have m01 : 0 + e ≤ 1 + e := by linarith
  have m12 : 1 + e ≤ 0 + e + e + e := by linarith
  obtain ⟨u0, u1, u2, u3, u4, _, _, q2, q3, q4, s01, s12, s23, s34⟩ :=
    (hF.hasRevLadder_iff 0 1 (0 + e + e) (1 + e + e) (0 + e + e + e + e)
      h01 h12 h23 h34).1 (realDiagram_hasRevLadder e he1 he54)
  have hac := hO.acyclic_of_zero
  have r01 : F'.map (homOfLE h01) ≫ F'.map (homOfLE h12) =
      J.forward.app 0 ≫ J.backward.app (0 + e) := by
    rw [J.forward_backward 0, ← F'.map_comp]
    rfl
  have r12 : F'.map (homOfLE h12) ≫ F'.map (homOfLE h23) =
      J.forward.app 1 ≫ J.backward.app (1 + e) := by
    rw [J.forward_backward 1, ← F'.map_comp]
    rfl
  have r23 : F'.map (homOfLE h23) ≫ F'.map (homOfLE h34) =
      J.forward.app (0 + e + e) ≫ J.backward.app (0 + e + e + e) := by
    rw [J.forward_backward (0 + e + e), ← F'.map_comp]
    rfl
  have n0 : F'.map (homOfLE h01) ≫ J.forward.app 1 =
      J.forward.app 0 ≫ O'.map (homOfLE m01) := J.forward.naturality (homOfLE h01)
  have n1 : F'.map (homOfLE h12) ≫ J.forward.app (0 + e + e) =
      J.forward.app 1 ≫ O'.map (homOfLE m12) := J.forward.naturality (homOfLE h12)
  have mm0 : J.backward.app (0 + e) ≫ F'.map (homOfLE h23) =
      O'.map (homOfLE m01) ≫ J.backward.app (1 + e) :=
    (J.backward.naturality (homOfLE m01)).symm
  have mm1 : J.backward.app (1 + e) ≫ F'.map (homOfLE h34) =
      O'.map (homOfLE m12) ≫ J.backward.app (0 + e + e + e) :=
    (J.backward.naturality (homOfLE m12)).symm
  have c0 : J.backward.app (0 + e) ≫ J.forward.app (0 + e + e) =
      O'.map (homOfLE m01) ≫ O'.map (homOfLE m12) := by
    rw [J.backward_forward (0 + e), ← O'.map_comp]
    rfl
  let L : CochainInterleavingLadder revX01 revX12 revX23 revX34 :=
    { Q0 := reverseComplex (F'.obj 0)
      Q1 := reverseComplex (F'.obj 1)
      Q2 := reverseComplex (F'.obj (0 + e + e))
      Q3 := reverseComplex (F'.obj (1 + e + e))
      Q4 := reverseComplex (F'.obj (0 + e + e + e + e))
      Z0 := reverseComplex (O'.obj (0 + e))
      Z1 := reverseComplex (O'.obj (1 + e))
      Z2 := reverseComplex (O'.obj (0 + e + e + e))
      b0 := reverseMap (F'.map (homOfLE h01))
      b1 := reverseMap (F'.map (homOfLE h12))
      b2 := reverseMap (F'.map (homOfLE h23))
      b3 := reverseMap (F'.map (homOfLE h34))
      α0 := reverseMap (J.forward.app 0)
      α1 := reverseMap (J.forward.app 1)
      α2 := reverseMap (J.forward.app (0 + e + e))
      β0 := reverseMap (J.backward.app (0 + e))
      β1 := reverseMap (J.backward.app (1 + e))
      β2 := reverseMap (J.backward.app (0 + e + e + e))
      o0 := reverseMap (O'.map (homOfLE m01))
      o1 := reverseMap (O'.map (homOfLE m12))
      acyclic0 := reverseComplex_acyclic (hac _)
      acyclic1 := reverseComplex_acyclic (hac _)
      acyclic2 := reverseComplex_acyclic (hac _)
      r01 := congrArg reverseMap r01
      r12 := congrArg reverseMap r12
      r23 := congrArg reverseMap r23
      n0 := congrArg reverseMap n0
      n1 := congrArg reverseMap n1
      m0 := congrArg reverseMap mm0
      m1 := congrArg reverseMap mm1
      c0 := congrArg reverseMap c0
      u0 := u0
      u1 := u1
      u2 := u2
      u3 := u3
      u4 := u4
      qi2 := q2
      qi3 := q3
      qi4 := q4
      l0 := HomotopyCategory.homotopyOfEq _ _ s01
      l1 := HomotopyCategory.homotopyOfEq _ _ s12
      l2 := HomotopyCategory.homotopyOfEq _ _ s23
      l3 := HomotopyCategory.homotopyOfEq _ _ s34 }
  exact (canonical_no_interleavingLadder 0).false L

/-! ### The strict homotopy-interleaving distance -/

/-- Admissible parameters: strict interleavings of entire real diagrams after
ARBITRARY whole-real weak zigzag replacements of BOTH lanes. -/
def homotopyInterleavingParameters (F G : ℝ ⥤ C4Complex) : Set ℝ :=
  {ε | ∃ hε : 0 ≤ ε, ∃ F' G' : ℝ ⥤ C4Complex, WeakZigzag F F' ∧ WeakZigzag G G' ∧
    Nonempty (StrictRealInterleaving F' G' ε hε)}

/-- The strict homotopy-interleaving distance, valued in `[0, ∞]`. -/
noncomputable def homotopyInterleavingDistance (F G : ℝ ⥤ C4Complex) : ℝ≥0∞ :=
  ⨅ ε ∈ homotopyInterleavingParameters F G, ENNReal.ofReal ε

/-- `dHI(F, 0) ≤ 5/2`, witnessed without any replacement. -/
theorem homotopyInterleavingDistance_le_five_halves :
    homotopyInterleavingDistance realDiagram zeroDiagram ≤ ENNReal.ofReal (5 / 2) :=
  iInf₂_le (5 / 2) ⟨by norm_num, realDiagram, zeroDiagram, Relation.EqvGen.refl _,
    Relation.EqvGen.refl _, ⟨realDiagram_strictInterleavingZero_fiveHalves⟩⟩

/-- `5/4 ≤ dHI(F, 0)`, over arbitrary whole-real zigzags of BOTH lanes. -/
theorem five_fourths_le_homotopyInterleavingDistance :
    ENNReal.ofReal (5 / 4) ≤ homotopyInterleavingDistance realDiagram zeroDiagram :=
  le_iInf₂ fun _ ⟨_, _, _, hF, hO, ⟨I⟩⟩ =>
    ENNReal.ofReal_le_ofReal (strictInterleaving_ge_five_fourths hF hO I)

#print axioms strictInterleaving_ge_five_fourths
#print axioms homotopyInterleavingDistance_le_five_halves
#print axioms five_fourths_le_homotopyInterleavingDistance

end C4
