# S155 BUILD — pinned code-level and CI provenance

- Entry main `b659d8927429cead1e686d81e566cfc14945e377` tree `7f95e46aeb30c1317aee5126f812edd490401842`; S154 PR and merged-main pinned Lean/integrity already SUCCESS.
- Disposable `scratch/s155-global-hz-01` attempts with FAILED Lean runs: #40709248339 (n−1+1 target), #40709646532 (shift arithmetic), #40710025085 (differential rw index), #40710493155 (dependent rewrite motive), #40710916233 (cast coercion), #40711328616 (positive Dh final `eqToHom` normalisation). These failed sources are NOT promoted.
- Final green scratch commit `f96eb40d04bc9ab1d53cae429820a30900b70d93`: full pinned Lean build #40711855409 SUCCESS and repository-integrity #40711855369 SUCCESS. Lean v4.35.0-rc2; Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55; no sorry/admit/axiom. Corrected z degree, positive normal forms, generic transport, h/z boundary identities only. OptionD unchanged.
- Authored PR and merged-main workflows must be separately inspected before their success can be asserted.
