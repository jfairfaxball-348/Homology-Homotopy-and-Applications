# S011-T28 — Integral Boolean n-cube block rigidity, all finite dimensions

**Status:** internally derived proof (PROGRAMME_PROVED in repository bookkeeping), not independent external referee verification, Lean formalisation or originality certification. It extends S010-T26's n=3 Boolean result to every integer n≥2. The key new-to-programme sublemma T29 is the elementary *finite-poset projective-lifting lemma*. Its projective/latching character is strongly classical; no priority claim.

## Precise definitions and statement

Let n≥2 be ANY finite integer, C_n={0,1}^n ordered coordinatewise, b=0^n, t=1^n. M:C_n→Free_fg(Z) is a commutative finite diagram; all vertex groups have finite rank, zero allowed. Each generating directed edge has **primitive cokernel**, i.e. its cokernel is torsion-free (injectivity is NOT required). For u,v in C_n define P_u=Z[↑u], I_v=Z[↓v], with Z at supported vertices, zero otherwise and identity between supported vertices. The full block P_b=I_t is counted once, and we exclude I_t from the death list.

**T28 theorem:** The following are equivalent.
(A) M ≅ (⊕_{u∈C_n} P_u^{b_u}) ⊕ (⊕_{v∈C_n\{t\}} I_v^{d_v}) as a Z-valued diagram, with nonnegative finite integer multiplicities and ONE natural change of basis for all maps.
(B) Every generating edge has torsion-free cokernel, and M_Q and M_{F_p} are block-decomposable for Q and **every** prime p, in the LLO sense.
(C) Every generating edge has torsion-free cokernel, and for EACH k-face F of C_n with 2≤k≤n its integral Koszul complex has H_i=0 for ALL 1≤i≤k−1 and torsion-free H_0.

Consequences: every composite M(x≤y) has torsion-free cokernel (not a hypothesis). There are exactly 2^(n+1)−1 possible Boolean support types. The H_k at the bottom of each k-face and its H_0 free rank are unrestricted. The full cube n=2 and all zero stalks are included.

### Lemma 1: exact enumeration of source blocks on a Boolean cube

The 2D source block list (codirected/birth rectangles; directed/death rectangles; one-coordinate bands, including the full rectangle) on {0,1}² is precisely the four ↑u, four ↓v, identifying ↑00=↓11. The two cross corners {01} and {10} are respectively ↑01∩↓01 and ↑10∩↓10 but NOT arbitrary supported singleton source blocks: one-dimensional bands have the OTHER axis full; mixed birth/death rectangles are not source blocks.

For n≥3 the LLO Definition3 induction gives (i) birth products of proper nonempty upward axis tails: on Boolean axes these are singleton top, ↑t; (ii) death products of proper nonempty downward initial sets: singleton bottom, ↓b; (iii) a block in n−1 axes times the full omitted Boolean axis. Inductively (↑u)×{0,1}=↑(u,0), (↓v)×{0,1}=↓(v,1). Every principal upset ↑u is obtained by taking the product of its non-full axes and full omitted axes (and likewise every downset), so this gives exactly the asserted union of supports. ↑b and ↓t coincide and no other ↑u equals ↓v for n≥2. The field block set therefore consists of these 2^(n+1)−1 thin indecomposables; each has endomorphism ring the coefficient field.

### Lemma 2: UCT, including TOP kernel reduction

For a free finite integral complex K, 0→H_i(K)⊗F_p→H_i(K⊗F_p)→Tor_1(H_{i−1}(K),F_p)→0. Q tensor detects the rational part. If every H_i(K⊗Q) and H_i(K⊗F_p) vanishes for 1≤i≤k−1, then H_i(K;Z)=0 for those degrees: finite-generation plus rational and all-prime reduction kills every group. Further, Tor(H_0(K),F_p)=0 for all p because H_1(K⊗F_p)=0, so H_0 is torsion-free. Conversely the integral vanishing and free H_0 force the stated field vanishing. Apply this on EVERY k-face, with the source LLO Theorem14 field criterion; this proves (B)⇔(C) under edge primitivity.

For a k-dimensional subcube with minimum x and active coordinates J (x_j=0), its highest-degree integral homology is
N_J(x)=∩_{j∈J}ker(M(x→x+e_j)) ⊂ M(x).
This subgroup is saturated because it is the kernel of a map from free M(x) into a sum of free target groups; N_J(x) is free and a direct summand of M(x). For k≥2, H_{k−1}=0 and UCT in degree k gives
N_J(x)⊗F_p ≅ N_J(x;M⊗F_p)
**inside** M(x)⊗F_p. This is NOT generic preservation of kernel intersections. For k=1, primitive edge coker gives the same equality via the Tor exact sequence for a two-term free complex. For Q all these identities hold by flatness. Source Lemma13 shows each restricted block has middle-exact Koszul complex.

### Lemma 3: integral death lifting, any n

For every v≠t put J(v)={j:v_j=0}, nonempty, K_v=N_{J(v)}(v), L_v=N_{J(v)}(b), and a_v=M(b≤v)|_{L_v}:L_v→K_v. Its target is indeed K_v: for j∈J(v), the composite through b+e_j kills L_v and agrees with the composite through v+e_j by commutativity.

Over ANY field where M is a block sum, a_v is onto. Verify each of the complete support types: (1) an upset ↑u has no joint outgoing kernel at a vertex in its support, since an edge in every coordinate j with v_j=0 stays supported; it has no contribution to either endpoint kernel. (2) a downset ↓w contributes one dimension to L_v exactly when w_j=0 for all j∈J(v), i.e. w≤v. At K_v it contributes iff v≤w and w_j=0 for every j∈J(v), hence w=v. For w=v its bottom→v coefficient is identity, for w<v the target is zero. Thus a_v sends the field space onto precisely all death ↓v coefficients.

By Lemma2, L_v and K_v commute with all prime/rational reductions. Let A=coker a_v, a finitely generated abelian group. Surjectivity over Q means A⊗Q=0; over all F_p means A/pA=0 for every p. A finite abelian group with those properties is zero. Therefore a_v is surjective integrally. Choose a Z-linear section s:K_v→L_v (K_v free).

### Lemma 4: NATURAL downset summand

Let D_v be the diagram equal to K_v on x≤v and zero elsewhere, with identities inside the lower principal ideal. Define i_x:D_v(x)→M(x) by M(b≤x)∘s for x≤v and zero outside. Since M(x≤v)i_x is the inclusion K_v↪M(v), i_x is injective. An edge leaving ↓v crosses one coordinate j∈J(v); it kills s(L_v) already at b+e_j, hence kills i_x. This proves naturality of i for all edges. Choose q:M(v)→K_v splitting the saturated inclusion. Define r_x:M(x)→D_v(x) by q∘M(x≤v) for x≤v and zero otherwise. Since ↓v is a downset, an edge entering it from outside does not exist, so r is also natural. At every x≤v, r_xi_x=q a_v s=id. Therefore M ≅ D_v⊕R, where R(x)=ker r_x is free (a genuine globally coherent functor splitting, not separately chosen vertex complements).

Since all D_v edges have free cokernels, the R edge cokernels remain free: coker(M_e)=coker(D_e)⊕coker(R_e), so coker(R_e) is torsion-free. Over each field, R is a direct summand of a block sum. By finite-dimensional Krull–Schmidt for the finite incidence algebra, and indecomposability of each connected thin block, it is itself a block sum. No integral Krull–Schmidt or simultaneous field bases asserted.

Peel ALL 2^n−1 proper v, any fixed order, always applying this construction to the residual. At its turn, the entire K_v disappears. Subsequent direct-summand operations cannot recreate any previously removed joint kernel: for two modules K_v(M⊕N)=K_v(M)⊕K_v(N). Lemma2 transfers each vanished integral joint kernel to Q and F_p. The only field block contributing K_v at v is ↓v. Therefore the final residual R has only upset blocks after extension to Q and each F_p.

### T29: finite-poset projective lifting — replacement for n=3 lattice trick

**Independent general lemma.** Let P be ANY finite poset, not necessarily a cube or lattice, and F:P→Free_fg(Z). Suppose for Q and every F_p the reduced diagram F_k decomposes into a direct sum of representables k[↑u], u∈P (one natural decomposition for EACH coefficient field separately). THEN F ≅ ⊕_{u∈P} Z[↑u]⊗C_u for finite free groups C_u. This is a full natural integral decomposition, with no extra arrow-purity hypothesis.

**Proof with explicit coherence.** Order P by a linear extension x_1,...,x_N. Inductively choose free coefficient groups C_u⊂F(u) and prove at every processed x a natural integral isomorphism F(x)=⊕_{u≤x} C_u, where the maps on processed comparable vertices send each C_u identically to the corresponding slot. At a new vertex v, let
L_v(F)=colim_{x<v} F(x),     λ_v:L_v(F)→F(v).
Because all proper predecessors of v have already been processed and their diagram is literally a sum of integral representables restricted to {x<v}, their colimit is canonically the finite FREE group A_v=⊕_{u<v}C_u (the support of each term ↑u in {x<v} has initial object u; its colimit is C_u). Its map to F(v) sends c∈C_u to F(u≤v)(c) and is natural by diagram commutativity.

Tensor with a field commutes with this finite colimit (tensor is a left adjoint). The field diagram is a sum of representables, so its latching map λ_{v,k} is an injection: for a single representable k[↑u], the strict predecessor latching space is k if u<v (mapped by identity), and 0 if u=v or u≰v. This calculation is independent of the chosen field decomposition and is functorial. Thus λ_v⊗Q and λ_v⊗F_p are injective for every p. Q-injectivity makes λ_v injective over Z. Apply the two-term free-complex UCT, or Smith form: since λ_v and all λ_v⊗F_p are injective, coker λ_v has no p-torsion for ANY p. The cokernel is finitely generated and therefore free. Choose a free complement C_v of im λ_v in F(v), making F(v)=A_v⊕C_v. This is compatible with every old map by construction; it completes the induction. At the end these splittings define ONE natural isomorphism of diagrams with all direct-sum representables. No independent bases across vertices or fields were glued; only local integral complements of canonical saturated latching images were chosen. Empty latching diagrams give 0, zero groups cause no problem. Q is used to exclude nonzero integral kernels before the Smith argument.

**Converse** immediate: integral representables remain field-representables, and all latching maps have split images.

Apply T29 to the death-free R obtained above. This gives all integral ↑u summands simultaneously and completes (B)⇒(A). Each integral block visibly satisfies (B), finishing T28.

### A finite arithmetic certificate and explicit multiplicities

The field-quantified (B) requires infinitely many coefficient fields; (C) is a FINITE integral certificate: compute integer kernels/cokernels of generating arrows and for every face and every 1≤i≤k−1 compute homology H_i, plus torsion of H_0. Smith normal form can check this with exact integer matrices. No complexity estimate or implementation is claimed; the test scales exponentially in n because the input cube itself has 2^n vertices.

Multiplicities are determined without field-specific choices. For v≠t,
d_v=rank ∩_{j:v_j=0}ker[M(v→v+e_j)].
For x∈C_n write r(x)=rank M(x) and
R(x)=r(x)−∑_{v≠t,\;v≥x}d_v.
Then the birth multiplicity is Boolean Möbius inversion:
b_u=∑_{x≤u}(-1)^{|u|−|x|} R(x).
All are nonnegative integers under the hypotheses. This is not valid as a barcode formula for arbitrary unvalidated diagrams: the theorem's full hypotheses are essential. The identical full support is assigned to b_b, never counted separately as d_t. Rank-zero and all-full edge cases follow.

### Source/homological significance and stop boundary

The original field theorem (LLO Theorem14) is indispensable to identify reductions as blocks from Koszul face homology; UCT in top/bottom degrees detects integral kernel/image purity that pointwise Smith conditions miss. T29 is a general projective-latching fact and very likely standard in finite-poset integral representation theory; T28 as assembled might already follow from older theorems. This is NOT an original publication claim. The theorem is about one Boolean cube in arbitrary n; it does NOT prove integral gluing over full products of longer chains, nor the compressed source Problem1. No Lean, formal check, external proof reader, arXiv, or HHA step occurred.