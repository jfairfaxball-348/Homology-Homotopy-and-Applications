# S144 PROOF — certified all-integer augmentation and regular-module projectivity

## Frozen mathematical object
Continue only the fixed cyclic-four candidate B=F₂[C₄], P indexed over all ℤ with regular modules in nonnegative degrees and zero terms in negative degrees, and the five-stage whole-real F in Ch(right B). The internal unverified quantitative theorem is d_CohI=1/2 < d_IHC=1 < 5/4 ≤ d_HI ≤ 5/2, permitting arbitrary objectwise quasi-isomorphism zigzags of BOTH entire real lanes.

## New genuine Lean certificates
- `C4.augmentationComponent_naturality`: for each n:ℤ, the composition of `integerDifferential n` with `augmentationComponent n` equals the component in degree n+1 followed by `residueDifferentialAt n`. In degree zero this is multiplication by t followed by residue=0; away from zero, the concentrated target has zero differential or zero augmentation component. The degree-zero proof closes the actual `eqToHom` transport by categorical composition associativity and the already-certified `differential_residueModuleMorphism`.
- `C4.augmentationChainMap : integerResolution ⟶ residueComplex` invokes `ChainComplex.ofHom` with the correct orientation of its degreewise commutativity equation and unfolds the genuine `ChainComplex.of_d`.
- `C4.integerObject_projective (n : ℤ) (hn : 0 ≤ n) : CategoryTheory.Projective (integerObject n)` exhibits the regular B term as a categorical projective using `ModuleCat.projective_of_free` with the explicit `Module.Basis.singleton Unit B`.

These are actual compiled categorical definitions/proofs over the concrete commutative ring B; no sorry, admit, axiom or oracle.

## What has NOT been certified
The S142 B-linear identities `residueLinear_ker_eq_range` and `positiveLinear_ker_eq_range`, together with the S144 chain map, support but do not replace a typed `ModuleCat` homology calculation. H₀ ≅ residue, H_n=0 for every n≠0 (including negative n), and `augmentationChainMap` being a quasi-isomorphism are still open. Neither polynomial quotient `RingEquiv`, genuine globally shifted P[i], all-choice x/h/z dg obstruction, derived whole-ℝ η₂, nor arbitrary both-lane real strict interleaving has been Lean-verified. The internal manuscript proof is not an exported kernel theorem.
