# S004 integral one-critical diamond: complete graph criterion, 2D repair and joint-kernel obstruction

Let P={00,10,01,11} be a commuting square. All topological objects finite based connected CW complexes; meet exact means T10 ∩ T01 = T00 **as actual subcomplexes**, equivalent to one critical grade per cell in this square.

## S004-T8 — necessary and sufficient graph classification

Let B:P→Ab be finite free integral groups. Assume the maps out of B00 are i:B00→B10 and j:B00→B01. Define D=(B10⊕B01)/{(i(x),−j(x)):x∈B00}; the commuting top arrows induce λ:D→B11.

**Theorem.** B admits a strictly nested, meet-exact family of connected **graph subcomplexes** T_p with H1(T_p;Z)=B_p and precisely the prescribed maps if and only if BOTH i,j are split injections AND λ is a split injection (primitive image). This includes rank, torsion and the exact map, not only Betti counts.

Necessity: Graph-subcomplex inclusion gives primitive top-dimensional H1 by S003-T6, hence i,j split. V=T10∪_{T00}T01 is a graph. Integral Mayer–Vietoris for three connected graphs gives H1(V)=D since the H0 diagonal map is injective. V⊂T11 is a graph-subcomplex inclusion, so H1(V)→H1(T11) is split injective: precisely λ.

Sufficiency: choose a rose T00 with B00 basis. Choose bases on B10 and B01 extending the same B00 basis using i,j. Make T10,T01 by wedging distinct new circles at the same original basepoint, intersecting in T00. V is a rose with H1 exactly D. Because λ is split injective, its basis extends to a B11 basis; wedge further circles onto V at grade 11 to make T11, and identify H1(T11) with B11 accordingly. Every old map and the full square is literally an inclusion; exact meet holds. Zero-rank groups correspond to a single basepoint.

Counterexample to rank-only sufficiency: B00=0, B10=B01=Z, B11=Z²; upper arrows 1↦(1,0), 1↦(1,2). Both individually primitive and rank 2≥1+1, yet λ has determinant 2 and cokernel Z/2. **No meet-exact graph model exists**. This disproves the tempting hypothesis that S003-T7 rank inequality is sufficient.

## S004-T9 — full upper-arrow repair in triple-intersection dimension two

Suppose only i,j are split injections, and upper arrows arbitrary. The construction above gives graph V with H1(V)=D. Pick a based cellular map h:V→G, G a rose of rank B11, inducing arbitrary λ on H1: each generator maps to a word with prescribed abelianization. Define T11 to be the ordinary mapping cylinder M_h retaining V as a CW-subcomplex at its domain end. T11 deformation retracts to G, so H1(T11)=B11, H2(T11)=0, and all prescribed square arrows are induced by literal subcomplex inclusions. The two side graphs still intersect exactly at T00, and newly attached cylinder cells all first appear at grade 11. Thus EVERY B square with split bottom maps has a one-critical 2-dimensional triple-intersection realization, even if upper maps are zero/noninjective/nonsplit.

Explicit determinant-two repair: V has oriented loops a,b. Add loop c and a 2-cell with attaching word b a^{-1} c^{-2}. Eliminating b by this relation leaves free generators a,c; H1 images are [a] and [b]=[a]+2[c]. The b/2-cell pair collapses; T11≃S¹∨S¹, H2=0, and the literal intersection of side graphs remains the common basepoint.

Relative cell budget: for connected V⊂K and no relative vertices, if s new 1-cells and t new 2-cells are attached then exact LES gives coker(H1(V)→H1(K))≅H1(K,V)≅coker(∂2^rel:Z^t→Z^s). Nonzero finite torsion in this cokernel requires s,t≥1. The example achieves index 2 with s=t=1; graph-only and 2-cells-only repairs cannot.

## S004-T10 — sharp two-dimensional joint-kernel obstruction

Suppose T00,T10,T01,T11 are connected, dim T11≤2 and meet exact. Put V=T10∪T01 and δ_q=(i_*,-j_*):H_q(T00)→H_q(T10)⊕H_q(T01). MV, H3(V)=0, and injective H0 diagonal give the exact sequence
0 → coker δ2 → H2(V) → ker δ1 → 0.
By the primitive top-degree inclusion theorem S003-T6, H2(V)→H2(T11) is a split injection. Consequently
rank H2(T11) ≥ rank H2(T10)+rank H2(T01)−rank H2(T00)+rank ker δ1.
If all H2(Tp)=0, then δ1 must be injective. This is a necessary condition for the *2-dimensional, H2-free triple spaces*, not arbitrary 3D covers.

Sharp counterexample: B00=Z, B10=B01=B11=0 with both bottom arrows zero. T00=S¹ and T10,T01 two distinct disks with the same boundary T00. Their union V is S², so no 2-dimensional T11 with H2(T11)=0 can contain V. Attach one 3-cell to S² to get T11=D³: all required B groups and maps hold, and the meet-exact square now exists in dimension 3. No 3D total three-cover impossibility follows.

Cautions: Dropping meet permits excess overlaps; dropping graph condition avoids T8; allowing H2(T11) removes T10's H2-free corollary; allowing dimension 3 kills its sphere. Do not turn any restricted obstruction into an unconditional one.
