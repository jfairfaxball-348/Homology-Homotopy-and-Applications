# S173 algebraic shoelace bar resolution: exact construction and Lean obligations

**Status: mathematical construction to formalise; NOT a certified Lean replacement or a proof of the frozen metric theorem.** Do not infer certification from the compiled shoelace *index-category* files. This construction deliberately targets all two-lane real diagrams, including nonzero acyclic zero-lane replacements, and avoids assuming the missing projective model structure.

## 1. Input and the important simplification

Let `P = RealShoelacePoint ε hε` be the **actual entire-real two-lane preorder**, certified in `C4/RealShoelacePoset.lean`, and let `D : P ⥤ C4Complex` be arbitrary. Write `B=𝔽₂[C₄]` and use its characteristic two.

The strict quotient argument in S171/S172 **does not actually need projective cofibrancy**. It needs:
1. a whole-poset functor `Q(D) : P ⥤ C4Complex`;
2. a natural transformation `augmentation : Q(D) ⟶ D` whose components are quasi-isomorphisms at every `p : P`;
3. monomorphism of `Q(D).map (homOfLE hpq)` for **each** `p≤q` (in particular every backward crossing).

A purpose-built algebraic *bar replacement* should establish these three facts directly, without a `ModelCategory` instance and without cofibrancy of the original chain complexes.

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

**Warning:** The bar resolution just outlined has not been defined in Lean, so the contraction, monomorphism and natural augmentation are not yet certified.

## 4. Direct connection to the frozen C4 theorem

Given ANY strict epsilon interleaving of *arbitrary* whole-real replacements `F'` and `G'`, build its genuine functor `D` on `P` (this direction of the shoelace/functor equivalence is another exact Lean obligation). Apply the bar `Q(D)`. Its two restricted lanes are objectwise quasi-isomorphic to the original lanes. If `G'` is objectwise acyclic, so is the right lane of `Q(D)`; every backward crossing is mono by the bar injection. The certified S172 quotient theorem then supplies `Q_F→C` as an objectwise quasi-isomorphism for the **entire real** diagram. S171 proves the full-real `2ε` structure map of `C` literally zero. S169 extracts three strict five-cut square-zero composites. Complete C1 higher transfer must then deliver the contradiction for `ε<5/4`.

This avoids proving a projectively-cofibrant model structure for `P⥤C4Complex`; no general model-category library is an implicit prerequisite.

## 5. Next implementation checkpoint and non-goals

**First:** finish/fix the actual whole-poset ↔ strict-two-lane interleaving conversion (not merely the preorder); cold-build and pin source. **Second:** construct `Chₙ` and the algebraic bar faces/total in genuine `ModuleCat B`, with no assumptions replacing the desired object. **Third:** prove its functoriality, objectwise quasi-isomorphism, and monic arrows, then apply S172/S171/S169. Do not add independent toy examples or resume cast-churn. C1/C2 and quantitative metrics remain OPEN until separately proven. Do not claim the five-stage result or issue external publications.
