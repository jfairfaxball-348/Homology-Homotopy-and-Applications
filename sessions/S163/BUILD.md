# S163 BUILD — pinned independent green Lean and integrity, failed scratch isolated

- Entry main `ae8d6ad7ec285135e0887d93ae2e7a901175fe59`, tree `a5a7e2e9420273e45fc7dc242d6c846270563122`. S162 merged-main Lean #40903604446 SUCCESS, integrity #40903604484 SUCCESS.
- Scratch `62496b5817711a708014280af633a3b5b4f221dd`: actual adjacent-shift naturality, two later arrows and 3 unit bridges. Lean #40906560143 SUCCESS; integrity #40906560196 SUCCESS.
- Scratch `ec3085026e0dc4a4f137c1fec3965aded64306db`: two-step global square transport and genuine later primary homotopies. Lean #40907040082 SUCCESS; integrity #40907039913 SUCCESS.
- Failed exploratory scratch `7017e9cdcdc4468e46155bfdd5a79c70a31bb925`, Lean #40907649875 FAILURE at C4/CanonicalGlobal.lean:223:67: `⊢ (id (cast ⋯ (Homotopy.nullHomotopy (globalHFamily s) ⋯))).hom n (n + 1) = globalHComponent s n`. This is a real dependent Homotopy cast extraction, not a counterexample and NOT promoted.
- Clean scratch `a8e18ebd58b808a3edb1b06df5f64a0c6d61d157` removes only the unproved component-extraction assertion, retaining correct canonicalZ03/14 and their support lemmas. Full pinned Lean #40908049804 SUCCESS; repository integrity #40908049784 SUCCESS.
- Compiler pin: Lean v4.35.0-rc2; Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. No sorry/admit/axioms; no OptionD edits. The clean authored branch must replay PR CI and merged main CI independently before claiming repository promotion.
