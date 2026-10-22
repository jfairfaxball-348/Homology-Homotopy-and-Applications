# S132 ADVERSARIAL — 22 October 2026

1. Strict commute vs homotopy pushout: the functor only applies to actual continuous squares. The opposite-birth two-vertex square has a terminal interval but a disconnected punctured homotopy pushout, so no general cocartesian axiom can be deduced from this construction.
2. Point-set cofiber vs derived cofiber: ordinary quotient fails to be homotopy invariant for arbitrary maps unless requisite cofibration/derived replacements are justified. New proof deliberately NEVER rewrites one as the other.
3. Empty face vs empty realisation: a finite complex always includes ∅, but the empty-face-only complex has no barycentric sum-one points. This is not a Lean-certified statement yet.
4. Radius boundaries: a short graph edge is absent at STRICT r=a and appears in (a,b], including r=b; negative radius does NOT erase born singleton points. S129 erratum remains binding. The δ sample needs interior eta, not r=a.
5. D6 universality: no simultaneous relative simplicial approximation/flag construction/common vertex assignment across arbitrary f,g has been certified; no outside-plateau zigzag or both interleaving identities. No theorem asserting dHI gap or D6/D7/D8 follows.
6. Lean scratch issue: the first attaching-arrow extension at 4da4d99 failed #39833437132, as simp left the arrow objects opaque. An explicit `change` to the exact continuous-map equality repaired it; updated a813d406 passes #39833792648. This failure did not affect the already green core cofiber functor #39833031041.
