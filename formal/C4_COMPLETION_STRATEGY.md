# C4 completion strategy and dependency ledger — 3 November 2026 (S174 closed; S175 active)

**The frozen theorem is one hosted-checked Lean declaration over the presentation `C4.B`.** `C4.c4_distance_separation` (`C4/MainTheorem.lean`) states `dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4 ≤ dHI(F,0) ≤ 5/2` with axioms `[propext, Classical.choice, Quot.sound]`. It was merged by PR #215 as the ordinary two-parent merge `bc06b6011f5556a8ba36ee85167b1fa5c875bc06`. Exact-head Lean #41592284384 and integrity #41592284364 passed, as did merged-main Lean #41593094820 and integrity #41593094882. S174 is closed; S175 is active. Pinned local Lean checks the full group-algebra declaration. Hosted integration is pending. Crosswalk: `formal/C4_LEAN_CROSSWALK.md`. Historical strategies remain in Git and session records.

## Fixed target and verified baseline

For the genuine five-stage F over B = F₂[C₄] against zero, prove
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4≤dHI(F,0)≤5/2`.
Use the homotopy category of WHOLE real diagrams for dIHC and arbitrary whole-diagram objectwise quasi-isomorphism zigzags on BOTH lanes for dHI. Do not restrict replacements to a finite grid or literal-zero second lane.

Current main `bc06b6011f5556a8ba36ee85167b1fa5c875bc06` passed merged-main Lean #41593094820 and integrity #41593094882; the S174 closeout PR builds on it. S174 evidence: `sessions/S174/PARTIAL.md` and `sessions/S174/CLOSEOUT.md`.

## One live dependency ledger

| ID | Required output | Evidence / exact remaining dependency |
|---|---|---|
| C0 | Explicit ring/resolution, homology, genuine arbitrary-global nonboundary, full-real diagram and strict upper witness | Certified; preserve. The group-algebra/polynomial-quotient presentation is the open C5 item. |
| C1 | Any admissible replacement data produce a genuine original-system tertiary filler, contradicting `GlobalFourfoldDefiningSystem.no_tertiary_filler` | **Certified (hosted CI)** in the weak-data form: `CochainInterleavingLadder.nonempty_fourfold` + `canonical_no_interleavingLadder`. Input is an interleaving with ACYCLIC opposite lane and a quasi-isomorphism ladder from the K-projective originals; no strict zero, quotient, cofibrancy or homotopy inverse. |
| C2 | Derived distance `dIHC(F,0)=1` in the localisation of whole real diagrams | **Certified (hosted CI)**: `derivedInterleavingDistance_eq_one` for EVERY localisation at `objectwiseQuasiIso`. Upper bound: stage reduction (`localized_twoShift_eq_zero_of_stage`), seven-stage cone resolution and natural nullhomotopy from canonical `h₀₂,h₁₃,h₂₄,z₀₃,z₁₄` incl. terminal edge (`localized_twoShift_eq_zero`), homotopy invariance (`map_eq_of_naturalHomotopy`). Lower bound: `one_le_derivedInterleavingDistance`. |
| C3 | Arbitrary BOTH-lane zigzags feed C1 | **Certified (hosted CI)**: `WeakZigzag` (`Relation.EqvGen` of objectwise-QuasiIso natural transformations), `WeakZigzag.acyclic_of_zero`, `WeakZigzag.hasRevLadder_iff`, `strictInterleaving_ge_five_fourths`. The bar/quotient route (old C3a/C3b) is no longer on the critical path; its modules are preserved. |
| C4 | Honest distances, infimum inequalities and one complete numerical theorem | **Certified over `C4.B` (hosted CI)**: `c4_distance_separation` (+ `_canonical`), crosswalk written. |
| C5 | Presentation equivalence and the faithful statement over 𝔽₂[C₄] | Pinned local Lean checks `groupAlgebraEquiv` and `c4_distance_separation_groupAlgebra`, with standard axioms. The crosswalk and manuscript align with the checked routes. Hosted integration and the final certificate remain. |

Maintain actual declaration names, exact source/run evidence and failed goals here or in the active partial record as work progresses. Do not duplicate a chronological status history across the guidance files.

## 1. The replacement-to-obstruction connection (resolved by a weaker-data route)

The quotient route required strict square-zero composites after a cofibrant/bar replacement and chain-homotopy inverses, which objectwise quasi-isomorphisms do not supply. The certified route avoids both:

1. `kProjective_postcomp_bijective`: for K-projective `P` and ANY quasi-isomorphism `u`, postcomposition with `u` is bijective on homotopy classes `P ⟶ X⟦n⟧` (homotopy-category colocality, `ObjectProperty.isColocal_trW`). Its cochain consequences are `kProjective_relative_lift` and `kProjective_acyclic_coboundary`.
2. A strict `e`-interleaving `α : F' → O'^e`, `β : O' → F'^e` with acyclic `O'` gives, at the five cuts `sᵢ`, the relations `bᵢbᵢ₊₁ = αᵢβᵢ`, `bᵢαᵢ₊₁ = αᵢoᵢ`, `βᵢbᵢ₊₂ = oᵢβᵢ₊₁`, `β₀α₂ = o₀o₁`. Nullhomotopies into the acyclic lane (K-projective source) replace every strict zero in the comparison words; both interleaving laws are used.
3. Iterated relative lifts through the quasi-isomorphism rungs produce primary, secondary and tertiary fillers on the ORIGINAL resolutions. The adjacent maps are the canonical ones, so the unit residues are the certified canonical residues.
4. The ladder exists for `realDiagram` (identities up to stage identifications) and transfers along every zigzag step in both directions.

No replacement-side K-projectivity, cofibrancy or homotopy inverse is inferred from QuasiIso.

## 2. The derived distance (C2) — certified route

The manuscript's integer free-quiver cone plus left Kan extension is replaced by: (i) factorising the whole-real two-unit shift through the seven-stage clock (`twoShift_realDiagram_factor`); (ii) a seven-stage resolution with contractible cone summands on stages 2 and 3 only (targets vanish from stage 4, so the terminal edge adds no condition), on which the stage two-shift is naturally nullhomotopic using the canonical primary and secondary fillers; (iii) Mathlib's cylinder lemma through complexes of persistence modules. The lower bound evaluates at `0` into `D(B)`.

## 3. Final declaration, crosswalk and the group-algebra restatement (C5)

The coefficient isomorphism sends `t` to `1 + g` and `t³` to the group norm. The induced module equivalence transports entire diagrams and their localisations. For the strict metric it transports all replacement zigzags in both directions. The homology comparison uses the canonical scalar inclusions on both sides. These claims are checked in the pinned local build.

## 4. Execution and completion

A local pinned toolchain works (elan + `lake exe cache get`). Use targeted `lake env lean` for iteration and a full `lake build` (C4 + preserved OptionD) before promotion. Hosted exact-head PR CI, an ordinary two-parent merge and independent merged-main CI remain mandatory for promotion; PR #215 is the worked example. Follow `docs/SESSION_PROTOCOL.md`. No new candidate, theorem weakening, custom axiom or external action is introduced by this plan.
