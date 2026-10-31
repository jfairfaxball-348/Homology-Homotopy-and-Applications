# S174 PARTIAL — entire-real algebraic bar indexing (IN PROGRESS, NOT CLOSED)

## Verified entry boundary

The S173 ordinary two-parent merge is `3d10eb7908d47dec9a4c51ae46552520db95bcfa` (parents `d8e26a32e98ea641506c589eef2d6b662c16220a` and `4c7ae600d36526aa50eddf281c0b1dcc7560e9fc`).
The S173 exact PR head passed Lean #41183865211 and integrity #41183865209; independent main push passed Lean #41184125042 and integrity #41184125033. Main was pinned at that merge SHA on S174 entry.

## Actual S174 code and status

`C4/RealShoelaceBarIndices.lean` supplies the true degree-n weak chains of arbitrary length in the two-lane *entire-real* shoelace preorder (including repetitions), coefficient-source vertex, upper-bound transport, injectivity for EVERY fixed simplicial n and EVERY poset arrow, composition of endpoint transport, the n=0 terminal simplex and the sigma indexing type across all n. `C4.lean` imports it into the full pinned build.

First draft `515145f8623a846a3c4caf4dda0c827a75bf2d27`: Lean #41187728007 FAILED in the index-injection proof and dependent-sigma injection attempt; not certified. Corrected source `c4027a5bf1ba6608f32f76c9d6270a13f2bae080`: full pinned OptionD+C4 Lean #41187841286 SUCCESS; repository integrity #41187841303 SUCCESS. The injection theorem at the *dependent sum* level was removed rather than accepted unproved. Confirm final PR-head and eventual main runs separately before further promotion.

## What remains unproved — the required S174 mathematical target

The actual bar total `Q(D)(p)_k = ⨁_{n, q₀≤⋯≤qₙ≤p} D(q₀)_{k-n}` has NOT been built as a chain complex in Lean. Neither the horizontal faces nor internal differential, square-zero, chain-level split-mono endpoint maps, natural augmentation, append-terminal contracting homotopy nor objectwise QuasiIso are compiled. Also still OPEN: strict-interleaving-to-full-shoelace-functor conversion; full-real BOTH-lane weak-equivalence transport; application of S172/S171/S169 to an actual bar replacement; C1 higher transfer; C2 derived cone; C4 numerical metrics.

The index embedding proves injectivity only at the **set of generator indices**. It does NOT prove mono of any chain-complex arrow, nor provide cofibrant objects or quasi-isomorphic augmentations. Preserve arbitrary nonzero acyclic zero-lane replacements and exact full-real quantifiers.

**Session boundary:** This is a verified partial proof step, **not** completed S174. Do NOT advance `STATE.last_completed_session` to S174 or install S175. Do not claim the entire C4 theorem, make external submissions or weaken the frozen first paper. Continue S174's remaining bar construction on subsequent authorization in the active conversation.
