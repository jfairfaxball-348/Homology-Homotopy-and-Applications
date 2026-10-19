# Option D — proved cross-session synthesis: block-simple Hopf cubes as stable Euclidean Rips multifiltrations

**19 October 2026 · mathematical research note, not a numbered session or a new session prompt**

**Status:** self-contained INTERNAL human-readable proof (modulo named standard classical results), not machine formalisation, external refereeing, or journal-originality certification. By explicit owner instruction **NO new novelty audit, gate promotion, Lean, Palomar, manuscript, or downstream session installation**. The authoritative S116/S117 state and the archival S115 C4 decision remain unchanged. This proof uses S014-T36, S011-T28's principal-block viewpoint, S026's corrected two-interleaving-identities argument, S027-T62's Euclidean Gram realisation, and S028's integral-cofiber/Hopf comparison. S093's perturbation/control lesson guides the stability corollary. It is not an assertion that these ingredients or their combination are literature-new.

## 0. Decision within a non-novelty synthesis screen

| Existing proven route | Compatible mathematical output | Decision for the present synthesis |
|---|---|---|
| S011–S014 integral Boolean cubes and T36 induced flag Hopf cube | Only three elementary integral persistence supports, yet an unbounded coherent Hopf invariant | **Keep**: forms the homotopical example and the unusually strong homological simplicity hypothesis |
| S025–S028 corrected quantitative coherent-cofiber Rips method | Exact Euclidean metric and positive all-whole-diagram homotopy-interleaving lower bound | **Keep**: gives a geometrically honest, quantitatively stable application |
| S093 genuine covering norm ghosts | Geometric B-module information loss; based equivariant and coefficient comparisons | Do not conflate with ordinary unpointed Top or use as a purported strict HI>IHC proof |
| S101 3-cover balanced fold | Independently consistent triple and total-space models, NOT one simultaneous cover | Cannot use unproved compatibility as a synthesis lemma |
| S113–S115 modular C4 higher bracket gap | Internal Ch(F2[C4]) metric hierarchy, first-HHA-paper significance retired | Preserve separately; avoid cosmetic repackaging, category mixing or another exact-distance search |
| S070 spectra, S097–S112 coherence/geometry | Conditional/source-dependent or internally classical cases, or unresolved decisive compatibility | No new unproved bridge silently invoked |

**Chosen theorem:** a general exact *Euclidean Rips transfer* for graded finite flag complexes, followed by a quantified family of real four-parameter Euclidean Rips diagrams that are identical in the pointwise homotopy category, with **block-simple integral homology**, but are separated by an arbitrarily large **integral coherent Hopf coefficient** and a strictly positive, perturbation-stable homotopy-interleaving distance.

This is a concrete proved mathematical packaging of prior project results. It does **not** upgrade G2 or contradict S028's note that a previously constructed 2-parameter Hopf witness already overlaps classical machinery.

## 1. Definitions

Write \(B_d=\{0,1\}^d\) with product order, and \(\mathrm{Top}^{\mathbb R^{d+1}}\) for *unpointed* space diagrams with product order, translated by \((\delta,\ldots,\delta)\). An \(\delta\)-homotopy interleaving means a strict \(\delta\)-interleaving **after arbitrary entire-diagram zigzags of objectwise weak homotopy equivalences of both inputs**. All claims about \(d_{\mathrm{HI}}\) use this unrestricted definition; they do not substitute an objectwise or pointwise-homotopy-category interleaving. The infimum need not be attained.

Given a labelled Euclidean point cloud \(P=\{x_v\}_{v\in V}\), and a height/birth vector \(w(v)\in B_d\), let \(F_P(r,h_1,\ldots,h_d)\) be the **flag Vietoris–Rips complex** on the vertices with \(w_j(v)\le h_j\) for every \(j\), with an edge exactly when Euclidean distance is \(\le r\). For \(r<0\), take the empty complex; for \(0\le r\) smaller than the first positive edge length, take isolated selected vertices. This is an honest, all-real strict inclusion filtration.

## 2. Universal transfer lemma — two Euclidean distance classes

**Lemma D1 (flag-to-Euclidean transfer).** Suppose \(K\) is a finite nonempty flag complex on \(N\ge2\) labelled vertices, and \(w:V(K)\to B_d\). Put
\[
\epsilon=\frac{1}{100N},\qquad
D_{uv}^2=
\begin{cases}
0&u=v,\\
1-\epsilon&\{u,v\}\in K^{(1)},\\
1+\epsilon&\{u,v\}\notin K^{(1)},\quad u\ne v.
\end{cases}
\]
There are *distinct* Euclidean points in \(\mathbb R^{N-1}\) with exactly these squared distances. For **every** \(p\in B_d\), at radius \(r=1\) and any height vector \(h\) with \(h_j\in[0,1)\) if \(p_j=0\) and \(h_j\ge1\) if \(p_j=1\), the resulting Rips complex is precisely the **vertex-induced** subcomplex \(K_p=K[\{v:w(v)\le p\}]\). For \(r\ge\sqrt{1+\epsilon}\), the selected vertices form a simplex; for \(0\le r<\sqrt{1-\epsilon}\), they are discrete. The model has only **two off-diagonal distance values**, independently of the combinatorial complexity of \(K\).

*Proof.* Let \(J=I-\mathbf1\mathbf1^{T}/N\) and \(G=-JD^2J/2\) be the centered Gram matrix. For equilateral squared distances \(D^{2,0}_{uv}=1\) when \(u\ne v\), \(G_0=J/2\). Set \(E=D^2-D^{2,0}\). It has zero diagonal, \(|E_{uv}|=\epsilon\) off diagonal, so
\(\|E\|_2\le\|E\|_\infty=(N-1)\epsilon\).
On \(\mathbf1^\perp\), for any \(z\),
\[
z^TGz=\tfrac12\|z\|^2-\tfrac12z^TJEJz
\ge \tfrac12(1-(N-1)\epsilon)\|z\|^2>0.
\]
Also \(G\mathbf1=0\), hence \(G\) is positive semidefinite of rank exactly \(N-1\). A Gram factorisation gives \(N\) Euclidean vectors with centered squared-distance matrix exactly \(D^2\) (the inverse double-centering formula holds for hollow symmetric matrices). Since both off-diagonal values are positive, points are distinct. At \(r=1\), edges are precisely the edges of \(K\), and the Vietoris–Rips flag construction recovers the induced flag complex on selected vertices. The other thresholds are immediate. \(\square\)

**Lemma D2 (Boolean birth criterion).** If \(\{K_p\subseteq K\}_{p\in B_d}\) is a diagram of vertex-induced subcomplexes with \(K_{1^d}=K\), monotone inclusions and \(K_p\cap K_q=K_{p\wedge q}\) **as subcomplexes** for every \(p,q\), then there is a **unique smallest birth vector** \(w(v)\in B_d\) for every vertex, and \(K_p=K[\{v:w(v)\le p\}]\).

*Proof.* For each vertex \(v\), the nonempty upset \(S_v=\{p:v\in K_p\}\) contains \(1^d\), and meet-exactness makes it closed under finite meets. Thus \(w(v)=\bigwedge S_v\) belongs to \(S_v\), and upward closure gives \(S_v=\{p:w(v)\le p\}\). Vertex-inducedness recovers the entire simplex set. \(\square\)

These are exact existence/realisation statements. They do NOT yield a dimension bound smaller than \(N-1\), bounded \(N\), or one fixed cloud simultaneously realizing all different values of the Hopf coefficient.

## 3. The algebraically elementary but coherently nontrivial source cube

**Lemma D3 (common punctured cube and Hopf-labelled terminal objects).** For every integer \(k\) there is a finite strict \(B_3\)-diagram \(X^{(k)}\) of inclusions of induced subcomplexes of one flag simplicial complex \(K_k\), with the *same* proper-seven-object geometry across any two prescribed \(k,\ell\) after a common subdivision, such that:

- \(X_{000}=S^1\) up to homotopy; every singleton and doubleton object is contractible; \(X_{111}\simeq S^2\). Every object is connected.
- Integral homology diagrams are the **same exact three elementary block modules** for every \(k\):
\[
H_0\cong\mathbb Z[B_3],\quad
H_1\cong\mathbb Z[\{000\}],\quad
H_2\cong\mathbb Z[\{111\}],\quad H_j=0\ (j>2).
\]
Here \(\mathbb Z[B_3]\) means the constant \(\mathbb Z\) module with identity arrows, and a singleton support has \(\mathbb Z\) only there. In all degrees every edge cokernel is torsion-free; every field and rational reduction and every Boolean-face/composite block test is satisfied. The full componentwise homotopy-group diagrams are also independent of \(k\).
- For \(P=B_3\setminus\{111\}\), the *coherent* natural comparison \(\operatorname{hocolim}_P X^{(k)}\to X^{(k)}_{111}\) is, under equivalences, \(k\eta:S^3\to S^2\), where \(\eta\) is the Hopf generator. Its homotopy cofiber \(C_k\) has integral cup ring with \(H^2=\mathbb Z x\), \(H^4=\mathbb Z y\), \(x^2=ky\).

*Proof from explicit cells.* Start with a single oriented \(S^1=A\). Attach three labelled 2-disks \(D_i\) along the same \(A\), and at grades \(e_i\) keep \(A\cup D_i=D^2\). For each \(ij\), attach a 3-ball \(B_{ij}\) to \(D_i\cup_A D_j=S^2\), making the grade \(e_i+e_j\) complex a 3-ball. Their literal proper union \(L\) has cellular boundary matrices
\[
\partial_2=(1\ 1\ 1),\quad
\partial_3=
\begin{pmatrix}
1&1&0\\-1&0&1\\0&-1&-1
\end{pmatrix}.
\]
Direct multiplication gives \(\partial_2\partial_3=0\); \(\partial_3\) has rank two and all its rank-two Smith factors are units (a 2-by-2 minor has determinant \(1\)); its kernel is generated by \((1,-1,1)\). Thus \(H_1(L)=H_2(L)=0\), \(H_3(L)=\mathbb Z\), and \(\pi_1(L)=0\) because any \(D_i\) fills \(A\). Hurewicz/Whitehead give \(L\simeq S^3\). Proper latching maps are subcomplex cofibrations, so \(\operatorname{hocolim}_P X\simeq L\), not just an unproved colimit approximation.

Choose a cellular map \(f_k:L\to S^2\) corresponding to \(k\eta\); make the terminal \(X_{111}\) its mapping cylinder, with \(L\) included at the source. This terminal is homotopy \(S^2\), and the natural comparison is \(f_k\). All proper-to-terminal maps are literal inclusions and each bottom-to-top map factors through a contractible proper object, so no \(\pi_j\) or graded homology persistence arrow detects \(k\). Cofibration and the Hopf mapping-cone theorem give \(C_k\simeq S^2\cup_{k\eta} e^4\) and \(x^2=ky\).

For two specified values \(k,\ell\), use one common triangulation/subdivision of the entire proper \(L\) on which both maps have simplicial approximations. Triangulate both finite mapping cylinders relative to that SAME triangulation of the proper complex. One simultaneous barycentric subdivision makes both terminal complexes flag, every proper member vertex-induced, and all Boolean intersections meet-exact; both induced proper diagrams are literally identical. They may have different counts of terminal-only vertices. Equalise them by adding finitely many **terminal-only leaves** (one free edge per new vertex attached to a fixed terminal vertex) on the smaller complex. This preserves flagness, terminal homotopy type, the entire proper diagram and the homotopy-cofiber type of \(L\hookrightarrow K_k\). After a label bijection, both have the same \(N\) vertices and the same birth vector at each label. No assertion of a uniformly bounded \(N\) is made. \(\square\)

## 4. Quantitative coherent-Rips synthesis theorem

**Theorem D4 — block-simple stable Hopf-obstruction family.** For every pair \(k,\ell\in\mathbb Z\) with \(|k|\ne|\ell|\) there is a finite \(N=N(k,\ell)\) and two labelled \(N\)-point Euclidean clouds in \(\mathbb R^{N-1}\), with the **same three binary vertex heights** and only the two squared-distance classes \(1\pm1/(100N)\), whose full \(\mathbb R^4\) radius-plus-three-height Vietoris–Rips diagrams \(F_k,F_\ell\) satisfy:

1. Their full **pointwise homotopy-category diagrams** are naturally isomorphic in \(\operatorname{Ho}(\mathrm{Top})^{\mathbb R^4}\). Consequently all natural integral and arbitrary-field (co)homology modules, cup-ring diagrams, component diagrams, and componentwise homotopy-group persistence diagrams agree. This is *not* an equivalence in \(\operatorname{Ho}(\mathrm{Top}^{\mathbb R^4})\).
2. On the single fixed radius \(r=1\), their full binary-height \(B_3\) restrictions have the exact block decomposition of D3 — constant \(H_0\), singleton-bottom \(H_1\), singleton-top \(H_2\), no other reduced homology — over \(\mathbb Z\) and after any coefficient extension.
3. The canonical derived cofibers of the selected full *coherent three-cubes* have \(x^2=ky\) and \(x^2=\ell y\) over \(\mathbb Z\). Their graded rings are unequal whenever \(|k|\ne|\ell|\). The coefficient is unbounded over this family, though N is allowed to grow.
4. With diagonal translation in all four real coordinates and arbitrary whole-diagram objectwise-WE replacements of BOTH lanes,
\[
\boxed{d_{\mathrm{HI}}(F_k,F_\ell)\ \ge\ \frac{1}{2000N}>0.}
\]
The construction has at most four radius strata (including the empty negative-radius region) times three height strata per height coordinate: at most \(4\cdot3^3=108\) product strata, independent of k and \(\ell\). This does not bound point count, Euclidean ambient dimension, or computational complexity.

*Proof.* Apply D3 (including the common label-padding) and D1–D2 with \(\epsilon=1/(100N)\); place vertex \(v\) at binary height \(w(v)\). For each \(p\in B_3\) choose the four-vector
\[
q_p=(1,h_1(p),h_2(p),h_3(p)),
\quad h_j(p)=\begin{cases}\frac14&p_j=0,\\\frac54&p_j=1.\end{cases}
\]
Then \(p\mapsto q_p\) is order preserving, and the selected *strict* coherent eight-object cube is exactly \(X^{(k)}\) or \(X^{(\ell)}\).

**Pointwise invariants.** At low radius all present vertices are labelled isolated points, with identical labelled birth subsets and therefore identical component-inclusion arrows. At radius between the two distance thresholds, the spaces at all height strata are the proper-contractible/S¹/top-S² cube of D3. They are connected, with the only nontrivial proper-to-top homotopy classes from \(S^1\) going to \(S^2\) through contractibles; thus every such proper-to-top map is null in the unpointed homotopy category. Maps within a grade stratum are identities. Any low-radius discrete-to-middle-radius map is unique in \(\operatorname{Ho}(\mathrm{Top})\) once the labelled components and connected target are specified. At high radius the selected vertices form a simplex, hence a contractible space, and maps from any middle-radius source into it are unique in the homotopy category. Before all height coordinates reach zero no vertices exist in either cloud. These choices give compatible objectwise isomorphisms **on all strata and their arrows**, hence in \(\operatorname{Ho}(\mathrm{Top})^{\mathbb R^4}\), including H⁰ idempotent/component mergers. Apply functorial homotopy groups and cohomology rings for assertion 1. The exact integral modules of assertion 2 follow from D3.

**Coherent cube obstruction.** Proper latching maps are cofibrations, so the punctured-cube homotopy colimit is the actual common \(L\simeq S^3\); the canonical comparison to terminal is \(k\eta\) or \(\ell\eta\). Homotopy pushout with a point gives the classical Hopf cone, whose integral H² generator has cup-square \(k\) or \(\ell\) times a primitive H⁴ generator. Any graded ring isomorphism must multiply each free integral generator by \(\pm1\), forcing \(|k|=|\ell|\). Thus distinct absolute coefficients preclude a natural zigzag of objectwise weak equivalences of the two coherent B3 cubes. This makes no appeal to pointwise-only operations.

**Uniform positive homotopy-interleaving bound.** Set \(\delta_0=\epsilon/20\). For \(0\le s\le2\delta_0=\epsilon/10\),
\[
1+s <\sqrt{1+\epsilon}
\qquad\text{since}\qquad
\sqrt{1+\epsilon}-1=\frac{\epsilon}{\sqrt{1+\epsilon}+1}>\frac{\epsilon}{3}>\frac{\epsilon}{10}.
\]
The lower edge threshold \(\sqrt{1-\epsilon}<1\) has already been passed; adding \(s\ge0\) cannot cross it backwards. Each low height \(\frac14+s\) stays below 1, each high height \(\frac54+s\) stays above 1, and all stay nonnegative. Consequently \(F_k(q_p)\to F_k(q_p+s)\) and \(F_\ell(q_p)\to F_\ell(q_p+s)\) are literally identities of simplicial complexes **at all eight p**, and similarly the maps between different \(p\).

Suppose a homotopy-\(\delta\)-interleaving exists for \(0\le\delta\le\delta_0\). Pick the permitted WHOLE-diagram objectwise-WE zigzag replacements \(A\simeq F_k\), \(B\simeq F_\ell\) carrying a strict interleaving \(a:A\to B(\delta)\), \(b:B\to A(\delta)\). At any \(q_p\), naturality through the zigzags and the no-event condition makes all maps \(A(q_p)\to A(q_p+s)\), \(B(q_p)\to B(q_p+s)\) for \(s=\delta,2\delta\) weak equivalences. In \(\operatorname{Ho}(\mathrm{Top})\), the first interleaving identity
\(b_{q_p+\delta}a_{q_p}=A(q_p\le q_p+2\delta)\)
makes \(a_{q_p}\) a split mono. The second identity
\(a_{q_p+\delta}b_{q_p}=B(q_p\le q_p+2\delta)\)
makes \(a_{q_p+\delta}\) a split epi. Naturality of \(a\) and invertibility of the intervening plateau structure maps conjugates \(a_{q_p+\delta}\) to \(a_{q_p}\), so \(a_{q_p}\) is also a split epi. A morphism with a left and right inverse is invertible; thus each \(a_{q_p}\) is a weak homotopy equivalence. Because \(p\mapsto q_p\) is monotone, the eight \(a_{q_p}\) form ONE NATURAL objectwise WE morphism of actual strict B3 diagrams \(A\vert_q\to B(\delta)\vert_q\). The original whole-diagram zigzags and no-event condition give natural objectwise-WE zigzags
\(X^{(k)}\simeq A\vert_q \xrightarrow{\sim}B(\delta)\vert_q\simeq X^{(\ell)}\).
Derived punctured homotopy colimit and terminal cofiber preserve such **coherent** weak equivalences, contradicting the integral Hopf cup rings. Hence no \(\delta\le\delta_0\) works; the infimum is at least \(\delta_0=\epsilon/20=1/(2000N)\). This specifically repairs the invalid single-composite two-out-of-three shortcut identified in S025, using BOTH strict interleaving identities as corrected in S026. \(\square\)

## 5. Concrete stability application under coordinate/metric perturbations

**Corollary D5 (margin under perturbation).** Retain one paired D4 construction with the same labels. Suppose each cloud is independently changed to a new Euclidean cloud (in any ambient dimension) with every pairwise **distance** changed by at most \(\rho\), and each of the three birth/height coordinates of every label changed by at most \(\rho\). Its new real four-parameter Rips diagram is strictly \(\rho\)-interleaved with the old one, via identity-on-label vertex maps: every vertex or edge present at parameter \(z\) in either filtration is present in the other at \(z+\rho\), and both composites are the ordinary inclusions. Therefore for the perturbed paired diagrams \(\widetilde F_k,\widetilde F_\ell\), the triangle inequality gives
\[
d_{\mathrm{HI}}(\widetilde F_k,\widetilde F_\ell)\ge
\frac{1}{2000N}-2\rho.
\]
In particular their full coherent diagrams are inequivalent whenever \(0\le\rho<1/(4000N)\). This is a geometric-label stability statement, not an invariance assertion under arbitrary relabelling, altered combinatorial vertex counts, or unrelated point-cloud correspondences. The unchanged mid-radius block decomposition itself need not survive perturbations; the **metric separation** does.

*Proof.* In either direction, selected vertices remain selected after adding \(\rho\) to every height and an edge of original length \(\le r\) has new length \(\le r+\rho\). The induced simplicial inclusions are natural and their round trips equal structure inclusions at translation \(2\rho\). Then use \(d_{\rm HI}(F_k,\widetilde F_k)\le\rho\), \(d_{\rm HI}(F_\ell,\widetilde F_\ell)\le\rho\), and D4. \(\square\)

## 6. Correctness boundaries and remaining tasks NOT authorised here

1. This is a rigorous **programme-internal prose proof**, reliant on classical PL triangulation, homotopy invariance of homotopy colimits, the Hopf invariant of \(k\eta\), and Gram-matrix Euclidean geometry. No external independent referee, Lean execution, or exhaustive explicit-coordinate construction has been conducted. The small cellular boundary identities can be checked by exact integer arithmetic but do not alone certify all topology.
2. The **new combination does not by itself establish novelty**. In particular S027/S028 already had a stronger-in-parameter-count two-parameter geometric Hopf family; this note's distinct contribution is its **general two-distance flag-to-Euclidean transfer**, the particularly elementary integral three-block source cube, and the complete quantitative/stable four-parameter synthesis. Do NOT assert these are new relative to outside literature. The owner expressly suspended novelty checks.
3. The construction is **not** a strict \(d_{\mathrm{HI}}>d_{\mathrm{IHC}}\) example in the *same category*, nor the original ordinary \(\mathrm{Top}^{\mathbb R}\) problem. It proves positive HI distance between two different \(\mathbb R^4\) diagrams **with matching pointwise** \(\operatorname{Ho}(\mathrm{Top})^{\mathbb R^4}\) shadows. No claim about \(d_{\mathrm{IHC}}\) is made: the homotopy category of diagrams is not the diagram category of the homotopy category.
4. Distinguish the **simplicial complex dimension** at most 4 of the T36 flag cube from the possibly very large **Euclidean dimension** \(N-1\). \(N=N(k,\ell)\) changes with coefficients. There is no verified fixed-dimension reduction or fixed \(N\) infinite family.
5. The robust lower bound is not an exact distance. No single universally sized finite certificate is asserted for arbitrary k; S028 supplies a different explicit 334-point \(k=0,2\) geometric benchmark, not an instance of this specific three-height cube transfer without doing the conversion.
6. No novelty/priority/G2 assessment, next-session prompt amendment, automatic programme restart, manuscript, formalisation, registration, arXiv/HHA submission, or external author contact is authorised by this note. S116 stays the last numbered completed session, S117 remains OWNER_CHOICE_PENDING. **Present this proven candidate to the owner, who will decide the next step.**

## 7. Suggested precise theorem for the owner's eventual decision

> **Block-simple Euclidean Rips persistence does not control coherent higher homotopy.** For every distinct absolute integer Hopf coefficients \(k,\ell\), two Euclidean radius-plus-three-height Rips filtrations with only two positive pair-distance classes have naturally isomorphic full pointwise homotopy-category and integral persistence diagrams; their binary-height restriction at an intermediate radius has just the constant homology block and one bottom and one top singleton block; yet their coherent punctured-cube total-cofiber cup squares differ by \(k\) versus \(\ell\), forcing \(d_{\mathrm{HI}}\ge1/(2000N)\), robust under sufficiently small geometric and height perturbations.

This is an internally proved, mathematically falsifiable synthesis candidate, **not** a statement that HHA would publish it. The next decision is the owner's; do not install a next numbered mathematical session automatically.
