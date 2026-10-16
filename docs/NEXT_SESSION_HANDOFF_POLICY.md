# Mandatory next-session handoff protocol

**Status:** owner reinstatement, 16 October 2026. Applies prospectively to the completion of S078 and every subsequent numbered session. Existing S077 was already completed before this amendment and S078 remains FUTURE/UNEXECUTED. This policy restores the previously requested ChatGPT end-of-session prompt handoff without running research autonomously.

## Automatic authoring requirements

During the SNNN session, with no separate request:
- Derive exactly ONE complete next-session prompt S(N+1) from the genuine verdict and greatest remaining mathematical obligation. A new theorem's full proof / disproof / G2 gate is preferred over low-value incremental polishing. STOP or owner-dependent work must be marked as `OWNER_DECISION_ONLY`.
- Commit the FULL prompt as `authoritative/NEXT_SESSION_PROMPT.md` in the same isolated branch/one atomic authored session commit as the SNNN dossier. This is not just a pointer, title, generic template, or a draft awaiting further owner approval to *write*.
- Explicitly state `FUTURE, UNEXECUTED` and that **only a fresh separate owner invocation** may execute S(N+1). Never imply that preparing a prompt automatically executes it.
- Align `authoritative/STATE.json`, the phase/decision/claims/sources ledgers and closeout. Keep original Top^R publication target unless explicitly switched by the owner; mathematical, novelty, Lean and release gates remain separate.

## Required next-prompt anatomy

1. `# SNNN — <exact ambitious objective> (FUTURE, UNEXECUTED)`
2. `## Authority and entry`: precise fresh-invocation boundary; mandatory live-main reconciliation, open PR/concurrency, SHA/tree, prior ordinary merge, actual PR/main seven-step hosted STATIC checks, protection/rulesets and one-branch/one-authored-commit/ordinary-merge protocol. CI is only governance.
3. `## Fixed state and hard exclusions`: what is PROVED vs INTERNAL vs OPEN, publication target, category, quantifiers and stop rules, with no stronger claim or exact-distance rabbit hole.
4. `## Decisive mathematical work`: specific deep proof-or-kill branches, adversarial counterexample attempts, success/failure certificates, mathematical significance and any Lean dependency blueprint ONLY when justified/authorized.
5. `## Primary-source and novelty gate`: exact up-to-date closest papers, theorem-level proof access/citations and G1/G2 HHA independence.
6. `## Closeout and owner gates`: exact delivered dossiers/catalogues, next FUTURE prompt, full integration verification and no silent Lean/Palomar/manuscript/arXiv/HHA/external contact.

If progress legitimately requires the owner to choose a new route, the next prompt remains a complete **OWNER_DECISION_ONLY** briefing: summarize two or more grounded alternatives and an explicit requested decision; do not authorise executing its mathematics without that decision.

## Required CLOSEOUT.md handoff block

Use the exact heading and state fields (replace placeholders with the actual facts):

```markdown
## NEXT_SESSION_HANDOFF
- Next session: SNNN
- Status: FUTURE, UNEXECUTED
- Canonical prompt: authoritative/NEXT_SESSION_PROMPT.md
- Decisive target: <single concrete obligation / owner decision>
- Authority: A new, separate owner instruction is required. Preparing this prompt does not run SNNN.
```

## Required user-visible terminal session closeout

After verifying the actual authored SHA, PR, ordinary merge tree and two parents and success of the hosted checks, give the research verdict/limitations and real GitHub identifiers, followed by a heading `Next session prompt — SNNN (FUTURE, UNEXECUTED)`, the **complete current main** contents of `authoritative/NEXT_SESSION_PROMPT.md` in a fenced `markdown` block and its stable GitHub link. Do not truncate merely due to length or substitute a summary. This is the owner-facing automation formerly missing from S077's report. If the GitHub merge or hosted checks cannot be confirmed, clearly label the unmerged prompt with its actual branch/commit instead of claiming completion.

## Mechanical enforcement

`python3 scripts/session_handoff.py --check` validates the state/prompt/closeout synchronization and required next-session text. Hosted GitHub Actions checks both push and PR; `--print` supplies a copy-ready terminal handoff. The validator is prospective: it must not rewrite S077's historical closeout, and it cannot itself deliver ChatGPT messages or prove any mathematics.
