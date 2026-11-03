# Homology, Homotopy and Applications — C4

We are formalising one frozen five-stage real persistence example over the cyclic-four group algebra. The internally written target is

\[
d_{\mathrm{CohI}}=\tfrac12 < d_{\mathrm{IHC}}=1 < \tfrac54\le d_{\mathrm{HI}}\le\tfrac52,
\]

allowing arbitrary objectwise quasi-isomorphism zigzags of **both entire real-indexed diagrams**.

**S175 completed the Lean formalisation.** `C4.c4_distance_separation_groupAlgebra` proves the frozen separation over the literal group algebra. `C4.groupAlgebraEquiv` identifies the truncated presentation with it via `t = 1 + g`. The full local build and hosted checks passed.

The group-algebra declaration uses the same genuine real diagram, all localisations and both replacement lanes. The [crosswalk](formal/C4_LEAN_CROSSWALK.md) records its correspondence with the manuscript.

[Current status](authoritative/START_HERE.md) · [Current dependency ledger](formal/C4_COMPLETION_STRATEGY.md) · [Proof plan](formal/C4_FORMALIZATION_PLAN.md) · [Working manuscript](paper/C4_MANUSCRIPT.md) · [Lean crosswalk](formal/C4_LEAN_CROSSWALK.md) · [S175 closeout](sessions/S175/CLOSEOUT.md) · [S176 handoff](authoritative/NEXT_SESSION_PROMPT.md)

Continuous owner authorisation applies within active work; routine checkpoints must not become one-lemma permission loops.

## Palomar statement package

The repository root is a Lean project laid out for the [Palomar](https://palomar-registry.org/) registry. Submission and registration are the owner's decisions.

- [`Challenge.lean`](Challenge.lean) is the statement a reader audits. It imports only Mathlib and defines everything the theorem uses:
  - the group algebra `kC4 = MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))` and `t = 1 + g`;
  - the stages `P[s]` of the periodic free resolution, `X s`, with stage maps `xMap s`;
  - the five-stage diagram `F` and the zero diagram;
  - the three distances `homologyDistance`, `derivedDistance L` and `homotopyDistance`.
- [`Solution.lean`](Solution.lean) proves the same declarations from the certified library. [`C4/Palomar/Statement.lean`](C4/Palomar/Statement.lean) is a verbatim copy of the Challenge definitions, and `scripts/check_palomar_statement.py` enforces this. [`C4/Palomar/Bridge.lean`](C4/Palomar/Bridge.lean) proves that the statement diagram is isomorphic to `C4.groupAlgebraDiagram`. It also proves that each statement distance equals the library distance and is invariant under isomorphism. It then transfers `C4.c4_distance_separation_groupAlgebra`.
- [`comparator.json`](comparator.json) lists three theorems. Their printed axioms are `[propext, Classical.choice, Quot.sound]`.
  - `C4Separation.distance_separation`: for the diagram `F` and the zero diagram, `d_CohI = 1/2 < d_IHC = 1 < 5/4 ≤ d_HI ≤ 5/2`. Here `d_IHC = 1` holds in every localisation of whole real diagrams at the objectwise quasi-isomorphisms. `d_HI` allows arbitrary objectwise quasi-isomorphism zigzags of both diagrams.
  - `C4Separation.stageD_comp_stageD`: the differentials of each `P[s]` square to zero.
  - `C4Separation.xComp_comm`: the stage maps commute with the differentials.

  The two well-formedness lemmas are proved inside the Challenge. They are listed so that Comparator compares their statements; proof terms produced by tactics in a different module need not be identical.
- [`formalization.yaml`](formalization.yaml) gives provenance, scope, classification, authorship, the AI-assistance disclosure and the review status. AI agents produced the mathematics and the Lean development under the owner's direction. No independent human expert review is recorded. Novelty has not been assessed.

The Palomar checks, run from the repository root, need Linux, Ruby, Python 3 and `bwrap`. The three Palomar scripts are copied from `PalomarRegistry/PalomarTemplate` at `2891de4c48955af824969a263d31b25e7a9a1406`.

```sh
python3 scripts/check-lean-sources.py
python3 scripts/check_palomar_statement.py
ruby scripts/validate-formalization.rb
./scripts/verify-comparator.sh
```

## Licence

This repository snapshot is licensed under the [Apache License 2.0](LICENSE). Cited papers and Lean dependencies keep their own licences.

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
