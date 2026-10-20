# S123 PLAN
1. Inspect pinned Mathlib v4.35.0-rc2 at SHA 065356127b1dc0016f66b7283ce0ce2c4055aa55: Matrix.PosSemidef, Hermitian, mulVecLin, rank-nullity, Matrix.toInnerProductSpace.
2. Convert S121's all-vector quadratic and S122's coordinate kernel to native Matrix.PosSemidef and Matrix.mulVec; derive exact N−1 rank with no new assumptions.
3. Attempt the full PSD factorisation into concrete dimension-exact Euclidean points, distance and Rips graph. Do not equate positivity or rank alone with an actual point configuration.
4. Use pinned GitHub Lean CI as compiler, repair failed tactics, update complete governance dossier and install S124 as the next separately invoked step.
