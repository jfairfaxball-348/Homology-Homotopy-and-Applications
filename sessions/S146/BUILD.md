# S146 BUILD — pinned observations and limitations

Entry main `491fa39d3b1e206db44bbe1d80e4645e50d9e9d8`, tree `b1d8c54bc627be66853838c45b77840954477faf`; S145 merge PR #176, two parents 4c5a5ec3b04cc4a819855ccbc00dc88d885ea25f and 1954a4a70e39e46a52e7b11c4d0a98247a582f9b. S145 PR Lean #40576528559 SUCCESS, integrity #40576528649 SUCCESS; S145 merged main Lean #40576882484 SUCCESS, integrity #40576882415 SUCCESS. Pinned Lean v4.35.0-rc2; pinned Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. Manifest unchanged.

- Positive result: scratch `d6b844d6f40c40143923956b2ef4513f2e20294c`, hosted pinned build [#40578700131](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/40578700131) SUCCESS, repository integrity [#40578700181](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/40578700181) SUCCESS. Result = actual all-negative categorical ExactAt and homology zero (not the positive-degree theorem).
- Subsequent positive bridge attempts FAILED Lean: `a8a5f717` #40578960052, `d3d358fd` #40579353988, `9f130031` #40579746304 and `2c602f0d` [#40580404408](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/40580404408). Their shared unclosed categorical obligation is the positive sc' eqToHom cast conversion. The final typed compiler error is quoted in PROOF.md.
- The final S146 authored branch retains only the verified green negative proof. The ordinary PR and post-merge main CI are to be checked independently after this authored commit; scratch green is NOT substitute for final checks.

No proof weakening, sorry, admit, axiom or dependency change.
