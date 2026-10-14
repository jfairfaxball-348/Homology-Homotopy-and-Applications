# S035 — reproducible exact finite time-index audit

Pre-registered finite target: confirm that for all sampled rational eps∈{1,5/4,1499/1000,3/2,2}, the integer stage at (0,1) of F and F^{2eps}, and point-stage of G^eps, match T76. Analytic proof uses a single interval argument, not finite sampling.

Runtime: Python 3 standard library Fraction, Linux container, no third-party dependencies. Run `python scripts/s035_stage_check.py`. Corrected source SHA256 `a42cdd7c0daae88d43af226692f60a9d830f38f4b9160a1188fc85b2a7a146be`; stdout SHA256 `df70679badce0322a9ba5f28e68f9c9c77dbbca6679e135735060371c4817e8d`, recompute on the committed blob before relying on byte identity.

Initial attempt mistakenly compared *F's stage* rather than G's in the intermediate Y stage and raised AssertionError. Repaired source passes all test points. This does NOT compute a Toda bracket, determine a derived mapping homotopy group, or certify the general topological proof. Full script and stdout are archived.
