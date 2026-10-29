# C4 project status — S164, 29 October 2026

The algebraic global fourfold obstruction is now proved in Lean. **The paper's full numerical metric theorem is still incomplete.**

## What is proved

- Genuine resolution, homology and augmentation quasi-isomorphism.
- All canonical primary homotopies and both secondary coherences at every integer shift.
- `C4.canonicalGlobalFourfold`: an actual global defining system.
- `C4.GlobalFourfoldDefiningSystem.terminal_not_boundary`: arbitrary-global terminal obstruction with independent maps and fillers, excluding every prospective boundary in the decisive component.
- `C4.realDiagram`: the actual whole-real five-stage functor, correct half-open stages/zero ends, and `realDiagram_shift_five_zero`.

## What remains

Homotopy-equivalence transfer with nonzero adjacent classes; coherent free-quiver cone and derived two-shift; the arbitrary both-lane whole-real replacement/quotient theorem; exact metric definitions and numerical bounds; coefficient-presentation isomorphisms.

Read `formal/C4_COMPLETION_REVIEW.md` for the evidence and exact dependency contracts. The pinned Mathlib cannot infer the unbounded/real-diagram projective model structures invoked in the paper; this is substantial missing infrastructure, not a final cast issue.

## Working rules

Read `AGENTS.md`, `authoritative/STATE.json`, the current proof sources and `sessions/S164/{PROOF,BUILD,CLOSEOUT}.md`. The owner's instruction is to continue toward completion within this conversation. Routine verified checkpoints do not create a fresh-permission requirement. The next handoff is a recovery instruction if work is interrupted or the conversation closes.

Preserve the frozen C4 target and OptionD source. No alternate target, novelty/fit/prior-art/outside-review work or external action. Registry, submission, release and third-party contact remain separately authorised.
