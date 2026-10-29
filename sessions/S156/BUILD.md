# S156 BUILD — exact source provenance and failure boundary

- Live entry main: `d4493aa87bee4b6de99280105574b5171f177f81`; tree `b58bfd384a683889a9654cd49957035391a32467`; S155 PR #187 and merged-main pinned Lean/integrity independently confirmed green.
- Disposable branch `scratch/s156-positive-hz-01` tested full positive Dh=x² in failed Lean builds #40837527738, #40837790514, #40838082238, #40838346852, #40838609377, #40838890258 and #40839166607. These failures expose the nondefinitional target or intermediate `eqToHom` cast mismatch after correct coefficient identity; none was promoted.
- Cleanup scratch #40839343686 failed only due to unattached Lean documentation comment. Repaired as an ordinary comment. No failed source promoted.
- Final clean scratch commit `68e0e5ae1e77f30fcbf9c7b18453816dafc9e2ff`: pinned OptionD+C4 Lean #40839444577 SUCCESS; repository integrity #40839444561 SUCCESS. Lean v4.35.0-rc2; Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. No sorry/admit/axioms and no OptionD file modifications.
- The authored session PR and merged-main workflows require independent observation; scratch success is not falsely described as PR or merged-main success.
