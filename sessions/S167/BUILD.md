# S167 — pinned source checks (29 October 2026)

Entry main `78312dca84cf410e1c0f9babd59f0ab891f42787`, parents `bb3ce24fea6152b1455011bcf8f37612011f95b3` and `6d508373b35b2cfad6ee41b1f026b1099b604eed`. Entry merged-main Lean #40973448909 SUCCESS; integrity #40973448964 SUCCESS.

Compiler: Lean v4.35.0-rc2; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. Full pinned OptionD + C4 build.

- Source S167 checkpoint `e788d59b67050cf89cdd601c3d35ccd70cdb5d73`: PR pinned Lean #40974584597 SUCCESS; PR integrity #40974584529 SUCCESS. Push Lean #40974578695 SUCCESS; push integrity #40974578773 SUCCESS.
- Original algebra / typed families and genuine original secondary component equations also passed separately on prior scratch commits.
- Initial transfer-candidate integration `706410a3` failed from elaborator defaulting explicitly written degree arithmetic to `ℕ` rather than `ℤ`; that source was corrected. The failed source is not the promoted checkpoint.
- The complete numerical theorem and both transferred secondary coherences are NOT checked because no such theorem is yet present.
- After this documentary commit, the final PR/head and merged-main workflow results must be independently checked; previous green source results alone never establish merged-main success.
