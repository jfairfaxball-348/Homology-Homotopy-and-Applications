# S124 PLAN — proof-first compiler work
1. Inspect pinned Lean v4.35.0-rc2 and Mathlib SHA 065356127b1dc0016f66b7283ce0ce2c4055aa55, especially Mathlib/Analysis/Matrix/PosDef.lean (semi-inner-product alone is not a separated N−1 space), Mathlib/Analysis/Matrix/Order.lean (CFC.sqrt), EuclideanSpace/PiL2 and matrix rank.
2. Prove strict squared-distance inequalities and conditionally turn exact Euclidean Gram witnesses in dimension N−1 into norms and all-clique Rips simplices.
3. Use pinned PSD spectral square root B=Bᴴ, B²=G to produce ACTUAL Euclidean column points in dimension N; certify all Gram entries and then norm squares and universal all-finset Rips equivalence without assuming existence.
4. Pursue exact dimension N−1; if incomplete, isolate missing kernel(B)/orthogonal complement isometry and hand off specifically to S125. No fake type casts, stronger assumptions or sorry.
5. Host-build pinned code, produce seven-file dossier/claim and governance mirrors and canonical new prompt, ordinary PR integration subject to checks.
