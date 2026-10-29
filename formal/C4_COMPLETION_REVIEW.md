# C4 completion review — 29 October 2026

The full first-paper theorem is **not formalised**. The current Lean development proves its algebraic global obstruction and constructs its real diagram, but the two quantitative metric lanes require additional categorical proofs. Passing the repository's build does not assert that the paper's headline theorem exists as a Lean declaration.

## Why the sessions accumulated

1. The repository passed through many research targets before freezing C4 at S138. Session numbers count that research history, not just this formalisation.
2. S149–S163 repeatedly transported shifted complexes through dependent equalities. Definitions created opaque equality casts on `Homotopy` data; subsequent work then attempted to recover the original components. This was an avoidable representation cost. S164 replaces endpoint casts by a data-preserving `relabelHomotopy` and defines the primary family explicitly.
3. Recent handoffs budgeted one small cast lemma or interface per owner invocation. That workflow obscured the much larger remaining dependency graph. The owner's continuous completion directive supersedes routine stop-after-one-lemma boundaries.
4. The inherited local obstruction interface reused a primary right-hand side and terminal factors. It did not directly represent the independent global data. S164 proves a stronger, correctly independent coefficient lemma and extracts its hypotheses from the genuine global equations.
5. The last numerical inequalities are not just packaging the ring calculations. They concern localisation of complete diagrams and arbitrary replacements of both lanes. No corresponding metric API or projective real-diagram model-category instance is supplied by this repository or its pinned imports.

The delay therefore combines genuine missing infrastructure with poor representation and planning choices. It is misleading to describe the remaining work as a few final Lean casts.

## Concrete progress in this review

- `C4.canonicalGlobalFourfold` constructs an actual `GlobalFourfoldDefiningSystem s` for every integer shift. Both secondary coherences refer to the actual primary homotopies, rather than independent lookalike families.
- `C4.GlobalFourfoldDefiningSystem.terminal_residue` quantifies over **every** genuine global defining system, with all four adjacent representatives independent. It obtains residue one by extracting the actual chain-map, primary and secondary equations.
- `C4.GlobalFourfoldDefiningSystem.terminal_not_boundary` excludes every possible pair of tertiary-boundary components in the actual shifted-complex terminal degree. Infinite higher components cannot repair that equation.
- `C4.realDiagram` is an actual functor from the entire ordered real line into `ChainComplex (ModuleCat B) ℤ`. Its stage objects and zero ends agree with the manuscript, including all half-open endpoints.
- `C4.realDiagram_shift_five_zero` proves literal vanishing of the entire natural five-unit time-shift map. No finite sampling or metric assumption is used.

These results do **not** prove the paper's full metric inequality or invariance under arbitrary homotopy-equivalent replacements.

## Exact remaining proof contracts

| Contract | What must actually be proved | Current status |
|---|---|---|
| Presentation | Identify the concrete coefficient ring with the stated polynomial quotient/group algebra, with any left/right convention transport | No quotient/group-algebra `RingEquiv` in C4 |
| Transfer | From an arbitrary strict square-zero five-object chain and genuine homotopy equivalences, construct the entire transferred defining system and a tertiary boundary; establish its nonzero-generator residue fields | Not implemented |
| Derived two-shift | Build the full free-quiver cone with its terminal edge and quasi-isomorphism, prove the coherent `(h,z)` cone homotopy, and carry it to the entire real diagram/localisation | Not implemented |
| Derived lower bound | Prove evaluation detects the nonzero identity and Ext-one classes for every real parameter below one | Not implemented |
| Both-lane replacement | For arbitrary whole-real objectwise quasi-isomorphism zigzags, replace the full shoelace diagram and naturally quotient its acyclic opposite lane, preserving all required equivalences | Not implemented |
| Numerical metrics | Define the exact two distances, their allowed zigzags and parameter sets, then prove `dIHC=1` and `5/4≤dHI≤5/2` without assuming those structural contracts | No final metric theorem declaration |

The field-forgetful equality is separately cited in the manuscript and is not a Lean claim.

## Smallest infrastructure probe

On Lean `v4.35.0-rc2`, Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`, importing the actual development and `Mathlib.AlgebraicTopology.ModelCategory.Basic`, both of these fail instance synthesis:

```lean
open CategoryTheory HomotopicalAlgebra
#synth ModelCategory (ChainComplex (ModuleCat C4.B) ℤ)
#synth ModelCategory (ℝ ⥤ ChainComplex (ModuleCat C4.B) ℤ)
```

Exact input/output: `sessions/S164/MODEL_CATEGORY_PROBE{,_OUTPUT}.txt`. This diagnoses a missing ready-to-use instance; it is not a proof that Lean cannot formalise the mathematics. Mathlib's bounded-below injective cochain model structure does not directly supply the unbounded projective structures invoked in the manuscript.

A faithful completion needs several substantial modules, not a reliable one-session or one-lemma estimate. Prefer an explicit algebraic diagram-resolution/localisation construction if it removes the need to build a general model-category library; first prove the exact bridge it replaces. Do not hide missing bridges behind hypotheses, new axioms, finite-grid surrogates or a weakened headline.

## Completion rule

The project is complete only when a cold pinned build checks a declaration matching the complete frozen full-real, both-lane theorem. Until then the authority must list the exact outstanding contracts. Continue within the active owner's authorisation; ordinary verified checkpoints do not require a new owner decision. Publication, submission and third-party contact still require separate instructions.
