# S176 closeout — Palomar statement package

The owner invoked S176 on 3 November 2026 and chose the Apache License 2.0 for the repository. S176 prepared a Palomar package for the frozen theorem and checked it. The owner later approved the repository integration recorded below. **Nothing was submitted to Palomar, arXiv or HHA.** The owner uploads and submits the candidate commit.

## The package

- **`Challenge.lean`** (Mathlib only; 358 lines, 16.6 KiB) states `C4Separation.distance_separation` over `MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))`. It covers:
  - `d_CohI(F,0) = 1/2 < d_IHC(F,0) = 1 < 5/4 ≤ d_HI(F,0) ≤ 5/2`;
  - every localisation of whole real diagrams at objectwise quasi-isomorphisms;
  - arbitrary zigzags of both diagrams.

  Each stage `P[s]` is `𝔽₂[C₄]` in degrees `n ≥ s` and zero below. Its differentials are `t` or `t³` and its stage maps are `1` or `t²`, according to parity, with `t = 1 + g`.
- **Solution side.** `Solution.lean` proves the theorem through:
  - `C4/Palomar/Statement.lean`, a verbatim copy of the Challenge definitions guarded by `scripts/check_palomar_statement.py`;
  - `C4/Palomar/Bridge.lean`, which gives the diagram and zero-diagram isomorphisms, the distance conversions and isomorphism invariance, then transfers `C4.c4_distance_separation_groupAlgebra`.
- **Comparator targets.** `comparator.json` lists `C4Separation.distance_separation`, `C4Separation.stageD_comp_stageD` and `C4Separation.xComp_comm`.
  - The two lemmas say that d² = 0 and that the stage maps are chain maps. They are proved inside the Challenge.
  - They are listed because Comparator compares the full values of non-target constants. A first run rejected the tactic proof term of `C4Separation.xComp_stageD`, which differs between modules.
- **Metadata.** `formalization.yaml` v0.4 contains:
  - author and maintainer John Fairfax-Ball;
  - arXiv math.AT and math.CT, and MSC 55N31, 18G80, 55U35, 20J06 and 55U15;
  - an original-proof source, with novelty stated as unknown;
  - Blumberg–Lesnick and Kuribayashi–Naito–Wakatsuki–Yamaguchi as background sources, verified against Crossref;
  - an AI-agent disclosure and `agent-reviewed` status, with no human expert review recorded.
- **Licence and tooling.** `LICENSE` is the template's Apache-2.0 text, which licensee detects exactly. The PalomarTemplate scripts are pinned at `2891de4c48955af824969a263d31b25e7a9a1406`, and CI runs in `.github/workflows/palomar-preparation.yml`.
- **Requirements used.** PalomarPolicy `28bd48b9b71bbb2a82c718ce761d5a4220ef8e60`, PalomarSubmission `14aa8d6b3c2f14a8540605e37144560b9a00e7e7` and Lean minimum `v4.35.0-rc2`. The repository had no registry record, so this is a new submission.

## Evidence

| Check | Result |
|---|---|
| Entry main | `886dfc03550c31fc4df304da6fdf71b48af43346`, tree `fa5caf3b3066a5197e9855803912e8b7371cfc8d`; baseline build 9017 jobs |
| Candidate commit | `f35677b710df2de38b2ef237b40ca4ad7ff7298b`, tree `94f1adffd95588fc8496e574b86de83ab226c47c` ([PR #220](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/pull/220)) |
| Local pinned build | `lake build`: 9021 jobs. `lake build Challenge`: only the deliberate `sorry` warning. |
| Printed axioms | `[propext, Classical.choice, Quot.sound]` for all three compared theorems |
| Local `./scripts/verify-comparator.sh` | "Your solution is okay!": con-ron accepted 25823 declarations; NanoDa and the Lean kernel accepted (bubblewrap 0.9.0) |
| Clean clone of the candidate SHA | Same build, Challenge build, source checks and Comparator result. The tree was unchanged afterwards. |
| Metadata and licence | `ruby scripts/validate-formalization.rb`: no TEMPLATE values. licensee 10.0.0: `["Apache-2.0"]`, exact, 100. |
| Exact-head PR CI | All success:<br>• Lean #41617793221<br>• repository integrity #41617793300<br>• Palomar package #41617793381, whose Comparator job 125855481148 shows con-ron, NanoDa and the Lean kernel accepting<br>• push runs Lean #41617739878 and integrity #41617739881 |
| Ordinary merge | `5cd80cace662cda665c6184644bc2eeb0cc3e341`, parents `886dfc03550c31fc4df304da6fdf71b48af43346` and `f35677b710df2de38b2ef237b40ca4ad7ff7298b`. Its tree is the candidate tree. |
| Merged-main CI | Lean #41630243235: success. Repository integrity #41630242696: success. Palomar package #41630243375: metadata and licence job 125897653805 success; Comparator job 125897654316 success, with con-ron (25823 declarations), NanoDa and the Lean kernel accepting and "Your solution is okay!". |
| Not run | Palomar's reusable preflight (`PalomarSubmission/.github/workflows/submission.yml`). It selects Namespace Cloud runner labels that this repository cannot use. The template-equivalent hosted checks above replace it. |

## Values for the Palomar form

The owner enters these after deciding to submit:

| Field | Value |
|---|---|
| Repository | `jfairfaxball-348/Homology-Homotopy-and-Applications` |
| Commit | `f35677b710df2de38b2ef237b40ca4ad7ff7298b` (reachable from `main` as the second parent of `5cd80ca`) |
| Project path | blank (repository root) |
| Comparator configuration | `comparator.json` |
| Metadata path | blank (default `formalization.yaml`) |
| Authorisation | responsible author or maintainer |
| Existing Palomar ID | none (new submission) |

Before submitting, the owner should confirm the human-authored metadata: the author name, the AI disclosure and the review status.

## NEXT_SESSION_HANDOFF

- Next session is S177 (FUTURE, UNEXECUTED).
- Canonical prompt is authoritative/NEXT_SESSION_PROMPT.md.
- S177 acts only on Palomar findings or package changes that the owner supplies. A separate owner instruction starts it. The owner alone submits, authenticates and registers.
