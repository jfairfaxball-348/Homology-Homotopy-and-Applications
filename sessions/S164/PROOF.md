# S164 — completion review and global obstruction

Entry main `9c813a7c9f43c7146193e7ab3cef2258c1e32927`, tree `f0bc438745a877ba18d570fd7c4bebaabc7a90d6`, is PR #196's ordinary two-parent merge. Its parents are `ae8d6ad7ec285135e0887d93ae2e7a901175fe59` and `628fd8f580cb13a2e7bb6e301292caa04bbdbd4e`; merged-main pinned Lean #40909137956 and integrity #40909137831 independently reported SUCCESS.

## Representation repair

`globalXSquaredNullHomotopy` now explicitly retains its `globalHFamily` data. `relabelHomotopy` changes endpoints by proving the new commutativity condition; it never casts the component family. The three canonical primary component lemmas then reduce directly, rather than attempting to eliminate dependent equality recursors later.

Both `canonicalZ03_coherence` and `canonicalZ14_coherence` prove the genuine secondary equations against those primary objects, including intermediate and final shift casts. `canonicalGlobalFourfold s` supplies every field of the actual global structure for all integers s. No assumed nonemptiness or separately chosen primary families are substituted.

## Universal global obstruction

The old local interface reused a primary right-hand side and terminal factors. The stronger coefficient lemmas `independent_terminal_residue` and `independent_terminal_not_boundary` do not do so. Only the first primary and first secondary equations are needed.

`C4/GlobalObstruction.lean` normalizes arbitrary maps between regular terms, not only endomorphisms in one chosen degree. It extracts the adjacent cocycle equation from the true chain-map square, the primary equation from the actual Mathlib homotopy, and the secondary equation from the actual global coherence. All arithmetic index reindexings are proved using data-preserving normalization lemmas.

For ANY `q : GlobalFourfoldDefiningSystem s`, `q.terminal_residue` proves residue one of its actual terminal component at degree s+2. `boundary_residue_zero` proves residue zero for arbitrary components of a possible tertiary filler. Consequently `q.terminal_not_boundary` excludes every such boundary. It quantifies over the genuine global structure and unrestricted tertiary components; it does not equate any independently chosen adjacent map or filler. This certifies the decisive global obstruction component; it is not a homotopy-equivalence transfer theorem.

## Actual full-real diagram

`C4/RealDiagram.lean` composes a genuine six-arrow chain (zero, P[0],...,P[4], zero) with a monotone real clock. It proves the exact objects on all five half-open intervals and both zero tails. All arrows spanning five real units are literally zero, so the actual natural five-shift transformation vanishes. This covers every real index, not just selected cuts.

## Remaining theorem boundary

The full headline metric inequality is not certified. General homotopy transfer/nonzero generator identification, the coherent free-quiver derived two-shift, arbitrary whole-real both-lane replacements/quotients, the group-algebra presentation and the precise metric relations remain to be implemented. A compiled diagnostic confirms missing ready-to-use model-category instances, not an impossibility theorem. See `formal/C4_COMPLETION_REVIEW.md`.
