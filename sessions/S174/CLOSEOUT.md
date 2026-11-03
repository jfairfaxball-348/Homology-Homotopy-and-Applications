# S174 CLOSEOUT — the frozen C4 separation is one hosted-checked Lean declaration over `C4.B`

S174 closed on 3 November 2026 at the owner's instruction to commit, push, merge, fast-forward and install the next session. The partial record `sessions/S174/PARTIAL.md` holds the exact declarations, failures and route changes.

**Result.** `C4.c4_distance_separation` (`C4/MainTheorem.lean`) proves the following for the genuine five-stage entire-real diagram `realDiagram` against `zeroDiagram`:
`dCohI(F,0) = 1/2 < dIHC(F,0) = 1 < 5/4 ≤ dHI(F,0) ≤ 5/2`.
`dIHC` is taken in EVERY localisation of whole real diagrams at objectwise quasi-isomorphisms. `dHI` ranges over arbitrary whole-diagram objectwise quasi-isomorphism zigzags of BOTH lanes, and nonzero acyclic replacements of zero are allowed. All three distances take values in `[0,∞]`. `C4.c4_distance_separation_canonical` specialises the theorem to Mathlib's `objectwiseQuasiIso.Q`. The hosted build log prints the axioms of both declarations as `[propext, Classical.choice, Quot.sound]`. The manuscript-to-Lean crosswalk is `formal/C4_LEAN_CROSSWALK.md`.

**Route.**
- C1/C3: the fourfold obstruction is transferred through the acyclic opposite lane of the interleaving, using only K-projectivity on the original side. No bar replacement, quotient, cofibrancy or homotopy inverse is used.
- C2: a seven-stage cone resolution carries a natural nullhomotopy built from the canonical fillers; together with Mathlib's cylinder lemma this gives the upper bound. Evaluation at 0 gives the lower bound.
- `dCohI` is computed on the homology of the underlying 𝔽₂-modules.

The bar/quotient modules are kept but are no longer on the critical path.

## Integration evidence

| Item | Value |
|---|---|
| Entry main | `783565958c01b36f35fcb01bda3593f328f11525` |
| PR | #215 (`ccr-efb93145-frhiz0` → `main`). It supersedes draft #214, whose head `a0ef3c47b3bc0979febdf3073f3fe0c219fa719d` it contains; GitHub marked #214 merged. |
| Exact PR head | `17ad479114421f0af8d67a1beda1a79a4cd48aea`, tree `cdd3545221c686895b4bf3ac9c0d4b4e45cfcfd7` |
| Checks on the exact PR head | Pinned Lean build #41592284384 SUCCESS; repository integrity #41592284364 SUCCESS. The push runs #41550309962 and #41550309968 on the same head also succeeded. |
| Ordinary two-parent merge | `bc06b6011f5556a8ba36ee85167b1fa5c875bc06`, parents `783565958c01b36f35fcb01bda3593f328f11525` and `17ad479114421f0af8d67a1beda1a79a4cd48aea`. Its tree `cdd3545221c686895b4bf3ac9c0d4b4e45cfcfd7` is identical to the PR head tree. |
| Merged-main CI | Pinned Lean build #41593094820 SUCCESS; repository integrity #41593094882 SUCCESS |
| Branch | `ccr-efb93145-frhiz0` fast-forwarded to the merge commit and pushed |

## Limitations

- The coefficient ring is `C4.B`, the four-coefficient truncated algebra 𝔽₂[t]/(t⁴). Its identification with the group algebra 𝔽₂[C₄] via `t = 1 + g` is documented but is not a Lean `RingEquiv`. The declaration is not yet stated over `MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))`. The numerical theorem is therefore certified over the presentation, and STATE keeps `full_metric_theorem_lean_certified: false` until S175 completes.
- Manuscript §§4–5 still describe the superseded free-quiver/Kan and cofibrant-quotient routes; implementation notes there point to the certified routes. §6's field-only comparison lies outside the frozen theorem and is not formalised.
- No OptionD development, novelty or prior-art phase, external action or release took place.

## NEXT_SESSION_HANDOFF
- Next session: S175
- Status: FUTURE, UNEXECUTED
- Canonical prompt: authoritative/NEXT_SESSION_PROMPT.md
- Decisive target: finish the full formalisation. This means a Lean `RingEquiv` `C4.B ≃+* 𝔽₂[C₄]` with `t = 1 + g`, a faithful restatement of `c4_distance_separation` over group-algebra modules, a faithfulness audit and the final certification record.
- Authority: A new, separate owner instruction is required. Preparing this prompt does not run S175.
