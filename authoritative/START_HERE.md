# C4 current status — 2 November 2026

**The full numerical theorem is not Lean-certified.** Last completed session: **S173**. Active continuation: **S174 — IN PROGRESS, PARTIAL**. This update changes the proof plan and handoff accuracy; it proves no new Lean declaration and does not close S174.

## Verified starting point

Reviewed main: `633634e2e32abe186bde3fc1cf7c26fa3f2e24c3` (ordinary merge of PR #211).
Independent main checks: [pinned C4+OptionD Lean #41290933867](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41290933867) and [integrity #41290933821](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41290933821), both SUCCESS. These certify existing source, not the proposed adapters or final theorem. Re-pin live main at execution.

| Contract | Actual position |
|---|---|
| C0: explicit C4 | Resolution/homology, canonical global defining system, arbitrary-global obstruction, genuine full-real diagram and strict 5/2 witness are certified. Preserve them. |
| C1: direct obstruction transfer | Primary homotopy-equivalence transfer and typed secondary candidates exist. The direct strict-square-zero-to-tertiary-filler implication, nonzero-class identification and full higher transfer remain open. |
| C2: derived distance | Complete quiver cone including terminal edge, coherent two-shift, whole-real localisation/comparison and derived equality remain open. |
| C3a: shoelace replacement and quotient | Full-real indexing/interpretation and conditional acyclic-mono quotient are certified. S174 adds indices, graded terms/maps, candidate boundaries and graded augmentation. Square-zero, chain/functor packaging, contraction/QuasiIso and chain-level mono remain open. |
| C3b: replacement-to-C1 connection | **Explicit open dependency:** the proposed bar's monic maps and QuasiIso do not supply manuscript §5's chain-homotopy inverses. A strengthened construction or a transfer theorem using the available weaker data is required. |
| C4: final statement | Exact metric definitions, coefficient-presentation bridge and full numerical declaration remain open. |

## What to do next

Follow [the executable S174 continuation](NEXT_SESSION_PROMPT.md) and [the single technical ledger](../formal/C4_COMPLETION_STRATEGY.md). First test C3b and the direct contradiction contract, using a small checked adapter to pinned Mathlib HomComplex. Then continue the bar against that contract. The existing S167 general secondary-transfer route is retained as a fallback, not an automatic prerequisite.

The frozen statement remains
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4≤dHI(F,0)≤5/2`
for arbitrary weak-equivalence zigzags of BOTH entire-real lanes. No assumptions or quantifiers are relaxed.

## Read only the relevant records

- [S174 merged partial work and limitations](../sessions/S174/PARTIAL.md).
- [Current working instructions](../AGENTS.md) and [execution protocol](../docs/SESSION_PROTOCOL.md).
- [Bar recipe and its missing downstream connection](../formal/C4_SHOELACE_BAR_CONSTRUCTION.md).
- [Working manuscript](../paper/C4_MANUSCRIPT.md), especially §5 equations (5.3)–(5.4).
- [Older completion review](../formal/C4_COMPLETION_REVIEW.md), as historical diagnosis.

The live fields of STATE and this page govern current status; historical checkpoint entries retain their original dates. An instruction to edit these documents is not an instruction to execute the proof. External-action boundaries remain unchanged.
