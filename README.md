# Homology, Homotopy and Applications — C4

We are formalising one frozen five-stage real persistence example over the cyclic-four group algebra. The internally written target is

\[
d_{\mathrm{CohI}}=\tfrac12 < d_{\mathrm{IHC}}=1 < \tfrac54\le d_{\mathrm{HI}}\le\tfrac52,
\]

allowing arbitrary objectwise quasi-isomorphism zigzags of **both entire real-indexed diagrams**.

**S174 is completed; S175 is FUTURE, UNEXECUTED.** The frozen numerical theorem is the Lean declaration `C4.c4_distance_separation`. It is stated over `C4.B = 𝔽₂[t]/(t⁴)`, the presentation of 𝔽₂[C₄] via `t = 1 + g`. It passed hosted exact-head PR and merged-main CI and uses only the standard axioms. The formal ring isomorphism with the group algebra and the restatement over it remain; they are S175's job.

| Certified in Lean (hosted CI) | Remaining for the full formalisation (S175) |
|---|---|
| Resolution, homology, augmentation, canonical global defining system, arbitrary-global terminal obstruction | `RingEquiv` `C4.B ≃+* MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))` with `t ↦ 1 + g` |
| Weak-data obstruction transfer, BOTH-lane zigzags, `5/4 ≤ dHI(F,0) ≤ 5/2` | Faithful restatement of the six conjuncts over group-algebra modules |
| `dCohI(F,0) = 1/2`; `dIHC(F,0) = 1` in every localisation of whole real diagrams | Definition-faithfulness audit and manuscript alignment of the superseded §§4–5 route text |
| Combined declaration and manuscript-to-Lean crosswalk | Final certificate record after hosted CI |

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

The default build checks both C4 and preserved OptionD certificates. A green build verifies the declarations present in the repository, including `C4.c4_distance_separation`; it does not by itself certify the group-algebra restatement, which is still open.

## Scope and history

Only the frozen C4 first-paper proof and its matching manuscript are active. Earlier research and OptionD certificates are retained in their session/source records; they are not additional active targets. No novelty, journal-fit, prior-art or outside-review phase is on the active roadmap. Registration, submission, public release and third-party contact require separate owner instructions.
