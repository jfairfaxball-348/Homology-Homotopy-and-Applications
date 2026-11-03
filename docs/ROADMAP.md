# Frozen C4 roadmap — 3 November 2026

**S174 complete; S175 FUTURE, UNEXECUTED. The numerical theorem is Lean-certified over the presentation `C4.B = 𝔽₂[t]/(t⁴)`. The group-algebra restatement is open.**

The exact first-paper target remains `dCohI=1/2 < dIHC=1 < 5/4≤dHI≤5/2` for the five-stage entire-real diagram over F₂[C₄], allowing arbitrary whole-diagram weak-equivalence zigzags of BOTH lanes.

Follow the [single dependency ledger](../formal/C4_COMPLETION_STRATEGY.md). C1–C3 and the final declaration `C4.c4_distance_separation` are certified (PR #215, ordinary merge `bc06b60`, hosted PR and merged-main CI). S175 finishes the formalisation:
1. Prove a Lean `RingEquiv` between `C4.B` and the group algebra `MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))`, with `t ↦ 1 + g`.
2. Restate the six-conjunct theorem faithfully over group-algebra modules.
3. Audit each definition against the manuscript and align the manuscript text with the certified routes.
4. Record the final certificate after hosted CI.

These are connected proof dependencies, not one-helper session quotas. Existing certified work is retained; all-real and BOTH-lane hypotheses are unchanged. This plan adds none of the following: a new candidate, distance optimisation, a novelty/HHA-fit/prior-art/outside-review phase, or OptionD development. Publication, registry, submission and third-party contact remain separately owner-controlled.

[Current status](../authoritative/START_HERE.md) · [S175 prompt](../authoritative/NEXT_SESSION_PROMPT.md) · [Execution protocol](SESSION_PROTOCOL.md).
