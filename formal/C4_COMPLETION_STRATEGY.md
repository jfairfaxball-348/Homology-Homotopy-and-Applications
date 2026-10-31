## S173 direct algebraic escape from missing projective model structure (31 October 2026)

The actual two-lane shoelace *preorder* with entire-real inclusions kernel-compiled at `80150b0cb72002688fc2c0212112b81d3da82d20`. **New candidate, not Lean-proved:** `formal/C4_SHOELACE_BAR_CONSTRUCTION.md` gives a concrete unnormalised characteristic-two direct-sum bar functor on the entire poset, whose arrows are degreewise inclusions and whose augmentation contracts objectwise by appending the terminal point. Since the S172 quotient needs only monic backwards crossings and acyclic opposite lane, **projective cofibrancy is not a necessary hypothesis for this algebraic route**. The real next burden is Lean implementation and proof of the bar differential, functoriality, augmentation quasi-isomorphism and monic arrows, plus conversion from arbitrary strict interleaving to a full-poset functor. Do not mistake the mathematical formula for a certified theorem. Apply S172/S171/S169 immediately on certification, then finish C1/C2 and frozen metrics; no toy examples or more cast sessions.

---

## S172 completed categorical quotient bridge (30 October 2026)

The honest monic acyclic-source cokernel projection is `QuasiIso` by the long exact homology sequence, and the whole-real pointwise evaluation comparison is certified under explicitly monic crossings (source `abcb591f53646b73903687f1ecfa7c723f9037ff`, Lean #41131166960, integrity #41131166873). Neither hypothesis follows automatically from an arbitrary strict interleaving. **Do not repeat these two proofs.** Next direct C3 dependency is a genuine whole-real **shoelace-poset** replacement of arbitrary weak-equivalence zigzags on BOTH lanes supplying monic crossings; no pinned projective model instance is synthesized. The full strict lower bound, C1/C2, exact metrics remain open. See S173 prompt.

---

## S170 certified test and C3 gap (30 October 2026)

The real opposite lane is NOT assumed literally zero: `C4/NonzeroAcyclicRealLane.lean` now kernel-certifies an explicitly nonzero, objectwise acyclic entire ℝ-diagram and a genuine objectwise quasi-isomorphism from `zeroDiagram`. This **does not** yield the full shoelace quotient. At arbitrary strict e interleaving of both replacement lanes, construct a full shoelace cofibrant Q; prove crossing Q_O(u-e)→Q_F(u) cofibration in the pinned interface and a natural quotient C with full-diagram quasi-isomorphism and literal zero 2e shift. Only then feed `FiveCutExtraction` into the global arbitrary-choice obstruction. No more standalone illustrative examples as substitutes for C3.

> **S169 progress:** certified full-real zero-lane acyclicity criterion, actual strict 5/2 interleaving and five-cut strict composite extraction. The missing C3 bridge is specifically the natural shoelace quotient for arbitrary BOTH-LANE weak-equivalence zigzags; S169's five-cut reduction needs the quotient-derived strict shift zero, not an assumption. C2 and C1 remain open; S170 must attack C3 and C2 directly. Lean #41046995470 and integrity #41046995461 passed source checkpoint; full metric remains uncertified.

# C4 completion strategy — top-down rescue (30 October 2026)

**This is execution guidance, not a Lean proof or new mathematical claim.** S168 remains the last completed formalisation session and S169 remains FUTURE, UNEXECUTED. This strategy supersedes older one-lemma-at-a-time prioritisation, but preserves the exact target, trusted source, CI and publication boundaries.

## Frozen full theorem (do not weaken)

For the genuine five-stage functor `F : ℝ ⥤ ChainComplex (ModuleCat B) ℤ` with `B = F₂[C₄]`, and zero diagram `O`, prove
`dCohI(F,O)=1/2 < dIHC(F,O)=1 < 5/4 ≤ dHI(F,O) ≤ 5/2`.
The derived distance `dIHC` is in the homotopy category of **whole real diagrams**, not pointwise homotopy categories. The strict homotopy-interleaving distance `dHI` allows arbitrary objectwise quasi-isomorphism zigzags of **BOTH entire real-indexed lanes**, including nonzero acyclic replacements of the zero lane. Do not substitute a finite sample, fixed representative, zero replacement literally zero, merely objectwise nullhomotopic maps, or a conditional theorem assuming a missing metric/transfer statement. No `sorry`, `admit`, fake axioms, or custom assumptions closing the target.

## Why the old process was slow

- C4 requires unbounded complexes, coherent higher homotopies, derived localisation and real-indexed replacement machinery unlike the finite combinatorics/number theory/geometry in TreeStack, Pascal and ellipse.
- Repeated `eqToHom` transports across S149–S163 and the S168 graded Leibniz failure are partly **representation debt**. S164 improved this using data-preserving `relabelHomotopy`. Diagnose the abstraction before repeating component-level simplification loops.
- One-helper sessions, repeated status prose, and focusing on local lemmas before **testing the most difficult global bridges** created avoidable overhead. Not all 168 sessions were C4 formalisation; C4 was frozen at S138.
- On the pinned Mathlib, S164's `#synth ModelCategory` checks for unbounded chain complexes and real diagrams FAILED. This is a missing ready-to-use instance, not proof of impossibility. An explicit algebraic resolution is preferable *if* its exact bridge can be proved.

## Live dependency contracts — work backwards from the final declaration

Maintain a **short** living ledger of exact proposed Lean signatures (or clearly marked Markdown-only signatures until types exist), source witnesses, dependencies, actual compiler evidence, and blockers. No tautological placeholder theorem or unproved result placed in the C4 imports.

| Contract | Required certified work | Current status |
|---|---|---|
| C0 — explicit C4 | ring, all-degree homology/augmentation, arbitrary-global nonfillable fourfold; actual full-real diagram; five-shift zero; adjacent and primary homotopy-equivalence transfer | Certified S164–S166; preserve |
| C1 — higher transfer | identify S165 primary components, prove BOTH actual S167 replacement secondary differential coherences, construct genuine tertiary pullback from a strict square-zero replacement five-chain and nonzero adjacent class data | Open; S168 Leibniz cast failure |
| C2 — derived | full five-edge free-quiver cone **including X₄→0**, quasi-isomorphism/cofibrancy bridge, coherent (h,z) two-shift, integer-to-whole-real derived comparison, lower bound by evaluation | Open |
| C3 — strict | entire real shoelace, arbitrary objectwise quasi-isomorphism zigzags on **both lanes**, natural quotient of acyclic opposite lane, strict square-zero five-cut extraction, transfer contradiction, literal five-shift upper bound | Open; highest risk |
| C4 — metrics/presentation | truthful definitions for all three distances, infima/inequalities, needed group-algebra/polynomial-quotient presentation, a cold-checked exact numerical theorem and manuscript-to-Lean crosswalk | Open |

**Change the ordering:** probe C3 and C2 **now, before** another long succession of C1 cast lemmas. Work C1 in parallel; C4 must be defined early enough that proof targets are not vague, but do not claim it exists until typed and checked.

## Mandatory focused feasibility tests (actual Lean, not another planning workshop)

**A. Full-real strict two-lane bridge (first/highest risk).** From manuscript §5, identify and test the precise shoelace/replacement APIs using an honestly *nonzero acyclic* second lane. Try genuine natural split-mono / quotient / quasi-isomorphism lemmas and the extraction of five actual strict zero-composite maps. Objectwise quasi-isomorphism is NOT a chain-homotopy equivalence. If projective model-category machinery is missing, test a purpose-built algebraic diagram-resolution/quotient bridge; do not spend an entire session constructing a general model-category library by default. Report the exact theorem/interface that works or fails.

**B. Derived real bridge (also high risk).** Prototype the actual complete five-edge `E→V→X` free-quiver cone with terminal arrow, the coherent whole-diagram two-unit shift nullhomotopy, real Kan/localisation or a proved exact equivalent. Vertexwise nullhomotopy is insufficient. Capture actual source/test/diagnostic evidence.

**C. Generic graded Hom/index transport.** Before replaying `sessions/S168/LEIBNIZ_DIAGNOSTIC.md`, inspect the pinned `Mathlib.Algebra.Homology.DifferentialObject` (`objEqToHom`, `objEqToHom_d`) and `HomologicalComplex.d_eqToHom`. They may help with cast coherence, but are NOT a proven drop-in replacement. Compile a minimal test of those lemmas or a data-preserving normal form. Then establish one reusable cast/naturality abstraction, Leibniz, `d_ofChainMap`, `ofHomotopy`, both S167 secondary coherences and genuine tertiary pullback. Avoid unchecked rewriting of previously certified C4 files.

**For each test**, specify exact typed target, run and outcome: `proved` / `specific missing bridge` / `resource or mathematical blocker`. An unproved Markdown formula and a successful build of unrelated lemmas do not certify the bridge. Do not repeat identical failing simplifications without changing architecture.

## Execution and evidence discipline

- Optimise for end-to-end theorem, not PR/session count. Work substantial *connected batches* and keep going within an active continuous-completion authorization; don't stop solely because one lemma passed or a PR merged. S169 begins only on a fresh owner invocation in a new conversation.
- During exploratory work compile targeted Lean files for fast feedback. Before **promoting mathematical code**, run full pinned `lake build` (C4+preserved OptionD), `python3 scripts/validate_repository.py` and `python3 scripts/session_handoff.py --check`. Preserve the ordinary two-parent PR merge, independent exact-head and merged-main CI; never say pending == successful.
- Maintain one short dependency ledger and concise proof/build/closeout evidence, not endless duplicated status overlays or permission gates. Record verified declarations and actual failure traces.
- DONE means the final exact theorem and full real/both-lane quantifiers appear as an actual cold-built Lean declaration, with source SHA, axiom audit, checks and manuscript crosswalk. BLOCKED means a concrete missing theorem/interface, real counterexample or resource problem — not a routine session limit. Avoid arbitrary completion estimates.
- No OptionD work, target switch, novelty/fit/prior-art/review, Palomar, arXiv/HHA submission, public release or third-party contact without separately explicit owner approval.
