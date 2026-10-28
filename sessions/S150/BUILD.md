# S150 BUILD — pinned source/CI, strict claim boundary

Pinned Lean 4 `v4.35.0-rc2`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. No manifest/toolchain change; default OptionD + C4 build.

- **CERTIFIED** source `553f990b228ea9b5b072e8bba5649861f7293374`: `C4/ShiftedDG.lean` global all-integer x,h,z term morphisms, `regularDx_commute`, `integerResolution_d_transport`; Lean #40676684048 SUCCESS, integrity #40676683857 SUCCESS.
- Initial component-only scratch `e2d359e669e7c9c9143685d1517dc5828936b89f`, Lean #40674486579 FAILED during Elan download due to network reset (not a proof failure).
- Exploratory full-x chain-map `3567e5713fe6d282fa0877abe20fc38960762a75`: Lean #40674956656 FAILED at `C4/ShiftedDG.lean:87/90/104` (dependent shifted differential casts).
- Exploratory `a0634d6c76f283be7758a7ea6152ae4741683432`: Lean #40675352420 FAILED, same casts.
- Exploratory `4a9982283ed5af4906d4265490793c9221cd496c`: Lean #40675697049 FAILED at `C4/ShiftedDG.lean:99/104/115`, but index differential transport compiled.
- Exploratory `ed16a1ccd6a0166464eab312e9b5c8d3743730af`: full-x naturality pending separate CI #40676075963 at authoring; no success assumed.
- Final PR/main Lean and integrity must be observed separately; this record does not pre-certify them.

The verified core deliberately excludes the unfinished whole-chain-map proof, global homotopies, real diagrams and numeric theorem.
