# C4 current status — 3 November 2026

**S174 is closed. The frozen theorem is one hosted-checked Lean declaration over the presentation `C4.B = 𝔽₂[t]/(t⁴)`. S175 is FUTURE, UNEXECUTED.**

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
| C4: final statement | Certified over `C4.B`: `c4_distance_separation`, plus the crosswalk. Open (S175): a Lean `RingEquiv` `C4.B ≃+* 𝔽₂[C₄]` and the restatement over group-algebra modules. |

## What to do next

S175 starts only on a separate owner instruction. It then follows [the S175 prompt](NEXT_SESSION_PROMPT.md) and [the single technical ledger](../formal/C4_COMPLETION_STRATEGY.md):
1. Prove the presentation `RingEquiv`.
2. Restate the theorem faithfully over the group algebra.
3. Audit definition faithfulness and align the manuscript.
4. Record the final certificate after hosted CI.

The frozen statement remains
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4≤dHI(F,0)≤5/2`
for arbitrary weak-equivalence zigzags of BOTH entire-real lanes. No assumptions or quantifiers are relaxed.

## Read only the relevant records

- [S174 closeout](../sessions/S174/CLOSEOUT.md) and [its partial record of evidence and limitations](../sessions/S174/PARTIAL.md).
- [Current working instructions](../AGENTS.md) and [execution protocol](../docs/SESSION_PROTOCOL.md).
- [Working manuscript](../paper/C4_MANUSCRIPT.md), §§1, 4–5 and 7.

The live fields of STATE and this page govern current status; historical checkpoint entries keep their original dates. An instruction to edit these documents is not an instruction to execute the proof. External-action boundaries remain unchanged.
