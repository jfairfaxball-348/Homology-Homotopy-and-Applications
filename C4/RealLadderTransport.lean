module
public import C4.InterleavingObstruction
public import C4.StrictRealInterleaving
public import Mathlib.Logic.Relation

@[expose] public section

/-!
# Whole-real zigzags and transport of the original comparison ladder

A *weak zigzag* of entire real diagrams is an arbitrary finite chain of
natural transformations of WHOLE real diagrams, in either direction, whose
components at every real index are quasi-isomorphisms
(`Relation.EqvGen ObjectwiseQuasiIsoStep`). Nothing is assumed about the
intermediate diagrams: they need not be cofibrant, K-projective, bounded, or
literally zero on the zero lane.

`HasRevLadder G t₀ … t₄` says that the five original shifted resolutions map
by quasi-isomorphisms (in reversed grading) to the values of `G` at the five
real cuts, making the four canonical adjacent squares commute in the homotopy
category. This property is invariant along every zigzag step, in BOTH
directions: forwards by composition, backwards by the K-projective lifting of
`KProjectiveLifting` (only the ORIGINAL side is K-projective). Hence it
transfers from the genuine diagram `realDiagram` to any replacement.

Acyclicity of every value is likewise invariant, so any zigzag replacement of
the zero diagram is objectwise acyclic (possibly nonzero).
-/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.defeqAttrib.useBackward true

namespace C4
open CategoryTheory CategoryTheory.Limits
open CochainComplex.HomComplex

/-! ### Whole-real zigzags -/

/-- One zigzag step: a natural transformation of ENTIRE real diagrams whose
component at EVERY real index is a quasi-isomorphism. -/
def ObjectwiseQuasiIsoStep {R : Type} [Ring R]
    (A A' : ℝ ⥤ ChainComplex (ModuleCat R) ℤ) : Prop :=
  ∃ w : A ⟶ A', ∀ t : ℝ, QuasiIso (w.app t)

/-- Arbitrary finite zigzags of whole-diagram objectwise quasi-isomorphisms. -/
def WeakZigzag {R : Type} [Ring R] :
    (ℝ ⥤ ChainComplex (ModuleCat R) ℤ) → (ℝ ⥤ ChainComplex (ModuleCat R) ℤ) → Prop :=
  Relation.EqvGen ObjectwiseQuasiIsoStep

/-- Invariance of a property along all zigzags follows from invariance along
one step, in both directions. -/
theorem WeakZigzag.iff_of_step (Φ : (ℝ ⥤ C4Complex) → Prop)
    (hΦ : ∀ A A', ObjectwiseQuasiIsoStep A A' → (Φ A ↔ Φ A'))
    {A A' : ℝ ⥤ C4Complex} (h : WeakZigzag A A') : Φ A ↔ Φ A' := by
  induction h with
  | rel A A' hs => exact hΦ A A' hs
  | refl A => exact Iff.rfl
  | symm A A' _ ih => exact ih.symm
  | trans A A' A'' _ _ ih₁ ih₂ => exact ih₁.trans ih₂

/-- Acyclicity of every value is invariant along one step. -/
theorem ObjectwiseQuasiIsoStep.acyclic_iff {A A' : ℝ ⥤ C4Complex}
    (h : ObjectwiseQuasiIsoStep A A') :
    (∀ t : ℝ, (A.obj t).Acyclic) ↔ (∀ t : ℝ, (A'.obj t).Acyclic) := by
  obtain ⟨w, hw⟩ := h
  constructor
  · intro hA t n
    exact (quasiIsoAt_iff_exactAt (w.app t) n (hA t n)).1 inferInstance
  · intro hA t n
    exact (quasiIsoAt_iff_exactAt' (w.app t) n (hA t n)).1 inferInstance

/-- Every zigzag replacement of the literal zero diagram is objectwise acyclic.
It may be a nonzero diagram. -/
theorem WeakZigzag.acyclic_of_zero {O' : ℝ ⥤ C4Complex}
    (h : WeakZigzag zeroDiagram O') : ∀ t : ℝ, (O'.obj t).Acyclic := by
  have hz : ∀ t : ℝ, (zeroDiagram.obj t).Acyclic := fun _ n => zeroComplex_exactAt n
  exact (WeakZigzag.iff_of_step (fun A => ∀ t : ℝ, (A.obj t).Acyclic)
    (fun _ _ hs => hs.acyclic_iff) h).1 hz

/-! ### Rung and square transport in the homotopy category -/

/-- The reversed original shifted resolution `P[k]`. -/
abbrev revRes (k : ℤ) : CochainComplex (ModuleCat B) ℤ :=
  reverseComplex (integerShiftResolution k)

theorem homotopyQuotient_quasiIso_iff {K L : CochainComplex (ModuleCat B) ℤ}
    (f : K ⟶ L) :
    HomotopyCategory.quasiIso (ModuleCat B) (ComplexShape.up ℤ)
      (homotopyQuotient.map f) ↔ QuasiIso f := by
  rw [HomotopyCategory.quotient_map_mem_quasiIso_iff]
  exact HomologicalComplex.mem_quasiIso_iff f

/-- A quasi-isomorphism rung lifts through any quasi-isomorphism of the target,
up to homotopy; the lift is again a quasi-isomorphism. -/
theorem exists_lift_rung {k : ℤ} {X X' : C4Complex} (w : X ⟶ X') [QuasiIso w]
    (u' : revRes k ⟶ reverseComplex X') [QuasiIso u'] :
    ∃ u : revRes k ⟶ reverseComplex X, QuasiIso u ∧
      homotopyQuotient.map (u ≫ reverseMap w) = homotopyQuotient.map u' := by
  obtain ⟨f, hf⟩ := (kProjective_postcomp_bijective (P := revRes k)
    (reverseMap w)).2 (homotopyQuotient.map u')
  have h1 : homotopyQuotient.map (f.out ≫ reverseMap w) = homotopyQuotient.map u' := by
    rw [Functor.map_comp, HomotopyCategory.quotient_map_out]
    exact hf
  refine ⟨f.out, ?_, h1⟩
  have hq : QuasiIso (f.out ≫ reverseMap w) := by
    rw [← homotopyQuotient_quasiIso_iff, h1, homotopyQuotient_quasiIso_iff]
    infer_instance
  exact (quasiIso_iff_comp_right f.out (reverseMap w)).1 hq

/-- Pull back one homotopy-commutative ladder square along a natural
quasi-isomorphism. Injectivity uses ONLY the K-projectivity of the original. -/
theorem rung_square_pull {k k' : ℤ} {X Y X' Y' : C4Complex}
    (x : revRes k ⟶ revRes k') (f : X ⟶ Y) (f' : X' ⟶ Y')
    (wX : X ⟶ X') (wY : Y ⟶ Y') [QuasiIso wY] (hnat : f ≫ wY = wX ≫ f')
    (ua : revRes k ⟶ reverseComplex X) (ub : revRes k' ⟶ reverseComplex Y)
    (ua' : revRes k ⟶ reverseComplex X') (ub' : revRes k' ⟶ reverseComplex Y')
    (ha : homotopyQuotient.map (ua ≫ reverseMap wX) = homotopyQuotient.map ua')
    (hb : homotopyQuotient.map (ub ≫ reverseMap wY) = homotopyQuotient.map ub')
    (hsq : homotopyQuotient.map (x ≫ ub') = homotopyQuotient.map (ua' ≫ reverseMap f')) :
    homotopyQuotient.map (x ≫ ub) = homotopyQuotient.map (ua ≫ reverseMap f) := by
  apply (kProjective_postcomp_bijective (P := revRes k) (reverseMap wY)).1
  change homotopyQuotient.map (x ≫ ub) ≫ homotopyQuotient.map (reverseMap wY) =
    homotopyQuotient.map (ua ≫ reverseMap f) ≫ homotopyQuotient.map (reverseMap wY)
  calc homotopyQuotient.map (x ≫ ub) ≫ homotopyQuotient.map (reverseMap wY)
      = homotopyQuotient.map x ≫ homotopyQuotient.map (ub ≫ reverseMap wY) := by
        rw [Functor.map_comp, Functor.map_comp, Category.assoc]
    _ = homotopyQuotient.map (x ≫ ub') := by rw [hb, Functor.map_comp]
    _ = homotopyQuotient.map (ua' ≫ reverseMap f') := hsq
    _ = homotopyQuotient.map (ua ≫ reverseMap wX) ≫ homotopyQuotient.map (reverseMap f') := by
        rw [ha, Functor.map_comp]
    _ = homotopyQuotient.map (ua ≫ reverseMap (wX ≫ f')) := by
        rw [← Functor.map_comp, Category.assoc]
        rfl
    _ = homotopyQuotient.map (ua ≫ reverseMap f) ≫ homotopyQuotient.map (reverseMap wY) := by
        rw [← hnat, ← Functor.map_comp, Category.assoc]
        rfl

/-- Push forward one ladder square along a natural map. -/
theorem rung_square_push {k k' : ℤ} {X Y X' Y' : C4Complex}
    (x : revRes k ⟶ revRes k') (f : X ⟶ Y) (f' : X' ⟶ Y')
    (wX : X ⟶ X') (wY : Y ⟶ Y') (hnat : f ≫ wY = wX ≫ f')
    (ua : revRes k ⟶ reverseComplex X) (ub : revRes k' ⟶ reverseComplex Y)
    (hsq : homotopyQuotient.map (x ≫ ub) = homotopyQuotient.map (ua ≫ reverseMap f)) :
    homotopyQuotient.map (x ≫ (ub ≫ reverseMap wY)) =
      homotopyQuotient.map ((ua ≫ reverseMap wX) ≫ reverseMap f') := by
  calc homotopyQuotient.map (x ≫ (ub ≫ reverseMap wY))
      = homotopyQuotient.map (x ≫ ub) ≫ homotopyQuotient.map (reverseMap wY) := by
        rw [← Functor.map_comp, Category.assoc]
    _ = homotopyQuotient.map (ua ≫ reverseMap f) ≫ homotopyQuotient.map (reverseMap wY) := by
        rw [hsq]
    _ = homotopyQuotient.map (ua ≫ reverseMap (f ≫ wY)) := by
        rw [← Functor.map_comp, Category.assoc]
        rfl
    _ = homotopyQuotient.map ((ua ≫ reverseMap wX) ≫ reverseMap f') := by
        rw [hnat, Category.assoc]
        rfl

/-! ### The original comparison ladder at five real cuts -/

/-- The canonical reversed adjacent maps of the original five-stage chain. -/
abbrev revX01 := reverseMap (canonicalGlobalFourfold 0).x01
abbrev revX12 := reverseMap (canonicalGlobalFourfold 0).x12
abbrev revX23 := reverseMap (canonicalGlobalFourfold 0).x23
abbrev revX34 := reverseMap (canonicalGlobalFourfold 0).x34

/-- A homotopy-commutative quasi-isomorphism ladder from the five original
shifted resolutions into a whole real diagram, at five real cuts. -/
def HasRevLadder (G : ℝ ⥤ C4Complex) (t0 t1 t2 t3 t4 : ℝ)
    (h01 : t0 ≤ t1) (h12 : t1 ≤ t2) (h23 : t2 ≤ t3) (h34 : t3 ≤ t4) : Prop :=
  ∃ (u0 : revRes 0 ⟶ reverseComplex (G.obj t0))
    (u1 : revRes (0 + 1) ⟶ reverseComplex (G.obj t1))
    (u2 : revRes (0 + 2) ⟶ reverseComplex (G.obj t2))
    (u3 : revRes (0 + 3) ⟶ reverseComplex (G.obj t3))
    (u4 : revRes (0 + 4) ⟶ reverseComplex (G.obj t4)),
    QuasiIso u0 ∧ QuasiIso u1 ∧ QuasiIso u2 ∧ QuasiIso u3 ∧ QuasiIso u4 ∧
    homotopyQuotient.map (revX01 ≫ u1) =
      homotopyQuotient.map (u0 ≫ reverseMap (G.map (homOfLE h01))) ∧
    homotopyQuotient.map (revX12 ≫ u2) =
      homotopyQuotient.map (u1 ≫ reverseMap (G.map (homOfLE h12))) ∧
    homotopyQuotient.map (revX23 ≫ u3) =
      homotopyQuotient.map (u2 ≫ reverseMap (G.map (homOfLE h23))) ∧
    homotopyQuotient.map (revX34 ≫ u4) =
      homotopyQuotient.map (u3 ≫ reverseMap (G.map (homOfLE h34)))

/-- The ladder property is invariant along one zigzag step, in both directions. -/
theorem ObjectwiseQuasiIsoStep.hasRevLadder_iff {A A' : ℝ ⥤ C4Complex}
    (hs : ObjectwiseQuasiIsoStep A A') (t0 t1 t2 t3 t4 : ℝ)
    (h01 : t0 ≤ t1) (h12 : t1 ≤ t2) (h23 : t2 ≤ t3) (h34 : t3 ≤ t4) :
    HasRevLadder A t0 t1 t2 t3 t4 h01 h12 h23 h34 ↔
      HasRevLadder A' t0 t1 t2 t3 t4 h01 h12 h23 h34 := by
  obtain ⟨w, hw⟩ := hs
  constructor
  · rintro ⟨u0, u1, u2, u3, u4, q0, q1, q2, q3, q4, s01, s12, s23, s34⟩
    refine ⟨u0 ≫ reverseMap (w.app t0), u1 ≫ reverseMap (w.app t1),
      u2 ≫ reverseMap (w.app t2), u3 ≫ reverseMap (w.app t3),
      u4 ≫ reverseMap (w.app t4), inferInstance, inferInstance, inferInstance,
      inferInstance, inferInstance, ?_, ?_, ?_, ?_⟩
    · exact rung_square_push _ _ _ _ _ (w.naturality _) _ _ s01
    · exact rung_square_push _ _ _ _ _ (w.naturality _) _ _ s12
    · exact rung_square_push _ _ _ _ _ (w.naturality _) _ _ s23
    · exact rung_square_push _ _ _ _ _ (w.naturality _) _ _ s34
  · rintro ⟨u0', u1', u2', u3', u4', q0, q1, q2, q3, q4, s01, s12, s23, s34⟩
    obtain ⟨u0, p0, e0⟩ := exists_lift_rung (w.app t0) u0'
    obtain ⟨u1, p1, e1⟩ := exists_lift_rung (w.app t1) u1'
    obtain ⟨u2, p2, e2⟩ := exists_lift_rung (w.app t2) u2'
    obtain ⟨u3, p3, e3⟩ := exists_lift_rung (w.app t3) u3'
    obtain ⟨u4, p4, e4⟩ := exists_lift_rung (w.app t4) u4'
    refine ⟨u0, u1, u2, u3, u4, p0, p1, p2, p3, p4, ?_, ?_, ?_, ?_⟩
    · exact rung_square_pull _ _ _ _ _ (w.naturality _) _ _ _ _ e0 e1 s01
    · exact rung_square_pull _ _ _ _ _ (w.naturality _) _ _ _ _ e1 e2 s12
    · exact rung_square_pull _ _ _ _ _ (w.naturality _) _ _ _ _ e2 e3 s23
    · exact rung_square_pull _ _ _ _ _ (w.naturality _) _ _ _ _ e3 e4 s34

/-- The ladder property transfers along arbitrary whole-real zigzags. -/
theorem WeakZigzag.hasRevLadder_iff {A A' : ℝ ⥤ C4Complex} (h : WeakZigzag A A')
    (t0 t1 t2 t3 t4 : ℝ)
    (h01 : t0 ≤ t1) (h12 : t1 ≤ t2) (h23 : t2 ≤ t3) (h34 : t3 ≤ t4) :
    HasRevLadder A t0 t1 t2 t3 t4 h01 h12 h23 h34 ↔
      HasRevLadder A' t0 t1 t2 t3 t4 h01 h12 h23 h34 :=
  WeakZigzag.iff_of_step (fun G => HasRevLadder G t0 t1 t2 t3 t4 h01 h12 h23 h34)
    (fun _ _ hs => hs.hasRevLadder_iff t0 t1 t2 t3 t4 h01 h12 h23 h34) h

#print axioms WeakZigzag.acyclic_of_zero
#print axioms WeakZigzag.hasRevLadder_iff

end C4
