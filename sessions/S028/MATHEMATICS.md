# S028 — explicit integral total-cofiber certificate and flagship retirement

## T64: a completely specified coefficient-two Euclidean example

There are two explicitly certified 334-point sets in Euclidean R^333, with heights in {0,1} and exactly three off-diagonal distances, whose radius×height Rips bifiltrations have naturally isomorphic full pointwise integral cohomology-ring diagrams and componentwise homotopy-group diagrams. Their coherent selected-square total cofibers have H²=Z x and H⁴=Z y, and x²=0 and x²=2y, respectively. The diagonal-translation homotopy-interleaving distance is at least 1/534400. This is a verified internal example, not a newness claim or a strict R5 model.

All finite objects are in `certificates/common.json`, `f0.json`, `f2.json`, the two complete distance-class CSVs and two complete rational Gram JSON matrices. Every simplex of each cylinder D is listed. The normalized reduced simplicial quotient D/U has exactly those nondegenerate D-simplices outside U (plus its basepoint); U consists of the source order complex and all target vertices, with no target positive-dimensional simplices. Thus the lists determine every normalized quotient simplex and every face, including faces collapsed into the basepoint. No unspecified triangulation is used in the cup computation.

### Source and vertex maps

Start with the 36-facet Madahar–Sarkaria model, using the exact input of the corrected `scripts/s020_certificate.py`. Remove the interior of T=[a0,a1,b1,c1] in two copies. Give nonshared vertices suffixes _L and _R; identify the boundary by sending right a0 to left a1, right a1 to left a0, right b1 to left b1 and right c1 to left c1. Keep every other facet. This gives K2 with 20 vertices, 90 edges, 140 triangles and 70 tetrahedra. Its complete literal facet list and vertex map are printed in `FINITE_OBJECTS.md` as well as JSON.

Each punctured original sphere is a PL ball; gluing their boundary spheres gives a PL S³. Independently, every K2 triangle has two incident tetrahedra, every vertex link is a connected closed Euler-characteristic-two surface, the oriented fundamental chain has 70 coefficients ±1 and zero boundary, and exact integral boundary elimination gives ranks 19,71,69, all nonzero Smith factors 1. These homology diagnostics alone are not the proof of S³: the connected-sum construction supplies that proof. An additional 128 verified elementary collapse pairs take the complement of the closed star of a0_L to a vertex. This supplies the contractible Bminus needed below without a homology-to-contractibility inference.

The map f2 sends each vertex xi_L or xi_R to its first letter x; f0 sends every vertex to a. Each facet uses at most three colors, so both are simplicial into Q=boundary of [a,b,c,d]. The gluing respects f2 because a0 and a1 have the same color. Source Hopf additivity is NOT used as a computational oracle.

An explicit integer 1-cochain c on K2, listed in common.json, is obtained by transporting the original ten-edge primitive to the two copies and adding an integer vertex coboundary on the right to match the shared facet. For α equal to 1 on [a,b,c] and 0 on the other ordered target triangles, the independent checker checks dc=f2*α on all 140 source triangles. It also checks <c cup f2*α,[K2]>=2 on the entire oriented 70-tetrahedron fundamental chain. This is a source diagnostic; the following computation independently evaluates the actual total-cofiber product.

### Cylinders, square and all full-plane arrows

For h=f0,f2 take the disjoint tagged nonempty face posets P(K2)_s and P(Q)_t, ordered internally by inclusion and across by σ_s<τ_t exactly when h(σ)⊆τ. There are 320+14=334 vertices. The order complex D_h is flag. The retraction r_h sends σ_s to h(σ) and fixes target faces; with j the target inclusion, r_h j=id and id≤jr_h. The order homotopy proves D_h≃sd(Q)≃S² and identifies sd(K2)→D_h with h.

Let Bplus be the closed star of a0_L and Bminus the faces of tetrahedra not containing a0_L. Let S be the common source comparability edges entirely in Bminus, with 1516 edges. Let H_h be the full cylinder comparability graph. Assign height 0 to source faces in Bplus and height 1 to every other vertex. With ε=1/33400 set squared distances to 1−ε on S, 1 on H_h minus S, and 1+ε elsewhere. Edge convention is distance≤radius, not half-distance.

At r0=√(1−ε/2), r1=√(1+ε/2), t0=1/2 and t1=3/2, the four complexes are L=sd(link(a0_L)) plus low isolated faces, B=sd(Bplus), C=sd(Bminus) plus all remaining isolated vertices, D_h. Their intersection is B∩C=L and their union is U=sd(K2) disjoint-union 14 isolated target points. Inclusions are cofibrations, so the homotopy pushout is U and the derived total cofiber is modeled by D_h/U. Equivalently its homotopy type is Cofib(h) wedge 14 circles; the integer chain argument below does not use the classical Hopf-cofiber cup formula.

Specify the negative-radius extension: our graph-clique convention retains all height-selected vertices and uses no edges when r<0. It agrees with the usual Rips construction for r≥0. Thus there are exactly 4 radius strata and 3 height strata, with event boundaries included in the new stratum. S027's 12-stratum count tacitly used this extension; with the alternative convention VR_r=empty for r<0 there is an additional radius event0 and at most15 product strata. All invariant equalities, cofiber certificates and the positive metric bound remain true for that alternative extension, but we do not claim12 strata for it.

Before the first distance, all present vertices are discrete; at short/low there is one S² component with isolates; at short/all one contractible Bminus component with isolates; at middle/low Bplus is contractible; at middle/all D_h≃S²; at the last radius each nonempty stage is a simplex. The independent checker verifies every named component partition at all12 strata under the stated extension for both graphs. All H⁰ ring arrows, including idempotent restriction maps, are consequently identical. Every arrow between distinct S² plateaux factors through the contractible Bplus or the contractible Bminus component, hence is nullhomotopic. Every other positive-degree arrow is an identity within a stratum or has contractible source or target. Fixing a sphere identification on each plateau proves all ring and componentwise π_j diagrams match for every j≥1, with compatible basepoints; infinitely many π_j are proved this way, not enumerated in software.

In fact these same choices show the full diagrams are isomorphic in Ho(Top)^(R²): maps from discrete components into a connected component are unique up to homotopy, and the only potentially nontrivial S²→S² arrows were just shown null. Naturality follows on every arrow; component identifications fix H⁰, including the empty strata. This is a stronger statement than equality of ring/π data. It does not give an isomorphism in Ho(Top^(R²)), which retains the coherence of the square.

### Exact rational Gram matrices

Both high graphs and all 55,611 unordered pair classes are checked independently. In the Gram files, every integer entry is divided by the common denominator 200N³, N=334. If d_ij is the numerator of D²_ij over 100N, s_i=Σ_j d_ij and s=Σ_i s_i, then

G_ij=−(N²d_ij−N s_i−N s_j+s)/(200N³).

This is exactly −JD²J/2. All row sums vanish and G_ii+G_jj−2G_ij=D²_ij for every ordered pair. On 1-perp, the perturbation from J/2 has operator norm at most (N−1)ε/2. Thus G≥(1−333/33400)/2=33067/66800>99/200 there, so rank is exactly 333 and the matrices are positive semidefinite. This proves exact Euclidean realization; algebraic coordinates follow from positive-definite anchored Gram Cholesky recursion with positive square roots. The supplied matrices are rational, hence also algebraic. They do not give rank-five coordinates.

### Actual integral relative Alexander–Whitney computation

Order face vertices by source-before-target, then face size and lexicographic labels. Write α_sd for the pullback of the abc cocycle by the last-vertex map sd(Q)→Q. For a source edge [σ,τ], pull c back by the last source vertices, respecting signs and assigning zero to degeneracies. Extend this source 1-cochain by zero on all other cylinder edges, and put

w=r_h*α_sd−d(c_ext).

For f0 use c=0. Color-first vertex ordering ensures the last-source-vertex and last-target-color maps commute, so w restricts to zero on sd(K2). The checker reconstructs w on every cylinder triangle, verifies w|U=0 and dw=0 on every cylinder tetrahedron, and verifies its restriction pairs to −1 with an explicit sd(Q) fundamental 2-cycle. This establishes an integral H² generator, not a possibly divisible cocycle.

Subdivide the oriented source fundamental cycle barycentrically, using all 24 signed vertex permutations per tetrahedron. Apply the simplicial prism chain for id→jr on the source: for a source flag [σ0,σ1,σ2,σ3], take the signed sum over i=0,…,3 of

[σ0_s,…,σi_s,h(σi)_t,…,h(σ3)_t]

with sign (−1)^i, omitting degenerate terms. The resulting integral 4-chain z has boundary ±the primitive source fundamental 3-cycle, with every relative 3-boundary coefficient zero. The checker verifies this boundary exactly from all supplied simplices; global orientation is chosen to make the f2 pairing positive. This is the explicit relative cycle in z4, with supports 1680 (f0) and 2760 (f2).

The relative integral LES gives H1(D,U)=Z^14, H2=Z, H3=0, H4=Z and all other reduced degrees zero: D≃S², U≃S³ disjoint-union 14 points, and the H0 kernel has rank14. The connecting map H4(D,U)→H3(U) is an isomorphism; the checked primitive boundary of z proves z is a generator. Unit Smith diagnostics on K2 and Q confirm that all the input homology is free. We did not run a dense Smith decomposition of the enormous D/U boundary matrices: their torsion-free homology is deduced integrally from the LES and explicit order retraction. The integral UCT, including Ext(H3,Z)=0, gives H⁴≅Hom(H4,Z), so a pairing uniquely determines the coefficient.

For EVERY ordered relative 4-simplex [v0,…,v4], the checker evaluates (w cup w)=w[v0,v1,v2]w[v2,v3,v4]. It checks the degree-five cocycle identities when such simplices exist. The direct integer pairings are 0 (f0) and 2 (f2). Hence x²=0 and x²=2y, without appealing to an inherited Hopf mapping-cone product theorem. Reducing this second coefficient mod2 would erase it; the integer calculation is essential.

### Quantitative coherence

Set δ=ε/16=1/534400. The exact S027 inequalities show each chosen corner and its δ and 2δ shifts remain in the same radius and height stratum: 1−r0>ε/4>2δ, √(1+ε)−r1>ε/8=2δ, and 2δ<1/2. Both interleaving identities and naturality imply every comparison map on these plateaux is a split mono and split epi in Ho(Top), hence an isomorphism. The comparisons therefore give an objectwise weak-equivalence morphism of coherent squares, forcing weakly equivalent total cofibers. Their integral rings have different vanishing of x², contradiction. No interleaving with shift≤δ exists, giving the stated lower bound. This is not an exact distance computation.

## A tested application of unbounded coefficients, and its limit

Extending the same construction existentially to two arbitrary Hopf classes m,n (common sufficiently subdivided source) gives matching pointwise diagrams. The graded integral cofiber ring detects |n|: any isomorphism sends x to ±x and y to ±y, so it can only change the sign of n. Over a field of characteristic p the graded ring depends only on whether p divides n; over characteristic zero all nonzero n give isomorphic rings by rescaling y. Thus the classical coefficients 2 and 4, or arbitrary distinct powers of 2, cannot be separated by ANY individual field-valued cofiber ring, although their integral rings differ. Circle summands have zero positive products with the sphere/cone summand.

This concerns each selected cofiber ring, not natural equality of the complete derived-cofiber ring profiles over every rectangle. It is an elementary arithmetic consequence of the classical cone ring, not a genuinely new application that clears HHA significance. No finite f4 certificate was generated here.

## Primary C and secondaries: exact scope of failure

The S023 frozen 182-node g/f1 strict R5 geometry is still OPEN. Replaying the actual star and K6,6 scripts confirms maximal stars32/30 and no induced K6,6; these do not give coordinates or a no-go proof. The new constant f0 has 140 triangle neighbours at target a and is excluded from R5 by the old kissing argument, but it is a DIFFERENT graph and cannot settle frozen g. Our Gram ranks333 and the old ranks181 prohibit compression of those exact matrices only. The remaining task is rank≤5 PSD feasibility for alternative squared distances satisfying every strict frozen threshold inequality and the shared short graph/heights, or an independently checkable universal obstruction. We did not produce either; no optimizer failure is labeled UNSAT.

Front A still lacks an all-input nonprincipal succinct bit-complexity improvement/lower bound over FoCM2025. Front C still lacks global primitive integral mixed-grid splitting or an all-Q/all-Fp counterexample satisfying every arrow/composite condition. They are not solved by the present certificate.

## HHA decision

Direct proof-level primary inspection now identifies the existing categorical mechanism, rather than only a vague risk. The Hopf/coherent-square separation route T46–T63 is RETIRED AS THE CURRENT HHA FLAGSHIP. Its internally valid statements and explicit benchmark certificates are preserved. This does not prove that an earlier paper literally printed these exact 334×334 matrices; it says that a routine finite realization and an integer benchmark do not establish the programme's required significant original theorem. Stage1 continues, G2 is not passed, no later stage is started.
