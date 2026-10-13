# S023 MATHEMATICS — T51 low-star nonconstant null map, T52 exact poset widths, T53 d<=4 exclusion

## 1. Explicit different null map (T51, INTERNAL)

Fix the SAME Madahar–Sarkaria 36-tetrahedron triangulated source 3-sphere K from S021 (12 vertices `a0,a1,a2,...,d2`, source face vector (12,48,72,36)) and target 2-sphere Q=boundary of a tetrahedron with vertices `a,b,c,d`. Keep the published Hopf simplicial map `f1(x_i)=x` for x=a,b,c,d, with Hopf invariant -1 on the previously certified orientation.

**Replace the S021 constant null map** with the following explicit nonconstant vertex map g:

- `g(a_i)=g(b_i)=g(c_i)` equals `a`, `b`, or `c` for i=0,1,2 respectively;
- `g(d_0)=g(d_1)=g(d_2)=d`.

On the actual list of ALL 36 facets of K, no facet maps onto all four vertices of Q and no facet has image exactly `{a,b,c}`. Consequently g is simplicial and the image of every simplex lies in the subcomplex `Q\{abc}`, meaning the full boundary tetrahedron with its **open triangle abc removed**. This is the closed triangular cone from d onto boundary(abc), hence a contractible **2-disc**. Therefore g:S^3→S^2 is nullhomotopic, despite using all four target vertices. This geometric disc-factor proof does NOT rely on computationally inferring zero Hopf invariant. The independent exact integer cochain check yields `g*alpha=0` identically for the generator alpha supported on oriented target triangle abc, so the cochain Hopf calculation is zero; original f1 retains Hopf invariant -1.

Build the two **genuine transitive** two-level mapping-cylinder face-posets `C_g=P(K) ⊔ P(Q)`, `C_f1=P(K) ⊔ P(Q)`. Within sides order by inclusion, and from a source face sigma to a target face tau exactly when `g(sigma)⊆tau` (respectively f1). Every cross transitivity case follows from order preservation. The target inclusion has order retraction r satisfying x<=jr(x); so `Delta(C_g)` and `Delta(C_f1)` both deformation retract onto sd(Q)≃S²; the source-to-target map is homotopic to g or f1.

Use EXACTLY S021 lower short graph: source-face comparabilities within the ball Bminus (tetrahedra not containing a0). Choose E_high=all full-cylinder comparisons, N=182, epsilon=1/(100N), squared distances `1-epsilon` for short edges, `1` for other high edges and `1+epsilon` otherwise; h=0 on faces of Bplus, h=1 otherwise. This rational matrix defines algebraic Euclidean point coordinates in R^181: with J projection to 1-perp, the equilateral Gram has eigenvalue 1/2 and the perturbation norm ≤(N-1)epsilon/2<1/200, hence Gram ≥99/200 on 1-perp. The same two thresholds `r0=sqrt(1-epsilon/2)`, `r1=sqrt(1+epsilon/2)`, height cutoffs 1/2 and 3/2 give the SAME lower three stages in both filtrations; the upper stage is sd(Q)-equivalent S² at radius smaller than the diameter. This is an exact 181-dimensional **existence** proof by Cholesky, NOT an actual five-dimensional point placement.

As in repaired S021 T47/T48, the proper-square homotopy pushout is `U=sd(K) ⊔ (14 isolated target vertices)`; all lower inclusions are honest simplicial induced inclusions; `U→Delta(C_g)` gives g and `U→Delta(C_f1)` gives f1 after deformation retraction. Their cofibers are respectively `(S²∨S⁴)∨14S¹` and `CP²∨14S¹`, with cofiber degree-2 generator x satisfying `x²=0` versus `x²=±y`, by the CLASSICAL Hopf-invariant cup-square theorem. The individually indexed integral homology, componentwise π_j and entire pointwise **integral graded cohomology ring diagrams** are naturally isomorphic as in S021: the short/low and middle stage complexes are identical, upper stages ≃S² with incoming positive-degree maps factoring through contractible stages, and component mergers H^0 coincide. This is a rigorous transfer of the S021 proof to a different valid face-poset mapping cylinder, not a newly discovered cohomology operation. π_j are proof-level inferences, NOT machine computed for all j; integral cofiber AW diagonal is NOT independently computed.

## 2. Exact graph change and attack of T50 (T52, COMPUTED_EXACT)

A stdlib face/comparability pair checker (repository `scripts/s023_recolored_null.py`) recalculates all 16,471 upper unordered pairs for BOTH graphs. g has **1,572** high edges, f1 has **1,524**; both have **644** identical short edges. Full canonical ordered distance-class SHA256:

- g null: `8cce60227b889db047c72e1bb73aaff6b27448d58097e8ebeaed58286c7d0a23`;
- f1 original: `ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351` (independently matches repaired S021);
- S021 constant f0: `65deabfaed606db2d756b38569de169bef073e32c388a774fe23de6d20e66741` remains valid for the OLD graph, not this new g graph.
- S020 lex-first-letter `138695...` remains RETRACTED/NONTRANSITIVE and MUST NEVER be substituted.

For each target face tau, the source neighbours are exactly the source faces sigma whose image is contained in tau. Exact maximal antichain widths via Dilworth/bipartite inclusion matching give: singleton tau width3 each; edges `ab,ac,bc,ad,bd,cd` width12 each; target facets `abc,abd,acd,bcd` widths **27,31,31,31** for g, and **27,27,27,27** for f1. In each facet case the listed triangular source faces already attain that width, verified by counts. Thus for any fixed target-vertex center the S022 72 independent **source** leaf configuration has been removed: maximum source-only leaf antichain is 31, not 72. No proof is claimed that every induced-star size of the full graph, with extra target leaves, equals 31; it could be larger. This result negates only the *specific S022 obstruction*, not all d5 packing/metric obstructions.

Independent all-clique GF2 boundary reduction (Python 3 / networkx3.6.1, `scripts/s023_homology.py`) gives:
- g upper complex f-vector (182,1572,4434,5418,2916,540), boundary ranks (181,1391,3042,2376,540), Betti (1,0,1,0,0,0);
- f1 upper complex f-vector (182,1524,3936,4032,1440), boundary ranks (181,1343,2592,1440), Betti (1,0,1,0,0).
These are finite homology corroborations of the order-retraction theorem, **not** integral homotopy or cup-ring computation.

## 3. Lower bound for any faithful Euclidean model of THESE revised graphs (T53)

In the g graph the target triangle `abd` is adjacent to **31 distinct source triangles**, which are pairwise incomparable and hence pairwise nonadjacent. The f1 graph has the analogous 27-triangle star at target triangle `abc`. Any faithful Euclidean threshold realisation at radius r>0 would yield a family of 31 (or 27) points in the radius-r ball about a center, pairwise >r apart. S022's normalization lemma projects radially to an angular code with inner products <1/2. O. Musin's published 2008 theorem gives kissing number tau(4)=24, so NO faithful placement in R^d for d≤4 of either revised graph. At r=0, all neighbors coincide with center, contradicting their mutual nonedges. Thus **d≥5 is necessary for these particular upper graphs**. This is a source-dependent graph geometric deduction, not a new kissing bound. Since 31<known tau(5) lower bound 40, the star argument does NOT decide d5; nor does it certify d5 feasibility.

## 4. Hostile mathematical bounds, journal viability and secondary fronts

- The null map uses all four target colours, but its **image lies in a disc**: surjectivity on vertices never implies a nonzero Hopf class. If a future redesign maps any K tetra onto all four target vertices, the simplicial cylinder definition FAILS. If an alleged null map covers target abc fully, this specific null-disc proof no longer applies.
- No attempt to solve the 182×182 rank≤5 Euclidean strict distance inequalities succeeded with an EXACT witness/certificate; d5 is **OPEN**. The new R181 Cholesky model does NOT bypass the d5 gap. Musin's 24 bound disallows d≤4 for THIS new pair.
- Generic classical attaching-map/Hopf square and standard cubical total homotopy cofiber are already published. No nonroutine stability, derived-equivalence, computability or HHA-scale theorem proved; RETAIN `NO_VIABLE_HHA_FLAGSHIP_YET`, Gate2 CLOSED. The new map reduces a geometric bottleneck only.
- Front A: canonical finite-representation complexity comparison to S010/S018 and LLO/FoCM shows no rigorous new succinct nonprincipal arbitrary-k result. OPEN.
- Front C: no all-prime primitive integral [0,2]^2/^3 grid idempotent compatible with ALL arrows/subcubes/composites proved, nor explicit global counterexample. OPEN.
