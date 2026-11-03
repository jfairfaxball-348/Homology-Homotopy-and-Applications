# A quantitative homotopy-interleaving gap over the cyclic-four group algebra

**Internal working manuscript, updated during S175 on 3 November 2026.** Lean checks the numerical theorem over the literal group algebra as `C4.c4_distance_separation_groupAlgebra` in the pinned local build. See the crosswalk for the definitions and verification record.

## Abstract

Over the group algebra \(B=\mathbb F_2[C_4]\), we give a five-stage real persistence diagram \(F\) of unbounded complexes of right \(B\)-modules whose homology, derived-diagram and homotopy-interleaving distances to zero are quantitatively separated:
\[
 d_{\mathrm{CohI}}(F,0)=\tfrac12
 <d_{\mathrm{IHC}}(F,0)=1
 <\tfrac54\le d_{\mathrm{HI}}(F,0)\le\tfrac52.
\]
The strict homotopy-interleaving metric allows arbitrary objectwise-quasi-isomorphism zigzags of both entire real-indexed diagrams, including nonzero acyclic replacements of zero. A fourfold defining-system obstruction gives the lower bound for the strict metric. Its terminal coefficient is independent of the choices of representatives and fillers. For the derived upper bound, a seven-stage resolution gives a natural nullhomotopy of the two-unit shift. For the strict lower bound, K-projective lifting transfers a hypothetical interleaving through its acyclic lane to a defining system on the original resolutions. The separate field-only comparison gives distance \(1/2\) for all three metrics after forgetting the \(B\)-action.

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

The distances take values in \([0,\infty]\), with the infimum of an empty parameter set equal to \(\infty\). When a lane is the zero object in the category where the interleaving is computed, both crossing maps are zero. An \(\varepsilon\)-interleaving with that lane exists exactly when \(\eta_{2\varepsilon}\) vanishes in that category. The strict metric also allows acyclic replacement lanes, for which the crossing maps may be nonzero.

**Theorem.** The explicit \(F\) of §2 satisfies the chain of inequalities displayed in the abstract. The strict lower bound excludes every parameter \(\varepsilon<5/4\).

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

**Current Lean correspondence.** `C4.canonicalGlobalFourfold` supplies the actual all-integer global defining system. `C4.GlobalFourfoldDefiningSystem.terminal_residue` and `.terminal_not_boundary` extract the necessary equations from arbitrary genuine global maps, homotopies and secondary families and prove the terminal component is outside every tertiary boundary. The independent-map proof uses only the first primary and first secondary equations, avoiding any identification of distinct fillers. Section 5 uses this algebraic obstruction after transferring a hypothetical interleaving to the original resolutions.

## 4. The entire derived diagram

Write \(S=(0,X_0,X_1,X_2,X_3,X_4,0)\) for the diagram on stages \(0,\ldots,6\), and let \(p:\mathbb R\to\{0,\ldots,6\}\) be the stage clock from §2, so \(F=p^*S\). The stage advance is \(a(0)=0\) and \(a(j)=\min(j+2,6)\) for \(j>0\). The stage two-shift \(S\to a^*S\) pulls back to a factor of \(\eta_2^F\). For \(u\ge0\), \(a(p(u))=p(u+2)\); at negative \(u\), the comparison map is from the zero complex. These components form a natural transformation \(p^*a^*S\to F^2\), including across the initial boundary.

For the stage calculation, put \(C_i=\operatorname{Cone}(\mathrm{id}_{X_i})\) and write \(\iota_i:X_i\to C_i\) for the cone inclusion. Replace stages 2 and 3 by \(C_0\oplus X_1\) and \(C_0\oplus C_1\oplus X_2\), respectively. The incoming edges use \(\iota_0\) and \(\iota_1\) in the new cone components, preserve the first cone from stage 2 to stage 3, and agree with the original edges after projection to the \(X_i\) components. The outgoing edge at stage 3 projects to \(X_2\) and applies \(x\). These projections and the identities on the other stages form an objectwise quasi-isomorphism \(Q\to S\), since the added cones are contractible.

The composite \(Q\to S\to a^*S\) has a natural nullhomotopy. On the resolution components use the three primary fillers \(h_{02},h_{13},h_{24}\). On the cone components use the cycles obtained from the two secondary fillers \(z_{03},z_{14}\): the secondary equations give the required compatibility with the cone inclusions, and the first cone's component at stage 3 is the stage 2 component followed by \(x_{34}\). This verifies naturality on the consecutive edges and hence on every stage morphism. From stage 4 the translated targets are zero, so the terminal edge also satisfies the naturality equation.

Pullback along \(p\) preserves objectwise quasi-isomorphisms. The cylinder projection of a natural chain homotopy is an objectwise quasi-isomorphism, so every localisation at these maps identifies naturally homotopic morphisms. It follows, using the invertible projection from \(p^*Q\) and the shift comparison above, that \([\eta_2^F]=0\) in every localisation of whole real diagrams. Zero crossings give \(d_{\mathrm{IHC}}(F,O)\le1\). The Lean declarations are `twoShift_realDiagram_factor`, `stageResolutionπ_quasiIso`, `stageK_nat` and `localized_twoShift_eq_zero`.

For \(0\le\varepsilon<1\), evaluate \(\eta_{2\varepsilon}^F\) at \(u=0\). It is the identity of \(P\) if \(2\varepsilon<1\), and the nonzero generator map \([x]:P\to P[1]\) if \(1\le2\varepsilon<2\). Neither vanishes in \(D(B)\). Evaluation preserves zero morphisms of entire derived diagrams, so no smaller derived interleaving exists. Consequently
\[
 d_{\mathrm{IHC}}(F,O)=1.
\]

## 5. Arbitrary whole-real replacements

Let \(F'\simeq F\) and \(O'\simeq O\) be arbitrary whole-real zigzag replacements and \((\alpha,\beta)\) a strict \(\varepsilon\)-interleaving of \(F'\) and \(O'\) with \(\varepsilon<5/4\); enlarge it to \(e=\max\{1,\varepsilon\}\). Every \(O'(v)\) is acyclic (it is zigzag-equivalent to \(0\)), but need not be zero. Sample \(s_0=0,\ s_1=1,\ s_2=2e,\ s_3=2e+1,\ s_4=4e\), write \(b_i\) for the structure maps of \(F'\) between them, \(Z_i=O'(s_i+e)\), \(\alpha_i,\beta_i\) for the crossings and \(o_i\) for the maps of \(O'\). The interleaving laws and naturality give \(b_{i+1}b_i=\beta_i\alpha_i\), \(\alpha_{i+1}b_i=o_i\alpha_i\), \(b_{i+2}\beta_i=\beta_{i+1}o_i\) and \(\alpha_2\beta_0=o_1o_0\).

The shifted resolutions \(P[i]\) are K-projective, so for every quasi-isomorphism \(w\), composition with \(w\) is bijective on homotopy classes out of \(P[i]\) in every degree. Hence the canonical identifications \(P[i]=F(s_i)\) transport along each zigzag step, in either direction, to quasi-isomorphisms \(u_i:P[i]\to F'(s_i)\) with homotopies \(\lambda_i\colon u_{i+1}x\simeq b_iu_i\). Every chain map \(P[i]\to Z_j\) is nullhomotopic, and every cocycle of \(\operatorname{Hom}(P[i],Z_j)\) is a coboundary.

Choose \(\theta_i\) with \(D\theta_i=\alpha_iu_i\). Then \(\mu_i=b_{i+1}\lambda_i+\lambda_{i+1}x+\beta_i\theta_i\) satisfies \(D\mu_i=u_{i+2}x^2\); a relative lift through \(u_{i+2}\) gives a primary filler on the original resolutions \(H_i\) and a correction \(\nu_i\) with \(\mu_i=u_{i+2}H_i+D\nu_i\).

The cocycle \(\omega_i=\alpha_{i+1}\lambda_i+o_i\theta_i+\theta_{i+1}x\) bounds some \(\pi_i\); then \(\xi_i=\lambda_{i+2}H_i+b_{i+2}\nu_i+\nu_{i+1}x+\beta_{i+1}\pi_i\) satisfies \(D\xi_i=u_{i+3}(xH_i+H_{i+1}x)\), and a second lift gives original secondary fillers \(K_i\) and corrections \(\rho_i\) with \(\xi_i=u_{i+3}K_i+D\rho_i\).

The final cocycle \(\chi=\alpha_2\nu_0+o_1\pi_0+\theta_2H_0+\pi_1x\) (closed by \(\alpha_2\beta_0=o_1o_0\)) bounds \(\sigma\), and \(\tau=\lambda_3K_0+\nu_2H_0+b_3\rho_0+\rho_1x+\beta_2\sigma\) satisfies \(D\tau=u_4w\) for the original terminal \(w=xK_0+H_2H_0+K_1x\). Injectivity through \(u_4\) makes \(w\) a boundary: an original-system tertiary filler, contradicting §3. All signs vanish in characteristic two. The Lean declarations are `CochainInterleavingLadder.nonempty_fourfold`, `canonical_no_interleavingLadder` and `strictInterleaving_ge_five_fourths`.

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

## 7. Formal-certification status

The current pinned Lean development certifies:

1. The concrete coefficient ring, the integer-indexed resolution, all-degree homology and the actual augmentation quasi-isomorphism.
2. Global adjacent maps, three primary homotopies, both secondary equations and a canonical global defining system at every integer shift.
3. The terminal residue-one obstruction for every independent global defining system, excluding every possible pair of tertiary-boundary components in the decisive actual complex degree.
4. The strict functor `realDiagram` over the entire ordered real line, all five half-open stage objects and zero ends, and literal vanishing of its natural five-unit shift.
5. The direct one/two/three-cut word boundary identities on arbitrary B-module complexes with actual comparison homotopies and strict consecutive zeros; original shifted-resolution K-projectivity and its explicit sufficient comparison contract.
6. K-projective lifting through arbitrary quasi-isomorphisms and the weak-data transfer of the fourfold obstruction through an interleaving with acyclic opposite lane (§5).
7. Whole-real weak zigzags of BOTH lanes and \(5/4\le d_{\mathrm{HI}}(F,0)\le5/2\) for the \([0,\infty]\)-valued strict homotopy-interleaving distance.
8. \(d_{\mathrm{CohI}}(F,0)=1/2\) for the underlying \(k\)-module homology persistence modules, supremum over all integer degrees.

9. \(d_{\mathrm{IHC}}(F,0)=1\) in every localisation of whole real diagrams at objectwise quasi-isomorphisms, and the combined declaration `C4.c4_distance_separation` of the abstract's chain of (in)equalities.

These are pinned-build certificates with axioms `[propext, Classical.choice, Quot.sound]`. They passed hosted exact-head PR CI (Lean #41592284384) and merged-main CI (Lean #41593094820) after the ordinary merge `bc06b6011f5556a8ba36ee85167b1fa5c875bc06`. The pinned local S175 build checks the ring presentation as `C4.groupAlgebraEquiv` and the result over group-algebra modules as `C4.c4_distance_separation_groupAlgebra`. Hosted verification is pending.

The proofs in §§4–5 work with natural transformations and objectwise quasi-isomorphisms of whole diagrams. The crosswalk records the correspondence between these proofs and the pinned declarations.

These are implementation/correctness requirements. No novelty, journal-fit, prior-art or external-review gate is part of the active roadmap. Registry, submission and release require separate owner instructions.

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
