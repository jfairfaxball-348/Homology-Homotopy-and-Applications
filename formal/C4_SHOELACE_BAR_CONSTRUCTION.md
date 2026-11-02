# S173 algebraic shoelace bar resolution: exact construction and Lean obligations

**Updated status, 2 November 2026:** S174 has certified indices and graded B-linear terms/maps, candidate boundaries and graded augmentation; see `sessions/S174/PARTIAL.md`. The bar is NOT yet a certified chain complex, replacement or proof of the frozen metric theorem. This recipe targets all two-lane real diagrams, including nonzero acyclic zero-lane replacements. The missing downstream comparison in §4 must be resolved; follow `C4_COMPLETION_STRATEGY.md`.

## 1. Input and the important simplification

Let `P = RealShoelacePoint ε hε` be the **actual entire-real two-lane preorder**, certified in `C4/RealShoelacePoset.lean`, and let `D : P ⥤ C4Complex` be arbitrary. Write `B=𝔽₂[C₄]` and use its characteristic two.

The strict quotient argument in S171/S172 **does not actually need projective cofibrancy**. It needs:
1. a whole-poset functor `Q(D) : P ⥤ C4Complex`;
2. a natural transformation `augmentation : Q(D) ⟶ D` whose components are quasi-isomorphisms at every `p : P`;
3. monomorphism of `Q(D).map (homOfLE hpq)` for **each** `p≤q` (in particular every backward crossing).

A purpose-built algebraic *bar replacement* should establish these three facts directly, without a `ModelCategory` instance and without cofibrancy of the original chain complexes. These are the C3a quotient hypotheses ONLY. They do not establish the homotopy comparison hypotheses later used by manuscript §5/C1; that separate C3b obligation is stated below.

## 2. Explicit unnormalised bar total complex

For each `p : P`, each integer homological degree `k`, and each nonnegative simplicial degree `n`, let
`Chₙ(p) = { (q₀,...,qₙ) | q₀≤q₁≤...≤qₙ≤p }`.
**All** weak chains are included; repeated vertices are allowed, and distinct lane-labelled vertices remain distinct.

Define an algebraic **direct-sum** total complex
```
Q(D)(p)ₖ = ⨁ (n : ℕ) ⨁ (σ : Chₙ(p))  D(σ₀)₍ₖ₋ₙ₎.
```
Internal differential `d_int` acts with `D(q₀)`'s differential on each summand. Horizontal differential `d_bar` lowers `n` by one, using the sum of the `n+1` face maps: face 0 applies `D.map(q₀→q₁)`; the other faces remove the indicated vertex and act as the identity on the coefficient in `D(q₀)`. Set `d_total=d_int+d_bar`; in characteristic two no additional Koszul sign is needed.

Precise proof obligations:
- `d_int²=0` from the original complexes.
- `d_bar²=0` by the usual paired simplicial face identities (each term occurs twice).
- `d_int d_bar=d_bar d_int` because every `D.map` is a chain map.
- Therefore `d_total²=0`, since `2=0` in `B`.
- Unbounded internal homological degrees cause no completion problem: the object is a **direct sum**, so each element has finite support and all differentials/homotopies are finite sums on each generator.

For `p≤r`, define `Q(D)(p)→Q(D)(r)` by **inclusion of chain indices**, `Chₙ(p)↪Chₙ(r)`. This is natural, commutes with both differentials, and is degreewise a split injection of B-modules. The projection onto source-indexed summands need not be a *chain map*; only degreewise injection is claimed. Faithfulness of evaluation of chain complexes makes the associated chain map mono.

## 3. Augmentation and explicit pointwise contraction

Define `aug_p : Q(D)(p)→D(p)` by mapping each `n=0` summand `D(q₀)` through `D(q₀→p)`, and setting all `n>0` summands to zero. The `n=1` face cancellation gives the chain-map equation.

At a **fixed** `p` the augmentation of the horizontal bar complex has an explicit extra degeneracy:
- from the `n=-1` augmented target `D(p)`, insert the singleton chain `(p)`;
- for `σ=(q₀,...,qₙ)`, append the terminal element `p` to form `(q₀,...,qₙ,p)`.

The standard paired-face cancellation gives the augmentation contraction. Characteristic two makes the internal differential/homotopy cross terms cancel in the direct-sum total. This proves `QuasiIso (aug_p)` for *every* `p`. The contraction is **pointwise** and need not be natural in `p`; the augmentation itself is natural, which suffices.

**Warning:** Only the graded ingredients have been defined and certified. Total square-zero, chain/functor packaging, chain-level monomorphism, natural chain augmentation, contraction and objectwise QuasiIso remain unproved. In particular, a graded augmentation is not yet a chain map.

## 4. Direct connection to the frozen C4 theorem

Given ANY strict epsilon interleaving of *arbitrary* whole-real replacements `F'` and `G'`, build its genuine functor `D` on `P` (this direction of the shoelace/functor equivalence is another exact Lean obligation). Apply the bar `Q(D)`. Its two restricted lanes are objectwise quasi-isomorphic to the original lanes. If `G'` is objectwise acyclic, so is the right lane of `Q(D)`; every backward crossing is mono by the bar injection. The certified S172 quotient theorem then supplies `Q_F→C` as an objectwise quasi-isomorphism for the **entire real** diagram. S171 proves the full-real `2ε` structure map of `C` literally zero. S169 extracts three strict five-cut square-zero composites. To obtain the contradiction for `ε<5/4`, the exact comparison data consumed by the direct C1 obstruction must still be supplied; the bar/quotient facts alone do not supply them.

### Missing connection to the downstream obstruction (C3b)

The manuscript's original §5 proof uses cofibrant-fibrant cut objects to choose chain-homotopy inverses and homotopies `D s_i = id + u_i v_i`. This algebraic bar recipe only promises QuasiIso and monic structure arrows. It uses arbitrary input coefficient complexes and establishes neither cofibrancy nor those inverse homotopies. Quasi-isomorphism alone does not imply chain-homotopy equivalence.

Before extending this recipe substantially, specify and test the exact comparison bridge. Either strengthen the replacement/comparison construction while preserving strict consecutive-zero composites and adjacent derived classes, or prove the direct obstruction using the weaker quasi-isomorphism/zigzag data actually available. Do not replace vertices independently without proving preservation of the required relations.

Avoiding a projective model-category instance for the quotient does not remove this downstream obligation. This is a gap in the adapted route, not a new disproof of the frozen theorem.

## 5. Next implementation checkpoint and non-goals

First resolve/test C3b and the direct C1 consumer under the current completion strategy. Reuse the existing S174 indices and graded maps. Compare the pinned AlternatingFaceMapComplex, ExtraDegeneracy and TotalComplex APIs with the direct implementation, checking orientation, coefficient maps and totalisation compatibility before choosing a representation. Then finish the actual complex/functor, monic chain maps, natural augmentation/contraction and QuasiIso, and complete the strict-interleaving/full-poset conversion. Apply S172/S171/S169 through the repaired comparison. C1/C2 and quantitative metrics remain OPEN until separately proven; do not claim the five-stage result or issue external publications.
