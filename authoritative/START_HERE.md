# C4 current status — 2 November 2026

**The full numerical theorem is not Lean-certified.** Last completed session: **S173**. Active continuation: **S174 — IN PROGRESS, PARTIAL**. The current continuation certifies the direct transfer-word boundary calculus and the original-side K-projectivity/comparison contract. It does not close S174.

## Verified starting point

Entry main: `f962b97dbf6d8ffd314c0ce09e98bc8a3dcb3235` (ordinary merge of documentation PR #212).
New checked proof source: `76120036d64ae3200c78ec9b6742deeeffcc38f0`; exact PR [Lean #41478721288](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41478721288) and [integrity #41478721382](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41478721382), both SUCCESS. Final integration checks are separate; see the active partial record and PR #213.

| Contract | Actual position |
|---|---|
| C0: explicit C4 | Resolution/homology, canonical global defining system, arbitrary-global obstruction, genuine full-real diagram and strict 5/2 witness are certified. Preserve them. |
| C1: direct obstruction transfer | Actual one/two/three-cut HomComplex boundary equations and a constructed primary homotopy are checked. The original-system tertiary-filler package, adjacent nonzero-class identification and final contradiction remain open. |
| C2: derived distance | Complete quiver cone including terminal edge, coherent two-shift, whole-real localisation/comparison and derived equality remain open. |
| C3a: shoelace replacement and quotient | Full-real indexing/interpretation and conditional acyclic-mono quotient are certified. S174 adds indices, graded terms/maps, candidate boundaries and graded augmentation. Square-zero, chain/functor packaging, contraction/QuasiIso and chain-level mono remain open. |
| C3b: replacement-to-C1 connection | The original shifted resolutions are proved K-projective. A quasi-isomorphism from a K-projective replacement supplies the comparison homotopies. Producing such compatible replacements with strict zeros and adjacent classes remains open; the bar has not supplied this. |
| C4: final statement | Exact metric definitions, coefficient-presentation bridge and full numerical declaration remain open. |

## What to do next

Follow [the executable S174 continuation](NEXT_SESSION_PROMPT.md) and [the single technical ledger](../formal/C4_COMPLETION_STRATEGY.md). First finish the C3b producer and the original-system obstruction bridge, reusing the checked `DirectTransfer` adapter and word equations. Then continue the bar against that contract. The existing S167 general secondary-transfer route is retained as a fallback, not an automatic prerequisite.

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
