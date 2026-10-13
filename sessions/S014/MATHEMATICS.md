# S014 — T36: a sharp dimension-four FLAG inclusion cube with invisible Hopf comparison

**Status:** full human-readable INTERNAL proof with dependence on classical mapping cylinders, simplicial approximation and the Hopf invariant. This is not a priority-certified new theorem or a solution to LLO Problem1. No Lean, CAS, numerical enumeration, referee, or mathematical certificate.

## T36 (precise statement)

For every integer \(k\), there is a strict covariant diagram \(X^{(k)}: B_3=\{0,1\}^3\to\mathrm{Top}\) realised by **simultaneous simplicial inclusions of induced subcomplexes of one finite flag simplicial complex** \(K^{(k)}=X^{(k)}_{111}\), of dimension **at most four**, such that:

1. All eight spaces are connected. \(X_{000}\simeq S^1\), each \(X_{e_i}\simeq *\) and each \(X_{e_i+e_j}\simeq *\), while \(X_{111}^{(k)}\simeq S^2\).
2. Every integral homology persistence diagram, with maps and in EVERY degree, is independent of k: \(H_0=\mathbb Z[P_{000}]\), \(H_1=\mathbb Z[I_{000}]\), \(H_2=\mathbb Z[P_{111}]\), and all other degrees zero. Therefore *all* generating edges have torsion-free cokernels, and every Q and Fp diagram and every subcube/composite passes the LLO block condition. In fact the statement remains true with arbitrary coefficient rings. All objectwise homotopy group diagrams \(\pi_j(X_{-})\) with induced maps (and \(\pi_1\)) are likewise independent of k.
3. For \(P=B_3\setminus\{111\}\), the canonical homotopy-colimit comparison \(hocolim_P X^{(k)}\to X_{111}^{(k)}\), under homotopy identifications source \(S^3\) and target \(S^2\), represents \(k\eta\in\pi_3(S^2)\cong\mathbb Z\), where η is the Hopf fibration generator (up to choices of orientation).
4. The *canonical homotopy cofiber* \(C_k=\mathrm{Cofib}(hocolim_P X^{(k)}\to X_{111}^{(k)})\) has an integral cohomology ring with \(\widetilde H^2(C_k)=\mathbb Z\langle u\rangle\), \(\widetilde H^4(C_k)=\mathbb Z\langle v\rangle\) and \(u\smile u=k v\). Thus different \(|k|\) give nonisomorphic graded integral cohomology rings, even though all ordinary persistence homology AND persistence homotopy-group diagrams coincide. For k=0 the cofiber is homotopy equivalent to \(S^2\vee S^4\); for k=±1 it has the cohomology ring of \(\mathbb CP^2\) (orientation qualification).
5. **Sharp dimension bound in this template:** if a simultaneous inclusion realisation contains the same punctured-colimit subcomplex \(L\) with \(H_3(L;\mathbb Z)=\mathbb Z\), yet \(H_3(X_{111};\mathbb Z)=0\), then \(\dim X_{111}\ge4\). Hence the dimension four above is minimal under the specified *subcomplex inclusion* and \(H_3\) hypotheses.

Crucially this is stronger than S013 T35 in geometry and in unstable homotopy: S013 chose arbitrary degree maps into an S3 top; T36 has only inclusions, has target S2, and all homotopy-group persistence also forgets k. It does **not** establish literary novelty; classical Hopf and mapping-cylinder topology are the underlying mechanisms.

## Construction and full proof

**Step 1: strict punctured diagram as a regular three-dimensional cellular filtration.** Take a based oriented 1-sphere \(A=S^1\) with one 0-cell and one 1-cell a. For i=1,2,3 attach a distinct 2-disk \(D_i\) along its entire boundary A; set \(X_{e_i}=A\cup D_i\cong D^2\). For each pair ij, \(X_{e_i}\cup_A X_{e_j}\cong S^2\), attach a 3-ball \(B_{ij}\) along this ENTIRE sphere by a homeomorphism; set \(X_{e_i+e_j}\cong D^3\). Include every lower object as its literal subcomplex of these pair objects. Use the same three disks in all pairs, not separate copies. All generating maps are inclusions and commute on the nose. Let \(L=\bigcup_{i<j}X_{e_i+e_j}=\operatorname{colim}_P X\).

The cellular chains on L, with compatible orientations, are
\[
C_3=\mathbb Z\langle c_{12},c_{13},c_{23}\rangle,\quad
C_2=\mathbb Z\langle b_1,b_2,b_3\rangle,\quad
C_1=\mathbb Z\langle a\rangle,
\]
\[
\partial_2=(1\ 1\ 1),\qquad
\partial_3=
\begin{pmatrix}
 1& 1& 0\\
-1& 0& 1\\
 0&-1&-1
\end{pmatrix}
\]
(columns \(b_1-b_2\), \(b_1-b_3\), \(b_2-b_3\), with one sign chosen to make the third column \(b_2-b_3\)). Observe the displayed matrix's third column is actually \((0,1,-1)^T\), so the third row is \((0,-1,-1)\); its 2x2 relation is \(c_{12}-c_{13}+c_{23}\), and \(\partial_2\partial_3=0\). The image of \(\partial_3\) is exactly \(\ker\partial_2\) (basis columns 1,2, with determinant one in quotient), \(\ker\partial_3=\mathbb Z\langle c_{12}-c_{13}+c_{23}\rangle\). Therefore \(H_3(L)=\mathbb Z\), \(H_2(L)=H_1(L)=0\), and \(H_0(L)=\mathbb Z\), with no torsion. The singleton disks kill \(\pi_1(A)\), so \(\pi_1(L)=0\). Hurewicz + Whitehead give a homotopy equivalence \(h:L\simeq S^3\). The proper diagram is cofibrant because each latching map is an inclusion of CW subcomplexes (the pair latching object is the two disks' common-sphere union). Thus \(hocolim_P X\simeq L\).

**Step 2: choose truly unstable attaching maps.** Let \(\eta:S^3\to S^2\) represent the generator with Hopf invariant +1. For each integer k, choose a cellular map \(f_k:L\to S^2\) representing \(k\eta\) after the equivalence h (the sign of k depends on chosen generators). Define the full terminal object by the finite mapping cylinder \(T_k=M_{f_k}=(L\times[0,1]\sqcup S^2)/(x,1)\sim f_k(x)\). Identify L with \(L\times\{0\}\subset T_k\). Put \(X^{(k)}_{111}=T_k\) and take all proper-to-terminal arrows to be the literal inclusions. Hence the full cube commutes STRICTLY, and every generating map is an inclusion. The cylinder deformation retracts onto S2, and the composite \(L\hookrightarrow T_k\simeq S^2\) is f_k. Punctured hocolim-to-terminal comparison agrees with this composite.

**Step 3: flag / induced geometry.** The diagram in Step 1 is a finite regular CW subcomplex diagram of dimension ≤3 with compatible ball characteristic maps and therefore admits a simultaneous finite triangulation. After subdivisions, simplicial approximation gives a simplicial representative of f_k. Triangulate the simplicial mapping cylinder compatibly so the triangulated L and every proper member stay actual subcomplexes (dimension max(3+1,2)=4). Apply barycentric subdivision to the *whole* terminal complex and to all its subcomplexes simultaneously. A barycentric subdivision is the order complex of faces: any pairwise adjacent vertices form a chain, so it is FLAG. Moreover \(sd(A)\) is a VERTEX-INDUCED subcomplex of \(sd(K)\) for every simplicial subcomplex A⊂K (a chain of faces all belonging to A lies in A). Hence all inclusion arrows are induced-subcomplex inclusions of finite flag complexes, no change of dimension, homotopy or homology. This is a finite EXISTENCE construction, not a claim of explicit enumerated vertex counts or a Rips metric realisation.

**Step 4: exact persistence including homotopy groups.** Each of the three \(X_{e_i}\) is D2, each \(X_{e_i+e_j}\) is D3, base A=S1 and T_k≃S2. The only reduced vertex homology is H1 at bottom and H2 at top; bottom-to-any-nonbottom maps in positive degree are zero. H0 is constant because every space is connected. This gives exactly the three integral LLO support modules named in item 2. For each generated edge, the map in every degree is identity Z→Z, Z→0, 0→Z or 0→0; cokernels are 0 or Z. Since these modules are literal global blocks, all field tests, even all composites and all subcubes, hold simultaneously. For homotopy-group diagrams, the only nonzero π1 of a proper vertex is π1(A)=Z, killed immediately; positive πj of singleton/pair vertices vanish, while πj(T_k)=πj(S2) for j≥2, with no nonzero incoming homomorphisms for j≥2. They are therefore isomorphic as diagrams for ALL k and ALL homotopy degrees. H0 and π0 are constant singleton.

**Step 5: canonical cofiber and multiplicative invariant.** The inclusion \(L\hookrightarrow M_{f_k}\) is a CW cofibration. Its cofiber \(M_{f_k}/L\) is homotopy equivalent to \(S^2\cup_{f_k}e^4\), the mapping cone of \(k\eta\). Its cellular chains have free ranks one in degrees 2,4 and zero differential, yielding free \(\widetilde H^2,\widetilde H^4\) and no other reduced integral cohomology. By the *defining classical Hopf invariant calculation*, under orientations \(u^2=H(f_k)v=k v\); the Hopf invariant \(H:\pi_3(S^2)\to\mathbb Z\) is an isomorphism sending η to 1. This is a homotopy invariant of the canonical comparison cofiber and is not captured by the persistence modules of homology or individual homotopy groups. Under arbitrary orientation changes, \(|k|\) remains invariant.

**Step 6: sharp dimension.** Any finite CW K of dimension ≤3 containing L as a CW subcomplex gives an injection \(H_3(L;Z)\hookrightarrow H_3(K;Z)\): inclusion of cellular C3 groups is injective, C4(K)=0, and every 3-cycle of L remains a 3-cycle of K with no possible 4-boundary. Since H3(L)=Z and H3(T_k)=H3(S2)=0, top dimension ≤3 is impossible. Our cylinder is dimension 4, proving the claimed optimality *for this model with L literally included*.

## Hostile boundary cases and misinterpretations

- k=0: f0 nullhomotopic; cofiber S2∨S4, u²=0. k=±1: Hopf number ±1; the sign depends on 4-orientation, hence absolute k is the canonical magnitude. k=2 vs 1 distinguished as cohomology rings. All k are represented by finite cellular maps after simplicial approximation.
- This T36 construction does NOT use degree-k maps S3→S3 (S013's trivial mechanism); the image in H3(Tk)=0 is always zero, but π3 map is k. In particular S013's homological τ_3 for T36 is the ZERO map for every k.
- Terminal space depends on k as a filtered inclusion ambient, though every terminal object is homotopy equivalent to S2. We do NOT claim the ambient complexes are fixed or the vertex counts equal, nor that the maps are induced by one fixed Euclidean Vietoris–Rips scale metric.
- The proof of hocolim≃L uses P-Reedy cofibrancy, not an unsupported arbitrary-diagram colimit equivalence.
- An embedding of S3 in a 3-dimensional homology-S2 top with the indicated inclusion homology is impossible, and the 4-cell bound witnesses precisely why the extra dimension is essential.
- All constructions use standard tools; these conclusions are internal exact topology, NOT proven new to the literature or an HHA flagship.

## Source-stated Front A: LLO Problem 1, precisely located but not solved

The original authors' arXiv2402.16624v4 Introduction lines 57–61 explicitly ask, for fixed interval class \(\mathcal I\), relative projectives \(\mathcal X\) and k, whether one can efficiently decide if a finitely presented multiparameter persistence module has \(\mathcal X\)-resolution length ≤k, from a finite free presentation or simplicial multifiltration. The paper proves the field block k=0 recognition theorem (Theorem4); *no* answer to unrestricted k≥1 is claimed here. The 2025 Dey–Jendrysiak–Kerber SoCG paper gives an O(N³) recognition/decomposition algorithm for interval-decomposable modules, a k=0-adjacent improvement, **not** a direct proof of relative k≥1 complexity or existence of relative resolutions for LLO's arbitrary class. No current exhaustive 2026 resolution-status check is claimed.

A hostile algebraic baseline illustrates that changing the projective class matters: on B_n the standard (principal-upset) minimal projective resolution of the bottom simple I_bottom has length n, using the augmented n-dimensional Koszul cube \(0\to P_{1^n}\to\bigoplus_{|S|=n-1}P_S\to\cdots\to\bigoplus_{|S|=1}P_S\to P_\varnothing\to I_\varnothing\to0\); at each vertex the evaluated complex is an exact augmented simplex chain complex, and after evaluating Ext against the top simple the last differential vanishes, showing pd=n. Yet I_bottom is ITSELF an LLO death block and has relative block-projective length 0. Therefore ordinary projective dimension cannot be substituted for the SOURCE's relative \(\mathcal X\)-dimension. This is a classical comparison, not a solution to Problem1.

## Front B: genuinely mixed G={0,1,2}^n

The S011-T28 Boolean field-to-integer theorem does not extend by the same proof to arbitrary induced middle bands. A bottom-zero true band such as \(\{1\}\times\{0,1,2\}\) is already an allowed integral LLO block, so it refutes only *global-bottom* peeling, NOT the desired integral-if-all-fields conjecture. For full mixed n=2,3, a nontrivial obstruction must distinguish independent local field splittings from compatible integral idempotents across overlapping bands. No explicit integer diagram with all primitive arrows, rational and EVERY-prime decompositions over every subcube/composite, AND a proved integral nonsplitting was found. No global saturated idempotent construction was proved either. This route is OPEN, not promoted.

## Conclusion

T36 is an internally established **homotopy-sensitive, sharp-dimensional, flag-filtration** strengthening of T35 with a classical Hopf-invariant mechanism; a potentially instructive application, but no demonstrated theorem-level HHA originality. Problem1 remains a legitimate sourced TARGET but UNSOLVED here, and the mixed-grid obstruction is also open. Decision: NO_VIABLE_HHA_FLAGSHIP_YET; keep Stage1 open, hold all later gates.
