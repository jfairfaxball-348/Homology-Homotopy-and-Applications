# C4 execution and handoff protocol — 2 November 2026

This is the live protocol. It supersedes historical single-helper and stale future-session instructions; former protocol text remains in Git history. The theorem and external-action boundaries are in `AGENTS.md`.

## Entry

Pin live main SHA/tree; inspect current/competing PRs and exact workflow evidence before writing. Read the short current status, STATE live fields, active handoff and single technical ledger. Read historical sources only where a dependency needs them.

Distinguish a documentation/process request from proof execution. This 2 November revision is documentation/process work only. A new conversation's separate owner invocation resumes the active incomplete session; within an authorised proof conversation, continue across routine checks and merges without new permission loops.

## Proof development

- Work backwards from the exact final theorem and connect each producer to its consumer. Record exact types and distinguish proved, proposed and blocked assertions.
- Establish pinned compiler feedback; prefer a persistent cached local environment. If unavailable, record the actual limitation and use permitted hosted pinned compilation. Never report an uncompiled draft as certified.
- Target substantial connected proof batches. Do not repeat coefficient calculations, failed cast simplifications or historical dossiers without a concrete dependency.
- Preserve correct provenance, precise assumptions, boundary cases and all-real/BOTH-lane semantics. Finite computations support only their declared scope. No admitted proof, custom axiom or unproved missing contract may certify the headline.
- Keep one living technical ledger in `formal/C4_COMPLETION_STRATEGY.md`. Evidence and failures belong in the active session record; live guidance is updated in place.

## Session and continuation state

`last_completed_session` is the last genuinely closed numbered session. `recommended_next_session` remains its immediate successor, whether that successor is unstarted or partially executed.

For an unstarted successor, omit `active_session` and use a prompt heading ending **(FUTURE, UNEXECUTED)**. When substantive partial work exists, retain last/next numbering and set:
`active_session = {"id": "S174", "status": "IN_PROGRESS", "record": "sessions/S174/PARTIAL.md"}`
with the actual active ID. The prompt heading must then end **(IN PROGRESS, PARTIAL)** and the nonempty partial record must exist. Neither state authorises execution by itself.

Do not mark a partial session complete to make a validator pass. On actual completion, write its closeout and NEXT_SESSION_HANDOFF, advance last/next exactly once and install the next future prompt. A previous session's future handoff remains a historical record of what was unexecuted at that time; do not rewrite it to pretend later work had already happened.

A completed numbered-session closeout includes the fresh, copy-ready next prompt after integration. A documentation-only revision or partial continuation reports its changed guidance/status and link; it does not fabricate a numbered-session completion or require another full dossier.

## Validation and integration

Use a separate branch and review the complete diff. Before promotion:
- Full pinned `lake build` for C4 and preserved OptionD, with no-placeholder and axiom checks appropriate to proof changes.
- `python3 scripts/validate_repository.py`.
- `python3 scripts/session_handoff.py --check`.
- `python3 -m unittest discover -s scripts -p 'test_*.py'` for the handoff status checks.

Require successful checks on the exact final PR head, ordinary two-parent merge (no force), and independent post-merge main CI. Pending or absent checks are not success. Keep checks separate from mathematical completion: they verify the declarations and governance present, not an absent final theorem.

Preserve archived session/claim/source evidence, frozen C4 scope and no-external-action boundaries. Report actual failures and missing hypotheses plainly.
