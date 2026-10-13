# S022 MATHEMATICS — T50 exact graph-specific Euclidean lower bound

## T50 (INTERNAL, fully quantified; no HHA novelty claim)

Let K be the 12-vertex 36-tetrahedron simplicial 3-sphere from original Madahar–Sarkaria, with 72 triangular faces (this is the corrected S021 `scripts/s020_certificate.py` complex). Let P be the poset of its 168 nonempty faces and Q be the poset of the 14 nonempty proper faces of a tetrahedron on {a,b,c,d}. Let f0:P→Q send every source face to the target singleton {a}, so f0 is order-preserving. Let G0 be the undirected comparability graph of the two-level mapping-cylinder poset P ⨿ Q: its within-level edges join strictly comparable faces and its cross-level edges join (σ_source,τ_target) exactly when f0(σ)⊆τ. Let r>0.

**Theorem.** There do not exist 182 points x_v in R^d for ANY d<=5 satisfying, for all distinct vertices v,w, exactly {v,w}∈E(G0) ⇔ ||x_v−x_w||<=r. In particular S021's corrected null-cloud three-class high-radius threshold graph CANNOT be compressed faithfully to d=3,4,5 by ANY nonlinear change of distances, even abandoning the near-equilateral box. Its exact graph requires d>=6. (A different graph giving homotopy-equivalent filtration diagrams is not covered.)

### Step 1: induced K_(1,72)
The face vector of K is (12 vertices,48 edges,72 triangles,36 tetrahedra), as checked in the corrected S021 source. Let T be its set of 72 distinct triangular faces. Same-size distinct faces are incomparable under inclusion. So their 72 P-vertices are pairwise nonadjacent in G0. For target vertex c=({a})_target, all 72 are adjacent because f0(σ)={a}⊆{a}. Hence induced K_(1,72), with center c, regardless of any other vertices or of the short-edge threshold.

### Step 2: Euclidean balls create spherical codes, with all edge cases
For arbitrary r>0 and points y_1,...,y_N,c in R^d satisfying ||y_i−c||<=r and ||y_i−y_j||>r for i≠j (N>=2), every y_i−c is nonzero (if y_i=c then ||y_i−y_j||<=r for all j). Put a_i=||y_i−c||/r∈(0,1], u_i=(y_i−c)/||y_i−c||∈S^(d−1). If u_i·u_j>=1/2, then
||y_i−y_j||²/r²=a_i²+a_j²−2a_i a_j (u_i·u_j) <= a_i²+a_j²−a_i a_j <=1.
The last inequality holds by convexity in each variable on [0,1]²: its maximum is attained at a corner and is 1. This contradicts >r. Therefore u_i·u_j<1/2 for every pair. Embed the sphere in R5 if d<=5.

### Step 3: self-contained EXACT dimension5 linear-programming bound
Put t∈[-1,1], λ=(5−2)/2=3/2 and C_k=C_k^(3/2) Gegenbauer polynomials, normalized by C_0=1,C_1=3t and recurrence
(n+1)C_(n+1)=2(n+3/2)t C_n−(n+2)C_(n−1).
For any N unit vectors u_i∈S^4 the matrices [C_k(u_i·u_j)]_(i,j) are positive semidefinite for k>=0 (spherical-harmonic addition theorem). Thus their total entry sum is >=0.

Choose
p(t)=(t+1)(t+1/2)^2 t² (t−1/2).
On −1<=t<=1/2 it is <=0, with equality allowed only at the displayed roots. Exact polynomial arithmetic yields:
p=(37/840)C_0+(11/168)C_1+(131/1980)C_2+(87/1540)C_3+(146/4095)C_4+(4/231)C_5+(16/3003)C_6.
EVERY coefficient is positive. Therefore
(37/840) N² <= Σ_(i,j) p(u_i·u_j) <= N p(1)= (9/4)N,
because all off-diagonal p-values are nonpositive. Consequently N<=1890/37<52, hence N<=51. Exact recurrence fractions and multiplication replayed in sessions/S022/COMPUTATION.md. This is a deliberately WEAKER self-contained bound than published tau5<=44 and needs no unpublished SDP certificate.

### Step 4: contradiction
For N=72 the ball neighbors from Step1 give a 5D spherical code with N<=51 by Steps2–3, contradiction. Works for all placements/distances and all r>0. If r=0, an edge connects only coincident points; 72 leaves adjacent to c would coincide with c and hence with one another, contrary to graph nonedges, so r=0 is impossible as well. For larger ambient dimensions d>=6 no conclusion. The two original S021 clouds in R^181 remain valid after the S021 correction, and no claim of a universal d<=5 no-go for different Hopf witnesses follows.

## Independent attack and alternative approaches
1. **Nonlinear distance and Gram rank reduction.** T49 excluded only matrices near a regular simplex. T50 excludes *every* distance assignment for THIS null graph, including wild outliers. A low-rank PSD Gram optimization cannot succeed if it preserves the 72-star inequalities. This proof makes a finite optimizer unnecessary and explains why a simple 182-to-5 projection cannot preserve the threshold graph, rather than merely failing to find a projection.
2. **Changing the poset model:** The giant star arises from the constant f0 mapping every source triangle into target singleton {a}; for a different Hopf/null diagram (e.g. more economical flag subdivision, different cone) that star need not persist. No universal lower bound on all scalar-height Euclidean Hopf witnesses was proved.
3. **Published sharper packing:** Cohn–Rajagopal 2026 original §2 reports tau5 between40 and44. Using the existing 44 upper bound immediately gives 72>44, but T50 includes an exact independent, weaker 51-bound and does not claim to improve packing literature.

## Front A and Front C (attempted, NOT solved)
- **A succinct nonprincipal k>=1:** implicit antichain incidence encodings might avoid enumerating all rectangles, but S010 fixed listed-family and S018 all-rectangle/Kan/relative Schanuel already implement much of the algebra. No polynomial bound/hardness reduction with quantified bit-size, arbitrary input, and proven soundness was produced. No mathematical claim registered.
- **C [0,2]^2/^3 primitive integral all-prime:** rational and F_p splits do not by themselves supply a globally coherent integral idempotent or compatible naturality matrices; attempted local-to-global projector reasoning lacks a concrete primitive global counterexample or a theorem under EVERY named hypothesis. Open.

## Significance boundary
T50 is valid, falsifiable and stronger than T49 for this graph, but it is an application of standard sphere-packing to a large induced star, not itself a nonroutine HHA homotopy theorem. The original mixed cup distinction is already based on known Hopf/CP² mechanisms and standard total homotopy cofiber; no HHA flagship selected, G2 closed. No Lean, Palomar, paper or submission.
