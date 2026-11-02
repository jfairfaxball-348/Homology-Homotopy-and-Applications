# C4 completion strategy and dependency ledger — 2 November 2026

**Documentation/process revision, not a proof certificate.** S173 remains completed; S174 remains IN PROGRESS, PARTIAL. Preserve the exact all-real, BOTH-lane theorem and existing certified source. This replaces accumulated prospective overlays; historical strategies remain in Git and session records.

## Fixed target and verified baseline

For the genuine five-stage F over B = F₂[C₄] against zero, prove
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4≤dHI(F,0)≤5/2`.
Use the homotopy category of WHOLE real diagrams for dIHC and arbitrary whole-diagram objectwise quasi-isomorphism zigzags on BOTH lanes for dHI. Do not restrict replacements to a finite grid or literal-zero second lane.

Baseline main `633634e2e32abe186bde3fc1cf7c26fa3f2e24c3` passed pinned Lean #41290933867 and integrity #41290933821. S174's latest source contribution is described in `sessions/S174/PARTIAL.md`. The final numerical declaration does not yet exist.

## One live dependency ledger

| ID | Required output | Evidence / exact remaining dependency |
|---|---|---|
| C0 | Explicit ring/resolution, homology, genuine arbitrary-global nonboundary, full-real diagram and strict upper witness | Certified existing modules through S169; preserve. Group-algebra/polynomial-quotient presentation is still C4 work. |
| C1 | A strict square-zero five-chain, with justified comparison data and correct adjacent classes, produces a genuine original-system tertiary filler, contradicting `GlobalFourfoldDefiningSystem.no_tertiary_filler` | Open. S165–S168 prove primaries, interfaces, correction algebra and candidate families, not this implication. |
| C2 | Full five-edge quiver cone, natural QuasiIso and coherent derived two-shift; real-diagram comparison/localisation and lower bound by evaluation | Open. Include the final edge X₄→0. Vertexwise nullhomotopy is insufficient. |
| C3a | Genuine whole-shoelace replacement with natural pointwise QuasiIso and monic crossings; apply S172 quotient, S171 literal two-shift zero, S169 five cuts | Partially implemented. S174 has graded bar data, no square-zero/chain packaging/contraction certificate. Strict-interleaving-to-full-poset conversion must also be proved. |
| C3b | Supply exactly the comparison hypotheses consumed by C1, from the C3a output and arbitrary BOTH-lane zigzags | Open and first priority. The bar contract does not currently establish cofibrancy, K-projectivity or chain-homotopy inverses. |
| C4 | Honest distances, presentation equivalence, infimum inequalities and one faithful complete numerical theorem | Open. Type the final target early and connect it to C1–C3; no missing contract may be assumed to claim completion. |

Maintain actual declaration names, exact source/run evidence and failed goals here or in the active partial record as work progresses. Do not duplicate a chronological status history across the guidance files.

## 1. Repair the replacement-to-obstruction connection first

The S172 quotient requires only monic crossings and an acyclic opposite lane. The proposed bar was designed for precisely those hypotheses. That local simplification is valid as a target contract.

However manuscript §5, after the five cuts, uses cofibrant-fibrant representatives to choose chain-homotopy inverses and homotopies `D s_i = id + u_i v_i`. The proposed bar uses arbitrary coefficient complexes and does not establish the properties needed for that step. Objectwise QuasiIso, isomorphism in the derived category, degreewise split injections, and chain-homotopy equivalence are distinct assertions.

Before more extensive bar implementation, write the exact producer/consumer Lean signatures and prove the missing connection on the actual inputs. Two acceptable routes are:

- Strengthen the replacement argument to produce the comparison/homotopy data C1 needs, retaining all strict consecutive-zero identities and compatibility with the original diagram/adjacent derived classes.
- Prove the direct obstruction implication using the weaker quasi-isomorphism/zigzag data actually supplied. Any use of K-projectivity, lifts or coherent comparisons must itself be proved.

These are proposed routes, not established theorems. Independent vertex replacements can lose strict zero composites; do not silently use them. No need to rebuild a general model-category library unless the concrete dependency truly requires it. Report a precise unresolved signature or counterexample if neither route closes.

## 2. Prefer the direct strict-square-zero contradiction

Manuscript (5.3) defines, in mathematical right-to-left composition,
`T_ij = v_j b_(j-1) s_(j-1) ... s_(i+1) b_i u_i`.
Here `b_(r+1) b_r = 0` strictly. Given valid homotopy comparison data, differentiation yields (5.4):
`D T_ij = sum_(i<r<j) T_rj T_ir`.

Formalise this specific construction for the five stages, including the degree-three T₀₄ filler and the adjacent residue/nonzero-class bridge. Build one actual `GlobalFourfoldDefiningSystem` and a filler to contradict the existing universal obstruction. Do not assume the missing coherence equations or unit-residue fields as hypotheses of the final theorem.

This narrower route may avoid transporting arbitrary pre-existing secondary choices with all S167 correction terms. Preserve those modules. Return to general transfer only if an explicit consumer requires it or the direct route fails for a documented reason.

## 3. Test the existing pinned HomComplex API

The inspected Mathlib pin is `065356127b1dc0016f66b7283ce0ce2c4055aa55`, with Lean `v4.35.0-rc2`. Its [HomComplex source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Algebra/Homology/HomotopyCategory/HomComplex.lean) already contains:

- `CochainComplex.HomComplex.δ_comp` (differential/composition).
- `CochainComplex.HomComplex.δ_ofHom` and `δ_ofHomotopy`.
- `CochainComplex.HomComplex.Cochain.equivHomotopy`.

This is source inspection, **not a compiled C4 adapter**. The API is cohomological. Prototype reindexing a chain complex by degree negation, with correspondence of degree, differential, composition, actual chain maps and homotopies. Prove the characteristic-two sign simplifications and compatibility with the existing C4 defining-system interfaces. Keep the adapter isolated; do not rewrite certified foundations speculatively.

First useful executable target: derive the required C4 Leibniz identity through the adapter and use it in a direct T_ij coherence. A `#check` alone is not integration evidence. If this fails, retain the precise diagnostic and compare with a reusable custom transport normal form, rather than repeating the same failing simplifications.

## 4. Build the bar against the confirmed contract

Retain `RealShoelaceBarIndices/Terms/Faces/Horizontal/Total/Augmentation`. At present these contain indices and graded maps, not a bar chain complex.

The pinned library also provides:

| Candidate reuse | What it supplies after its input is constructed |
|---|---|
| [AlternatingFaceMapComplex](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean) | An alternating face complex and `d_squared` for a genuine simplicial object |
| [ExtraDegeneracy](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/AlgebraicTopology/ExtraDegeneracy.lean) | `ExtraDegeneracy.homotopyEquiv` for an augmented simplicial object |
| [TotalComplex](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Algebra/Homology/TotalComplex.lean) | `HomologicalComplex₂.total` for a bicomplex with the required coproducts/shapes |

Prototype the necessary interfaces before selecting a large representation change. Check coefficient transport at the first face, all simplicial identities, append-terminal versus library degeneracy orientation, mixed ℕ/ℤ indexing, coproduct totalisation and preservation of the contraction through the internal differential. The extra-degeneracy result alone does not certify the current total complex.

If the existing direct-sum route is simpler after these tests, prove identities on `DirectSum.lof` generators with a reusable extensionality/transport layer. Then establish square-zero, chain/functor laws, monic chain maps, natural augmentation, contraction and QuasiIso; apply the certified quotient/cut results and the repaired C3b/C1 connection.

## 5. Execution and completion

Establish a functioning pinned compiler and reuse its dependency cache; record local versus hosted verification accurately. Use targeted Lean for iteration and a full pinned C4+OptionD build before promotion. Environment limitations justify explicit hosted fallback, not uncompiled claims.

A connected batch should discharge a named dependency and exercise its consumer. Helpers may be necessary but are not automatic stop points. Keep C2 and C4 visible while resolving C1/C3. Update the working manuscript when the implemented argument changes, distinguishing an internal recipe from a certified theorem.

Follow `docs/SESSION_PROTOCOL.md` for branch, ordinary two-parent merge, exact PR/main checks, handoff status and authorization. No new candidate, theorem weakening, custom axiom or external action is introduced by this plan.
