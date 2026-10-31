module
public import C4.RealShoelacePoset

@[expose] public section

/-!
# S173: strict interleavings from genuine two-lane shoelace diagrams

A functor on the *whole* two-lane real shoelace preorder determines
two full-real diagrams and their exact strict interleaving crossings.
This is the index-category contract for a possible projective bar/cellular
replacement. It does not assume a model category instance or construct a
cofibrant replacement.
-/

namespace C4
open CategoryTheory CategoryTheory.Limits

/-- The entire left lane of an arbitrary shoelace diagram. -/
noncomputable def realShoelaceLeftRestriction
    {ε : ℝ} {hε : 0 ≤ ε}
    (H : RealShoelacePoint ε hε ⥤ C4Complex) : ℝ ⥤ C4Complex :=
  realShoelaceLeftInclusion ε hε ⋙ H

/-- The entire right lane of an arbitrary shoelace diagram. -/
noncomputable def realShoelaceRightRestriction
    {ε : ℝ} {hε : 0 ≤ ε}
    (H : RealShoelacePoint ε hε ⥤ C4Complex) : ℝ ⥤ C4Complex :=
  realShoelaceRightInclusion ε hε ⋙ H

/-- The actual forward crossing family is natural over every real arrow. -/
noncomputable def realShoelaceForward
    {ε : ℝ} {hε : 0 ≤ ε}
    (H : RealShoelacePoint ε hε ⥤ C4Complex) :
    realShoelaceLeftRestriction H ⟶
      translateDiagram (realShoelaceRightRestriction H) ε where
  app u := H.map (homOfLE (realShoelace_forward_le ε hε u))
  naturality := by
    intro u v f
    dsimp [realShoelaceLeftRestriction, realShoelaceRightRestriction,
      translateDiagram, realTranslation]
    rw [← H.map_comp, ← H.map_comp]
    congr 1

/-- The actual backward crossing family is natural over every real arrow. -/
noncomputable def realShoelaceBackward
    {ε : ℝ} {hε : 0 ≤ ε}
    (H : RealShoelacePoint ε hε ⥤ C4Complex) :
    realShoelaceRightRestriction H ⟶
      translateDiagram (realShoelaceLeftRestriction H) ε where
  app u := H.map (homOfLE (realShoelace_backward_le ε hε u))
  naturality := by
    intro u v f
    dsimp [realShoelaceLeftRestriction, realShoelaceRightRestriction,
      translateDiagram, realTranslation]
    rw [← H.map_comp, ← H.map_comp]
    congr 1

/-- From ANY functor on the entire shoelace index category, recover a
true both-lane strict epsilon interleaving, including both exact
composite laws for every real u. -/
noncomputable def realShoelaceInterleaving
    {ε : ℝ} {hε : 0 ≤ ε}
    (H : RealShoelacePoint ε hε ⥤ C4Complex) :
    StrictRealInterleaving
      (realShoelaceLeftRestriction H)
      (realShoelaceRightRestriction H) ε hε where
  forward := realShoelaceForward H
  backward := realShoelaceBackward H
  forward_backward := by
    intro u
    dsimp [realShoelaceForward, realShoelaceBackward,
      realShoelaceLeftRestriction, realShoelaceRightRestriction,
      translateDiagram, realTranslation]
    rw [← H.map_comp]
    congr 1
  backward_forward := by
    intro u
    dsimp [realShoelaceForward, realShoelaceBackward,
      realShoelaceLeftRestriction, realShoelaceRightRestriction,
      translateDiagram, realTranslation]
    rw [← H.map_comp]
    congr 1

/-- The existing whole-real cokernel construction works on the true
shoelace index category, provided an independent replacement theorem
supplies acyclicity and the required pointwise mono crossings. -/
theorem realShoelacePoset_quotient_objectwise_quasiIso
    {ε : ℝ} {hε : 0 ≤ ε}
    (H : RealShoelacePoint ε hε ⥤ C4Complex)
    (hacyclic : ∀ u : ℝ,
      (H.obj (realShoelaceRight ε hε u)).Acyclic)
    (hmono : ∀ u : ℝ, Mono
      (H.map (homOfLE (realShoelace_backward_le ε hε u)))) :
    ∀ u : ℝ, QuasiIso
      ((cokernel.π (realShoelaceInterleaving H).backward).app u) := by
  apply realShoelaceCokernel_projection_objectwise_quasiIso
    (realShoelaceInterleaving H)
  · exact hacyclic
  · intro u
    simpa only [realShoelaceInterleaving, realShoelaceBackward] using hmono u

end C4
