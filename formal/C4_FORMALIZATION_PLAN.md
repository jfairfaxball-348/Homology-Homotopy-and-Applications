# C4 formalisation ladder — frozen first-paper proof

Pinned existing Lean leanprover/lean4:v4.35.0-rc2 and Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55. Do not modify the OptionD import graph. Build new C4 modules in the same root.

**L0 (S138 COEFFICIENT BRIDGE ACHIEVED; genuine ring/shift bridge remains S139):** exact B=F₂[t]/t⁴, or a proved-isomorphic concrete Fin4 coefficient ring; show t⁴=0, alternating multiplication/annihilator identities, even/odd x,h,z, w₂≡1 mod(t). MOST IMPORTANT: prove low-degree congruences for ARBITRARY nontrivial cocycle, arbitrary primary and secondary fillers. Pinned hosted Lean certifies the exact truncated four-coefficient multiplication and annihilator ideal identities, selected degree-two equations and arbitrary-choice n=2 terminal nonboundary, with no sorry/admit. This is not yet a formal Ring instance/quotient isomorphism nor an entire dg-Hom/chain-complex theorem. Original Python replay PASS remains bounded arithmetic. Draft paper in parallel.

**L1 (S139 partial all-degree coefficient identities; S140 actual category bridge):** establish real ring quotient isomorphism and an actual genuine unbounded chain complex resolution P_n, all degree shifts P[i], chain maps and nullhomotopies; universal fourfold defining-system exclusion, not just one representative.

**L2:** whole ℕ free-quiver projective cone, naturality/coherent h/z homotopy, left Quillen extension to ℝ, actual η₂^F null in Ho(Ch(B)^ℝ), quantitative d_IHC exactly one.

**L3:** strict interleaving after arbitrary full ℝ objectwise-WE zigzags of BOTH lanes. Full real shoelace cofibrant replacement, natural acyclic opposite-lane quotient and square-zero finite restriction, fourfold homotopy transfer. Lower bound 5/4; upper 5/2. Do not replace unknown model-category lemmas by implicit axioms, paper claims or just finite time samples.

**L4:** cold pinned build of final theorem EXACTLY matching manuscript and fully disclosed dependencies; finish first paper concurrently. Field-forgetful equality may remain a separately cited statement if no Lean proof, clearly distinguished.

**Stop policy:** if exact categorical L2/L3 cannot be expressed with existing mathlib, report smallest typed blocker, estimate needed infrastructure and continue manuscript rather than wandering through new experiments. No novelty, fit, prior-art, outside review, Palomar, arXiv or HHA submission in routine sessions.

**S139 checkpoint.** C4/Periodic.lean formalises d², exactness at every positive coefficient degree, and the x/h/z parity equations plus chosen terminal-unit identity for ALL n. This is stronger than the degree-40 replay but still not a CommRing/quotient-isomorphism, actual Ch(right B) object or global dg defining system. S140 must close the ring, ChainComplex and full all-choice dg bridge without expanding the publication target.

**S140 checkpoint (27 October 2026):** New `C4/Ring.lean` has genuine `CommRing C4.B` with exact coordinate convolution and transferred annihilator identities; `C4/Resolution.lean` has actual `ModuleCat B` B-linear periodic differentials and `positiveResolution : ChainComplex (ModuleCat B) ℕ` with all `d²=0`. Pinned scratch Lean #40515282269/#40515289838 SUCCESS. These are NEW genuine categorical algebra objects beyond S139's coefficient identities. They are NOT the canonical quotient `RingEquiv`, full ℤ-indexed unbounded complex with negative-degree zeros/augmentation/homology, shifts, global x/h/z dg fourfold, L2 or L3. S141 must address those precise unfinished obligations. The manuscript tracks rather than conceals gaps; no novelty/fit/prior-art/outside review.
