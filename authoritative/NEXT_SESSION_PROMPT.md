# S177 — Palomar review follow-up (FUTURE, UNEXECUTED)

The owner sets the scope. A separate owner instruction such as "Run next session" starts S177. Installing or reading this handoff executes nothing, and S176 remains the last completed session. The S176 candidate commit for Palomar is `f35677b710df2de38b2ef237b40ca4ad7ff7298b` (see `sessions/S176/CLOSEOUT.md`). The owner uploads and submits it and handles Palomar intake, authentication, review and the registration decision.

## Scope

Act only on Palomar findings or package changes that the owner supplies. Examples are a mechanical verification report, an editorial review, or an instruction to change the metadata. For each item:

1. **Locate it.** Find the affected text in `Challenge.lean`, `Solution.lean`, `C4/Palomar/`, `comparator.json`, `formalization.yaml` or the README.
2. **Fix it.** Keep the certified theorem `C4.c4_distance_separation_groupAlgebra` and the meaning of `C4Separation.distance_separation`. Do not weaken a quantifier, the coefficient ring, the localisations or the both-lane zigzags. Mirror every Challenge change in `C4/Palomar/Statement.lean`. Change human-authored metadata facts only as the owner states them: authors, the AI disclosure and the review status.
3. **Re-check.** Rerun the full pinned `lake build`, `python3 scripts/check-lean-sources.py`, `python3 scripts/check_palomar_statement.py`, `ruby scripts/validate-formalization.rb`, licensee detection and `./scripts/verify-comparator.sh`. Also run the repository validators.
4. **Report.** Give the new full 40-character candidate SHA and the evidence. Distinguish Lean build, Comparator and anything not run.

If the owner supplies nothing, record that no Palomar item is outstanding and stop.

## Integration

Use a branch and review the diff. Require passing exact-head PR checks, including the Palomar statement package workflow. Integrate with an ordinary two-parent merge and confirm independent merged-main CI. Report the SHA actually checked for submission rather than substituting a merge SHA.

## Boundaries

Do not submit to Palomar, authenticate on the owner's behalf, create Palomar tags or gists, or register. Do not submit to arXiv or HHA, publish, announce priority or contact third parties. No novelty, prior-art or outside-review phase without a separate owner instruction. Preserve the OptionD certificates and the matching manuscript. Close S177 under `docs/SESSION_PROTOCOL.md` and leave any further session future.
