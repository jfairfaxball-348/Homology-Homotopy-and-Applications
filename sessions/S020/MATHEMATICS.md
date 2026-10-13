# S020 MATHEMATICS — T47 explicit 182-point finite Euclidean Hopf comparison

**Scope:** internal mathematical theorem with finite checked ingredients; not originality/referee/Lean certified. Published 2000 simplicial Hopf triangulation used as input, not rediscovered. See scripts/s020_certificate.py and COMPUTATION.md.

## Objects and complete exact finite specification

Let K have the 36 sorted 4-vertex facets exactly listed in the standalone Python source (labels a0,a1,a2,b0,b1,b2,c0,c1,c2,d0,d1,d2), source MathOverflow 2022 transcription of Madahar–Sarkaria 2000. Let Q=∂Δ³ have nonempty proper subsets of {a,b,c,d} as simplices. The vertex map f1:K→Q sends xi to x for x∈{a,b,c,d}; f0 sends all 12 vertices to a. Every source tetrahedron has ≤3 distinct letter types, so both maps are simplicial.

Let P(K),P(Q) be posets of NONEMPTY faces. For i=0,1 define C_i on the tagged disjoint union P(K)_s ⊔ P(Q)_t; use usual inclusion within each half, and σ_s<τ_t iff f_i(σ)⊆τ. There are no target-to-source relations. This is a partial order: mixed transitivity follows from f_i monotone. Let D_i=Δ(C_i), its ORDER COMPLEX. Since all mutually comparable face vertices are a chain, D_i is flag, and source Δ(P(K))=sd(K) is an induced subcomplex on 168 tagged source-face vertices. The target has 14 vertices. Thus N=12+48+72+36+4+6+4=**182** for both, with equal literal tagged vertex set.

Choose Bplus=closed star of a0: the faces of the 16 tetrahedra containing a0. Choose Bminus=faces of remaining 20 tetrahedra. Finite exhaustive incidence gives |P(Bplus)|=101, |P(Bminus)|=117, |P(Bplus∩Bminus)|=50, and P(Bplus)∪P(Bminus)=P(K). Every vertex link of K is connected closed triangulated surface χ=2 and hence an S²; every triangle lies in two tetrahedra. Bplus is a cone on link(a0), hence a 3-ball. Bminus is a compact combinatorial 3-manifold with boundary link(a0), and an explicit greedy series of **58 elementary simplicial collapse pairs** takes Bminus to a vertex, proving contractibility. By the classical 3-dimensional sphere/ball recognition consequence (or the known PL S³ model from the cited construction), Bminus is a 3-ball and K=Bplus∪_{S²}Bminus≅S³. A=their intersection ≅S². Exact mod2 simplicial boundary ranks (∂1,∂2,∂3)=(11,37,35) confirm H*(K;F2)=H*(S³;F2); this alone would not prove simple connectivity, hence the explicit balls matter.

### Exact Hopf calculation over the integers

Take α on Q whose value on the oriented target face [a,b,c] is 1 and other target 2-simplices 0; α represents a generator H²(Q;Z). β=f1*α. An integral 1-cochain c on edges of K has the following NONZERO values (all lexicographically increasing):
(a0,a2):1; (a0,b0):1; (a0,d1):1; (a2,c2):−1; (b0,b1):−1; (b1,c1):1; (b1,d1):1; (c1,c2):−1; (c2,d1):1; (d0,d1):1.
All other edges have 0. Checking each of 72 oriented triangles gives dc=β exactly. Orient the 36 tetrahedra coherently across their 72 shared 2-faces, yielding a fundamental 3-cycle z. The Alexander–Whitney Hopf formula then gives **〈c∪β,z〉=−1** (global sign depends on orientation). For f0, β=0 and Hopf invariant 0. This independently verifies the finite simplicial class of f1 is a Hopf generator, rather than relying on a label in the literature.

### Poset-cylinder deformation and comparison

The order-preserving r_i:C_i→P(Q) sends a source face σ_s to f_i(σ) and a target face τ_t to τ. The inclusion j:P(Q)→C_i has r_i j=id and x≤j r_i(x) for every x∈C_i. The latter natural transformation gives a homotopy from id on |D_i| to jr_i; therefore D_i≃sd(Q)≃S², and the composite sd(K)↪D_i→sd(Q) is the barycentric functor induced by f_i. This is a fully explicit **simplicial** mapping cylinder model; no unspecified subdivision is needed.

### Exact Gram realization

Let E_s contain comparable pairs of SOURCE faces both in Bminus. Let E_i contain ALL comparable pairs in C_i. The checker enumerates E_s⊆E_i: |E_s|=644, |E_0|=2244, |E_1|=1524. Set ε=1/18200. For p≠q prescribe squared distances

D²_i(p,q)=1−ε if {p,q}∈E_s, =1 if {p,q}∈E_i\E_s, =1+ε otherwise. Diagonal 0.

This is a **complete algebraic squared-distance certificate** with ordered labels and SHA256 provided in COMPUTATION; it uniquely defines a rational 182×182 matrix for each cloud without 33,124 hand-printed entries. Let J=I−11ᵀ/182 and G_i=−(1/2)J D²_i J. Relative to the equilateral baseline G*=J/2, the distance perturbation matrix has entries bounded by ε; operator norm ≤182ε=1/100 (Frobenius or row-sum bound). Hence on 1⊥, G_i≥(1/2−1/200)I=99/200 I>0, so rank G_i=181. A factorization G_i=X_iX_iᵀ with 181 columns gives actual Euclidean coordinates, exactly realizing the specified squared distances. This rank also proves THESE exact matrices have no realization in dimension ≤180. It is **not** a universal obstruction to another d≤5 construction.

Use r0=√(1−ε/2), r1=√(1+ε/2), t0=1/2,t1=3/2; LOW height 0 on the 101 source-face vertices in Bplus, HIGH height1 elsewhere. Strictly √(1−ε)<r0<1<r1<√(1+ε), so all thresholds have positive margins; r1<diam=sqrt(1+ε) because the high graph is not complete.

### Four threshold complexes and all persistence grades

For F_i(r,t)=VR_r({h≤t}), the selected square has
* lower left A0=sd(A) plus 51 isolated Bplus\Bminus face vertices: total 52 path components;
* lower right B=sd(Bplus)≃point: 101 vertices;
* upper left C=sd(Bminus) plus 65 isolated vertices: total 66 components;
* upper right D_i=Δ(C_i)≃S²: 182 vertices, connected.

B∩C=A0 and B∪C=sd(K) ⊔ 14 isolated target-face vertices. These are equalities of actual *induced clique complexes*, not just abstract homotopy models.

Across the ENTIRE (r,t) plane, the only radius changes occur at √(1−ε), 1, √(1+ε), and height changes at 0,1. Before shortest distance all present vertices are discrete. At short range with LOW height, A0 has one S² component; with ALL heights, C has Bminus a point plus isolates. At middle radius with LOW height, B is contractible; with ALL heights, D_i≃S². At longest radius both are simplices. All π0 component maps are the same because the named vertices, short graph, and connectivity partitions agree between i=0,1. For j≥1 all potentially nonzero π_j arise from the LOW/short A≃S² component and ALL/middle D_i≃S². Every map A→D_i factors through LOW/middle B≃point (or ALL/short C≃point on the A component), so induces zero in π_j. Every identity-on-stratum map is identical after a fixed identification of S² groups; remaining source/target maps into/from contractible components vanish. The same argument with integer H_j proves equality of all individual group-valued persistence representations. This does NOT assert equivalence in the homotopy category of space-valued diagrams or strict functorial identifications of all based π_j without basepoint choices.

Since B and C are subcomplex inclusions, the punctured-square homotopy pushout is their ordinary union U. The map U→D_i restricts on the sd(K) component to f_i after r_i, while 14 other source components are single vertices. Its cofiber is Cofib(f_i)∨(∨^14 S¹) up to homotopy. Consequently

Cofib(f0)≃(S²∨S⁴)∨14S¹;  Cofib(f1)≃CP²∨14S¹.

If x∈H² and y∈H⁴ are integral generators, x²=0 in first and x²=±y in second (nonzero). These rings differ even though all individual homology and homotopy-group diagrams agree. The 14 circles cannot affect degree-4 cup products.

### Scope, robustness, other fronts

Distance classes separated by strictly positive δ=min(r0−√(1−ε),1−r0,r1−1,√(1+ε)−r1). Each point move <δ/4 and each height move <1/4 preserves the four chosen complexes (not full real-valued persistence unchanged). Fixed exact-distance Gram rank181 excludes direct representation of THIS certificate in d3/4/5, but does not settle dimension reduction for different distances/graphs. Front A requires new succinct nonprincipal k≥1 theorem or reduction beyond exponential staircase enumeration; none proved. Front C global primitive all-Q/all-Fp [0,2]²/³ mixed splitting/counterexample still open. The source Hopf map is 2000 prior art; mixed invariant literature priority/HHA novelty not certified. **NO_VIABLE_HHA_FLAGSHIP_YET**.
