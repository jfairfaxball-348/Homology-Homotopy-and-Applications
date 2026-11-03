# Homology, Homotopy and Applications — C4

We are formalising one frozen five-stage real persistence example over the cyclic-four group algebra. The internally written target is

\[
d_{\mathrm{CohI}}=\tfrac12 < d_{\mathrm{IHC}}=1 < \tfrac54\le d_{\mathrm{HI}}\le\tfrac52,
\]

allowing arbitrary objectwise quasi-isomorphism zigzags of **both entire real-indexed diagrams**.

**S174 is completed and S175 is active.** Pinned local Lean checks `C4.c4_distance_separation_groupAlgebra` and the coefficient presentation `C4.groupAlgebraEquiv`. Hosted integration and S175 closeout are pending.

The group-algebra declaration uses the same genuine real diagram, all localisations and both replacement lanes. The [crosswalk](formal/C4_LEAN_CROSSWALK.md) records its correspondence with the manuscript.

[Current status](authoritative/START_HERE.md) · [Current dependency ledger](formal/C4_COMPLETION_STRATEGY.md) · [Proof plan](formal/C4_FORMALIZATION_PLAN.md) · [Working manuscript](paper/C4_MANUSCRIPT.md) · [Lean crosswalk](formal/C4_LEAN_CROSSWALK.md) · [S174 closeout](sessions/S174/CLOSEOUT.md) · [S175 prompt](authoritative/NEXT_SESSION_PROMPT.md)

Continuous owner authorisation applies within active work; routine checkpoints must not become one-lemma permission loops.

## Build

Lean `v4.35.0-rc2`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`, pinned by the committed manifest.

```sh
lake exe cache get
lake build
python3 scripts/validate_repository.py
python3 scripts/session_handoff.py --check
python3 -m unittest discover -s scripts -p 'test_*.py'
```

The default build checks C4 and the preserved OptionD certificates. Lean prints the axioms of the final declarations in the build log.

## Scope and history

Only the frozen C4 first-paper proof and its matching manuscript are active. Earlier research and OptionD certificates are retained in their session/source records; they are not additional active targets. No novelty, journal-fit, prior-art or outside-review phase is on the active roadmap. Registration, submission, public release and third-party contact require separate owner instructions.
