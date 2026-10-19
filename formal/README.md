# Formal verification — deliberately not started

No `lakefile.toml` or pinned Lean toolchain has been created because the mathematical target, objects and required mathlib library are not yet selected. This is a deliberate scope boundary, not a completed formal proof.

After a theorem passes first novelty:
1. Map every definition and paper hypothesis to Lean declarations and record gaps.
2. Pin Lean4 and mathlib commits; create minimal reproducible project with `lake build`, local and hosted tests.
3. Supply both a human-readable proof and kernel-checked theorem covering the **exact** paper statement; identify trusted axioms and computational steps.
4. Reject `sorry`, `admit`, unjustified axioms, opaque oracle/external checker trust, and hidden stronger assumptions.
5. Freeze manifest/source hashes before Palomar, retain independent verification and cold rebuild.

A build or Lean statement does not prove novelty.

## Latest owner directive — 19 October 2026 (PROSPECTIVE)
The historical no-formalisation rule above is superseded for the existing internal Option D synthesis. Owner explicitly authorises incremental Lean formalisation of D1–D5 before any new novelty check. S117 future will first create the pinned Lean v4.35.0-rc2 + Mathlib project and proof-bearing D1 lemma; later sessions complete proof and eventual Palomar-compatible independent-kernel preflight WITHOUT registry submission. No build has yet happened as a result of installing this prompt. See formal/OPTION_D_FORMALIZATION_PLAN.md and authoritative/NEXT_SESSION_PROMPT.md.

## Latest Option D stronger theorem note — 19 October 2026 (prospective)
After the original Option D PR #135, PR #136 merged research/OPTION_D_TWO_HEIGHT_UNIVERSAL_ATTACHING.md, with universal two-height R³ attaching-map obstruction D6, Hopf two-block D7 and sharper c_N bound and D8 stability. **These later D6–D8 conclusions are the primary formalisation target**, with D1–D2 shared first milestones; the earlier D3–D5 four-parameter R⁴ route is archival, not an obligatory detour. S117 remains FUTURE and unexecuted. No novelty checks, no actual Lean build yet, no registry or publication permission.
