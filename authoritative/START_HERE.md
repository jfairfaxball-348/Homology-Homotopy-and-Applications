# C4 current status — 2 November 2026

**The full numerical theorem is not Lean-certified.** Last completed session: **S173**. Active continuation: **S174 — IN PROGRESS, PARTIAL**. This continuation certifies, in a local pinned build, the strict homotopy-interleaving bounds `5/4 ≤ dHI(F,0) ≤ 5/2` over arbitrary whole-real zigzags of BOTH lanes, and `dCohI(F,0) = 1/2`. It does not close S174: `dIHC(F,0) = 1`, the combined final declaration and hosted CI/merge remain.

## Verified starting point

Entry main: `783565958c01b36f35fcb01bda3593f328f11525` (PR #213 merge; merged-main Lean #41480400099 and integrity #41480400038 SUCCESS). Working branch `ccr-efb93145-frhiz0` contains draft PR #214's branch (repaired) plus the new proofs. Local pinned `lake build` (C4 + preserved OptionD) SUCCESS at `fc42de8`; hosted exact-head PR checks and merged-main CI have not yet been run for it.

| Contract | Actual position |
|---|---|
| C0: explicit C4 | Resolution/homology, canonical global defining system, arbitrary-global obstruction, genuine full-real diagram and strict 5/2 witness are certified. Preserve them. |
| C1: obstruction transfer | Certified (local) in weak-data form: an interleaving with acyclic opposite lane and a quasi-isomorphism ladder from the K-projective originals yields an original-system tertiary filler, contradicting `no_tertiary_filler` (`canonical_no_interleavingLadder`). |
| C2: derived distance | Open: derived interleavings in the localisation of whole real diagrams, natural cone resolution with the canonical h/z nullhomotopy (terminal edge included), homotopy invariance, evaluation lower bound. |
| C3: arbitrary BOTH-lane zigzags | Certified (local): `WeakZigzag`, acyclicity of zero replacements, ladder transport both ways, `strictInterleaving_ge_five_fourths`. The bar/quotient route is preserved but no longer needed. |
| C4: final statement | Partial: `homotopyInterleavingDistance` bounds and `homologyInterleavingDistance … = 1/2` certified (local). Combined declaration, presentation and manuscript crosswalks open. |

## What to do next

Follow [the executable S174 continuation](NEXT_SESSION_PROMPT.md) and [the single technical ledger](../formal/C4_COMPLETION_STRATEGY.md): formalise C2 (`dIHC(F,0)=1`), then the single final declaration and crosswalk, then hosted PR/main integration.

The frozen statement remains
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4≤dHI(F,0)≤5/2`
for arbitrary weak-equivalence zigzags of BOTH entire-real lanes. No assumptions or quantifiers are relaxed.

## Read only the relevant records

- [S174 merged and branch partial work, evidence and limitations](../sessions/S174/PARTIAL.md).
- [Current working instructions](../AGENTS.md) and [execution protocol](../docs/SESSION_PROTOCOL.md).
- [Working manuscript](../paper/C4_MANUSCRIPT.md), §§4–5.
- [Bar recipe](../formal/C4_SHOELACE_BAR_CONSTRUCTION.md), now off the critical path.

The live fields of STATE and this page govern current status; historical checkpoint entries retain their original dates. An instruction to edit these documents is not an instruction to execute the proof. External-action boundaries remain unchanged.
