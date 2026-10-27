# S143 — categorical residue augmentation: formal proof record

## Frozen mathematical target
The sole first-paper target is the five-stage whole-real (Ch(B)) diagram over (B=\mathbb F_2[C_4]) from S076/S077/S113/S114 with internally asserted distances (1/2<1<5/4\le d_{HI}\le5/2). The strict homotopy metric allows arbitrary weak-equivalence zigzags on both entire real-indexed lanes, including nonzero acyclic zero-lane replacements. This session does not promote the main metric statement to a Lean theorem.

## Certified S143 residue-category layer
In `C4/Augmentation.lean`, `residueModuleObject : ModuleCat B` uses an explicit `Module B (ZMod 2)` structure supplied by `residueHom.toModule`. The genuine categorical `residueModuleMorphism` uses the public `ModuleCat.ofHom` API and the S142-certified B-linear residue map. `differential_residueModuleMorphism` shows the first differential followed by augmentation vanishes. `residueObjectAt` and `residueDifferentialAt` build `residueComplex : ChainComplex (ModuleCat B) ℤ` supported at degree zero. `augmentationComponent` is defined for every integer (residue map at zero, zero elsewhere), including negative degrees.

This solves the concrete S142 module-object elaboration problem. It is not the homology computation and is not automatically a chain map: the indexed naturality relation must compile to promote the components to `integerResolution ⟶ residueComplex`.

## Mathematical argument
At index zero the differential into the source term is multiplication by t, whose residue is zero; in every other target index the proposed augmentation component is zero. This is enough algebraically to define a chain map once the dependent `eqToHom` transports in `integerDifferential` and `augmentationComponent` are discharged. The existing `residueLinear_ker_eq_range` and `positiveLinear_ker_eq_range` provide exactness as actual B-submodule equalities but do not yet identify `H₀`, all `H_n`, projectivity, or a complete shifted dg system.

## Further obligations
A compiled all-integer chain map, categorical homology H₀ and H_n≠0 vanishing, a B-ring quotient isomorphism, global shifted x/h/z all-choice dg fourfold, quiver, derived η₂, both full-real metrics remain obligations unless explicitly shown separately in BUILD/CLOSEOUT.
