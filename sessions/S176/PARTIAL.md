# S176 Palomar package — local certificate and integration handoff

The owner invoked S176 on 3 November 2026 ("run next session, palomar packaging"). The owner chose the Apache License 2.0 for the repository. Entry main was `886dfc03550c31fc4df304da6fdf71b48af43346`, tree `fa5caf3b3066a5197e9855803912e8b7371cfc8d`. No pull requests were open.

## Palomar requirements used

| Source | Revision |
|---|---|
| PalomarPolicy (`CONTRIBUTING.md`) | `28bd48b9b71bbb2a82c718ce761d5a4220ef8e60` |
| PalomarTemplate (scripts, `LICENSE`, `Gemfile`, CI) | `2891de4c48955af824969a263d31b25e7a9a1406` |
| PalomarSubmission (`toolchains.json` minimum `v4.35.0-rc2`, taxonomies) | `14aa8d6b3c2f14a8540605e37144560b9a00e7e7` |

The repository's Lean `v4.35.0-rc2` and Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55` are exactly the template's pins. No registry record exists for this repository: `data.palomar-registry.org/repositories/jfairfaxball-348/homology-homotopy-and-applications.json` returned 404. The submission is therefore new.

Comparator compares the full `ConstantInfo` of every non-target constant the statement uses, values included. So the Challenge restates the definitions using Mathlib only. The Solution imports a verbatim copy of them and proves a bridge to `C4.c4_distance_separation_groupAlgebra`. The reusable PalomarSubmission preflight was not run. It selects Namespace Cloud runner labels (`nscloud-ubuntu-24.04-amd64-…-with-features`) that this repository cannot use. The template-equivalent hosted checks are used instead.

## Local evidence (pinned toolchain, this container)

- Baseline `lake build` of entry main: 9017 jobs, success.
- `lake build Challenge Solution` and the full default build: success. The only warning in the new files is the deliberate `sorry` of the advertised Challenge theorem.
- `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for `C4Separation.distance_separation`, `C4Separation.stageD_comp_stageD` and `C4Separation.xComp_comm`.
- `./scripts/verify-comparator.sh` uses the toolchain's `lake comparator` under bubblewrap 0.9.0. It printed "Your solution is okay!": con-ron accepted 25823 declarations, the NanoDa kernel accepted, and the Lean default kernel accepted.
- `python3 scripts/check-lean-sources.py`, `python3 scripts/check_palomar_statement.py`, `ruby scripts/validate-formalization.rb` (no TEMPLATE values) and `bundle exec licensee detect LICENSE` (licensee 10.0.0: `["Apache-2.0"]`, exact, 100) all pass.

Finish integration with exact-head PR CI, including the hosted Comparator job, an ordinary two-parent merge and independent merged-main CI. Then record the candidate SHA and the evidence in the closeout, and install the future S177 handoff. S175 remains the last completed session until those checks pass.
