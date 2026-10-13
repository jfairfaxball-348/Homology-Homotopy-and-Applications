# S030 — T66: all finite rectangular grids, one integral block basis (internal proof)

**Claim classification:** `PROGRAMME_PROVED` internally, NOT originality-cleared, formally certified or peer reviewed. This generalizes S029-T65 from 3-level axes to **any finite lengths**, independently rechecking the S029 operations. It is an exact assertion for the restricted recursively defined block family, not arbitrary rectangles or all intervals in multidimensional grids.

## A. Exact support class and rank formulas

Let `P=∏_{j=1}^n [0,m_j-1]` with integer `m_j>=2`; `b=(0,...,0)`, `t=(m_j-1)_j`. In the identical recursive rule used in S029, the allowable connected supports are: all principal upsets `U_u=↑u`, all principal downsets `D_v=↓v`, and the **interior coordinate bands**
`B_{i,a,c}={x∈P:a<=x_i<=c}` for `1<=a<=c<=m_i-2`. An empty interior-index set occurs for `m_i=2`. The only upset/downset duplicate is `U_b=D_t=P`. Every interior band is distinct. Hence

`|B(P)|=2∏_j m_j -1 + Σ_j (m_j-2)(m_j-1)/2.`

Proof: on one chain, all nonempty intervals partition into terminal upsets, initial downsets and interior [a,c]. Coordinate deletion carries principal up/down supports to principal up/down supports with an extremal inserted coordinate, and carries a previously obtained interior band to the same band on its original coordinate. New principal supports add all missing up/down supports, and repeated deletion pulls every one-coordinate interior interval to the full product. For equal m=4 and n=2,3 this gives 37,136 types, respectively. For m=3 this is S029's 19,56.

For a diagram `M:P→Free_fg(Z)`, define `r(x,y)=rank_Q M(x≤y)`. **Every** comparable composite having torsion-free cokernel implies all those ranks are identical over Q and every F_p, by integer Smith factors. We do NOT assume the Q and F_p decompositions use compatible bases.

## B. The theorem

**T66.** Assume (H1) `coker[M(x≤y)]` is torsion-free for **every comparable x≤y**, including all nonprimitive-length composites; and (H2) for Q **and every prime field F_p**, the full diagram `M⊗k` decomposes as a finite sum of thin modules `k[B]` with `B∈B(P)`. Then

`M ≅ ⊕_{B∈B(P)} (Z[B]⊗C_B)`

for finite free coefficient groups `C_B`, via **one** natural integral family of stalk isomorphisms. Conversely such a direct sum satisfies both H1,H2. No common field basis is presupposed.

## C. Death extraction (S029-T65 independently rechecked and length-independent)

At global bottom only the full support and proper downsets can occur. For any field, `r(b,x)=f+Σ_{v≥x,v≠t}d_v`; `f=r(b,t)`. Product-chain downward Möbius inversion of all r(b,x) shows each d_v is independent of the field. Fix v≠t. For each axis j where `v_j<m_j-1` let `a_j=(v_j+1)e_j` (zeros on other axes), and put `L_v=∩_j ker(M(b→a_j))`. For a field block D_w at b, this retains exactly w≤v; full block retained never, because v≠t. Thus `dim_k L_v⊗k=Σ_{w≤v}d_w` is constant over Q/F_p. More formally `T_v:M(b)→⊕M(a_j)` has identical rank over every field, and Smith's unit criterion yields `ker T_v⊗k=ker(T_v⊗k)` and L_v a direct summand of M(b).

The restricted map `A_v=L_v→M(v)` has field rank exactly d_v: every D_w with w<v is already zero at v, and D_v maps as identity. Its rank is prime-independent, so `H_v=im A_v` is saturated in M(v), the quotient free. Choose a section `s:H_v→L_v` and a projection `q:M(v)→H_v`. For x≤v define `ι_x=M(b→x)s` and `ρ_x=qM(x→v)` and set both zero outside D_v. One has `ρ_xι_x=id`. If x≤v and y not≤v, some j has `y_j≥v_j+1`, so `a_j≤y`; therefore `M(b→y)s=0` since s(H_v)⊂L_v. This proves inclusion naturality for **every exit**, including arrows with other coordinates below v. Retraction naturality is automatic at exits because ρ is zero at y and no arrows enter a downset. Thus Z[D_v]⊗H_v splits naturally. Apply for every v≠t, including d_v=0. Because a split diagram over a field has indecomposable connected thin blocks with End=k, Krull–Schmidt keeps the residual within the block class; every composite coker in a direct summand remains free. All proper downsets are removed over all fields, not just Q.

## D. New interval-band extraction: the 4-level issue resolved

Now M denotes the downset-free residual, whose only field blocks are U_u and B_{i,a,c}. For each axis i and 0≤q≤s≤m_i−1 write `e_i^q` for the point having i-coordinate q and all others 0, and `h_i^s` for the point with i-coordinate s and all others at their maximum. Let

`F_i(q,s)=rank(M(e_i^q→h_i^s))−rank(M(e_i^q→t))`.

At e_i^q no interior bands of another axis appear, since those axes are 0; all principal-upset summands present at e_i^q continue to both h_i^s and t. Hence, over every field,

`F_i(q,s)=Σ_{1≤a≤q≤s≤c≤m_i−2} μ_{i,a,c}.`

Consequently, with boundary F_i(0,s)=F_i(q,m_i−1)=0, a two-direction discrete inversion uniquely recovers

`μ_{i,a,c}=F_i(a,c)−F_i(a−1,c)−F_i(a,c+1)+F_i(a−1,c+1).`

All four values are ranks of explicit **composite maps**, invariant over all primes by H1. Hence the same μ occurs over Q and every F_p. This is the rank-rigidity step missing from a naive nested-band proof.

Fix i; process end indices **c descending** (`m_i−2,...,1`), and at each fixed c start indices **a ascending** (`1,...,c`). Blocks already peeled on i are precisely those with end>c or end=c/start<a. Fix the current pair (a,c), and set `e=e_i^a`, `h=h_i^c`, `l=e_i^{a−1}` with all other axes at their **maximum** (i.e. l_i=a−1). Define `K=ker[M(e→t)]` and `H=im[K→M(h)]`, and `I=im[M(l→h)]`.

Because e→t has unit Smith nonzero factors, K is a direct summand and commutes with reduction mod p. Over every field, the restricted image K→M(h) consists **exactly** of the μ_{i,a,c} copies of the current band: surviving bands with end<c die before h, and those with end≥c have already been peeled unless their start is precisely a; different-axis bands are absent at e. Thus rank(K→M(h))=μ_{i,a,c} for Q and every prime field. By the Smith unit criterion H is a saturated/direct summand of M(h); K↠H admits an integral section s.

Over every field, I consists of principal-upset components and any surviving internal i-bands starting ≤a−1 that are present at h. Such remaining bands would need end≥c and are already peeled, so **I and H have disjoint block coordinates**. The composite l→h itself is pure by H1, so I is saturated. Moreover the joint column map `H⊕I→M(h)` has the same full column rank over Q and **every** F_p (independence of the two summand images in each field), hence its image is saturated by the Smith criterion. Therefore choose a **single integer projection** `q:M(h)→H` acting identically on H and zero on I (extend a basis of their saturated direct sum). This is stronger than separately choosing complements.

Define the thin cylinder `E_{i,a,c}(x)=H` when a≤x_i≤c, 0 otherwise, with identity internal arrows. At supported x let

`ι_x=M(e→x)s:H→M(x)`, `ρ_x=qM(x→h):M(x)→H`.

At x=h, `q[M(e→h)]s=id_H`, and for every other supported x, the composite through h yields ρ_xι_x=id. For any internal arrow naturality is diagram functoriality. Incoming arrow from x_i<a to y on the band: x≤l, so `qM(x→h)=0` as it factors through I; this proves ρ naturality. Outgoing arrow from x on the band to y_i>c: `M(e→y)s=0` *integrally*, because over Q every surviving interior band present at e has end≤c, and principal upsets have no vectors in K. There is no other way to leave the band in an order-preserving arrow. This proves ι naturality. Thus ρι=id as natural maps, giving the required direct summand. In particular for m_i=4 the **[1,2] band is removed BEFORE singletons [1,1], [2,2]**: descending end order c=2 peels [1,2],[2,2]; only then c=1 peels [1,1]. A projection chosen without annihilating I can fail incoming-arrow naturality; the joint saturation step repairs this.

Repeat for all bands and axes. Every removal is integral and natural, preserves all composite purity, and retains all-field decomposition by Krull–Schmidt.

## E. Final coherent integral birth basis and limits

The residual has only representables `k[↑u]` over all fields. Apply S011-T29 finite-poset projective/latching lifting: along a linear extension of P, all previous representable births give an integral free latching module; over each Q/F_p decomposition the latching map has split injective image; its integral Smith factors are units, so a free complementary lattice exists. Inductively add one birth lattice C_u at each vertex, extending **one** common integer natural basis. This proves the forward direction and is compatible with all zero groups and n=1. Converse: 0/identity maps of integral thin blocks have torsion-free cokernels.

This argument uses exact field-to-integral rank/saturation for *joint maps*, not a claim that arbitrary field bases lift. The fieldwise block class is restricted; rank inversion would be false for arbitrary mixed rectangles. Without all-composite Smith purity, ranks may change at a bad prime. Without every prime, a finite-index defect may hide. The proof relies on classical finite-poset projective descent S011-T29 and field Krull–Schmidt, **not** a novel projectivity theorem.

### Important boundary

An **internally complete** proof is recorded but has not received external referee verification. This does NOT prove T66 is new: original Höppner–Lenzing (1981) full text and Keagy (2026) full proofs were not retrieved. Nor does it by itself provide a strong homotopical application beyond integral multiparameter persistent homology. The stricter S023 R5 and original LLO Problem1 succinct nonprincipal relative k>=1 BIT complexity remain OPEN. S028 Hopf benchmark survives but is RETIRED as proposed HHA flagship. No Stage2 promotion or downstream action.