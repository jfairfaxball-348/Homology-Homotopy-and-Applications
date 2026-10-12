# S010-T26 — Integral block rigidity for arbitrary finite free three-cubes

Internal complete proof candidate, PROGRAMME_PROVED in this repository's prose sense. No Lean, external review or novelty certificate. Resolves the exact internally proposed Boolean-three-cube C11, including kernels; it does not prove the arbitrary finite-grid analogue or solve LLO Problem1.

## Exact equivalence

Let C={0,1}^3 with coordinatewise order. Let M:C→Free_fg(Z) be a commuting diagram of eight finite free groups and twelve generating edges. A map is primitive if its cokernel is torsion-free; it need not be injective. For a q-face, use its alternating Koszul complex K_q→…→K_0 with degree q at the minimum and degree 0 at the maximum.

The following are equivalent:

1. M is a finite direct sum of rank-one integral blocks Z[↑u] (u∈C) and Z[↓v] (v∈C\{111}); the full cube is counted once as ↑000. Active maps on each support are identity, others zero. These are exactly the fifteen LLO block supports on this Boolean cube.
2. The twelve generating edges are primitive, and M⊗Q and M⊗Fp for EVERY prime p are block-decomposable.
3. The twelve edges are primitive; on every six square faces H1(K;Z)=0 and H0(K;Z) is torsion-free; on the full cube H1=H2=0 and H0 is torsion-free.

Thus every composite becomes primitive as a conclusion. In particular the S010 requested version assuming all structure maps primitive is covered. There is NO top-injectivity assumption. Zero ranks and arbitrary kernels are permitted.

On two-valued axes, source birth/death/induced blocks reduce inductively to principal upsets/downsets: a proper nonempty up/down subset of an axis is {1}/{0}; an induced block simply allows a full axis. Two-dimensional bands are anchored up/down on this two-element chain. There are eight upsets and eight downsets, with full support duplicated once. This argument is special to the Boolean support list.

### 1. Integral UCT detects the relevant extrema

For any bounded free integer complex, 0→H_i(K;Z)⊗Fp→H_i(K⊗Fp)→Tor(H_{i-1}(K;Z),Fp)→0, and Q tensor is exact. If middle homology vanishes over Q and every Fp, each integral middle group vanishes (a nonzero finite free or p-primary part survives), and the lowest middle condition forces H0 torsion-free. Conversely integral middle vanishing plus torsion-free H0 implies every field middle vanishes. Apply separately to every face/full cube. Source field block criterion therefore gives (2)⇔(3), retaining the edge hypothesis.

A second endpoint consequence is critical. Fix a vertex x and a nonempty set J of coordinates with x_j=0. Put

N_J(x)=intersection_{j∈J} ker[M(x→x+e_j)].

This is the top-degree homology of the |J|-cube varying J and holding other coordinates fixed: the first Koszul boundary is the signed joint outgoing map, and there is no group above it. It is saturated in M(x), since it is the kernel of a map to a free group. For |J|≥2 the preceding middle homology H_{|J|-1} is zero by UCT above; hence

N_J(x)⊗Fp ≅ intersection_{j∈J} ker[(M⊗Fp)(x→x+e_j)]

as SUBSPACES OF M(x)⊗Fp. For |J|=1 this identity follows instead from Tor(coker edge,Fp)=0, namely edge primitivity. Over Q it always holds. Do not infer this identity from arbitrary tensor/intersection commutation.

### 2. A terminal death kernel lifts integrally from the bottom

Let b=000, t=111, v≠t and J={j:v_j=0}. Define

K_v=N_J(v), L_v=N_J(b), a_v=M(b→v)|_{L_v}:L_v→K_v.

Commutativity ensures this restriction lands in K_v: for j∈J, M(v→v+e_j)M(b→v) factors through M(b→b+e_j), which kills L_v. Both are finite free. The endpoint calculation identifies their reductions with the corresponding field joint kernels.

For any field in the hypotheses, a_v is SURJECTIVE. This is checked summandwise in a field block decomposition, without assuming coherent bases across different fields:

- A birth block ↑u contributes nothing to either joint kernel, since every excluded coordinate j∈J remains active whenever its source is in the support (and J is nonempty).
- A death block ↓w contributes k to L_v exactly when w_j=0 for every j∈J, i.e. w≤v. It contributes k to K_v exactly when w=v. For w=v the bottom-to-v map is identity; for w<v its target is zero.

The full block belongs to the birth case. Thus the restriction maps every needed field death generator onto K_v. Its integral cokernel A is finitely generated and has A⊗Q=0 and A⊗Fp=0 for every p, by right exactness of tensor and the IDENTIFIED integral kernels. Therefore A=0. Choose a group section s:K_v→L_v of a_v, possible because K_v is free. When v=b, a_v is identity and this includes the bottom singleton.

### 3. Natural splitting: a free coefficient group on ↓v

Define D(x)=K_v for x≤v, zero otherwise, with identity active arrows. Define an injection i:D→M by

i_x=M(b→x)s for x≤v, and zero otherwise.

For x≤v its composite to M(v) is the inclusion K_v→M(v), because a_vs=id. Hence it is injective. For an edge leaving ↓v, its direction belongs to J, and the image of s⊂L_v is killed by M(b→b+e_j); commutativity shows the crossing edge kills i_x. Inside the support, naturality follows by functor composition. All other arrows follow from generating edges.

K_v is saturated in M(v), so choose a group retraction q:M(v)→K_v of its inclusion. Define r:M→D by

r_x=q M(x→v) for x≤v, zero otherwise.

This is natural: inside ↓v use composition; an arrow exiting the downset has both target-side expressions zero; an arrow from outside to inside is impossible for a downset. Finally r_x i_x=q M(b→v)s=id for every supported x. Therefore ri=id and M≅D⊕R as diagrams, where R(x)=ker r_x is free. This is a genuine MODULE splitting, not independently chosen incompatible vertex complements. Choosing a basis of K_v decomposes D into rank(K_v) copies of Z[↓v].

### 4. Iteration preserves all hypotheses

Every edge of M decomposes as its D edge plus its R edge. D edges are identity or zero between free groups and have free cokernel. Thus primitive M edges imply primitive R edges. After tensor with a field, R is a direct summand of a finite-dimensional block sum. The category of finite-dimensional representations of the finite incidence algebra is Krull–Schmidt; its fifteen thin connected block modules have End=k and are indecomposable. Uniqueness of finite indecomposable decomposition implies the complement R is again block-decomposable. This invokes only FIELD Krull–Schmidt, not an unjustified integer version.

For clarity, this finite Krull–Schmidt input is classical: a finite-dimensional object's decompositions terminate by dimension; Fitting's lemma makes an indecomposable's endomorphism algebra local; the standard exchange argument gives uniqueness. It applies over each Fp and Q separately. No integral idempotent lifting is assumed.

Apply Steps 1–3 successively to each of the seven v≠t, splitting the ENTIRE K_v at that stage. On its complement the same K_v is zero. Later complements cannot reintroduce it, because joint kernels commute with direct sums. After seven stages all seven death kernels vanish integrally and, by Step1, in each field. The field block list then contains no proper downset blocks: each ↓v would contribute a nonzero terminal death kernel at v. What remains is a sum of principal-upset blocks over every field.

In particular all maps R(x→t) are injective over Q, hence integrally (their kernels are torsion-free and tensor Q detects them). Primitive generating edges and these injections imply primitive composites to top: the quotient of a composed chain of primitive inclusions is an extension of free groups and is free. The residual diagram now satisfies S009-T25. Use its single common-top lattice basis to split it into the eight principal upsets. Combining with the seven peeled downsets proves (2)⇒(1). Each block satisfies (2) by direct inspection, proving the other direction.

### 5. Rechecked monomorphic finishing argument (T25)

Inside D=R(t), let U=R110,V=R101,W=R011. Integral square middle exactness makes the three lower sides their pairwise intersections A=U∩V,B=U∩W,C'=V∩W, and R000=T=U∩V∩W. Full cubic H1 is (W∩(U+V))/(B+C'); H0=D/(U+V+W), H2=0. Their field vanishing makes W∩(U+V)=B+C' and S=U+V+W primitive in D. Lower-square UCT makes A+B primitive in U, A+C' primitive in V, B+C' primitive in W.

Choose A=T⊕A0, B=T⊕B0, C'=T⊕C0, then U=T⊕A0⊕B0⊕U0, V=T⊕A0⊕C0⊕V0, W=T⊕B0⊕C0⊕W0. Any relation among these seven pieces first puts W0 in W∩(U+V)=B+C', so W0 term vanishes; then U∩V=A kills U0,B0,V0,C0 terms; T⊕A0 kills the last terms. Their sum is direct. Split primitive S from D by D0. The eight free pieces have ↑000,↑100,↑010,↑001,↑110,↑101,↑011,↑111 supports. This also supplies the global natural basis for the residual, rather than only vertex ranks.

## Finite certificate and sharpness

Condition (3) is a finite integral linear-algebra criterion, replacing infinitely many prime tests by actual middle homology and saturation. It can be checked with integer kernel/image bases and Smith forms; no implementation, runtime complexity or mathematical computation was performed this session. Edge nonzero Smith factors must all be units; square/full H0 nonzero torsion factors must be absent, and the specified middle homology groups must vanish. Htop is allowed nonzero and represents deaths. Cokernel H0 free rank is allowed and represents births.

All-field exactness alone remains insufficient: inflate the primitive-BEZOUT-FAILED square A=B=C=D=Z with lower maps 3,2 and upper maps 2,3 constantly along the third axis. Every field is block-decomposable, but an integral block basis would make its nonprimitive edges primitive. Conversely primitive edges alone plus integral middle homology is insufficient: inflate the determinant-m diamond from S008; it fails the H0 saturation test and some Fp condition. Neither is a counterexample to T26.

## Higher grid attack and exact stopping boundary

A first attempt to repeat the terminal-death lift on a longer finite grid fails as an immediate generalisation: the Boolean support list no longer consists only of principal upsets/downsets. For example {1}×{0,1,2}×{0,1,2} on {0,1,2}^3 is an induced band block whose support contains neither global bottom nor top. Its terminal outgoing kernel at (1,2,2) cannot be lifted from global bottom (the source group is zero). Thus the exact Step2 field-surjectivity assertion is FALSE there, even on a single genuine block. This is an explicit obstruction to the proposed proof mechanism, NOT to integral decomposition on grids. Coherent local basis gluing is not established.

A broader n-cube would require a general monomorphic lattice finish; death peeling extends formally on Boolean supports but S009's eight-piece proof is dimension three. No every-n theorem promoted. Branch C was conditional on both main routes failing, so no unrelated HHA problem was added after this complete three-cube theorem.

## Homological role and paper gate

Koszul homology/UCT is indispensable: it controls simultaneous kernel reduction and saturated image sums; independent edge Smith conditions alone do not. The result gives an integral representation criterion for any free homology-valued Boolean-cube diagram, including deaths, and shows fieldwise block decompositions lift under precise purity. It is stronger than T25 and is a plausible candidate for a substantive HHA theorem. Source originality, nonroutine reach, final published comparison and an application beyond the small cube still require the first novelty gate. No priority claim is made.
