# C4 completion strategy and dependency ledger — 2 November 2026 (S174 continuation)

**Verified partial continuation; the full theorem remains uncertified.** S173 remains completed; S174 remains IN PROGRESS, PARTIAL. The homotopy-interleaving bounds `5/4 ≤ dHI(F,0) ≤ 5/2` and the homology distance `dCohI(F,0) = 1/2` are now Lean declarations (local pinned build; hosted PR/main CI still required). The derived distance `dIHC(F,0) = 1` and the single final declaration remain open. Historical strategies remain in Git and session records.

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
| C2 | Derived distance `dIHC(F,0)=1` in the localisation of whole real diagrams | **Open.** Needs: derived interleavings via lifted translation functors on an arbitrary localisation at objectwise quasi-isomorphisms; upper bound `L(η₂)=L(0)` from a natural cone resolution `Cone(⊕L_{i+1}X_i → ⊕L_iX_i) → F` (including the terminal edge `X₄→0`) with natural nullhomotopy built from canonical `h₀₂,h₁₃,h₂₄,z₀₃,z₁₄`, plus homotopy invariance of the localisation (Mathlib `Homotopy.map_eq_of_inverts_homotopyEquivalences` through complexes of persistence modules); lower bound by evaluation at `0` into `D(B)` using `globalAdjacent_nonnull` and original K-projectivity. |
| C3 | Arbitrary BOTH-lane zigzags feed C1 | **Certified (local build)**: `WeakZigzag` (`Relation.EqvGen` of objectwise-QuasiIso natural transformations), `WeakZigzag.acyclic_of_zero`, `WeakZigzag.hasRevLadder_iff`, `strictInterleaving_ge_five_fourths`. The bar/quotient route (old C3a/C3b) is no longer on the critical path; its modules are preserved. |
| C4 | Honest distances, presentation equivalence, infimum inequalities and one faithful complete numerical theorem | **Partial.** `homotopyInterleavingDistance` with `5/4 ≤ · ≤ 5/2` and `homologyInterleavingDistance … = 1/2` are certified (`ℝ≥0∞`-valued infima/suprema; empty sets give `∞`). Remaining: dIHC (C2), one combined final declaration, the group-algebra presentation crosswalk, and the manuscript-to-Lean crosswalk. |

Maintain actual declaration names, exact source/run evidence and failed goals here or in the active partial record as work progresses. Do not duplicate a chronological status history across the guidance files.

## 1. The replacement-to-obstruction connection (resolved by a weaker-data route)

The quotient route required strict square-zero composites after a cofibrant/bar replacement and chain-homotopy inverses, which objectwise quasi-isomorphisms do not supply. The certified route avoids both:

1. `kProjective_postcomp_bijective`: for K-projective `P` and ANY quasi-isomorphism `u`, postcomposition with `u` is bijective on homotopy classes `P ⟶ X⟦n⟧` (homotopy-category colocality, `ObjectProperty.isColocal_trW`). Its cochain consequences are `kProjective_relative_lift` and `kProjective_acyclic_coboundary`.
2. A strict `e`-interleaving `α : F' → O'^e`, `β : O' → F'^e` with acyclic `O'` gives, at the five cuts `sᵢ`, the relations `bᵢbᵢ₊₁ = αᵢβᵢ`, `bᵢαᵢ₊₁ = αᵢoᵢ`, `βᵢbᵢ₊₂ = oᵢβᵢ₊₁`, `β₀α₂ = o₀o₁`. Nullhomotopies into the acyclic lane (K-projective source) replace every strict zero in the comparison words; both interleaving laws are used.
3. Iterated relative lifts through the quasi-isomorphism rungs produce primary, secondary and tertiary fillers on the ORIGINAL resolutions. The adjacent maps are the canonical ones, so the unit residues are the certified canonical residues.
4. The ladder exists for `realDiagram` (identities up to stage identifications) and transfers along every zigzag step in both directions.

No replacement-side K-projectivity, cofibrancy or homotopy inverse is inferred from QuasiIso.

## 2. Remaining mathematics: the derived distance (C2)

Formalise, for an arbitrary localisation `L` of `ℝ ⥤ C4Complex` at objectwise quasi-isomorphisms: lifted translation functors (`Localization.lift`), derived `ε`-interleavings using them, and the distance as an `ℝ≥0∞` infimum. Prove:

- **Upper bound `ε = 1`.** Build `R = Cone(∂ : ⊕ L_{i+1}X_i → ⊕ L_iX_i)` on the whole real line, the natural objectwise quasi-isomorphism `R → F`, and the natural nullhomotopy of `η₂ ∘ (R → F)` with vertex components `h` and edge components `z` (terminal edge `X₄ → 0` included). Transfer homotopies to equalities in `L` via complexes of persistence modules and Mathlib's cylinder lemma. Vertexwise nullhomotopy is insufficient.
- **Lower bound.** For `ε < 1`, evaluation at `0` (into `D(B)` via reversal) detects `η_{2ε}`: the identity of `P` (not acyclic) for `2ε < 1`, and the nonzero `[x]` for `1 ≤ 2ε < 2` (K-projectivity reflects `Q.map` equalities to homotopies; `globalAdjacent_nonnull`).

## 3. Final declaration and crosswalk

After C2, state ONE theorem with `homologyInterleavingDistance realDiagram zeroDiagram = 1/2`, `derivedInterleavingDistance … = 1`, `5/4 ≤ homotopyInterleavingDistance …`, `… ≤ 5/2` (and the strict numerical inequalities), print its axioms, and write a manuscript-to-Lean crosswalk naming each definition. Keep the B-presentation (`C4.B` as `k[t]/(t⁴)` for `k[C₄]`) explicit in the crosswalk.

## 4. Execution and completion

A local pinned toolchain now works (elan + `lake exe cache get`); use targeted `lake env lean` for iteration and a full `lake build` (C4 + preserved OptionD) before promotion. Hosted exact-head PR CI, ordinary two-parent merge and independent merged-main CI remain mandatory for promotion. Follow `docs/SESSION_PROTOCOL.md`. No new candidate, theorem weakening, custom axiom or external action is introduced by this plan.
