# Formal verification — Option D incremental Lean

S117 (19 October 2026) introduces the first Lean project and the mathematical D1 pair/row estimates. The *target* is still the stronger D1, D2, D6–D8 real three-parameter two-height Euclidean Rips proof, not an easier weakened theorem.

- Toolchain `leanprover/lean4:v4.35.0-rc2`; Mathlib pinned `065356127b1dc0016f66b7283ce0ce2c4055aa55`.
- `OptionD/GramBounds.lean`: local mixed-product perturbation estimate and strict numerical Gram margin.
- `lake build OptionD` and GitHub Actions Lean build are the verification boundary; status must be read from the actual CI job, not assumed here.
- There is currently **no** Euclidean representation theorem, no coherent-square theorem, no Challenge/Solution comparator, no independent-kernel Palomar preflight, and no Palomar registration.
- No sorry, admit or custom axioms intentionally appear in the proposed proof sources.

See `formal/OPTION_D_FORMALIZATION_PLAN.md` for exact statement-to-Lean mapping, and `authoritative/NEXT_SESSION_PROMPT.md` for S118 (FUTURE, UNEXECUTED). No novelty audit was undertaken.
