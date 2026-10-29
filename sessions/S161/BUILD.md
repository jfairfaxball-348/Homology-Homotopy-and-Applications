# S161 BUILD — exact green source and rejected scratch record

- Entry main `b2ea7e939d84a77d9d8a5f4154bfa40fb3b482c6`, tree `144a55fd8f9cf4a21588e327e55cdac546a2425e`. Verified S160 PR #193 ordinary two-parent merge and both merged-main Lean/integrity successful.
- `scratch/s161-canonical-primary-01` commit `150391d5f81d33d3642d2300107095f691eccf66` (new C4/CanonicalGlobal.lean, C4.lean import): pinned full OptionD+C4 Lean #40896532516 SUCCESS, repository integrity #40896532296 SUCCESS.
- Later scratch `df170a1abdb9f2206677fb358a2f19d62a518cbb` #40896864815 FAILURE; `d87cf9a5960f018f9239c5db1e85effd5e0a1a4a` #40897290177 FAILURE; `d53833275c89597c39bfaa0c1c69327b759404c2` #40897688744 FAILURE. All involve only an attempted first-positive-component residue-unit lemma; no failed source promoted.
- Exact promoted source is the earlier GREEN `150391d5`, not the later scratch head. No OptionD changes; pin Lean v4.35.0-rc2/Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. PR/main checks to be independently observed.
