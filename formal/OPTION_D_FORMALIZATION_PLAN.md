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
