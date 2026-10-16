# S070 MATHEMATICS — a complete abstract spectral obstruction theorem, and a source-dependent 2-local instance

**Outcome classification: (B) COMPLETE_PROOF_G2_OPEN for the abstract theorem, NOT a freeze of the original ordinary unpointed space pair.** The complete proof below is a mathematical argument using established model-category and classical Toda inputs, not a Lean compilation, a new verification of published 2-primary stems, or a certified originality result. Its *specific* \(\theta_4\) application remains dependent on the literature's conventional fourfold comparison. The owner has not selected spectra as the official replacement target.

## 1. Models and exact definitions

Work in the ordinary **stable**, simplicial, cofibrantly generated **left proper** model category \(\mathcal{S}p\) of symmetric spectra in pointed simplicial sets (Hovey–Shipley–Smith), with zero object \(0\). Weak equivalences are stable equivalences. The index category is the small poset \((\mathbb R,\le)\) as an ordinary set-sized category; \(\mathcal{S}p^{\mathbb R}\) has the projective model structure with objectwise weak equivalences. \(d_{\mathrm{HI}}\) allows **arbitrary entire zigzags** \(F'\simeq F,G'\simeq G\) of objectwise stable equivalences and a strict interleaving in \(\mathcal{S}p^{\mathbb R}\). \(d_{\mathrm{IHC}}\) is computed by interleavings in \(\operatorname{Ho}(\mathcal{S}p^{\mathbb R})\), not \(\operatorname{Ho}(\mathcal{S}p)^{\mathbb R}\). \(G\) below is the constant zero spectrum diagram at ALL reals.

Let \(A_0\xrightarrow{a_0}A_1\xrightarrow{a_1}A_2\xrightarrow{a_2}A_3\xrightarrow{a_3}A_4\) be any actual strict chain of spectra representing an ordered chain in the stable homotopy category. Define the whole step diagram \(F\) by \(F(t)=0\) for \(t<0\), \(F(t)=A_i\) for \(i\le t<i+1\) and \(0\le i\le4\), \(F(t)=0\) for \(t\ge5\); all internal arrows are identities, stage crossings are composites of the \(a_i\), and maps into/out of zero use the unique zero morphisms. No pointwise cofibrancy or monicity is assumed for F or for any allowed replacement.

Use Kochman's composition-product **complete conventional stable fourfold Toda bracket** \( \langle[a_0],[a_1],[a_2],[a_3]\rangle_{\rm K}\subseteq[\Sigma^2A_0,A_4]\), assuming the three adjacent composites vanish in Ho and defining systems exist (the nonzero/zero test below automatically implies nonemptiness). It is the union over compatible five intermediate cone maps and over representatives, not a preselected triple composition or one arbitrarily picked secondary class.

## 2. T184 — abstract **five-term spectral obstruction theorem**

> **Theorem S070-T184 (fully specified universal statement).** Suppose \(\mathcal{S}p\) is as above, \(F,G\) are the step diagrams just defined, and the complete Kochman fourfold Toda bracket of the underlying chain exists and **does not contain zero**. Then
>
> \[
> \boxed{d_{\mathrm{HI}}^{\mathcal{S}p^{\mathbb R}}(F,G)\ \geq\ 5/4.}
> \]
>
> This conclusion quantifies over *all* whole-diagram, objectwise-stable-equivalence replacements of **both** inputs and every real interleaving parameter. It asserts neither endpoint attainment nor any value of \(d_{\mathrm{IHC}}\), and does not refer to ordinary \(\mathrm{Top}^{\mathbb R}\).

### Lemma T184.1: projective cofibrant poset diagrams have cofibration arrows

For any **small** poset \(P\), a projectively cofibrant \(P\)-diagram of symmetric spectra can be chosen so all its structure arrows are cofibrations. The projective generating cofibrations are \(P(p,-)_+\wedge i\), with \(i\) a generating cofibration in spectra. Such a generator attaches an identical new cell on the upset \(P_{\ge p}\), and nothing outside it. In a relative projective cellular attachment at \(p\), for a fixed \(x\le y\), either both stages receive the same pushout cell (\(p\le x\)), only \(y\) receives the new cell (\(p\not\le x,p\le y\)), or neither does. In all three cases the induced \(Q(x)\to Q(y)\) remains a cofibration, by closure under pushouts/composition. Transfinite composites and retracts preserve cofibrations. This uses no well-order on P: the transfinite order is the **cell-attachment ordinal**, not the dense real indexing. For \(\varepsilon>0\), the interleaving shoelace category \(P_\varepsilon\) is a small poset: its objects are two labelled copies of \(\mathbb R\); same-lane order is \(\le\), and crossings \(F(s)\to G(t)\), \(G(s)\to F(t)\) exist exactly when \(s+\varepsilon\le t\). The two strict interleaving equations make the paired lanes a functor on this poset.

### Lemma T184.2: every strict interleaving has a whole-equivalent strict-zero replacement

Suppose \(F'\simeq F\), \(G'\simeq G=0\) as **whole diagrams**, with a strict \(\varepsilon\)-interleaving for some \(\varepsilon>0\). Apply one projective cofibrant replacement \(Q\to H\) to their **whole shoelace diagram** (not separately to the lanes). Write \(Q_F,Q_G\) for the restrictions. Every crossing \(b_{s}:Q_G(s)\to Q_F(s+\varepsilon)\) is a cofibration by T184.1, and \(Q_G(s)\to0\) is a stable equivalence for every real \(s\), since \(Q_G\simeq G'\simeq0\) objectwise. Define for every real \(u\)
\[
C_F(u):=Q_F(u)\coprod_{Q_G(u-\varepsilon)}0.
\]
The map \(q_u:Q_F(u)\to C_F(u)\) is a stable equivalence: the left vertical \(Q_G(u-\varepsilon)\hookrightarrow Q_F(u)\) is a cofibration, the map \(Q_G(u-\varepsilon)\to0\) is a stable equivalence, and the symmetric-spectra stable model is left proper. Naturality of the crossings gives **one entire functor** \(C_F:\mathbb R\to\mathcal{S}p\) and a natural objectwise stable equivalence \(Q_F\to C_F\). Both F and G were arbitrary whole-WE zigzags; \(C_F\simeq F\) in their original metric sense.

Strictness on the original shoelace means for all real \(t\)
\[
Q_F(t\le t+2\varepsilon)=
[Q_F(t)\xrightarrow{a_t}Q_G(t+\varepsilon)\xrightarrow{b_{t+\varepsilon}}Q_F(t+2\varepsilon)].
\]
The induced \(C_F(t)\to C_F(t+2\varepsilon)\) is the literal zero map. Indeed its precomposition with the pushout generator \(Q_F(t)\to C_F(t)\) is zero, since the displayed factorisation lands in the cofiber-killed crossing \(Q_G(t+\varepsilon)\subset Q_F(t+2\varepsilon)\). Its precomposition with the other pushout generator \(0\to C_F(t)\) is automatically zero. The universal property of that pushout makes the entire induced arrow zero. **Both interleaving identities, every real naturality, and replacements on both lanes are used**, with no pointwise-only shortcut.

### Lemma T184.3: strict doubles give a zero fourfold value

Let \(B_0\xrightarrow{f_0}B_1\xrightarrow{f_1}B_2\xrightarrow{f_2}B_3\xrightarrow{f_3}B_4\) be an actual pointed spectrum chain with \(f_1f_0=f_2f_1=f_3f_2=0\) **as maps**, not merely in the homotopy category. In Kochman Def 2.2.1 for \(t=4\), the three first-cone extensions \(G_{02},G_{13},G_{24}\) can be taken to be literally constant, because their boundaries are those three strict composites. The two second-cone extensions \(G_{03},G_{14}\) can likewise be taken constant because each of their two boundary faces uses an already constant primary cone map. The final unfilled face union \((G_{01}G_{14})\cup(G_{02}G_{24})\cup(G_{03}G_{34})\) is then the zero attaching map; hence \(0\in\langle[f_0],[f_1],[f_2],[f_3]\rangle_{\rm K}\). This is an explicit **five-filler/three-terminal-face** argument, not an inference from pairwise homotopy-class nullness.

The **complete** conventional bracket is invariant under chain isomorphisms in \(\operatorname{Ho}(\mathcal{S}p)^{[4]}\): if \(\phi_i:A_i\cong B_i\) intertwine the four homotopy classes, replace each \(\phi_i\) by a stable weak-equivalence zigzag between cofibrant-fibrant models and whisker the entire defining system using cylinders/cones and their homotopy extension properties. Conversely use inverse \(\phi_i^{-1}\). The transported zero output stays zero under conjugation, independent of additive signs. Equivalently, the complete bracket is defined on a composable sequence of **homotopy classes**, and choosing different representatives is expressly part of Kochman's Def 2.2.1 union. This argument applies to the conventional Kochman bracket; it does **not** identify a different author's fourfold variant.

### Proof of T184: full parameter/endpoint check

Suppose an \(\varepsilon\)-strict interleaving after replacements existed for \(\varepsilon<5/4\). Standard interleaving thickening (postcompose crossings with transitions) takes any \(0\le\varepsilon<1\) to an interleaving at 1; thus it suffices to exclude \(1\le\varepsilon<5/4\). For \(\varepsilon=0\), thickening also works; the quotient lemma is applied at 1.

Set \(c=2\varepsilon-2\), so \(0\le c<1/2\), and sample
\[
t_0=0,\quad t_1=1,\quad t_2=2+c,\quad t_3=3+c,\quad t_4=4+2c.
\]
Each \(t_i\) lies in **the corresponding half-open interval** \([i,i+1)\). Direct arithmetic yields \(t_{i+2}=t_i+2\varepsilon\) for \(i=0,1,2\). By T184.2, the sampled C_F chain has all three adjacent double composites **literally zero**. By T184.3 its full stable fourfold bracket contains zero. The entire weak equivalence \(C_F\simeq F\) restricts on the five chosen timestamps to zigzags of \([4]\)-diagrams and hence a natural chain isomorphism in \(\operatorname{Ho}(\mathcal{S}p)^{[4]}\). The original bracket therefore contains zero, contradicting the hypothesis. At \(\varepsilon=1\), \(c=0\), all sample times are legal. As \(\varepsilon\uparrow5/4\), \(t_4\uparrow5\) but remains \(<5\); at \(\varepsilon=5/4\), \(t_4=5\) lies in the terminal ZERO stage, so **no endpoint exclusion is asserted**. Negative indices are no exception: zero spectra are present there and the whole shoelace proof included them. Taking the infimum gives \(d_{\rm HI}\ge5/4\). QED.

## 3. T185 — independent derived-side sufficient criterion

> **Proposition S070-T185.** For any such step F, suppose its integer-chain 2-shift natural transformation on \(\{0,1,2\}\), \((a_1a_0,a_2a_1,a_3a_2):(A_0\to A_1\to A_2)\to(A_2\to A_3\to A_4)\), is null in the **derived homotopy category of the three-vertex diagram**, with the target transformations to the zero stages for integers \(\ge3\) included. Then \(d_{\mathrm{IHC}}(F,0)\le1\). If the identity/first-crossing map on \(A_0\) remains nonzero under \(\eta_F^{2\varepsilon}(0)\) for every \(\varepsilon<1\), then \(d_{\mathrm{IHC}}(F,0)=1\).

**Proof.** Let \(i:\mathbb N_0\hookrightarrow\mathbb R\). For \(t\ge0\), the comma index of \(i_!\) at t has terminal object \(\lfloor t\rfloor\); for \(t<0\) it is empty and its colimit in spectra is zero. Thus \(i_!X=F\) on the nose for the integer step diagram X. Restriction \(i^*\) preserves projective fibrations and trivial fibrations objectwise and is right Quillen; \(i_!\) is left Quillen. Its derived image \(\mathbb Li_! X\) is objectwise equivalent to F because replacing X projectively cofibrantly leaves the floor values objectwise equivalent, including zero at negative indices. The derived adjunction identifies the map \(\eta_F^2\) with its restriction \(X\to i^*(F^2)\): precisely the integer two-step natural map. Nullness on integers 0,1,2 extends to all later integer stages since those target stages are zero, giving \(\eta_F^2=0\) in \(\operatorname{Ho}(\mathcal{S}p^{\mathbb R})\). A 1-IHC interleaving with constant zero G uses the two unique zero natural transformations; the zero lane's identity holds automatically and the F lane holds iff \(\eta_F^2=0\). Conversely for \(\varepsilon<1\), its F-lane identity would force \(\eta_F^{2\varepsilon}=0\), contrary to the stated nonzero component. QED.

## 4. T186 — the actual two-local chain and a source-dependent instance

Let \(\mathbb S_{(2)}\) be the 2-local sphere spectrum **as an object of ordinary symmetric spectra**, and set
\[
(A_0,A_1,A_2,A_3,A_4)
=(\Sigma^{68}\mathbb S_{(2)},\Sigma^{68}\mathbb S_{(2)},\Sigma^{54}\mathbb S_{(2)},\Sigma^{40}\mathbb S_{(2)},\Sigma^{40}\mathbb S_{(2)}).
\]
Choose actual representatives of the stable classes \(2,\sigma^2,\sigma^2,2\). Their consecutive composites are stably zero by the standard 2-primary relations used in Xu's fourfold computation. In the stable projective mapping-space of natural transformations on \([2]\), replace the source \(A_0\to A_1\to A_2\) by a projectively cofibrant cellular/mapping-cylinder diagram \(Q_0\hookrightarrow Q_1\hookrightarrow Q_2\). The two restriction maps of derived mapping spaces
\(\mathrm{Map}(Q_1,A_3)\to\mathrm{Map}(Q_0,A_3)\) and \(\mathrm{Map}(Q_2,A_4)\to\mathrm{Map}(Q_1,A_4)\) are Kan fibrations after fibrant target replacement. Choose three vertexwise nullpaths for the composites. The discrepancy of the first compatibility condition is a loop in \(\mathrm{Map}(Q_0,A_3)\); the second is a loop in \(\mathrm{Map}(Q_1,A_4)\). Both loop groups are
\[
\pi_1\mathrm{Map}(\Sigma^{68}\mathbb S_{(2)},\Sigma^{40}\mathbb S_{(2)})\cong \pi_{29}^{S}{}_{(2)}=0.
\]
Fill the first rel-endpoint loop and lift its nullhomotopy along the first restriction fibration to correct the middle nullpath **without moving endpoints**; fill the second discrepancy and lift along the second restriction fibration to correct only the final nullpath. The first square stays fixed during the second correction. Consequently all three natural transformation components are null by **one coherent path** in the derived [2]-diagram mapping space. T185 yields \(d_{\rm IHC}\le1\). For \(\varepsilon<1/2\), \(\eta^{2\varepsilon}_F(0)\) is the identity on \(\Sigma^{68}\mathbb S_{(2)}\); for \(1/2\le\varepsilon<1\), it is multiplication by 2. Both give nonzero maps on \(\pi_{68}\cong\mathbb Z_{(2)}\). Thus
\[
\boxed{d_{\rm IHC}(F,0)=1.}
\]
If the **Kochman conventional complete stable bracket** is the one Xu's published §5 calls \(\langle2,\sigma^2,\sigma^2,2\rangle=\{\theta_4\}\), then Xu's \(\theta_4\ne0\) together with T184 gives
\[
\boxed{1=d_{\rm IHC}^{\mathcal{S}p^{\mathbb R}}(F,0)
<5/4\le d_{\rm HI}^{\mathcal{S}p^{\mathbb R}}(F,0).}
\]
**Source specificity:** Xu, *Geometry & Topology* 20 (2016) printed p1620, calls this the second of four **well-known** fourfold brackets and cites Kochman [10,11], but does not restate the defining system. We reproduce Kochman's complete defining system for the zero-direction; a literally quoted Xu–Kochman equality of definitions was not found. The **abstract T184/T185 proofs are unconditional**. The named numerical \(\theta_4\) application is supported by the very strong source lineage, not independently rederived from Adams differentials; do not give it the status of a separately formally/referee-certified theorem. No integral \(\pi_{29}^S=0\) assertion and no ordinary unpointed Top^R conclusion follows.

## 5. Formalisation architecture (DESIGN ONLY)

Target Lean interfaces would encode (i) an abstract small poset and its shoelace with two real-indexed copies and crossing inequalities; (ii) projectively cofibrant diagram, structure cofibrations, whole WEs and functorial cofiber; (iii) a fourfold Toda ZERO predicate and strict-double-zero → contains-zero; (iv) weak-equivalence invariance of that predicate; (v) \(\operatorname{Ho}(\mathrm{Sp}^{\mathbb R})\) natural-shift maps and derived integer-to-real Kan; (vi) π29_(2)=0 and the Xu θ4 complete-value input as imported/classical **non-formal** dependencies to be mechanised or clearly justified separately.

Example pseudocode (NOT compiled):
\`\`\`lean
theorem fourfold_zero_of_strict_doubles
  (C : Chain4 Sp) (h01 : C.a1 ≫ C.a0 = 0)
  (h12 : C.a2 ≫ C.a1 = 0)
  (h23 : C.a3 ≫ C.a2 = 0) :
  0 ∈ kochmanBracket4 C := by ...
theorem spectral_five_stage_HI_lower
  (F : Step5 Sp ℝ) (h : 0 ∉ kochmanBracket4 F.chain) :
  (5 / 4 : ℝ) ≤ homotopyInterleavingDistance F (zeroDiagram ℝ Sp) := by ...
\`\`\`
The composition order in pseudocode is schematic only. No mathlib spectral model, Toda defining-system, cofibrant replacement, real-poset Kan or θ4 stem API was compiled/confirmed. An honest build must FIRST mechanise the elementary *finite five-clock arithmetic* and the category-theoretic pushout lemma in a suitable abstract model, then tackle genuine spectrum/Toda machinery; importing θ4 as an unexplained axiom would not certify the full published example.

## 6. Paper-readiness outline (NOT a manuscript)

Proposed title (ONLY if owner switches and G2 passes): *A Fourfold Toda Obstruction to Rectifying Interleavings of Persistent Spectra*. Abstract idea: a complete fourfold stable Toda operation obstructs all whole-equivalence strict interleavings with zero persistent spectra, despite the vanishing of the two-shift map in the derived diagram category; a 2-primary classical Kervaire element supplies the proposed explicit sharp numerical separation \(1<5/4\). Sections: model/distance definitions; whole-shoelace cofibration/cofiber reduction; fourfold zero criterion and five clocks; independent derived two-loop calculation; exact classical θ4 source; novelty/current HHA comparison; limitations and formalisation.

**Referee-standard honesty:** unlike the previous Top^R route, this proof has no unpointed zigzag/pointing bridge and no spaces-to-spectra passage. It does NOT settle Lanari–Scoccola's question specifically for **spaces**. A first-pass current originality gate is unresolved even for spectra; if prior art yields this as an easy corollary, it is a useful lemma, not HHA-ready.
