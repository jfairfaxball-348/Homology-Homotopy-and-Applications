# S106 MATHEMATICS — vertexwise-identical ghost squares; higher-coherence objective killed

All mathematical results are INTERNAL mathematical arguments, not formally or independently certified. Work in based compactly generated CW spaces, based weak homotopy equivalences and the coordinatewise square P=[1]×[1].

## T269: literal finite CW squares, equal at every vertex
Let X=S²∨S⁴_1∨S⁴_2. Let p_i:X→S⁴_i pinch onto the ith 4-sphere, j:S²→X the inclusion and eta²:S⁴→S² the nonzero generator of pi4(S²)=Z/2. Define h_i=j eta² p_i:X→X for i=1,2. On S² both h_i are literally constant, and their images lie in S²; thus **every composite h_i h_j is literally constant**. On the ith π4 free summand h_i is nonzero, so all h_i are non-nullhomotopic. Each induces zero on all positive-degree reduced integral homology and reduced mod-2 cohomology.

Use four copies of X as A (00), B (10), C (01), D (11). Define strict commuting squares Q_parallel and Q_perp, arrows (a:A→B,b:A→C,c:B→D,d:C→D):
- Q_parallel: (h1,h1,h1,h1);
- Q_perp: (h1,h2,h1,h1).
Both squares commute *strictly*, since ca=db=constant. All vertices are literally identical, not merely weakly equivalent. All graded integral homology, cup rings, mod-2 primary Steenrod operations and every arrow between them agree naturally: all arrows act as zero on reduced cohomology/homology. At H0 both have the same identity maps on connected occupied X.

## T270: joint outgoing pi4 rank invariant
The first mixed Hilton–Milnor sphere involving S² and S⁴ has dimension 2+4−1=5, so pi4(X)=Z e1⊕Z e2⊕(Z/2)t, t=j_*(eta²). The induced map h1_* takes e1↦t, e2↦0, t↦0; h2_* takes e1↦0, e2↦t, t↦0.

For any square whose two outgoing maps a,b kill Tor(pi4(A)) and land in the respective torsion subgroups, define V(A)=(pi4(A)/Tor)⊗F2 and the **joint** homomorphism Φ_Q:V(A)→Tor(pi4(B))⊕Tor(pi4(C)), [x]↦(a_*x,b_*x). This is well defined and preserved in rank by arbitrary independent vertexwise weak homotopy equivalences, because π4 isomorphisms preserve torsion and induce quotient isomorphisms. Along any *zigzag* of entire-square vertexwise WE, the induced commutative π4 squares preserve this rank.

For Q_parallel the F2 matrix is [[1,0],[1,0]], rank 1; for Q_perp it is [[1,0],[0,1]], rank 2. Therefore the squares are not equivalent by any whole-diagram based objectwise-WE zigzag, even allowing all vertex automorphisms. Individual edges h1,h2 are conjugate by swapping the 4-spheres; only simultaneous compatibility of the TWO outgoing arrows obstructs equivalence. This is already visible in Fun(P,Ho(Top_*)), so it is **not** a Toda/DKS higher-coherence-only invariant.

## T271: honest all-real finite-CW R² comparison
For each Q, define F_Q:R²→Top_* with support [-1,1)². If either coordinate is <-1 or >=1 take the point *. Otherwise choose A for x,y<0; B for x>=0,y<0; C for x<0,y>=0; D for x,y>=0. All values in the occupied box equal X. Inside a region arrows are identities, across interior boundaries use Q arrows and their strictly constant square composite, from/to point use unique based maps. An increasing comparable pair cannot leave the box and later reenter, so all maps, including boundaries exactly -1, 0 and 1, form a **strict** functor. Death arrows are collapses, not all inclusions.

For the based whole-diagram homotopy interleaving distance with diagonal shifts, the internal proof gives
```
     1/2 <= d_HI(F_parallel,F_perp) <= 1,
     d_I(H_*(F_parallel;Z),H_*(F_perp;Z))=0.
```
Upper: ε=1, t+(2,2) lies outside support whenever t is occupied. Thus both 2ε shift structure maps are literally constant at *every* grade. The zero transformations in both directions form a strict ε-interleaving, checking BOTH composites and boundary cases.

Lower: for arbitrary 0<=ε<1/2 choose x_-∈[-1,-2ε), x_+∈[0,1-2ε), similarly y_-,y_+. The four t_ij=(x_i,y_j), t_ij+ε(1,1), and t_ij+2ε(1,1) stay in the same respective interior corner. A homotopy ε-interleaving, even following arbitrary whole-diagram objectwise-WE replacements, evaluates in Ho(Top_*) to a pair of natural four-corner transformations. Its composites are cornerwise identities because the F_Q maps for t_ij→t_ij+2ε(1,1) are identities. Hence these four components are isomorphisms, and naturality along all four cross-boundary arrows would naturally identify Q_parallel and Q_perp in Fun(P,HoTop_*), contradicting T270 rank 1 vs 2. Thus no ε<1/2 works. At ε=1/2 this argument no longer applies; **no exact value is claimed**.

The same sampling/rank argument obstructs a small interleaving already in pointwise Ho(Top_*) diagrams. Thus no same-category strict dHI>dIHC is claimed, in particular none in ordinary unpointed one-parameter Top^R.

## T272: required higher-coherence/HHA verdict
The S106 finite pair is **not terminal-vertex-type clock driven** at the lower bound: all corresponding vertices are literally X or *; it is their two-arrow joint map rank that differs. Yet that rank is a *primary* pi4 diagram invariant, not a choice-free secondary/Toda class invisible in pointwise HoTop. The upper bound is ordinary zero-interleaving of common finite support, not new stability machinery. No new nonclock HHA application, and no strict HI>IHC theorem, has been proved. The decisive **derived-only higher-coherence requirement FAILS**. Original unpointed Top^R strict separation remains OPEN. G1 HHA candidate and G2 HHA novelty/significance NOT PASSED. No Lean, formal certificate or publication.
