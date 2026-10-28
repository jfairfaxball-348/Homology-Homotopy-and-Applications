# S151 — certified full integer truncation-boundary naturality, positive global dg remains OPEN (28 October 2026)

Pinned C4 Lean source `b6e061be604dd6ae1bf0945154a0f77e679987d0` passed build #40682347499 and integrity #40682347435. `C4.globalXComponent_naturality_at_boundary` proves the genuine shifted chain-map naturality square for **every integer shift s and every n ≤ s**; `C4.globalXComponent_zero_below` proves the actual component vanishes when its target degree is zero. This is a bona fide homomorphism-of-shifted-complexes **boundary** statement, NOT a complete global chain map. Eight exploratory positive-degree x naturality builds failed on dependent `eqToHom` casts/normalization; no failed source was promoted. Complete x naturality, global h/z, full fourfold invariance, L2/L3 and all real metric equalities remain UNPROVED. No publication/novelty/HHA-fit/prior-art/review steps.

---

# S150 — certified shifted dg components, global chain map and full-real metric still OPEN

S150 (28 October 2026): pinned Lean #40676684048 SUCCESS and integrity #40676683857 SUCCESS on 553f990b228ea9b5b072e8bba5649861f7293374. New C4/ShiftedDG.lean compiles actual all-integer shifted B-linear x, h, z COMPONENTS, the characteristic-two categorical Dx=0 equality and an explicit differential-index transport lemma. This does NOT prove global chain-map naturality, global h/z homotopy equations, globally quantified fourfold transfer, real-diagram construction, or any of the frozen numerical distances. The completion goal remains OPEN; no false theorem certification, release, novelty/HHA-fit/prior-art or outside review.

---

> **S149 formalisation correspondence (28 October 2026).** Pinned Lean independently verifies the regular-module category identities for all periodic degrees (`regularDx_zero`, `regularDh_xx`, `regularDz_xh_hx`, `regularTerminal_identity`; #40666132514), arbitrary `ModuleCat B` local low-degree defining-system fillers and terminal nonboundary (`regularAllChoice_terminal_not_boundary`; #40666531530), and the actual full integer reindexing `integerShiftResolution s` of the S148 projective resolution (#40667762021). **The local all-choice theorem is not the global fourfold bracket over all shifted dg chain maps**, and the reindexed complexes alone do not provide these maps. The whole-real derived/strict distances and arbitrary both-lane weak-equivalence transfer are NOT Lean-certified. Paper's displayed numerical separation remains an INTERNAL working theorem, not a proved Lean statement.

> **Lean correspondence, S148 (28 October 2026).** `C4/Exactness.lean` now compiles `integerResolution_homology_zero_iso : integerResolution.homology 0 ≅ residueModuleObject`, `augmentationChainMap_quasiIsoAt_zero`, `augmentationChainMap_quasiIsoAt_nonzero` and `augmentationChainMap_quasiIso : QuasiIso augmentationChainMap`. The latter certifies the **actual augmentation-induced** homology isomorphism at every integer, not just an abstract matching of objects. The degree-zero equality of casted differentials closes by `ModuleCat.hom_ext`, `LinearMap.ext`, `rfl`. Exact source `c22d3890b77b753476f5731cc393edc9f1baf7e5`; pinned Lean #40657026979 SUCCESS, integrity #40657026873 SUCCESS. **Uncertified:** shifted P[0] through P[4], genuine B-linear x/h/z global dg maps/homotopies and all-choice fourfold; entire-real derived and strict homotopy-interleaving metric bounds on BOTH zigzag lanes. The manuscript's quantitative theorem remains INTERNAL, not Lean-certified. S149 is future only.

> **Lean correspondence, S147 (27 October 2026).** The genuine integer-indexed resolution has now passed Lean proofs of exactness/homology vanishing in *every nonzero degree* (positive `ShortComplex.isoMk` comparison plus S146 negative zero objects). The residue module is categorically the cokernel of the first differential. This does **not** supply the degree-zero homology isomorphism or show the actual augmentation-induced homology map is an isomorphism. Those two Lean obligations remain OPEN, as do shifted global dg x/h/z, all-choice bracket exclusion and the entire-real two-lane distance theorem. These are internal manuscript arguments, not claimed Lean certificates. Pinned source `e9898c401a25037a8d3862f88ef27bbb4e347bb5`; Lean #40588606381 SUCCESS; scratch H₀ #40589338567 FAIL at `C4/Exactness.lean:140:36`.

> **S146 formalisation boundary (27 October 2026).** S146 (27 October 2026): Pinned Lean certifies ACTUAL negative-degree integerResolution.ExactAt n and IsZero(integerResolution.homology n) for every n<0, including -1 (scratch d6b844d6f40c40143923956b2ef4513f2e20294c, build #40578700131 SUCCESS; integrity #40578700181 SUCCESS). Positive integer ExactAt remains OPEN: latest scratch 2c602f0d29c9cbec6703172c160b9c219189591a failed pinned Lean #40580404408 at C4/Exactness.lean:77:2 because range/kernel maps still compose with eqToHom casts, and do not simplify to bare coefficientLinear maps. No H0, QuasiIso, globally shifted dg all-choice fourfold, or whole-real distance theorem is certified. Frozen theorem unchanged. S147 is FUTURE, UNEXECUTED and requires separate owner instruction.

> **S144 Lean correspondence (27 October 2026).** The augmented integer-indexed chain morphism is now an ACTUAL Lean-certified `C4.augmentationChainMap` at all degrees (pinned Lean #40538805810 SUCCESS), rather than a family of compatible components awaiting `ChainComplex.ofHom`. Every nonnegative regular term is certified as a categorical projective module by `C4.integerObject_projective` (pinned Lean #40539821868 SUCCESS). This does **not** yet establish H₀/H_n, categorical quasi-isomorphism, global shifted all-choice fourfold, or either full-real homotopy metric; the manuscript's main numerical theorem remains internal and not Lean-certified.

> **S143 Lean formalisation boundary (27 October 2026).** An explicit categorical residue B-module and B-linear morphism, the degree-zero differential annihilation, a concentrated integer-indexed residue chain complex and augmentation components at every integer degree are pinned Lean-certified on scratch `b514244c1eeaaad3d96566c599e75262bca39396` (Lean #40534476045 SUCCESS; integrity #40534476198 SUCCESS). The complete augmented chain morphism and categorical H₀/H_n identification are **not** certified solely by these declarations; neither are the canonical quotient-ring isomorphism, global all-choice dg fourfold or either whole-real derived/strict metric. The displayed main theorem remains INTERNAL mathematical work, not a Lean-certified quantitative homotopy theorem. See S143 CLOSEOUT for any later verified chain-map extension.

> **S142 Lean formalisation boundary (27 October 2026).** The residue ring hom now induces an actual B-module on `ZMod 2` and a genuine B-linear augmentation `C4.residueLinear`. Lean certifies equality of the augmentation kernel and first differential image as B-submodules, and equality of all positive differential kernels and following images as B-submodules, via `C4.residueLinear_ker_eq_range` and `C4.positiveLinear_ker_eq_range`. This is rigorous module-level exactness, but a typed map of `ChainComplex (ModuleCat B) ℤ`, categorical homology objects H₀/H_n, quotient-ring `RingEquiv`, global all-choice dg fourfold and both whole-real metric proofs are STILL OPEN. S142 scratch build #40529780801 passed; do not identify these with a certified main theorem.

# A quantitative homotopy-interleaving gap over the cyclic-four group algebra

> **S141 formalisation boundary (27 October 2026).** `C4/IntegerResolution.lean` now certifies an actual integer-indexed `ChainComplex (ModuleCat B) ℤ` with the regular B-module in every nonnegative degree and an explicit zero module in negative degrees. `C4.integerDifferential_square` is all-integer. `C4.positiveDifferential_exact_coeff` certifies coefficient exactness, while `C4/Augmentation.lean` gives a surjective unital residue homomorphism B→F₂ whose kernel is (t). These do NOT yet prove a polynomial quotient `RingEquiv`, an augmented complex with H₀/H_n, the global all-choice dg obstruction or the whole-real quantitative metric theorem. The abstract remains an INTERNAL mathematical claim, not a kernel certificate.

**Frozen working manuscript — S138, 27 October 2026.** This is the selected first-paper mathematical argument, not a Lean certificate or a submission-ready proof. The complete full-real metric theorem remains to be certified. Throughout, statements about projective model structures, Kan extensions and fourfold transfer below are mathematical proof obligations for the final Lean development. The finite calculation in the appendix checks only finite coefficient jets.

## Abstract

Over the group algebra \(B=\mathbb F_2[C_4]\), we give a five-stage real persistence diagram \(F\) of unbounded complexes of right \(B\)-modules whose homology, derived-diagram and homotopy-interleaving distances to zero are quantitatively separated:
\[
 d_{\mathrm{CohI}}(F,0)=\tfrac12
 <d_{\mathrm{IHC}}(F,0)=1
 <\tfrac54\le d_{\mathrm{HI}}(F,0)\le\tfrac52.
\]
The strict homotopy-interleaving metric allows arbitrary objectwise-quasi-isomorphism zigzags of **both entire real-indexed diagrams**, including nonzero acyclic replacement diagrams for zero. The separation is detected by a fourfold defining-system obstruction whose terminal coefficient is independent of all choices. We explain the integer free-quiver and real Kan constructions for the derived upper bound, and the full real-shoelace cofibrant quotient for the strict lower bound. After forgetting the \(B\)-module structure, all three distances are \(1/2\) by a separately identified field-specific theorem. The categorical proof is currently internal and its full Lean verification is open.

## 1. Conventions and the exact statement

Let \(k=\mathbb F_2\), \(G=C_4=\langle g\mid g^4=1\rangle\), and \(t=1+g\). In characteristic two,
\[
 B=k[G]\cong k[t]/(t^4).
\]
The variable \(t\) has **homological degree zero**. We use homologically graded unbounded chain complexes of **right** \(B\)-modules, differential lowering degree, with the projective model structure: weak equivalences are quasi-isomorphisms, and fibrations are degreewise surjections. Denote this model category by \(\mathcal M=\mathrm{Ch}(B)\). All its objects are fibrant.

For a real-indexed diagram \(A\), write \(A^s(u)=A(u+s)\), and \(\eta_s^A:A\to A^s\) for the natural structure transformation. We use three different distances to zero.

* \(d_{\mathrm{CohI}}(A,0)\) is the supremum over homological degrees of the ordinary interleaving distances of the graded homology persistence modules (underlying \(k\)-modules).
* \(d_{\mathrm{IHC}}(A,0)\) is the interleaving distance computed in \(\mathrm{Ho}(\mathcal M^{\mathbb R})\), the homotopy category of **whole real diagrams**, not in \((\mathrm{Ho}\mathcal M)^{\mathbb R}\).
* \(d_{\mathrm{HI}}(A,0)\) is the infimum of strict interleaving parameters after **arbitrary whole-diagram zigzags of objectwise weak equivalences of both input lanes**. A replacement of the zero lane may be a nonzero acyclic diagram. No hypothesis requiring literal-zero replacements, a finite grid, or objectwise independent equivalences is added.

For interleaving with zero in any of these categories, the crossing transformations are the zero transformations. Hence an \(\varepsilon\)-interleaving exists precisely when the corresponding \(\eta_{2\varepsilon}\) is zero in the category in which the interleaving is considered; for \(d_{\mathrm{HI}}\), this criterion is applied **after** an allowed strict whole-diagram replacement.

**Theorem (internal, to be kernel-certified).** The explicit \(F\) of §2 satisfies the chain of inequalities displayed in the abstract. The \(\tfrac54\) lower bound is on an infimum: we claim no strict interleaving with \(\varepsilon<\tfrac54\), not nonattainment at \(\tfrac54\). We do not assert the exact value of \(d_{\mathrm{HI}}\), a topological-space analogue, or any generalisation to all finite group algebras.

## 2. The periodic free resolution and the strict five-stage diagram

In the ordered basis \(1,t,t^2,t^3\), multiplication in \(B\) is coefficientwise convolution truncated above degree three. The annihilator identities are
\[
 \operatorname{ann}(t)=(t^3),\qquad
 \operatorname{ann}(t^3)=(t).
\]
Consider the nonnegative free resolution
\[
 P_n=\begin{cases}B,&n\ge0,\\0,&n<0,\end{cases}
 \qquad
 d_n=\begin{cases}t,&n\ge1\text{ odd},\\t^3,&n\ge2\text{ even}.\end{cases}
\]
The equalities \(t\,t^3=t^4=0\) show \(d^2=0\). At positive even and odd degrees the two annihilator formulas show \(\ker d_n=\operatorname{im}d_{n+1}\). Therefore \(H_0(P)\cong B/(t)\cong k\), \(H_n(P)=0\) for \(n\ne0\). Since \(P\) is a bounded-below chain complex of free modules, it is cofibrant in \(\mathcal M\).

Put \(X_i=P[i]\) with \((P[i])_n=P_{n-i}\), for \(i=0,1,2,3,4\). An adjacent chain map \(P[i]\to P[i+1]\) is represented by a degree-minus-one family of coefficients on the *unshifted* resolution. Define
\[
 x_n=\begin{cases}1,&n\text{ odd},\\t^2,&n\text{ even},\end{cases}\quad
 h_n=\begin{cases}0,&n\text{ odd},\\t,&n\text{ even},\end{cases}\quad
 z_n=\begin{cases}0,&n\text{ odd},\\1,&n\text{ even},\end{cases}
\]
for \(n\ge1\), and zero for unavailable source/target degrees. These families will also serve as the primary and secondary fillers in §3. A componentwise verification yields \(Dx=0\) (§3), so all shifted copies of \(x\) define genuine chain maps \(a_i:X_i\to X_{i+1}\).

Define \(F:\mathbb R\to\mathcal M\) by
\[
 F(u)=\begin{cases}
 0,&u<0,\\
 X_i,&i\le u<i+1\quad(0\le i\le4),\\
 0,&u\ge5 .
 \end{cases}
\]
Its internal stage maps are identities; a map between stages is the ordered composite of the corresponding \(a_i\), and arrows involving zero are zero. Associativity in \(\mathcal M\) makes this a **strict functor over all real indices**. Let \(O\) denote the constant zero real diagram.

## 3. The complete fourfold obstruction: every choice

For any underlying degree-minus-one family \(f=(f_n)\), the characteristic-two Hom differential is
\[
 (Df)_n=d_{n-1}f_n+f_{n-1}d_n .
\]
The product of two degree-minus-one families at degree \(n\) is \((fg)_n=f_{n-1}g_n\) in our composition convention. The parity substitutions in §2 give, for all \(n\ge2\),
\[
 Dx=0,\qquad x^2=t^2,\qquad Dh=x^2,
 \qquad xh+hx=t,\qquad Dz=xh+hx .
\]
The explicit terminal fourfold combination is \(w=xz+hh+zx\). Its component at \(n=2\) equals \(1\), whereas a degree-minus-one boundary at degree two has the form
\[
 (Df)_2=tf_2+t^3f_1\in(t).
\]
The constant-term map \(\lambda:B\to k\), \(\lambda(\sum_{j=0}^3b_jt^j)=b_0\), therefore detects nontriviality. This **selected** nonzero representative is not by itself enough to rule out zero in a complete Toda–Massey bracket. We now quantify over *all* defining systems.

Let \(a,b,c,d\) be **any** adjacent degree-zero maps among the four shifted resolutions, each representing the nonzero generator \([x]\in\operatorname{Ext}_B^1(k,k)\). Their unshifted degree-minus-one families satisfy
\[
 a_1\equiv1\pmod t,\qquad
 0=(Da)_2=ta_2+t^3a_1 .
\]
Comparing the coefficients of \(t,t^2,t^3\) forces
\[
 a_2\equiv t^2\pmod{t^3}.
 \tag{3.1}
\]
The same equations hold for \(b,c,d\).

Suppose \(H\) is **any** primary filler, \(DH=ba\). At degree two,
\[
 tH_2+t^3H_1=b_1a_2,
\]
so (3.1) and \(b_1\equiv1\pmod t\) imply
\[
 H_2\equiv t\pmod{t^2}.
 \tag{3.2}
\]
The identical restriction applies to all three primary fillers, independently of their components at larger degrees.

Suppose \(K\) is **any** secondary filler with \(DK=cH+Ja\), where \(J\) is another primary filler. Again at degree two,
\[
 tK_2+t^3K_1=c_1H_2+J_1a_2 .
\]
The right side is \(t\pmod{t^2}\), by (3.1)–(3.2). Therefore
\[
 K_2\equiv1\pmod t.
 \tag{3.3}
\]
In every full defining system the terminal expression at degree two consists of three terms with the shape
\[
 c_1K_2+H_1J_2+L_1a_2 .
\]
The first has constant term one by (3.3), while the last two have constant term zero by (3.1)–(3.2). Thus \(\lambda(w_2)=1\) for **every** admissible choice. A boundary has \(\lambda((Df)_2)=0\). Consequently the complete nonempty fourfold defining-system set does **not** contain zero. Nonemptiness comes from \(x,h,z\).

The argument depends only on necessary equations at degree two, not on enumerating all infinite chain-map families; arbitrarily many higher components cannot alter it. The endomorphism group of \(k[i]\) in the derived category is \(\operatorname{Ext}^0_B(k,k)=k\), whose units are \(k^\times=\{1\}\). Hence homotopy-equivalence conjugations of the adjacent maps do not introduce other nonzero generator scalars in this example.

**Lean boundary for S138.** The coefficient structure \(k[t]/t^4\) and all-choice low-degree equations can be checked without defining the entire dg-Hom fourfold operation. That is useful but strictly weaker than a kernel-checked theorem quantifying over all unbounded resolutions, shifts, derived equivalences and real diagrams.

## 4. The entire derived diagram: vanishing of the two-unit shift

Let \(j:\mathbb N\hookrightarrow\mathbb R\), and let \(X:\mathbb N\to\mathcal M\) be the integer diagram \(X_i=P[i]\) for \(0\le i\le4\), \(X_i=0\) for \(i\ge5\). Its edges are \(a_i=x\) for \(0\le i<4\) and, **importantly**, the terminal \(a_4:X_4\to0\).

For an object \(M\in\mathcal M\), denote by \(L_iM\) the free integer diagram on vertex \(i\): it is zero below \(i\), equals \(M\) from \(i\) onward, and has identity structure maps in its nonzero range. Form the free diagram presentation
\[
 E=\bigoplus_{i=0}^{4}L_{i+1}X_i
 \xrightarrow{\ \partial\ }
 V=\bigoplus_{i=0}^{4}L_iX_i
 \longrightarrow X\longrightarrow0 .
 \tag{4.1}
\]
Each \(\partial\) summand is the incidence between its source vertex and the next, with the latter component multiplied by \(a_i\); the \(i=4\) summand is essential to remove the unwanted free tail beyond vertex four. Objectwise, (4.1) is split exact in the underlying graded modules. Its mapping cone \(Q=\operatorname{Cone}(\partial)\) receives an objectwise quasi-isomorphism \(Q\to X\) and admits the requisite projectively cofibrant cellular filtration from the free objects.

The shift \(\eta_2^X:X\to X^2\) has vertex components \(x^2\) at \(i=0,1,2\), zero afterward. In the usual two-column Hom-complex for the free-quiver cone, a nullhomotopy consists of vertex components \(U_i\) and edge-correction components \(V_i\). Choose \(U_i=h\) at the first three vertices, zero later, and \(V_i=z\) at the first two edges, zero later. The relations
\[
 Dh=x^2,\qquad Dz=xh+hx
\]
are respectively the vertex and edge equations for the differential of this cone homotopy. The terminal edge contributes zero. Thus the actual *whole integer-diagram* two-shift is nullhomotopic after the cofibrant resolution, yielding
\[
 [\eta_2^X]=0\quad\text{in }\mathrm{Ho}(\mathcal M^{\mathbb N}).
 \tag{4.2}
\]
The full free-quiver chain-level differential, model cofibrancy and homotopy classes in (4.2) are L2 Lean obligations; vertexwise nullhomotopy alone would not prove (4.2).

The restriction functor \(j^*:\mathcal M^{\mathbb R}\to\mathcal M^{\mathbb N}\) preserves objectwise fibrations and trivial fibrations; hence \(j_!\dashv j^*\), where \(j_!\) is left Kan extension, is a Quillen adjunction for projective diagram model structures. At each real \(u\), \(j_!X\) is exactly the step diagram \(F\) of §2. The natural shift-comparison map
\[
 j_!(X^2)\longrightarrow (j_!X)^2
\]
need **not** be an isomorphism on negative real indices. What matters is the factorisation \(\eta_2^F=(\text{comparison})\circ j_!(\eta_2^X)\). Derived left Kan extension applied to the null morphism (4.2), with a cofibrant replacement as needed, therefore gives
\[
 [\eta_2^F]=0\quad\text{in }\mathrm{Ho}(\mathcal M^{\mathbb R}).
\]
Zero crossings give \(d_{\mathrm{IHC}}(F,O)\le1\).

For \(0\le\varepsilon<1\), evaluate \(\eta_{2\varepsilon}^F\) at \(u=0\). It is the identity of \(P\) if \(2\varepsilon<1\), and the nonzero generator map \([x]:P\to P[1]\) if \(1\le2\varepsilon<2\). Neither vanishes in \(D(B)\). Evaluation preserves zero morphisms of entire derived diagrams, so no smaller derived interleaving exists. Consequently
\[
 d_{\mathrm{IHC}}(F,O)=1.
\]

## 5. Arbitrary whole-real replacements: the homotopy lower bound

Suppose for contradiction that a homotopy interleaving exists at \(\varepsilon<5/4\), after some arbitrary zigzags of whole real diagrams objectwise quasi-isomorphic to \(F\) and \(O\). Monotonicity allows enlargement to
\[
 e=\max\{1,\varepsilon\}<5/4,\quad
 \alpha=2e-2\in[0,1/2).
\]
A strict \(e\)-interleaving is a single strict diagram on the real shoelace poset \(S_e\), with two copies of \(\mathbb R\) and crossing order \(F(u)\to O(v)\) (or vice versa) when \(u+e\le v\). Choose **one** projectively cofibrant replacement \(Q\) of this entire poset diagram. Its second lane \(Q_O\) is only required to be objectwise acyclic; it need not be literally zero. The first lane is whole-diagram weakly equivalent to \(F\).

For any comparable vertices \(p\le q\), the evaluation of a projective generating cofibration along the arrow \(p\to q\) is either zero, an identity or a generating cofibration in the arrow category. Projective cofibrations are closed under cellular pushouts, transfinite composition and retracts. Accordingly each structure arrow \(Q(p)\to Q(q)\) is a cofibration in \(\mathcal M\); in particular each crossing
\[
 Q_O(u-e)\longrightarrow Q_F(u)
\]
is a degreewise split-injective cofibration of cofibrant chain complexes. We can therefore form a **natural whole-real** quotient diagram
\[
 C(u)=Q_F(u)/Q_O(u-e) .
 \tag{5.1}
\]
The acyclic subcomplex in (5.1) gives \(Q_F(u)\to C(u)\) as a quasi-isomorphism, by the long exact homology sequence. These maps commute with every real structure arrow, so \(C\) remains weakly equivalent to \(F\) as a full diagram.

The two crossing arrows of the interleaving factor
\[
 Q_F(u)\longrightarrow Q_O(u+e)
 \longrightarrow Q_F(u+2e).
\]
The image of the middle object is **killed** in \(C(u+2e)\) by construction. Therefore for every real \(u\),
\[
 C(u)\longrightarrow C(u+2e)=0
 \quad\text{as an actual chain map, not merely up to homotopy.}
 \tag{5.2}
\]
This is precisely why one must quotient an acyclic replacement of the zero lane rather than assuming the zero lane is literally zero.

Now sample five real cuts
\[
 s_0=0,\quad s_1=1,\quad s_2=2+\alpha,\quad
 s_3=3+\alpha,\quad s_4=4+2\alpha .
\]
They remain in the five respective half-open stages, since \(0\le\alpha<1/2\) ensures \(s_4<5\). Furthermore
\[
 s_2-s_0=s_3-s_1=s_4-s_2=2e .
\]
The restriction \(C_i=C(s_i)\) yields a strict five-object chain
\[
 C_0\xrightarrow{b_0}C_1\xrightarrow{b_1}C_2
 \xrightarrow{b_2}C_3\xrightarrow{b_3}C_4
\]
of cofibrant complexes, in which \(b_{i+1}b_i=0\) for \(i=0,1,2\), **strictly** by (5.2). The whole weak equivalence between \(C\) and \(F\) identifies the adjacent morphisms with the nonzero \([x]\) classes in the derived category; every automorphism of \(k[i]\) is multiplication by the sole scalar \(1\).

Because both \(C_i\) and \(P[i]\) are cofibrant-fibrant representatives of isomorphic derived objects, choose chain-homotopy inverse maps \(u_i:P[i]\to C_i\), \(v_i:C_i\to P[i]\) and fillers \(s_i\) with
\[
 D s_i=\operatorname{id}_{C_i}+u_i v_i .
\]
For \(j>i\), set
\[
 T_{ij}=v_j b_{j-1}s_{j-1}b_{j-2}\cdots
       s_{i+1}b_i u_i,
 \tag{5.3}
\]
with no \(s\) when \(j=i+1\). Differentiating a term of (5.3) replaces one \(s_r\) by \(\mathrm{id}+u_rv_r\). The identity summands vanish by the consecutive-composite equalities \(b_rb_{r-1}=0\); the \(u_rv_r\) terms factor as products of the shorter \(T\)'s. Thus
\[
 DT_{ij}=\sum_{i<r<j}T_{rj}T_{ir}.
 \tag{5.4}
\]
In particular \(T_{02},T_{13},T_{24}\) are primary fillers, \(T_{03},T_{14}\) secondary fillers, and \(T_{04}\) is a further homotopy whose differential equals the terminal fourfold expression. This means **zero lies in the complete defining-system bracket**, contradicting §3. Hence
\[
 d_{\mathrm{HI}}(F,O)\ge5/4.
\]
Equations (5.1)–(5.4), with the exact full-real, both-lanes quantifiers, are the main L3 Lean obligation; this manuscript's mathematical derivation must not be mistaken for kernel certification.

For the upper bound, \(F(u)\to F(u+5)\) is literally zero for every real \(u\), including every endpoint. Zero crossings therefore give a strict \(5/2\)-interleaving with \(O\), without any replacement:
\[
 d_{\mathrm{HI}}(F,O)\le5/2 .
\]

## 6. Homology and coefficient forgetting

For \(i\in\{0,1,2,3,4\}\), \(X_i=P[i]\) has only \(H_i(X_i)\cong k\). Thus for each fixed homological degree \(n=0,\dots,4\), the real persistence module \(H_n(F)\) is exactly the interval module \(k_{[n,n+1)}\), while the other degrees vanish. A length-one interval has distance \(1/2\) to zero: its time-\(2\varepsilon\) structure morphisms all vanish exactly when \(2\varepsilon\ge1\). Therefore \(d_{\mathrm{CohI}}(F,O)=1/2\).

Restrict scalars along \(k\to B\). The underlying \(k\)-complex-valued persistence diagram \(UF\) retains those five homology bars. The **field-specific** identification of homology, derived and homotopy-interleaving distances recorded in S113, attributed there to Kuribayashi–Naito–Wakatsuki–Yamaguchi (2026, Theorem 3.3), gives
\[
 d_{\mathrm{CohI}}^{\mathrm{Ch}(k)}(UF,0)
 =d_{\mathrm{IHC}}^{\mathrm{Ch}(k)}(UF,0)
 =d_{\mathrm{HI}}^{\mathrm{Ch}(k)}(UF,0)=1/2.
\]
The precise field-only theorem and its hypotheses are inherited from the archived proof notes; this is not an assertion about arbitrary coefficient algebras. Retaining the modular \(B\)-action increases the derived distance in this example and creates the fourfold strict separation.

## 7. Formal-certification status and finite audit

The exact coefficient model in S138's `C4/Jets.lean` has four \(\mathbb F_2\)-coefficients, exact truncated multiplication, nilpotence and necessary conditions for arbitrary degree-two adjacent, primary and secondary jets. It does **not** itself certify the full group-algebra isomorphism, entire dg-Hom resolution, full defining-system functoriality, derived \(\mathbb R\)-diagram or real shoelace quotient.

The pending Lean dependencies are explicitly divided:
1. **L1:** equip the coefficient model with full ring structure/prove the quotient isomorphism; construct the unbounded free resolution and shifts and transfer low-degree jet theorems to actual dg-Hom maps; prove fourfold nonvanishing for every defining system.
2. **L2:** formalise free-linear-quiver cone projective cofibrancy, the \((h,z)\) nullhomotopy of \(\eta_2\) in the full integer diagram, the real Kan Quillen comparison, and the equality \(d_{\mathrm{IHC}}=1\).
3. **L3:** formalise the full real shoelace projective model structure, cofibrant replacement, acyclic zero-lane quotient, all-real literal two-shift vanishing, and the fourfold homotopy transfer (5.3)–(5.4) for arbitrary allowed zigzags.
4. **L4:** state the manuscript's complete theorem with exact quantifiers and prove it without admitted obligations, then produce final paper files.

These are correctness/implementation requirements, **not** novelty, fit, literature-screening or external-review gates. Registry and submissions require separate owner instructions.

### Reproducibility appendix: bounded, exact arithmetic

The unchanged repository source is `sessions/S076/check_c4.py`. On 27 October 2026 the exact file was independently replayed with Python 3.13.5 (`python3 /tmp/check_c4.py` after exact-copy SHA validation), with SHA256 `52653eee774b5ad74a5b2d5375aae07fb66fed6bb9b0aa0531b6654563a22948` and Git blob SHA `4d22fec866c39d4cd5894b508e1410b4927b2b13`. Output:

```text
EXPLICIT_40_DEGREES: PASS
ADJACENT_JETS: PASS 16
PRIMARY_ALL_CHOICES: PASS 8192
SECONDARY_ALL_CHOICES: PASS 524288
TERMINAL_INVARIANT: PASS; finite jets only, NOT metric proof
```

The first line checks 39 indices \(n=2,\dots,40\). The remaining counts enumerate the **bounded coefficient choices at degree one/two**, not infinitely many defining systems. They neither prove the full real-valued theorem nor establish Lean certification. The machine memory peak was approximately 95,632 KiB and execution elapsed approximately 14.19 s in this replay.


## S139 proof-to-Lean alignment note (27 October 2026)

The all-degree *coefficient* periodic formulas of §2–§3 are now expressed as six universally quantified statements on C4.B in `C4/Periodic.lean`: `d_squared`, `exact_positive`, `Dx_zero`, `Dh_xx`, `Dz_xh_hx`, `terminal_unit`. For n≥0, the coefficient at differential degree n+1 is t for even n and t³ for odd n; adjacent x is 1 or t², h is 0 or t, and z is 0 or 1 respectively. A two-case proof using ann(t)=(t³) and ann(t³)=(t) establishes the resolution kernel/image condition at **every** positive degree, as a statement about raw coefficient multiplication. These identities are not bounded Python checks.

**Exact limitation:** C4.B has no genuine ring instance or proved isomorphism to the polynomial quotient in this formalisation; `C4/Periodic.lean` is *not yet* a Mathlib `ChainComplex` or dg-Hom object. Consequently the manuscript's augmentation, derived nonzero generator, complete-choice bracket, free-quiver cone, Kan comparison and whole-real shoelace statements have not been certified by these new lemmas. The terminal-unit identity concerns a selected defining system; the independent all-choice degree-two obstruction in `C4/Jets.lean` still awaits a typed extraction from ALL global defining systems. The paper's frozen mathematical theorem remains internal, and the overall proof is not yet submission-ready.


## S141 Lean correspondence and remaining categorical obligations

The unbounded indexing in §2 now has an actual `C4.integerResolution : ChainComplex (ModuleCat C4.B) ℤ` in Lean. Negative modules are represented by `ModuleCat.of B (Fin 0 → B)` (canonically zero), and the positive maps use a `ModuleCat` morphism transported via `eqToHom` to handle index-dependent objects. `C4.integerDifferential_square` verifies every composite in ℤ, including the -1/0 interface. The alternating-kernel coefficient statement is `C4.positiveDifferential_exact_coeff`, not yet an equality of categorical images and kernels. Degree-zero reduction is represented by the genuine surjective `C4.residueHom` with `C4.residueHom_kernel`. The B-module action on its target, a chain augmentation, all homology objects and projectivity/categorical resolution exactness need formal proofs. So do the shifts, full defining-system quantifiers, real projective quiver/Kan lift and arbitrary two-lane whole-real zigzag shoelaces. None of the three full distance statements are Lean-certified in S141.


### S145 formal proof status (27 October 2026)
Pinned Lean certifies `C4.positiveShortComplex_exact` universally and `C4.augmentationShortComplex_exact`, actual categorical short-complex exactness over the concrete ring B, in addition to S144's compiled integer complex, augmentation chain map and projective positive terms. These local exactness theorems do **not** in themselves prove categorical homology of `integerResolution`, quasi-isomorphism of `augmentationChainMap`, the all-choice global dg obstruction or arbitrary whole-real zigzag distance bounds. The frozen numerical metric separation is still an internal written theorem, not a Lean theorem.
