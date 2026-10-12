# Formal verification — deliberately not started

No `lakefile.toml` or pinned Lean toolchain has been created because the mathematical target, objects and required mathlib library are not yet selected. This is a deliberate scope boundary, not a completed formal proof.

After a theorem passes first novelty:
1. Map every definition and paper hypothesis to Lean declarations and record gaps.
2. Pin Lean4 and mathlib commits; create minimal reproducible project with `lake build`, local and hosted tests.
3. Supply both a human-readable proof and kernel-checked theorem covering the **exact** paper statement; identify trusted axioms and computational steps.
4. Reject `sorry`, `admit`, unjustified axioms, opaque oracle/external checker trust, and hidden stronger assumptions.
5. Freeze manifest/source hashes before Palomar, retain independent verification and cold rebuild.

A build or Lean statement does not prove novelty.

