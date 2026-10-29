# S159 PROOF — actual shifted-term and isomorphic-presentation arbitrary-choice nonboundary

Entry pinned main f2a1c99e8fcafbd1d67a0d9b9bf4a39a52defb29, tree 43c052fef543698d92508c3ec85ae393d27b5fc3. S158 PR #191 ordinary two-parent merge verified. Merged-main pinned Lean #40887938704 SUCCESS and repository integrity #40887938983 SUCCESS.

New actual `C4/GlobalChoice.lean` imports pinned C4 shifted dg and proves:
- `transportedAllChoice_terminal_not_boundary`: ANY 13 actual endomorphisms of a ModuleCat object propositionally equal to regular B, subject to the four S149 local defining-system equations and three nonzero-residue hypotheses, have a fourfold terminal NOT equal to a local differential boundary.
- `positiveShiftTerm_is_regular` and the fully typed `PositiveShiftChoice s n hn` for every integer s≤n; the theorem `PositiveShiftChoice.terminal_not_boundary` rules out terminal boundaries for ALL such choices on the GENUINE shifted ChainComplex term.
- `isoConj_add`, `isoConj_comp`, `isoConj_coefficient`, `isoConj_zero` and `isoAllChoice_terminal_not_boundary` transport arbitrary local regular choice and terminal nonboundary along any actual categorical ModuleCat isomorphism `P ≅ ModuleCat.of B B`. This is more than a mere object equality cast.

Proofs use the pre-existing genuinely categorical arbitrary-choice S149 theorem, faithful categorical transport, and valid `eqToHom`/iso cancellations; no chosen filler restriction. Crucial limitation: `PositiveShiftChoice` is an all-choice LOW-DEGREE WINDOW, NOT the global dg-Hom structure with coherent degree-shifted chain maps across all indices. No homotopy-equivalence/quasi-isomorphism zigzag invariance or real metric theorem is claimed.

Scratch source dd286ee6c85b55aa20b89c894ed2a00cea7090c1: pinned full OptionD+C4 Lean #40893097063 SUCCESS; integrity #40893097053 SUCCESS. Lean v4.35.0-rc2 / Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55.
