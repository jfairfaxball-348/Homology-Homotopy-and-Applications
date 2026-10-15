# S051 mathematics — natural pointing by mapping paths; relative zero-cell obstruction remains open

## Fixed scope and what is genuinely achieved

Original F and G, source-dependent numerical bracket, GRID(r,s), T108–T121 are fixed in INPUT. **No** unrestricted GRID(5,2) or GRID(8,3) witness/no-go and **no** exact dHI is obtained. The new positive result T122 proves a general and explicit *unpointed-to-pointed whole-chain weak-equivalence transport* lemma, removing the particular pointing ambiguity flagged in S050. T123 applies it to the old T119 on-image collisions while retaining the published stable bracket and higher-operation naturality inputs. T124 proves each strict GRID relation is individually independent in a limited contractible toy universe, for all L,r. T125 calculates only a candidate obstruction group's degree. T126 rules out an unsound ordinary-category replacement shortcut.

## T122 — actual pointed zigzags from unpointed whole-diagram weak equivalences (PROGRAMME_PROVED, standard mapping-path technique)

Let J=[L]={0<1<...<L} and let B,C:J→CGWH spaces be strict diagrams. A *propagated pointing* on B is a natural section of points b_j=B(0→j)b_0; similarly c_j=C(0→j)c_0. Let f:B→C be a natural transformation whose f_j are **all weak homotopy equivalences**. Assume C_0 is path-connected. Then for ANY prescribed propagated pointings b and c there is an explicit zigzag of **strict based J-diagrams and objectwise weak homotopy equivalences**
  (B,b) ← (P,p) → (C,c)
which forgets to a replacement of the original natural transformation.

**Construction.** Choose one path λ:[0,1]→C_0 from f_0(b_0) to c_0. Put
  P_j={(z,γ)∈B_j×C_j^[0,1] : γ(0)=f_j(z)}.
For j≤k send (z,γ) to (B(j→k)z, C(j→k)∘γ). Define natural transformations q_j:P_j→B_j by (z,γ)↦z and t_j:P_j→C_j by (z,γ)↦γ(1). Let λ_j=C(0→j)∘λ and p_j=(b_j,λ_j); this is a coherent, *literally* propagated basepoint family, q(p)=b and t(p)=c.

**Weak-equivalence proof, not an appeal to pointwise path choice.** q_j has the continuous section s_j(z)=(z,constant path at f_j(z)), and the homotopy
  H_u(z,γ)=(z,t↦γ(ut)), 0≤u≤1,
contracts q_j's fibers from γ to the constant-start path while holding z fixed. Thus q_j is a homotopy equivalence (q_j s_j=id and H_1=id, H_0=s_jq_j). The maps t_j and f_jq_j are homotopic by (z,γ,u)↦γ(u). Since f_j and q_j are weak equivalences, homotopy invariance/2-of-3 implies each t_j is a WE. The displayed transformations preserve the strict pointings by construction. They act on the **entire natural diagram**, not independently selected vertex representatives. All endpoint squares commute on the nose. At a literal point terminal C_L and B_L, P_L is itself a literal point; without this extra hypothesis P_L need not be point, as expected.

**Zigzag corollary.** Given ANY finite unpointed J-diagram WE zigzag whose 0-stage spaces are all path-connected, choose arbitrary propagated basepoints on intermediate vertices, leave BOTH endpoint pointings prescribed, and replace EACH arrow f by the mapping-path span above. Its codomain 0-stage is path-connected, independent of the arrow's direction. We obtain one genuine *pointed whole-diagram zigzag* between the prescribed endpoint pointings, without asserting objectwise-homeomorphism, cofibrancy, monicity or any canonical strict basepoint lift through f. Because all source stages are WE to S^160 at index0 in this programme, connectivity holds at every zigzag vertex.

**Sharp boundary.** If C_0 is disconnected and f_0(b_0) and c_0 are in distinct components, no λ exists. Example: B=C=constant S^0, f=id, and choose opposite pointings; a pointed homotopy equivalence over this fixed f cannot carry one to the other. Thus path-connectedness cannot simply be dropped. The construction does NOT claim that the *original arrow f itself* is pointed under arbitrary chosen points: it is replaced by a span. It also does not upgrade a model-level homotopy interleaving to a strict one.

## T123 — sharpen the meaning of T119's conditional contradiction

For every coprime 2s<r<3s, L=5s, a hypothetical original-sphere GRID(r,s) K admits propagated x from its strict constants. Restrict its ONE whole-[L] unpointed zigzag to the five sampled objects K_0,K_s,K_2s,K_3s,K_4s, but first apply T122 to point the WHOLE [L] zigzag, with prescribed canonical pointings on A^s. Thus the precise 'arbitrary unpointed WE loses pointing' gap flagged in S050 is repaired.

For i=0,1,2 put P_i=K_(is→(i+2)s) and V_i=K_((i+2)s→is+r). As in T119, V_iP_i is literally constant and V_i is a within-stage WE. If each V_i is injective **on im(P_i)**, all three P_i are literally zero maps on the propagated pointings. The sampled chain then has a strictly zero adjacent-pair model, with trivial compatible higher null tracks. By the usual naturality of the *full* fourfold higher Toda operation under pointed objectwise WE zigzags (BJT2019 §7.A is prior art) and suspension to spectra, zero in its full bracket transfers to the original stable chain. It conflicts with the **published / inherited** Wang–Xu2017 and IWX2023 full-bracket zero-exclusion, provided that the original representative and the naturality/suspension conventions are exactly the retained ones.

Therefore the on-image COLLISION conclusion of T119 no longer depends on an unconstructed pointing transport: T122 supplies that step. It still depends on published θ_5 and h_5 n indeterminacy, on precise full fourfold Toda naturality and original unstable representative identifications. **No independent Adams/Moss computation or novel GRID impossibility is claimed.** Neither mere nonmonicity nor existence of one image collision suffices to build a GRID.

## T124 — every marked length-r strict zero relation is independent in a contractible toy universe (PROGRAMME_PROVED, general)

Let integers L>r≥1. Put K_i=I=[0,1] based at 0 for i=0,...,L−1 and K_L=point. Edges u_i:K_i→K_(i+1) for i=0,...,L−2 are chosen from id_I and the based constant z; terminal edge is unique. Both internal options are WEs between contractible spaces. The GRID zero constraints have indices j=0,...,L−r−1.

For any *selected* j in that range, set u_i=id precisely for j≤i<j+r (these indices are ≤L−2), and set u_i=z for all other internal i. Then j→j+r is identity on I and NOT the constant map; for each k≠j in 0..L−r−1 the equal-length edge window [k,k+r) contains an edge outside [j,j+r), so k→k+r includes a z and is literally constant. Proof of the interval claim: if k<j, its leftmost edge k<j is outside; if k>j, its rightmost edge k+r−1≥j+r is outside and at most L−2. Thus every one of the L−r equations is *individually logically independent* even if all other equations are imposed, in pointed, contractible, objectwise-WE finite chains. In particular all FIVE j=0..4 GRID(5,2) relations and all SEVEN j=0..6 GRID(8,3) relations are essential for a general equivalence proof. This is **not** a sphere WE model and has no implication that original GRID exists. The elementary algebraic proof is independent of the bounded script checks.

## T125 — genuine tertiary target DEGREE, not an obstruction class (PROGRAMME_PROVED conditional stable-range conventions)

For based sphere representatives at the ends of the original four-map chain,
  π_2 Map_*(S^160,S^100)_0 = π_2 Ω^160 S^100 = π_162(S^100).
By Freudenthal, since 162−100=62≤100−2, this maps isomorphically to π_62^S. This is exactly the degree in which the *published* bracket of (2,θ_4,θ_4,2) lies, and the IWX2023 h5²/h5 n comparison is relevant.

This only checks the **degree of a possible top-level tertiary S² boundary** after fixing cofibrant/fibrant basepoint-zero mapping objects. The actual relative Z_(10,5) homotopy-coherent resolution could have multiple incidence components or nonabelian dependence at lower levels. No 3cell boundary, attaching map, equation family, indeterminacy quotient, vanishing criterion or full WE-zigzag invariant has been computed. A symbol π_2 alone is NOT a DKS cocycle.

## T126 — why naive ordinary DKS of the underlying zero-category is inadequate

T121 Z_(L,r) is POINTED-SET enriched: the designated formal zero arrow must map to the *constant based map*, not an arbitrary idempotent. Forgetting enrichment changes the functor problem. Toy proof: take a one-object ordinary category with identity 1 and absorbing idempotent z, z²=z; an ordinary functor can send z to the NONCONSTANT based idempotent projection p:S¹∨S¹→S¹∨S¹ retaining one summand and collapsing the other. It satisfies p²=p, but does not send the distinguished zero to the basepoint. A strictly pointed enriched representation forbids this. Therefore an arbitrary ordinary free category resolution, without imposing z as the zero map **at every simplicial level and relative to the original whole chain**, is not the requested obstruction model. This is a *precise invalid shortcut*, NOT a proof that a valid enriched DKS resolution cannot exist.

## Explicit failed endpoint / 4/3 / cofinal routes

Endpoint [10] notation: a_i=d_i e_i, e_i:K_2i→K_(2i+1) a WE. The simultaneous constraints remain
j0 e2 a1 a0=0; j1 a2 a1 d0=0; j2 e3 a2 a1=0; j3 a3 a2 d1=0; j4 e4 a3 a2=0.
Attempted mapping-path absorption at the e2/e3/e4 WE tails: T122 furnishes genuine WE *spans*, but does not give a finite GRID K with any composite literally zero. Pulling back a pair P_i into a strict fiber of V_i creates no compatible choices for the overlapping five relations. Making all three tails injective on images would contradict T123; making all noninjective is not sufficient. The fourfold bracket alone still does NOT prove nonexistence of all arbitrary nonmonic K.

At GRID(8,3), the seven required equations remain j→j+8 for j=0,...,6. T124 shows none can be ignored in the general toy category. A hypothetical endpoint witness resamples to 4/3 by T116, not conversely. An arbitrary 4/3 witness must exhibit a T123 image collision in a two-arrow within-stage WE tail (6→8 or 9→11 or 12→14). No actual all-seven original-sphere K constructed or ruled out.

Cofinal GRID(10m+1,4m): T123 applies for every m≥1, with tail r_m−2s_m=2m+1 and L_m−r_m=10m−1 actual equations. The toy independence theorem applies to all 10m−1 equations, but neither infinitely many positive witnesses nor a single negative above-endpoint grid is obtained. No dHI improvement beyond the inherited 5/4 to 3/2 bracket.

**Freeze:** dIHC=1 INTERNAL; dHI∈[5/4,3/2] INTERNAL source-dependent; T66 all primitive/composite Q/every Fp and single Z split / original1981 caution, R5 strict 16471 OPEN, retired Hopf and derivative T84 intact. No independently proved original HHA flagship, first novelty Gate2 NOT_STARTED.
