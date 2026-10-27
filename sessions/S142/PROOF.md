# S142 PROOF — actual module kernel/image identities

The residue field is the scalar restriction along `C4.residueHom : B →+* ZMod 2`. Using `RingHom.toModule`, the type `ZMod 2` is a left B-module. The map `residueLinear : B →ₗ[B] ZMod 2` is additive and B-linear because residueHom is multiplicative and B acts through residueHom. The underlying function is surjective by the explicit lift (v,0,0,0).

Its kernel is tB, from S141's `residueHom_kernel` (equivalently `C4.ann_t3`). `Periodic.d 0=t`, so the image of `coefficientLinear (Periodic.d 0)` is exactly this ideal. Lean records it as `C4.residueLinear_ker_eq_range`.

For each n:ℕ, S141's `positiveDifferential_exact_coeff n` gives pointwise ker d_n = im d_(n+1). Extensionality over actual submodules `LinearMap.ker` and `LinearMap.range`, with existential witness equality reversed, proves `C4.positiveLinear_ker_eq_range n`. This quantifies over all n and every B-module element (not a finite-degree test).

These proofs are categorical in the category of B-modules *as equalities of submodules*, but they are not yet formal `ChainComplex` homology objects or an augmentation chain map. `ModuleCat.of B (ZMod 2)` failed to synthesize the expected module instance in the attempted construction; its other integer-indexed casts were also not resolved. The attempted categorical claims were removed from the green artifact; no `sorry`, `admit` or extra axiom is introduced.
