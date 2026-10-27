# S140 — Lean-certified genuine cyclic-four algebra and natural-degree complex

Entry main: 6460ba80c258d17a480dc660df868edc7b53c628; tree d8b93bf1bc9f369f12e56e0c2b7a506422949a40; prior S139 PR #167 ordinary two-parent merge and PR/main Lean/integrity SUCCESS.

## Certified results
- `C4/Jets.lean` exposes the previously verified four-coordinate multiplication and annihilator definitions across Lean modules.
- `C4/Ring.lean` defines an ACTUAL `CommRing C4.B`. Addition, zero, one, negation and convolution multiplication are concrete. Named `c4_*_coord` lemmas prove each requisite ring law before the instance is packaged. `mul_is_truncated_convolution`, `ann_t_ring`, `ann_t3_ring` transport the S138 arithmetic.
- `C4/Resolution.lean` defines `coefficientLinear` as a genuine B-linear map, `differential n` as an actual morphism of `ModuleCat B`, `differential_square n` for EVERY n by ring associativity and S139's unbounded-in-n `Periodic.d_squared`, and `positiveResolution : ChainComplex (ModuleCat B) ℕ`, a genuine natural-degree chain complex with B objects at each degree. No finite degree cutoff.

## Scope boundary and next obligation
The new complex is ℕ-indexed, **not** the entire ℤ-indexed unbounded Ch(right B) object with zero negative degrees. Exact positive homology as categorical homology, H₀, augmentation, shifts P[i], a genuine ring isomorphism to k[t]/(t⁴), x/h/z as dg-Hom elements, complete ALL-choice fourfold, L2 integer-real derived diagrams and L3 both-lane whole-real strict interleavings all remain OPEN. S138 universal degree-two coefficient jets and S139 all-natural-degree identities remain valid but do not alone certify d_IHC=1 or d_HI≥5/4. The manuscript target remains an internal mathematical theorem.

Pinned Lean leanprover/lean4:v4.35.0-rc2 and mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. Fully compiled scratch head a0d1770a1eaca63f24958bc7c9840b026ab60755: Lean push #40515282269/PR #40515289838 SUCCESS; integrity push #40515282275/PR #40515289832 SUCCESS, no admitted proofs, unchanged manifest. No local Lean compiler.
