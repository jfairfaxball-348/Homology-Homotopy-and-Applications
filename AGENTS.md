# C4 working instructions — 3 November 2026

## Authority and scope

Read `authoritative/START_HERE.md`, the live fields of `authoritative/STATE.json`, and `authoritative/NEXT_SESSION_PROMPT.md` first. The single technical dependency ledger is `formal/C4_COMPLETION_STRATEGY.md`; `docs/SESSION_PROTOCOL.md` governs evidence and integration. Historical session records and Git history describe their own checkpoints, not current execution priorities.

On 3 November the owner directed integration and closeout of S174. **S174 is the last completed session**; its record is `sessions/S174/CLOSEOUT.md`, with evidence in `sessions/S174/PARTIAL.md`. **S175 is FUTURE, UNEXECUTED** (`authoritative/NEXT_SESSION_PROMPT.md`) and runs only on a separate owner instruction. Do not relabel S175 as started or execute S176.

Preserve the frozen first-paper theorem over B = F₂[C₄], for the genuine five-stage real diagram F against zero:
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4≤dHI(F,0)≤5/2`.
The derived category is that of whole real diagrams. The homotopy metric allows arbitrary whole-diagram objectwise quasi-isomorphism zigzags on BOTH lanes, including nonzero acyclic replacements of zero. No finite-grid surrogate, literal-zero replacement assumption, or stronger hidden hypothesis may replace this statement.

## Immediate proof priorities (S175)

The 2 November priorities on replacement-to-obstruction, the direct contradiction, the HomComplex adapter and the bar were resolved, or made unnecessary, in S174 by the certified weak-data route. They are preserved in Git at `bc06b6011f5556a8ba36ee85167b1fa5c875bc06`. The remaining work finishes the formalisation over the literal group algebra:

1. **Presentation.** Prove a Lean `RingEquiv` `C4.B ≃+* MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))` with `t ↦ 1 + g`.
2. **Faithful restatement.** State and prove `c4_distance_separation` over complexes of group-algebra modules: the transported diagram, every localisation, and BOTH-lane zigzags. Prefer ring-generic definitions whose `C4.B` instances stay definitionally unchanged, together with invariance under the induced equivalence. Existence of the RingEquiv beside the B-theorem is not enough.
3. **Faithfulness audit.** Record the definitional conventions in the crosswalk and align the manuscript text with the certified routes. §6's field-only comparison stays outside the frozen theorem.
4. **No re-proof.** Do not re-prove the certified C1–C4 components. A green helper build does not close a missing contract.

## Execution and evidence

- Pin live main SHA/tree and check competing PRs before writes. Reuse certified work; do not repeat historical research or re-prove foundations without a concrete need.
- Establish fast feedback with the pinned Lean/lake and cached Mathlib when available. If unavailable, record the exact environment limitation and use permitted pinned hosted compilation for a connected proof batch; never label unchecked text as verified.
- Use targeted compilation while developing, then full C4 plus preserved OptionD build, source/axiom audit, `python3 scripts/validate_repository.py`, `python3 scripts/session_handoff.py --check`, and applicable tests before promotion.
- Keep exact hypotheses, definitions, all-degree/all-real boundary cases and actual compiler evidence. No `sorry`, `admit`, custom axioms, unchecked oracle or assumed missing theorem may close the target.
- Use a branch, review the diff, require passing exact-head PR checks, ordinary two-parent merge, and independent merged-main CI. Zero checks or pending checks are not success.
- During an owner-authorised proof run, continue through routine lemmas and merges without fresh permission loops. Documentation-only requests do not start proof execution. A new conversation's “Run next session” resumes the active incomplete session or, when none is active, starts the installed FUTURE session.
- Update the current ledger and live status in place. Preserve historical evidence in session records/Git; do not prepend another chronology to every guidance file. Record actual progress, not a percentage inferred from session count.

## Preserved boundaries

Only frozen C4 Lean and its matching manuscript are active. Preserve OptionD certificates without further OptionD development. No target search, novelty/HHA-fit/prior-art/outside-review phase, distance optimisation, Palomar registration, arXiv/HHA submission, public release, priority announcement or third-party contact without separate owner instruction. Correctness checks remain mandatory.

The numerical theorem is Lean-certified over the presentation `C4.B = F₂[t]/(t⁴)`: `C4.c4_distance_separation` passed hosted exact-head PR and merged-main CI with standard axioms only. It is **NOT yet Lean-certified over the literal group algebra**. Full certification requires the formal presentation equivalence, a faithful restated declaration, full build and axiom evidence, and an updated manuscript-to-Lean crosswalk. Source access levels and claim provenance must remain honest; finite computations are not proofs over arbitrary real diagrams.

The accumulated former instructions are preserved in Git at baseline `633634e2e32abe186bde3fc1cf7c26fa3f2e24c3` and in historical session records.
