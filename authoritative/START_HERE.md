# C4 current status — 3 November 2026

**S175 is closed and the frozen C4 theorem is Lean-certified over the literal group algebra.** The final declaration is `C4.c4_distance_separation_groupAlgebra`. It proves `dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4 ≤ dHI(F,0) ≤ 5/2`, with axioms `[propext, Classical.choice, Quot.sound]`.

The presentation is `C4.groupAlgebraEquiv` with `t ↦ 1 + g`. See the [S175 closeout](../sessions/S175/CLOSEOUT.md) and [crosswalk](../formal/C4_LEAN_CROSSWALK.md).

## Verified integration

[PR #217](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/pull/217) passed Lean #41596661062 and integrity #41596661058 at the exact proof head. The ordinary two-parent merge `274216e07e1bceda8c31945beb71921f342bb566` passed independent Lean #41597179634 and integrity #41597179773.

| Contract | Actual position |
|---|---|
| C0: explicit C4 | Certified: resolution/homology, canonical global defining system, arbitrary-global obstruction, genuine full-real diagram and strict 5/2 witness. |
| C1: obstruction transfer | Certified: weak-data transfer through the acyclic opposite lane (`canonical_no_interleavingLadder`). |
| C2: derived distance | Certified: `derivedInterleavingDistance_eq_one` in every localisation of whole real diagrams at objectwise quasi-isomorphisms. |
| C3: arbitrary BOTH-lane zigzags | Certified: `WeakZigzag`, `WeakZigzag.hasRevLadder_iff`, `strictInterleaving_ge_five_fourths`. |
| C4: final statement | Certified over `C4.B`: `c4_distance_separation`, plus the crosswalk. S175 certifies the same statement over 𝔽₂[C₄] as `C4.c4_distance_separation_groupAlgebra`. |

## What to do next

The first-paper proof is complete. [S176 — Palomar register preparation](NEXT_SESSION_PROMPT.md) starts on a separate owner instruction. It checks the requirements, runs the available preflight and prepares a clean commit for the owner to upload.

## Read only the relevant records

- [S175 closeout](../sessions/S175/CLOSEOUT.md) and [S174 presentation theorem](../sessions/S174/CLOSEOUT.md).
- [Current working instructions](../AGENTS.md) and [execution protocol](../docs/SESSION_PROTOCOL.md).
- [Working manuscript](../paper/C4_MANUSCRIPT.md), §§1, 4–5 and 7.

The live fields of STATE and this page govern current status; historical checkpoint entries keep their original dates. An instruction to edit these documents is not an instruction to execute the proof. External-action boundaries remain unchanged.
