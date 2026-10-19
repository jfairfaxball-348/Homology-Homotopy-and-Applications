# S111 MATHEMATICS — graph-bundle obstruction, filtered Massey class and nonclock kill

**Classification:** T293–T298 internal proofs based on standard topology and the original Fenn–Sjerve 1987 theorem; T299 evidence-bound HHA gate failure. These are NOT independently novel HHA-ready research results or formal certificates. The ambient persistence category is **ordinary unpointed** Top^R with arbitrary objectwise ordinary-weak-equivalence zigzags of **both entire diagrams**. Never silently substitute a marked fibre category, pointed spaces, one fixed resolution or Fun(R,HoTop).

## T293: the IA examples are not locally trivial finite-graph bundles

Let F=F(a,b,c) and w∈[F(b,c),F(b,c)] be nontrivial. Let φ_w(a)=aw, φ_w(b)=b, φ_w(c)=c. Its powers are φ_w^m(a)=a w^m, b↦b, c↦c. If φ_w^m were inner, implemented by g∈F, then g commutes with b and c, so g∈C_F(b)∩C_F(c)={1}. Then a w^m=a, contradicting torsion-freeness of F(b,c). Thus [φ_w] has **infinite order in Out(F3)**.

For any fixed **finite connected graph** Γ, a homeomorphism h:Γ→Γ permutes the finitely many branch vertices of the core (suppress valence-two vertices; ignore contractible trees) and the finitely many open core edges, allowing finitely many reversals. Subdivision/interval reparameterisations have no effect on the induced outer automorphism of π1Γ. Hence the image of Homeo(Γ)→Out(π1Γ) is finite: every realised outer class has finite order. This also covers the core circle case by ±1; the rank-three case has branch points. Consequently **no locally trivial Γ-bundle over S¹ with Γ a finite connected graph and monodromy [φ_w] exists**.

A cellular graph map representing φ_w is a homotopy equivalence, **not** a graph homeomorphism. Its finite 2-dimensional mapping torus is a *homotopy mapping torus* / free-by-cyclic presentation complex, not a locally trivial finite-graph bundle. A mapping torus of a homeomorphism is a bundle; a mapping torus of a general homotopy equivalence need not be. Thus the precise S111 'genuine finite graph-bundle' premise fails on the selected nontrivial IA candidates, independently of numerical stability.

This does not forbid alternative infinite-fibre bundles, mapping tori of graph **homotopy** equivalences, semiflows, or other group-actions. Such categories need separate honest hypotheses.

## T294: a genuine PL sublevel filtration exists, but the time weights are not intrinsic

Write M_w with one 0-cell v; edges a,b,c,t; and 2-cells with words
r_b=tbt⁻¹b⁻¹, r_c=tct⁻¹c⁻¹, r_a=tat⁻¹(aw)⁻¹.
Subdivide the finite characteristic disks and loops into simplices so that each cell has a chosen interior barycentric vertex and its entire boundary has already appeared at a lower PL height (subdivide sufficiently; regularise cell characteristic polygons if needed). Assign height 0 at v, 1 at each edge interior barycentre, 2 at the b-cell interior, 3 at the c-cell interior, 4 at the a-cell interior; extend linearly over the coned boundary triangulations (vertex values on subdivided boundary edges chosen < their cell event, compatibly). Denote the continuous PL function h_w on the finite polyhedral presentation model.

For t<0, L_w(t)=∅; 0≤t<1 the sublevel retracts to {v}; 1≤t<2 it retracts to the rose R4; 2≤t<3 to R4∪e_b²; 3≤t<4 to R4∪e_b²∪e_c²; t≥4 it is M_w. For every noncritical cut the partial cell is a collar on its existing boundary and retracts onto the preceding skeleton. At each equality cut its barycentre and full closed cell are present. Inclusion from the displayed CW-stage into the actual PL sublevel is an objectwise homotopy equivalence and natural in real t; in particular this represents a **literal finite continuous geometric sublevel inclusion filtration**, not just a declared four-step functor.

For w=1 and w=[[b,c],b] these have the same numeric vector of five event times. More generally the quantity δ_event=max_i |height_i(w)−height_i(1)| equals 0 for identically assigned heights. **δ_event is only a comparison of a labelled vector, not the sup norm of two maps on one common space and not a legitimate unmarked metric on graph bundles.** It forgets attaching words, and therefore cannot control dHI. The usual ||h−g||∞ sublevel stability theorem applies only when the two functions live on a common identified domain; its hypotheses are absent here. The independent choice of 0,1,2,3,4 means this PL height does not calibrate word length/outer monodromy canonically.

## T295: explicit lower-central obstruction, with marking caveat

Write G_w=F(a,b,c)⋊_{φ_w}⟨t⟩. Let γ_j denote group lower central terms. If w∈γ3F(b,c), the words tbt⁻¹b⁻¹, tct⁻¹c⁻¹ and tat⁻¹(aw)⁻¹ reduce mod γ3 to the identity-case relations. Thus the **marked** class-two nilpotent quotients G_w/γ3 and G_1/γ3 are canonically isomorphic on generators a,b,c,t.

The depth-three effect is genuine: set N=F(a,b,c)/γ4F. The automorphism of N fixes b,c and sends a↦aw with w central and nontrivial for w=[[b,c],b] (its degree-three Magnus polynomial is 2BCB−BBC−CBB). The semidirect product H=N⋊_{φ_w}Z is nilpotent of class at most three: [t,F]⊆γ3N, [t,γ2N]=1, and [t,γ3N]=1. It is a quotient of G_w and [t,a]=w≠1 in H. Hence the **marked** relation is detected by the γ4 quotient of G_w. This alone is NOT a proof that the unmarked isomorphism types of all class-three quotients differ, nor an interleaving-distance lower bound. Distinct *terminal* unmarked groups are separately known from their centres (S110 T287).

## T296: the γ3 example has a nonzero triple Massey product modulo FULL indeterminacy

Use cohomology with Z, and let A,B,C,T∈H¹(M_w;Z) be dual to a,b,c,t, with U_a,U_b,U_c∈H² dual to its 2-cells. Cellular ∂₂=0 and all these groups are free. For w=[[b,c],b]∈γ3F(b,c), S110's verified Fox degree-two computation gives exactly the same cup products as for M_1≃R3×S¹: T∪A=±U_a, T∪B=±U_b, T∪C=±U_c; B∪C=0. Hence ⟨B,C,B⟩ is defined.

Put Q_w=⟨b,c | w⟩, the corresponding finite presentation 2-complex. There is a cellular map p:M_w→Q_w taking b,c to their named loops and a,t to the basepoint. Under p the r_b,r_c attaching loops are null, so choose fillings in the 1-skeleton; r_a maps to w⁻¹, so its 2-cell maps with degree −1 onto Q_w's sole 2-cell. The pulled-back H¹ classes are B,C; on H² the dual 2-cell class pulls back to ±U_a. All this is a map of spaces, not a dubious group retraction.

In Q_w the sole relator is in γ3F(b,c), so Fenn–Sjerve (1987), original finite-presentation 2-complex Theorems 4.1–4.2, applies with k=3. Its degree-three Magnus coefficient of word [[b,c],b] in noncommuting B,C is 2BCB−BBC−CBB; thus the *zero-indeterminacy* triple ⟨B,C,B⟩ on Q_w evaluates to ±2 on its 2-cell. By Massey naturality its pullback gives an element ±2U_a of ⟨B,C,B⟩ on M_w. The FULL ordinary triple indeterminacy is B∪H¹(M_w)+H¹(M_w)∪B=Z U_b, by the already computed whole integral cup ring. Therefore the **entire triple Massey coset** is

    ⟨B,C,B⟩_(M_w) = ±2 U_a + Z U_b  ⊂ H²(M_w;Z).

It does **not contain zero**; after tensoring with Q it still misses zero. In contrast, M_1≃R3×S¹ is rationally formal (a graph and a circle are rationally formal, as is their product): every defined rational triple Massey set contains zero. In particular its corresponding integral triple has zero coset Z U_b. Thus nontrivial rational triple Massey structure gives a genuinely **unmarked** homotopy-type distinction, not only the earlier group-centre distinction. This is a classical Fox/Massey phenomenon, **not a new independently original HHA theorem**.

The marked explicit triple is natural under cellular stages where the classes exist; before adding e_a the U_a evaluation is absent and at the last stage appears. General Massey sets, with their full indeterminacy, are preserved (up to induced isomorphism of graded rings) by ordinary weak homotopy equivalences of the *whole spaces* in the standard singular cochain model. This fact does not make marked B,C or the quotient homomorphism p intrinsic to unmarked persistence. To claim an unmarked persistence detector one must use the existential non-vanishing class or full Massey functor under all WE zigzags, not a selected coordinate as a canonical class. No specific twisted local coefficient representation is needed for this third-order detection; **no twisted-coefficient calculation is claimed**.

## T297: the finite positive full-real nonclock objective is impossible for THIS pair

Any finite PL h:X→R on compact X is bounded above. Thus its sublevel persistence is strictly constant at X for all t beyond max h. If X and Y are not weakly homotopy equivalent, then d_IHC(L_h,L_g)=d_HI(L_h,L_g)=∞ in the **unpointed** all-real categories with arbitrary objectwise ordinary-WE zigzags of both whole diagrams. Proof: any finite strict HI after zigzags induces an interleaving of Fun(R,HoTop); at t≫max{max h,max g,ε} all four structure maps are identities and the two shifted comparison maps exhibit mutually inverse isomorphisms X≃Y in HoTop. Contradiction. It also excludes an IHC finite interleaving directly by taking large tails. At t<0 both PL sublevels are ∅, and equality cuts do not alter this tail argument. The same proof works for uniform R² min-coordinate constructions along cofinal diagonals.

For M_1 and M_w, w≠1, the groups have centres Z and 1, so terminal weak equivalence is impossible. The PL models of T294 therefore have **exactly ∞ for both HI and IHC**, even though δ_event=0. No edge-length-only or event-height-only Lipschitz estimate can hold across differing attaching words without an additional topology/monodromy identification. Rescale times by any λ>0 and this remains ∞; in the case of finite comparisons λ rescales the distance exactly (S110 T290). A finite positive sharp value is impossible for the required enduring IA pair in ordinary Top^R **under every finite PL sublevel realisation with those terminal spaces**, regardless of whether heights are canonical or extrinsic.

This is a **model-family no-go**, not a proof that all geometric persistent monodromy phenomena, all bundles, or every shared-terminal filtration have infinite distance. Necessary for any finite HI comparison of eventually constant compact sublevels is terminal weak-equivalence of total spaces; necessary for a δ-Lipschitz bound is a comparison controlling the topology/attaching maps, not just a list of lengths/heights. Equality of full terminal homotopy types is necessary, NOT by itself sufficient for a meaningful sharp finite quantitative theorem.

## T298: hostile controls and category precision

| Input/control | Verified output |
|---|---|
| w=1 | φ=id, genuine graph homeomorphism (identity), terminal centres equal, self distance 0; Massey zero. |
| w=[b,c] | IA nontrivial infinite-order Out, no finite-graph bundle, earlier cup rings already unequal; distance∞. |
| w=[[b,c],b] | IA nontrivial infinite Out; complete integer persistent cup rings match; triple ⟨B,C,B⟩=±2U_a+ZU_b, centre 1, HI=IHC∞. |
| w⁻¹ | φ inverse fixes b,c, a↦aw⁻¹; degree-three Magnus coefficient changes sign, triple nonzero; centre 1. |
| Inner automorphism / re-marking | Inner classes vanish in Out and mapping-torus groups may become product after rechoosing stable letter; cannot use nonidentity of a presentation word as unmarked detector. |
| Conjugation / graph change | Unmarked bundle monodromy is an **outer conjugacy** class; marked nilpotent coefficient is not invariant without transport of fibre marking. |
| t<0 / t at 0,1,2,3,4 / t≫4 | Empty / exact complete barycentric-stage attachment / whole M; all cuts included in the full-real argument. |
| Wang and π1/γ2 | Ordinary H_*(−;Z) and abelianized Wang data agree; detecting γ3 requires actual secondary/topological input, not these shadows. |

**Decisive verdict:** a valid explicit secondary homotopy difference is found, but (i) genuine finite-graph bundle geometry excludes these IA monodromies, (ii) permanent terminal inequivalence forces ∞ under the actual HI/IHC definitions, (iii) event-time pseudocontrol gives no stability, (iv) classic Fenn–Sjerve/Kitano already own the underlying Magnus/Massey link. The S111 geometric-monodromy route is **STOPPED as a first HHA paper candidate**. No same-category strict dHI>dIHC theorem and no original positive finite nonclock stability theorem was obtained. Go to S112 on *shared-terminal* cell-attachment filtration geometry, not another IA eternal-tail clock.
