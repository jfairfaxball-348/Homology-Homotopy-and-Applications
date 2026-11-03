# C4 completion strategy and dependency ledger — 3 November 2026 (S174 continuation)

**The frozen theorem is one Lean declaration, checked locally; promotion is pending.** `C4.c4_distance_separation` (`C4/MainTheorem.lean`) states `dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4 ≤ dHI(F,0) ≤ 5/2` and compiles in a full local pinned build with axioms `[propext, Classical.choice, Quot.sound]`. S173 remains completed; S174 remains IN PROGRESS until hosted exact-head PR CI, ordinary merge and merged-main CI exist. Crosswalk: `formal/C4_LEAN_CROSSWALK.md`. Historical strategies remain in Git and session records.

## Fixed target and verified baseline

For the genuine five-stage F over B = F₂[C₄] against zero, prove
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4≤dHI(F,0)≤5/2`.
Use the homotopy category of WHOLE real diagrams for dIHC and arbitrary whole-diagram objectwise quasi-isomorphism zigzags on BOTH lanes for dHI. Do not restrict replacements to a finite grid or literal-zero second lane.

Entry main `783565958c01b36f35fcb01bda3593f328f11525` passed merged-main Lean #41480400099 and integrity #41480400038. The current continuation is on branch `ccr-efb93145-frhiz0` (it contains draft PR #214's branch, repaired); see `sessions/S174/PARTIAL.md`.

## One live dependency ledger

| ID | Required output | Evidence / exact remaining dependency |
|---|---|---|
| C0 | Explicit ring/resolution, homology, genuine arbitrary-global nonboundary, full-real diagram and strict upper witness | Certified; preserve. Group-algebra/polynomial-quotient presentation remains a C4 crosswalk item. |
| C1 | Any admissible replacement data produce a genuine original-system tertiary filler, contradicting `GlobalFourfoldDefiningSystem.no_tertiary_filler` | **Certified (local build)** in the weak-data form: `CochainInterleavingLadder.nonempty_fourfold` + `canonical_no_interleavingLadder`. Input is an interleaving with ACYCLIC opposite lane and a quasi-isomorphism ladder from the K-projective originals; no strict zero, quotient, cofibrancy or homotopy inverse. |
| C2 | Derived distance `dIHC(F,0)=1` in the localisation of whole real diagrams | **Certified (local build)**: `derivedInterleavingDistance_eq_one` for EVERY localisation at `objectwiseQuasiIso`. Upper bound: stage reduction (`localized_twoShift_eq_zero_of_stage`), seven-stage cone resolution and natural nullhomotopy from canonical `h₀₂,h₁₃,h₂₄,z₀₃,z₁₄` incl. terminal edge (`localized_twoShift_eq_zero`), homotopy invariance (`map_eq_of_naturalHomotopy`). Lower bound: `one_le_derivedInterleavingDistance`. |
| C3 | Arbitrary BOTH-lane zigzags feed C1 | **Certified (local build)**: `WeakZigzag` (`Relation.EqvGen` of objectwise-QuasiIso natural transformations), `WeakZigzag.acyclic_of_zero`, `WeakZigzag.hasRevLadder_iff`, `strictInterleaving_ge_five_fourths`. The bar/quotient route (old C3a/C3b) is no longer on the critical path; its modules are preserved. |
| C4 | Honest distances, presentation equivalence, infimum inequalities and one faithful complete numerical theorem | **Final declaration certified (local build)**: `c4_distance_separation` (+ `_canonical`). Crosswalk written. Remaining: hosted PR/main CI and merge; the presentation `C4.B ≅ 𝔽₂[C₄]` is documented, not a Lean `RingEquiv`. |

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

## 3. Final declaration and crosswalk

Done: `C4.c4_distance_separation` and `formal/C4_LEAN_CROSSWALK.md`. Optional strengthening: a Lean `RingEquiv` between `C4.B` and `MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))` via `t = 1 + g`.

## 4. Execution and completion

A local pinned toolchain now works (elan + `lake exe cache get`); use targeted `lake env lean` for iteration and a full `lake build` (C4 + preserved OptionD) before promotion. Hosted exact-head PR CI, ordinary two-parent merge and independent merged-main CI remain mandatory for promotion. Follow `docs/SESSION_PROTOCOL.md`. No new candidate, theorem weakening, custom axiom or external action is introduced by this plan.
