# C4 current status — 3 November 2026

**S174 is closed. S175 is active.** Pinned local Lean checks the full theorem over the group algebra as `C4.c4_distance_separation_groupAlgebra`. The hosted integration record is pending.

`C4.c4_distance_separation` proves `dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4 ≤ dHI(F,0) ≤ 5/2`, with axioms `[propext, Classical.choice, Quot.sound]`. Last completed session: **S174** ([closeout](../sessions/S174/CLOSEOUT.md)). Next: **S175**, which finishes the full formalisation over the literal group algebra. Crosswalk: [formal/C4_LEAN_CROSSWALK.md](../formal/C4_LEAN_CROSSWALK.md).

## Verified starting point

- **Main.** `bc06b6011f5556a8ba36ee85167b1fa5c875bc06` is the ordinary two-parent merge of PR #215. Its parents are `783565958c01b36f35fcb01bda3593f328f11525` and the exact head `17ad479114421f0af8d67a1beda1a79a4cd48aea`.
- **Exact-head PR checks.** Lean #41592284384 and integrity #41592284364 both SUCCESS.
- **Merged-main CI.** Lean #41593094820 and integrity #41593094882 both SUCCESS.
- **Superseded draft.** PR #214 is contained in the merge, and GitHub marked it merged.

| Contract | Actual position |
|---|---|
| C0: explicit C4 | Certified: resolution/homology, canonical global defining system, arbitrary-global obstruction, genuine full-real diagram and strict 5/2 witness. |
| C1: obstruction transfer | Certified: weak-data transfer through the acyclic opposite lane (`canonical_no_interleavingLadder`). |
| C2: derived distance | Certified: `derivedInterleavingDistance_eq_one` in every localisation of whole real diagrams at objectwise quasi-isomorphisms. |
| C3: arbitrary BOTH-lane zigzags | Certified: `WeakZigzag`, `WeakZigzag.hasRevLadder_iff`, `strictInterleaving_ge_five_fourths`. |
| C4: final statement | Certified over `C4.B`: `c4_distance_separation`, plus the crosswalk. S175 adds the locally checked `groupAlgebraEquiv` and `c4_distance_separation_groupAlgebra`. |

## What to do next

Verify hosted integration and close out S175. See the [active handoff](NEXT_SESSION_PROMPT.md) and [dependency ledger](../formal/C4_COMPLETION_STRATEGY.md).

## Read only the relevant records

- [S174 closeout](../sessions/S174/CLOSEOUT.md) and [its partial record of evidence and limitations](../sessions/S174/PARTIAL.md).
- [Current working instructions](../AGENTS.md) and [execution protocol](../docs/SESSION_PROTOCOL.md).
- [Working manuscript](../paper/C4_MANUSCRIPT.md), §§1, 4–5 and 7.

The live fields of STATE and this page govern current status; historical checkpoint entries keep their original dates. An instruction to edit these documents is not an instruction to execute the proof. External-action boundaries remain unchanged.
