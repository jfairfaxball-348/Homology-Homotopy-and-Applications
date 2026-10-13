# S029 — an integral global block-descent theorem for three-level product grids

**Research status:** Complete symbolic **internal proof** T65 below, subject to external correctness/priority scrutiny. `PROGRAMME_PROVED` is internal bookkeeping, **not** Lean/formal, journal acceptance or certified novelty. All hypotheses frozen by S029 are retained. The assertion is stronger than the prescribed n=2,3, extending to **every fixed finite n≥1**. The class is the exactly frozen recursively defined family B_n; it is *not* an assertion about all arbitrary intervals, mixed birth–death rectangles, or longer axes with 4+ levels.

## 1. Precise supports

Let P_n={0,1,2}^n with coordinatewise order, b=0^n, t=2^n. Write U_u=↑u, D_v=↓v; for 1≤i≤n put S_i={x∈P_n:x_i=1}, a middle slab. For an order-convex support B, Z[B] is Z on B, zero off it, identity whenever both endpoints lie in B and zero otherwise.

**T65a (support classification).** The recursive supports B_1=all nonempty intervals of {0,1,2} and B_n (n≥2)=all U_u, all D_v, and all coordinate-deletion pullbacks of B_(n−1), with duplicates removed, are exactly
  {U_u:u∈P_n} ∪ {D_v:v∈P_n} ∪ {S_i:1≤i≤n}.
The unique duplicated upset/downset is U_b=D_t=P_n. Every S_i is distinct from these and from each other. Hence |B_n|=2·3^n−1+n: 6,19,56,165 for n=1,2,3,4.

**Proof.** For one axis the six intervals are U_0=[0,2], U_1=[1,2], U_2={2}, D_0={0}, D_1=[0,1], S_1={1}. Assume the formula for n−1. Deleting coordinate i and pulling back U_u gives U_(insert 0 at i); pulling back D_v gives D_(insert 2 at i); pulling back any middle slab becomes one of the n coordinate slabs. The fresh principal supports supply all U,D, and all slabs are obtained by repeated pullback of {1}. Counting is immediate. This matches the **restricted three-level specialisation** of LLO Definition3, not an identification with arbitrary source supports on a longer chain.

## 2. T65 global theorem (full frozen quantifiers)

Let M:P_n→Free_fg(Z) be any strict commuting diagram of finite free abelian groups (including zero groups and noninjective maps). Assume:

(i) **Every** M(x≤y), for every comparable x≤y, including every composite, has torsion-free cokernel (Smith nonzero factors all units).

(ii) For k=Q and k=F_p **for every prime p**, the diagram M⊗k is isomorphic, with possibly *independently chosen* field bases, to a finite sum of thin k[B] with B∈B_n.

Then there are finite free coefficient groups C_B and a **single natural isomorphism of integral diagrams**
   M ≅ ⊕_(B∈B_n) Z[B]⊗ C_B.
Equivalently, one globally coherent integral basis simultaneously block-diagonalises every structure map. Conversely an integral B_n direct sum satisfies (i) and (ii).

The theorem makes no promise that the fieldwise bases themselves can be glued. Instead it constructs new *integral natural section/retraction pairs*.

### Lemma A — all-field rank rigidity at the global bottom

In the field B_n decomposition choose the full block U_b once, let f be its multiplicity, and let d_v (v≠t) be the multiplicity of D_v. Because b is in no middle slab and no proper upset, the rank of the comparable map b→x is
 r(x)=f+Σ_(v≠t,v≥x) d_v.      (1)
Every composite has torsion-free cokernel, so rank over Q and F_p is *the same* for all p (Smith units). In particular f=r(t) and all d_v are uniquely determined across fields by downward Möbius inversion of r(x)−r(t) on the product of three-chains, with d_t=0. They are nonnegative. This does **not** require coherent field bases. For any residue field, the multiplicity of every proper downset is therefore the same as over Q.

### Lemma B — an integral natural D_v extraction with zero terminal and all intermediate kernels

Work in any residual diagram with the same hypotheses and fix v≠t; let J(v)={j:v_j<2} (nonempty). Set a_j=(0,...,0,v_j+1,0,...,0), with v_j+1 at coordinate j. Define the simultaneous **bottom source kernel**
 L_v=∩_(j∈J(v)) ker[M(b→a_j)] ⊆ M(b).
Do **not** replace these by kernels of b→v+e_j: those do not control crossing maps at lower values of the other coordinates. Let T_v:M(b)→⊕_(j∈J(v))M(a_j) be the joint arrow map, so L_v=ker T_v.

Over each field, bottom-supported summands are only full U_b and proper D_w. The full block contributes nothing to L_v, since J nonempty; D_w contributes exactly when w_j≤v_j for each j∈J, equivalently w≤v. Thus
 dim_k L_(v,k) = Σ_(w≤v,w≠t) d_w,   (2)
the same over Q and all F_p. Since rank(T_v,k)=dim M(b)−dim L_(v,k) is independent of k, Smith's criterion makes all its nonzero invariant factors units. Consequently L_v is a direct summand in M(b), and L_v⊗k maps isomorphically onto the field joint kernel, for **every** prime (also rationally).

Let a_v=M(b→v)|_(L_v):L_v→M(v), and H_v=im a_v. On a field block D_w with w≤v, b→v is zero unless w=v, and is identity for w=v. Hence rank(a_v,k)=d_v for every field. As the source L_v commutes with reductions, rank(a_v⊗k)=d_v for Q and all F_p. The exact Smith criterion again implies H_v is a saturated/direct summand of M(v), despite possible failure of direct-sum purity for arbitrary unrelated maps.

For each j∈J, M(v→v+e_j)H_v=0 because b→v+e_j factors through b→a_j and annihilates L_v. Moreover a_v:L_v↠H_v admits a Z-linear section s:H_v→L_v, as H_v is free. Pick a retraction q:M(v)→H_v of the saturated inclusion. Define D(x)=H_v for x≤v, zero otherwise, identity inside ↓v; define natural maps i:D→M and r:M→D by
 i_x = M(b→x)s,      r_x = q M(x→v)   (x≤v);
 both 0 for x outside ↓v.
Every component i_x is injective because composing x→v equals H_v↪M(v). For an arrow leaving ↓v from x to y there is a j with y_j≥v_j+1, thus a_j≤y and b→y annihilates s(H_v); this proves naturality even at low coordinate values in other directions. Naturality of r is automatic on the downset (no outside→inside arrows). For all x≤v, r_x i_x = q a_v s = id. Hence the actual diagram splits:
 M ≅ Z[D_v]⊗H_v ⊕ R.       (3)
A split summand has free stalk complements, and coker of every composite in the direct sum is the direct sum of cokernels; therefore R keeps (i). Field Krull–Schmidt, applied to connected thin block indecomposables End=k, ensures R⊗k is a B_n block sum. Equation (1) or uniqueness shows exactly d_v copies of D_v are removed. Repeat for **each** v≠t, in any fixed order; at the end no proper downset remains over Q or any F_p. This proof allows d_v=0 and J size 1 or larger.

### Lemma C — integral extraction of each interior slab, including incoming-arrow coherence

In the downset-free residual, all field blocks are principal upsets and middle slabs. Fix i. Let e_i=(0,...,1,...,0); h_i=(2,...,1,...,2), with 1 at i; and l_i=(2,...,0,...,2). Put
 K_i=ker[M(e_i→t)],  K'_i=ker[M(h_i→t)],  I_i=im[M(l_i→h_i)].
The two maps into t and l_i→h_i have torsion-free cokernels by the **composite** hypothesis. Thus all relevant kernels/images commute with mod p reduction and are saturated.

Over every field, the only summand supported at e_i and killed by the map to t is the slab S_i. At h_i the only summand killed by the map to t is again S_i: the other slabs S_j (j≠i) are absent because h_i,j=2. The natural map a_i:K_i→K'_i induced by e_i→h_i is an isomorphism over Q and **every** F_p. It is therefore an isomorphism over Z: rational isomorphism gives finite cokernel; mod-p isomorphism, with the kernel reductions above, kills all prime torsion.

The obstruction to a naive slab retraction is incoming arrows from coordinate i=0. Remedy: over every field, I_i consists of principal-upset components already present at l_i and is disjoint from the slab K'_i. Since the two summands have saturated inclusions and K'_i⊕I_i→M(h_i) has the same full rank over Q and all F_p, its image is saturated. Choose ONE integral group projection
 q_i:M(h_i)→K'_i
that is identity on K'_i and zero on I_i (extend a direct-sum basis of K'_i⊕I_i by a complement). This is the necessary **joint** integral choice.

Define E_i(x)=K_i on x_i=1, zero otherwise, with identity maps on the slab. For x_i=1, let
 ι_x = M(e_i→x)|_(K_i);
 ρ_x = a_i^{−1} q_i M(x→h_i).
Off the slab, let both maps be zero. The composite x→h_i identifies K_i with K'_i, so ι_x injective and ρ_xι_x=id. For a slab→outside arrow (i-coordinate 1→2), the map on K_i vanishes integrally because its Q-extension is the actual S_i subspace (other coordinate targets do not change this), so ι is natural. For an incoming arrow (i-coordinate 0→1), its map to h_i factors through l_i→h_i, annihilated by q_i; so ρ is natural. Within the slab, all arrows commute by construction. Thus E_i is a genuine **natural direct summand** isomorphic to Z[S_i]⊗K_i. Remove it and repeat for all i. Composite purity and all-field block decomposability persist by splitting + Krull–Schmidt. No band remains.

### Lemma D — one global birth basis after deaths and slabs

The final residual F is, over Q and every F_p, a sum of principal upset representables k[↑u]. Apply the **previously internally proved** S011-T29 finite-poset projective-latching lemma, valid for any finite poset P over Z: a diagram whose Q and all F_p reductions are sums of representables is integrally a sum of representables. In a linear extension, the latching colimit of the already split predecessor diagrams is free with one copy of each earlier C_u, and the latching map into F(v) remains injective over Q and all F_p. Smith units make its integral cokernel free; choose a complement C_v and extend the common basis. Induction constructs ONE coherent family of maps F≅⊕_u Z[U_u]⊗C_u; no preselected field bases are glued.

Combining the canonical natural section/retraction pairs in (3), the slab splitting, and these final latching complements proves T65. The converse is immediate: supported maps of thin blocks are 0 or identity, so all cokernels are free and every field reduction has the same blocks. This covers zero stalks, zero maps and all n≥1.

## 3. Finite all-prime test, without testing sample primes

The theorem's infinitely many field assumptions can be certified by finite exact arithmetic: first test **every comparable map**, not merely adjacent edges, for unit nonzero Smith factors. Then for every 2≤q≤n and every q-dimensional subcube determined by two distinct coordinates-values on q varying axes (and fixed remaining values), form its alternating integral Koszul complex and check H_j=0 for 1≤j≤q−1 and H_0 torsion-free. Every field B_n block is middle-exact on every such face, and the full original LLO Theorem4 plus its cube/Koszul Theorem14 yield the converse field decomposition. The finitely generated free-complex UCT controls both the middle homology and the torsion of H_0; omitting H_0 saturation is an error. This is a **finite Smith/homology certificate** with no sampling bound or guess about exceptional primes: unit Smith factors establish every p at once. It does not imply a polynomial bit bound in a succinct input description; coordinate-cube enumeration may be exponential in n and the input itself is 3^n stalks.

## 4. Mathematical boundaries

T65 settles the precisely frozen B_n three-level integral problem, n=2 and n=3 and in fact all n; it does **not** settle LLO Problem1 for succinct k≥1 arbitrary nonprincipal relative resolutions, or all interval-decomposable diagrams over axes with ≥4 levels. The earlier S011 Boolean T28 is a strict shorter-axis ancestor, not this proof. T64's 334-point integral Hopf benchmarks and the S023 strict R5 issue are unchanged, and Hopf is still retired as an HHA flagship. No original-HHA-paper status or external proof validation is claimed.