# Homology, Homotopy and Applications — C4

We are formalising one frozen five-stage real persistence example over the cyclic-four group algebra. The internally written target is

\[
d_{\mathrm{CohI}}=\tfrac12 < d_{\mathrm{IHC}}=1 < \tfrac54\le d_{\mathrm{HI}}\le\tfrac52,
\]

allowing arbitrary objectwise quasi-isomorphism zigzags of **both entire real-indexed diagrams**.

**The full numerical theorem is not yet formalised.** S164 proves the global fourfold obstruction and constructs the actual real diagram; substantial transfer and localisation/replacement proofs remain.

| Lean-certified after S164 | Still required for the paper theorem |
|---|---|
| Resolution, homology and augmentation quasi-isomorphism | Coefficient-presentation isomorphisms |
| Canonical global defining system, both secondary coherences | Transfer through general homotopy equivalences and nonzero class identification |
| Arbitrary-global terminal nonboundary, independent maps/fillers | Whole free-quiver cone, coherent derived two-shift and real comparison |
| Actual full-real five-stage functor and literal five-shift vanishing | Arbitrary both-lane real replacements/quotient and exact numerical metrics |

[Current status](authoritative/START_HERE.md) · [Completion review](formal/C4_COMPLETION_REVIEW.md) · [Proof plan](formal/C4_FORMALIZATION_PLAN.md) · [Working manuscript](paper/C4_MANUSCRIPT.md) · [S164 evidence](sessions/S164/PROOF.md) · [Recovery handoff](authoritative/NEXT_SESSION_PROMPT.md)

The review explains the earlier cast/representation churn and the missing categorical infrastructure. Continuous owner authorisation applies within active work; routine checkpoints must not become one-lemma permission loops.

## Build

Lean `v4.35.0-rc2`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`, pinned by the committed manifest.

```sh
lake exe cache get
lake build
python3 scripts/validate_repository.py
python3 scripts/session_handoff.py --check
```

The default build checks both C4 and preserved OptionD certificates. A green build verifies the declarations present in the repository; it does not imply that the final metric theorem has been implemented.

## Scope and history

Only the frozen C4 first-paper proof and its matching manuscript are active. Earlier research and OptionD certificates are retained in their session/source records; they are not additional active targets. No novelty, journal-fit, prior-art or outside-review phase is on the active roadmap. Registration, submission, public release and third-party contact require separate owner instructions.
