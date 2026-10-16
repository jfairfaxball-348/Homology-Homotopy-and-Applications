# S071 MATHEMATICS — finite-clock normal form, source-domain correction, derived audit

**Verdict: T187 internal full proof; S070-T184's asserted universal _Kochman bracket_ requires a new definition-and-transport theorem. The exact numerical theta4 application remains source-conditional. NO unconditional HHA-ready spectral gap certified.** The correction is not a disproof of the desired gap.

## I. Precise source/type issue: S070 T184 is overgeneral as cited

Kochman's *Chapter 2: Toda brackets*, Definition 2.2.1 (printed pp 13–16), formulates the stable composition product via classes `x_1,...,x_{t-1}` in sphere stems and a last class with coefficients in a spectrum `E` (smash/cone construction). It explicitly constructs the fourfold using G_02, G_13, G_24, G_03 and G_14, and three terminal faces; Theorem 2.2.3 compares **his** composition and smash versions. It is NOT, literally, a definition of a canonical complete bracket for every chain of arbitrary symmetric spectra. S070 T184 uses `kochmanBracket4(A_0→...→A_4)` for arbitrary `A_i`; this expression is **outside the stated source's declared scope** unless an extension and source-exact agreement are first supplied. Even if the original A_i are suspensions of sphere spectra, an arbitrary strict-zero replacement C_i need not be such a sequence; an isomorphism of Ho(Sp)^[4] alone does not authorise an unproved chain-invariance rule for that bracket. This is a **domain/transport missing lemma**, not a constructed interleaving violating the claimed bound. Accordingly the unconditional all-spectra implication in CLM-0353 is downgraded from PROGRAMME_PROVED to INHERITED_UNVERIFIED pending proof.

## II. T187 — unconditional all-real finite-clock strict-zero normal-form theorem

Let `M` be a pointed, left-proper, cofibrantly generated model category admitting the projective model structure on all the small diagram categories used below. Let `m≥2` be an integer. Let `F:R→M` be zero at negative times, constant `A_j` on `[j,j+1)` for `0≤j≤m`, and zero for `t≥m+1`; transition maps are a genuine strict chain `A_0→...→A_m` and its composites. Let `G` be zero at every real time. Distances use strict interleavings after arbitrary zigzags of **whole-diagram objectwise weak equivalences** of both inputs.

**Theorem S071-T187.** If the two diagrams admit such an ε-homotopy interleaving with `0≤ε<1+1/(2 floor(m/2))`, then for some `e` with `1≤e<1+1/(2 floor(m/2))` there exists a whole diagram `C:R→M` and a zigzag `C≃F` of whole objectwise weak equivalences such that the exact sample times
`t_j=j+floor(j/2)(2e−2)`, `j=0,...,m`, lie in their intended half-open stages, and all three-step-index double composites `C(t_j)→C(t_{j+2})` (all j≤m−2) are **literally zero morphisms of M**. Equivalently this strict-zero sampled chain represents a diagram isomorphic to the original chain in `Ho(M)^[m]`.

**Proof.** Increase ε to e=max{1,ε} using the standard thickening of an interleaving: postcompose crossings with structure maps to obtain an e-interleaving; both double composites remain the corresponding 2e transitions by functoriality. The bound on e remains strict. Write the resulting strict interleaved replacements as two lanes of the shoelace poset `P_e`, whose objects are `(F,t),(G,t)`, same-lane order is `≤`, and crossing order requires `s+e≤t`. It is a small poset even though its object set is uncountable. Choose ONE projectively cofibrant replacement of the entire shoelace diagram `Q→H`. Restriction to both lanes gives whole weak equivalences `Q_F≃F` and `Q_G≃G=0`.

For every comparable x≤y of P_e the structure map Q(x)→Q(y) is a cofibration: cellular projective generators `P_e(p,-)⊗i` add each cofibrant cell identically to every object in the upset of p. At any x≤y, a cell enters neither, both, or y only; induction on the cell-attachment ordinal, pushouts, transfinite composition and retracts preserve the cofibration conclusion. (No well-order or local finiteness of real indices is assumed.) In particular the crossing `Q_G(u−e)→Q_F(u)` is a cofibration for every u. Form the functorial pushout
`C(u)=Q_F(u) ⊔_{Q_G(u−e)} 0`.
Its map `Q_F(u)→C(u)` is a weak equivalence by left properness, since `Q_G(u−e)→0` is a weak equivalence. Crossing naturality supplies one whole-diagram map `Q_F→C`, not unrelated pointwise witnesses. Each F-double arrow factors strictly through `Q_G(t+e)→Q_F(t+2e)`; the terminal crossing is killed in `C(t+2e)`. Therefore the induced map `C(t)→C(t+2e)` has zero composites with the two pushout generators and is **literally zero** by the universal property. This works for every real t, including negative/critical/terminal times.

Set `c=2e−2`, so `0≤c<1/floor(m/2)`. Hence `0≤floor(j/2)c<1` for each j≤m, proving `j≤t_j<j+1`, including endpoints at ε=1. Also `t_{j+2}−t_j=2+c=2e`, so the asserted sampled doubles vanish strictly. Restrictions of the whole weak-equivalence zigzag `C≃F` to these sample times yield an isomorphism of the two m-arrow chains in `Ho(M)^[m]`. QED.

For m=4, `e<5/4`, times `0,1,2+c,3+c,4+2c` and 3 doubles vanish. At e=5/4 the last time is 5, which leaves the fourth sphere stage; the theorem intentionally does NOT exclude this endpoint.

**Limit:** This normal-form theorem alone does not turn zero double composites into zero in **the specific Xu/Kochman sphere bracket**. That needs a separately proved, explicitly model-independent general higher Toda operation plus zero-membership invariance and comparison with Kochman on sphere words. T187 may itself be a standard consequence of classical rectification technology and does NOT pass G2 or establish dHI>dIHC.

## III. Referee audit of S070 T185/T186 (not a new external verification)

The derived floor-left-Kan construction has a formal adjunction: `i:N_0→R`, `(i_!X)(t)=X(floor(t))` for t≥0, zero for t<0. Restriction `i^*` preserves objectwise projective fibrations/trivial fibrations, so `i_!` is left Quillen and preserves the derived representative after a projective source replacement. Thus a derived-null integer two-step natural map suffices for a real derived-null 2-shift. This is not merely componentwise nullity.

For the specific 2-local sphere spectrum chain `Σ^68S_(2) --2→ Σ^68S_(2) --σ²→ Σ^54S_(2) --σ²→ Σ^40S_(2) --2→ Σ^40S_(2)`, the two coherence discrepancies of vertexwise double nullhomotopies are loops in mapping spaces whose `π_1` are identified (with projective source and fibrant target replacements) with `π_29^S{}_(2)=0`. As described by S070, successive lifting through restriction fibrations can kill these two defects without spoiling the first correction. Under the exact 2-primary source stem input, `d_IHC=1` remains an **internal conditional result**: ε<1 would force a nonzero id/degree-2 component of the 2ε-transition to vanish, while the coherent derived 2-shift produces ε=1. An independent full model-categorical mapping-space construction, including all strict representatives and the exact source relation `σ²σ²=0`, remains desirable before downstream formalisation. None of this repairs the Toda type/transport problem.

## IV. Source-convention comparison (no forced equivalence)

| Input | Kochman Ch2 Def 2.2.1 / Thm2.2.3 | Xu 2016 §5 | Decision |
|---|---|---|---|
| Class domain | t−1 sphere-stem maps, terminal E-class, stable suspensions | explicit sphere-stem word 2,σ²,σ²,2 | **compatible specific input**, not arbitrary spectrum chain |
| 4fold defining system | G02,G13,G24 and G03,G14, all choices | symbol ⟨2,σ²,σ²,2⟩ without printing its system | exact bijective convention identity **unquoted** |
| Output | final union of G01G14, G02G24, G03G34; 0 if all fillers constant | {θ4}, θ4 ≠0, indeterminacy zero (Xu Lemma5.1) | strong lineage, NOT literal definition crosswalk |
| Conventions | composition/smash equality internal to Kochman's definitions; warns some other brackets differ | references Kochman [10,11], and other sources | extension to model-categorical stable 4fold zero operation **not certified** |
| Arbitrary weak-equivalence replacements | not a source-stated invariance theorem for all chains of arbitrary spectra | no persistence/whole-WE theorem | **missing comparison-and-transport lemma** |

The only defensible conclusion is that the particular spectral gap is plausible/source-supported, **not** a formally unconditional derived numerical theorem or evidence of a new HHA-level theorem yet. The original ordinary unpointed Top^R owner target is unchanged and unproved.

## V. Lean dependency graph (DESIGN ONLY; nothing compiled)

A. basic finite-clock integer/floor arithmetic on real inequalities → B. shoelace as small preordered/poset category; projective representable cells → C. stable model category cofibration and left-proper cofiber preservation + whole weak-equivalence zigzags → D. strict 2e-killing diagram and sampled [4] transport (T187) → E. genuine general stable fourfold Toda zero predicate on arbitrary cofibrant-fibrant chains → F. exact zero-membership invariance under Ho(Sp)^[4] isomorphisms and **explicit comparison with Kochman sphere-stem convention** → G. published θ4 nonzero and π29 2-primary inputs with verified source/computation → H. projective diagram mapping-space derived null and floor-left-Kan real shift → I. stated spectral separation. Formal mathematics must not claim proof of F/G by declaring an unchecked axiom. Mathlib actual APIs, Lean version and compilation were NOT inspected or tested. Owner would first have to authorise a separate Lean session after proof and G2 gates.
