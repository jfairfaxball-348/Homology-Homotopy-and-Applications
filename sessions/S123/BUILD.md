# S123 BUILD — pinned hosted verification
- Lean leanprover/lean4:v4.35.0-rc2, Mathlib SHA 065356127b1dc0016f66b7283ce0ce2c4055aa55; committed lake-manifest.json unchanged.
- GitHub branch formal/S123-matrix-psd-rank; PR #148. Source: OptionD/MatrixBridge.lean, OptionD/Rank.lean, OptionD.lean module imports.
- Earlier compiler attempts found a Lean syntax issue around star x, root rather than Matrix.dotProduct, and a final Nat-rank arithmetic normalisation issue; these were repaired without mathematical weakening, sorry or custom axiom.
- Last source repair commit at dossier preparation 2b6c63f6f2f3ff2d63187ed4268d544166e94d84; hosted Lean run #39379455850 and PR duplicate #39379459546 have subsequently both completed SUCCESS at the exact source SHA. Final PR/dossier and merged-main runs must also pass.
- Repository-integrity runs for recent source commits green, including #39379455548/#39379459519. No full Palomar Challenge/Solution comparator or registration. No Euclidean factorisation theorem built.
