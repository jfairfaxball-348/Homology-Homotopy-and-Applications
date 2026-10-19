# Option D — incremental Lean formalisation plan

**Governance installation only, 19 October 2026.** Reference: research/OPTION_D_SYNTHESIS_PROOF.md, already merged PR #135. S117 has not been executed; no Lean build or Palomar preflight has yet been run. Owner authorised incremental formalisation of the existing internal proof, not a novelty or journal audit.

## Prose-to-Lean statement and risk ledger

| Item | Mathematically faithful declaration target | Status | Dependency risks |
|---|---|---|---|
| D1 | Arbitrary finite N>=2 flag complex, squared distances exactly 1 ± 1/(100N); centered Gram PSD rank N−1, Euclidean realisation and selected-height Rips induced flag complexes | NOT STARTED | Matrix/Euclidean distance/finite point geometry; Flag clique complex |
| D2 | Exact Boolean upset/meet criterion -> unique minimal birth label per vertex; induced complexes recover all simplices | NOT STARTED | Finite Boolean lattice, induced subcomplex |
| D3 | Actual strict B3 flag inclusion cube, integral cellular chain homology blocks, proper hocolim S3 and terminal mapping cylinder kη with integral Hopf cup square k | NOT STARTED | CW/hocolim/homotopy type/cup products/Hopf invariant: very high library risk |
| D4 | Two same-height R4 Rips diagrams, natural pointwise HoTop isomorphism vs coherent non-equivalence, all-whole-WE homotopy-interleaving lower 1/(2000N) | NOT STARTED | D1–D3; real indexed functors, homotopy-localisation, strict interleaving and both identities |
| D5 | Labelled geometric/birth perturbations rho imply strict rho interleavings and quantitative lower minus 2rho | NOT STARTED | D4; metric/interleaving triangle inequality |

Never replace Ho(Top^P) with Fun(P,HoTop), full R4 with a finite sampling without a completeness proof, or the coherent dHI bound with pointwise homology distance. No new mathematical novelty checks.

## Latest target selection and source lock after PR #136

Research/OPTION_D_TWO_HEIGHT_UNIVERSAL_ATTACHING.md (merged PR #136, main b7b4bef398d8a0b5b94a578c15642fd2c12e50e5) is the LATEST internally proved Option D statement, and supersedes D3–D5 as the primary formal proof candidate. The key mathematical strengthening is universal two-height square R3 rather than three-height cube R4, with threshold-inclusive radius sample and stronger c_N >1/(200N) lower bound. D1 and D2 are shared prerequisites. D3–D5 remain historically valid nonmandatory 4-parameter targets.

| Target | Quantifiers and exact proof content | Lean status | Dependencies |
|---|---|---|---|
| D6 primary | every n≥1, connected finite simplicial Y, f,g:S^(n+1)→Y whose cofibers not WE, same labels and two squared distance values 1±1/(100N), 2 birth coordinates, full R³ pointwise HoTop equality, genuine coherent derived square cofibers, dHI≥c_N=(sqrt(1+ε)−sqrt(1−ε))/2 >1/(200N) for arbitrary whole-diagram WEs of both | NOT STARTED | D1, D2, finite simplicial/CW/hocolim cofiber, model category/real interleavings |
| D7 Hopf instance | kη versus ℓη with |k|≠|ℓ|, cup squares k/ℓ, exactly two H2 singleton blocks on B2 and natural HoTop equality and positive R3 dHI | NOT STARTED | D6 construction / Hopf invariant and integral cup structure |
| D8 | labelled perturbation with metric and two birth-coordinate deviation≤ρ; lower c_N−2ρ, positivity threshold ρ<1/(400N) | NOT STARTED | D6 and strict interleaving triangle inequality |

The final compared full Challenge/Solution is to target **D6–D8**, with underlying D1–D2, not only the weaker D4 four-parameter bound. If needed first formalise D7 separately as an honest partial theorem, but do not present a restricted Hopf result as universal D6.

## Palomar-compatible build and toolchain: authoritative snapshot

Live PalomarSubmission/toolchains.json (19 Oct 2026) requires at least v4.35.0-rc2; choose exact Lean leanprover/lean4:v4.35.0-rc2 and Mathlib4 tag v4.35.0-rc2, resolved commit 065356127b1dc0016f66b7283ce0ce2c4055aa55. PalomarTemplate uses this same configuration. Generate an authentic lake-manifest.json with full SHA-pinned transitive dependencies; do not copy a possibly stale manifest blindly or mix Mathlib and Lean toolchain versions.

Build at repository root with one Lakefile, module headers and each Lean source <=10000 physical lines. No LFS, submodules or committed compiled artifacts. Correct statement-only Challenge and proved Solution with matching comparator.json; eventually full formalization.yaml v0.4 and root detected LICENSE. Deliberate sorry only in Challenge declarations; NOT in Solution or its dependencies. Cold lake build and template-compatible lake comparator must pass, including NanoDa and con-ron replay bundled by the pinned toolchain. This is a **future preflight goal**, not proof already established or permission for Palomar registration. See https://github.com/PalomarRegistry/PalomarTemplate and https://github.com/PalomarRegistry/PalomarPolicy/blob/main/CONTRIBUTING.md .

## Incremental attack order

S117: establish genuine Lean/Lake/CI toolchain and kernel-prove substantial numerical/finite-Gram D1 lemma. Report cold/local or hosted build logs, axiom audit and unproved exact Euclidean step. Avoid generating only trivial plumbing.
Following sessions: close D1 realisation and Rips transfer; D2 finite lattice/unique births; D3 actual finite induced flag CW model/cellular maps/derived cofiber Hopf calculation; D4 full coherent homotopy invariance under both-whole WE zigzags, plateau, both interleaving identities, 1/(2000N) bound; D5 perturbation. If Mathlib's homotopy/Steenrod machinery is absent, provide explicit well-defined internal foundations and kernel proofs; never make new axioms encoding the desired facts.
Final step: full D1–D5 theorem stated exactly, proved with allowed axioms, Challenge/Solution/Comparator, accurate metadata and license, reproducible clean build, independent kernel Palomar-compatible preflight. Palomar registry action or publication is a separate owner decision.

Record in this file, at every executed Lean session, which exact declarations have actually been built and their paths/test results. Build of a restricted lemma is not proof of D4. Original source remains unchanged.

## S117 execution — 19 October 2026, D1 local entry

Live entry main `00e1f9721f7240931f13713bd01b771885a5b2a8`; PR #137 had already installed the prospective prompt. Primary fixed theorem is D1/D2/D6/D7/D8. No novelty checks or Palomar submission.

**Implementation.** `OptionD/GramBounds.lean` has three concrete targets under namespace `OptionD`:
- `d1_pair_error_lower`: with arbitrary real `a,x,y,ε`, `0≤ε` and `|a|≤ε`, proves `-(ε/2)(x²+y²)≤axy` by the two signs of `xy`. This is the exact two-coordinate off-diagonal D1 quadratic control, not a toy unrelated arithmetic identity.
- `d1_row_error_small`: `N≥2` yields `(N−1)/(100N)<1/100` over ℝ, the uniform row-magnitude margin.
- `d1_strict_gram_margin`: real lower bound `99/200 < (1−(N−1)/(100N))/2`, to be consumed after the full finite sum inequality.

A successful `lake build` would certify only these lemmas; the authoring pass itself cannot establish compilation. The pinned mathlib manifest is adapted from the live PalomarTemplate lockfile using the exact resolved transitive SHAs; hosted CI must check reproducibility. Exact Mathlib SHA 065356127b1dc0016f66b7283ce0ce2c4055aa55; Lean v4.35.0-rc2. Build check: `lake build OptionD`; CI action uses the same toolchain. Host checks must be inspected **after** this authored commit. There is no Challenge/Solution/comparator yet: claiming Palomar preflight success would be misleading.

**Unproved D1 obligations:** actual N×N symmetric centered Gram definition, finite quadratic double sum with diagonal subtraction, PSD and N−1 rank/kernel, exact Euclidean reconstruction via real inner-product space, flag threshold, Boolean induced subcomplex transfer. D2 and D6–D8 wholly not Lean-formalised. The next S118 prompt prioritises closing the finite Gram inequality before any homotopical machinery.

## S118 (19 Oct 2026)
Verified S117 main hosted Lean PASS: run 39271946320. S118 added OptionD/FiniteGram.lean, explicit epsilon, perturbation, squared-distance and centered Gram; arbitrary-N hollow quadratic coefficient (N−1)ε theorem, specialised D1 bound. S118 hosted build must be inspected independently; no full PSD, rank, embedding, D2/D6–D8, comparator or Palomar preflight claimed. S119 will target centered quadratic identity, strict PSD, rank and Euclidean embedding.

## S119 (19 Oct 2026)
S118 merged main CI 39288732449 Lean SUCCESS and integrity 39288732424 SUCCESS. S119 authors `OptionD/MeanZero.lean` equilateral zero-sum quadratic identity, upper hollow perturbation bound via negating S118, exact two-distance negative-type estimate with 99/100 margin, and 99/200 positive raw mean-zero Gram *form*. Build proof status contingent upon S119 hosted Lean CI. D1 actual double-centered Gram PSD/kernel/rank/Euclidean embedding NOT proved. D2/D6–D8 not begun. The S120 prompt targets the missing exact centered-matrix identity and representation, with pinned toolchain unchanged.

## S120 — actual centered quadratic now compiled (19 Oct 2026)
Corrected hosted pinned Lean #39310425894 SUCCESS, integrity #39310425904 SUCCESS. Exact double-centering quadratic cancellation for arbitrary mean-zero x and 99/200 coercivity on the actual Gram; symmetry under explicit edge symmetry. FULL PSD/kernel/rank, exact Euclidean points, D2 and D6–D8 UNFORMALISED. S121 future must finish these. No novelty, Palomar or publication.

## S121 (19 Oct 2026): centered full-vector positivity actually Lean-built
`OptionD/CenteredPSD.lean` imports S120 and provides `d1_centered_row_sum` (directed predicate works algebraically), `d1_centered_gram_symmetric` and `d1_centered_column_sum` (symmetric edge hypothesis), `d1_centered_ones_kernel`, `d1_centered_vector_sum_zero`, `d1_centered_quadratic_projection`, and `d1_centered_quadratic_nonneg`. Arbitrary N≥2, no sorry/axiom. The stronger algebraic consequence q_G(x)≥99/200∑(x_i−mean)² follows by exact projection plus S120's bound. Pinned Lean v4.35.0-rc2/Mathlib SHA 065356127b1dc0016f66b7283ce0ce2c4055aa55 hosted test #39312760687 SUCCESS. The scratch first pass #39312367968 failed two tactic-level issues, repaired. Final S121 PR/main verification independent. FULL PSD as an inequality is proved, but `Matrix.PosSemidef` API conversion, exact kernel/rank and Euclidean Gram representation are still NOT Lean-proved. D2 Boolean births and universal D6/D7/D8 entirely not started in Lean. S122 targets the missing finite-dimensional geometry and graph threshold; no novelty/Palomar/paper action.


## S122 — kernel and algebraic distance recovery (19 Oct 2026)
Pinned Lean #39316514201 SUCCESS (OptionD/Kernel.lean), #39316720044 SUCCESS (OptionD/Recovery.lean), both with static integrity green. ALL N≥2 symmetric edge data: strong q≥99/200Σ(x−mean)², q=0 iff constants, coordinate kernel exactly constants, D_ij<1 iff edge, D_ij>1 iff nonedge (i≠j), and Gii+Gjj−2Gij=Dij. The mathematical rank N−1 follows from constant kernel and rank-nullity but Matrix.rank is NOT YET a compiled statement; likewise no p:Fin N→EuclideanSpace ℝ (Fin (N−1)), no norm recovery or actual Rips graph. S123 future attacks pinned PSD-to-spectral/Euclidean bridge, not D2/D6–D8 by assertion. No novelty audit or Palomar.
