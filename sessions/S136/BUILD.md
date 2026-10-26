# S136 BUILD — verified scratch hosted evidence (26 October 2026)

Entry LIVE main 9c1c4a5a9eb74281a0042b4ec2d9488e92b1e6bd, tree ac461e348a6182eb2664d3171b81759eed5a805d; S135 PR #161 two-parent merge. S135 merged-main Lean #40407536554 SUCCESS and integrity #40407536690 SUCCESS. No open PRs. Branch protection access 403 UNKNOWN.

Pinned dependency: Lean 4 v4.35.0-rc2, Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55; manifest unchanged.
Scratch branch scratch/S136-two-endpoint-cofiber; no scratch branch is the final S136 session branch.
- Scratch 0c5eafbadb98463b354dfff2429de63339389cee: Lean #40414291318 FAIL due to opaque collapse relation; integrity PASS.
- Intermediate f3745be84b44cbe7a654cdabf2d1ec51baaa6c96: Lean #40414629659 FAIL due to a doc-comment placed before an exported lemma; integrity PASS.
- Corrected f0361978f12cb6a7b08b177dfefdb2f5601a967f: Lean #40414892541 SUCCESS; exact attaching image and endpoint basepoint collapse.
- Extended 6ade25917c287fb7ef5cd31972646a92226cf8de: Lean #40415189291 SUCCESS; exact cofiber-fibre equivalence.
- First continuous/surjective pass 8304d2ebb9d46931de99f9879eab8dfc647c6308: Lean #40415398486 FAIL only on two trailing tactics after rw had already closed goals.
- FINAL scratch b2e1ab16e7ccd308e9479b0807b09b51280538b6: hosted pinned Option D Lean #40415660191 SUCCESS and repository integrity #40415660047 SUCCESS; complete new endpoint/quotient-fibre/continuity/surjectivity lemmas.
Official numbered PR and post-merge main CI must still be observed independently after integration, not inferred from scratch. No Mathlib AddCircle type-test, full S¹ homeomorphism build, Palomar or other external action.
