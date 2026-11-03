# S175 — finish the full C4 formalisation over the group algebra 𝔽₂[C₄] (IN PROGRESS, PARTIAL)

**Authority.** Installing or reading this prompt executes nothing. S175 starts only on a fresh, separate owner instruction, for example "Run next session". Within that authorised conversation, continue through routine lemmas, checks and merges without new permission loops. Do not execute S176.

**Frozen theorem (unchanged).** Over B = 𝔽₂[C₄], for the genuine five-stage entire-real diagram F against zero:
`dCohI(F,0)=1/2 < dIHC(F,0)=1 < 5/4 ≤ dHI(F,0) ≤ 5/2`.
The derived category is that of whole real diagrams, and the homotopy metric allows arbitrary whole-diagram objectwise quasi-isomorphism zigzags on BOTH lanes, including nonzero acyclic replacements of zero. None of the following may stand in for it: a finite-grid surrogate, a literal-zero shortcut, a hidden hypothesis, `sorry`, `admit`, a custom axiom, or a conditional headline.

**Continuation.** S175 has a pinned local certificate. See `sessions/S175/PARTIAL.md` for the completed proof and the hosted checks still needed.

**Entry state.** S174 is closed (`sessions/S174/CLOSEOUT.md`).
- PR #215 was merged into main by the ordinary merge `bc06b6011f5556a8ba36ee85167b1fa5c875bc06`; merged-main Lean #41593094820 and integrity #41593094882 passed.
- Main contains `C4.c4_distance_separation` (`C4/MainTheorem.lean`). It proves all six conjuncts over `C4.B`, the four-coefficient truncated algebra 𝔽₂[t]/(t⁴), for every localisation `L` of `ℝ ⥤ C4Complex` at `objectwiseQuasiIso`. Its axioms are `[propext, Classical.choice, Quot.sound]`.
- The crosswalk is `formal/C4_LEAN_CROSSWALK.md`.
- The only open row of the ledger (`formal/C4_COMPLETION_STRATEGY.md`) is C5.

Do not re-prove the certified C1–C4 components. Edit them only to generalise definitions, and keep their `C4.B` instances definitionally unchanged.

**Entry checks.** Before writing:
- Pin the live main SHA and tree.
- Verify the S174 closeout merge that installed this prompt, and its merged-main CI.
- Inspect open PRs.
- Read `AGENTS.md`, `authoritative/START_HERE.md`, the live STATE fields, `formal/C4_COMPLETION_STRATEGY.md`, the crosswalk, and `C4/{Jets,Ring,RealDiagram,HomologyInterleavingDistance,DerivedInterleavingDistance,RealLadderTransport,HomotopyInterleavingBound,MainTheorem}.lean`.

**Deliverable 1 — the presentation as a Lean theorem.** Construct `C4.groupAlgebraEquiv : C4.B ≃+* MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))`, preferably also as an `≃ₐ[ZMod 2]`. It sends `t` to `1 + of g`, where `g = Multiplicative.ofAdd 1`; equivalently, `of g ↦ 1 + t`.

Suggested route:
- In characteristic two, `(1+t)⁴ = 1 + t⁴ = 1`, so `1 + t` has order dividing 4 and `MonoidAlgebra.lift` gives the algebra map out of the group algebra.
- Give the inverse on the basis `1, t, t², t³` and check both composites on generators or bases. Kernel-checked finite `decide` on `B`, which has `DecidableEq`, is acceptable.
- Record `t ↦ 1 + g` and `t³ ↦ 1 + g + g² + g³` (the norm element) as lemmas.

**Deliverable 2 — the faithful final statement over the group algebra.** Prove the same six conjuncts for complexes of `ModuleCat (MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4)))`, for:
- the transported diagram: `realDiagram` composed with the equivalence of whole real diagrams induced by restricting scalars along the RingEquiv (for example `ModuleCat.restrictScalarsEquivalenceOfRingEquiv`, mapped through `Functor.mapHomologicalComplex` and whiskering);
- the zero diagram;
- EVERY localisation at objectwise quasi-isomorphisms.

Preferred route:
1. Make `objectwiseQuasiIso`, `WeakZigzag`, `StrictRealInterleaving`, `derivedTranslate`, the homology persistence and the three distances generic in the coefficient ring (an 𝔽₂-algebra), keeping their `C4.B` instances definitionally unchanged.
2. Prove each distance invariant under the equivalence. This needs the equivalence to preserve zero, translations, objectwise quasi-isomorphisms in both directions, localisations (check the pinned `Functor.IsLocalization` transport lemmas) and underlying 𝔽₂-module homology.

A direct invariance proof for this one diagram is an acceptable fallback. Stating only that the RingEquiv exists beside the B-theorem does NOT complete this deliverable.

**Deliverable 3 — faithfulness audit and manuscript alignment.** Check each Lean definition against manuscript §1 and record these conventions in the crosswalk:
- right modules equal left modules, because the coefficients are commutative;
- homological ℤ-grading;
- `dCohI` on underlying 𝔽₂-modules, with the supremum over all degrees;
- `dIHC` in every localisation;
- `dHI` after zigzags of both lanes;
- `[0,∞]` values, with an empty infimum equal to `∞`;
- half-open stages and the terminal edge.

Align the abstract and manuscript §§4–5 with the certified routes while keeping the mathematics correct. §6's field-only comparison stays outside the frozen theorem and is not formalised unless the owner separately instructs it.

**Deliverable 4 — final certificate and closeout.** Do this only after exact-head PR CI, an ordinary two-parent merge and independent merged-main CI for the restated declaration:
- Mark the presentation row of the crosswalk as formal.
- Set `full_metric_theorem_lean_certified: true` in STATE, with the declaration names, axioms and run IDs.
- Update the status lines in START_HERE, README, ROADMAP and AGENTS, and manuscript §7.
- Write `sessions/S175/CLOSEOUT.md` with its NEXT_SESSION_HANDOFF.
- Advance last/next exactly once and install a FUTURE, UNEXECUTED S176 prompt whose scope the owner decides.

**Execution evidence.** Iterate with targeted `lake env lean`. Before promotion, run:
- the full pinned `lake build` (C4 plus the preserved OptionD);
- `#print axioms` on the new final declaration;
- the source scan for `sorry`, `admit` and `axiom`;
- `python3 scripts/validate_repository.py`;
- `python3 scripts/session_handoff.py --check`;
- `python3 -m unittest discover -s scripts -p 'test_*.py'`.

Zero or pending checks are not success. Report failures plainly, with the exact compiler output.

**Boundaries.** Without a separate owner instruction, none of the following: OptionD development, a new candidate, distance optimisation, a novelty/HHA-fit/prior-art/outside-review phase, Palomar registration, arXiv/HHA submission, public release, a priority announcement or third-party contact.
