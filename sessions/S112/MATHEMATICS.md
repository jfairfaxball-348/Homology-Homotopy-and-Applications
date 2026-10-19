# S112 MATHEMATICS — finite common-polyhedron PL example, quantitative obstruction, and HHA kill

**Status:** internally proved T300–T305; classical control example, **not** original HHA G1/G2. All distance claims concern ordinary **unpointed** \`Top^R\` with arbitrary objectwise ordinary weak-equivalence zigzags of BOTH COMPLETE diagrams; derived homotopy-category diagrams use \`Ho(Top^R)\`, not \`Fun(R,HoTop)\`. No same-category strict dHI>dIHC proved.

## T300. An entirely specified common finite simplicial polyhedron

Use the 3×3 periodic square-grid triangulation A of the torus. Vertices are (i,j), i,j∈Z/3; the 18 oriented 2-simplices are
\`[(i,j),(i+1,j),(i+1,j+1)]\` and \`[(i,j),(i,j+1),(i+1,j+1)]\`, all indices mod 3. Opposite grid sides have consistent identification; faces have three distinct vertices, and the quotient is the standard triangulated T². Let v=(0,0). The subcomplex A1 is the union of the three horizontal edges in row j=0 and three vertical edges in column i=0. It is a wedge of two 3-edge loops, A1≃S¹∨S¹, and inclusion A1→A induces an isomorphism H1=Z². A0={v}, A2=A.

Independently triangulate B as the union of two three-edge circles \`(v,u1,u2,v)\`, \`(v,w1,w2,v)\` and the tetrahedron boundary ∂Δ³ on vertices \`(v,z1,z2,z3)\`, with all non-v vertices distinct. Thus B1=the two three-edge circles≃S¹∨S¹, B2=B≃(S¹∨S¹)∨S² and B0={v}. Share *only* v between A and B; put Y=A∨_v B. Let q be an extra vertex and take the literal simplicial cone X=q*Y (dimension 3, finite and contractible). Both filtrations end in this SAME X, not merely a weakly equivalent terminal.

For ordinary simplicial subcomplex filtrations set A4=B4=X and use A0⊂A1⊂A2⊂X respectively B0⊂B1⊂B2⊂X; no event at 3. The time values 0,1,2,4 are actual PL sublevel critical levels of the explicit functions below, but chosen filtration heights are not intrinsic physical Morse data.

## T301. Genuine continuous PL height functions, lengths and gradient formula

Realise each original vertex of X as a distinct standard orthonormal vector e_j in R^N, linearly on every simplex. On sd(X), each nonempty face σ has barycentre bσ=(1/|σ|)Σ_{j∈σ}e_j. Define h_A(σ)=the least a∈{0,1,2,4} with σ⊆A_a, and h_B by B_a. Set f(bσ)=h_A(σ), g(bσ)=h_B(σ), extending affinely on every simplex of sd(X). This defines continuous, globally Lipschitz, nonconstant PL maps f,g:X→R. For σ⊂τ, the actual Euclidean edge length is
\[
 \ell(b_\sigma,b_\tau)=\sqrt{1/|\sigma|-1/|\tau|}.
\]
For any barycentric chain σ0⊊...⊊σk with sizes r0<...<rk and vertex heights a_i=h(σ_i), consecutive centroid differences are mutually orthogonal. Thus the *exact tangential affine gradient* on this simplex satisfies
\[
 |\nabla_\sigma h|^2=\sum_{i=0}^{k-1}(a_{i+1}-a_i)^2\,{r_i r_{i+1}\over r_{i+1}-r_i}.
\]
For full dimension-3 flags sizes 1,2,3,4, this is \`2(Δa0)^2+6(Δa1)^2+12(Δa2)^2\`; all other flags are faces, so their gradient norms are bounded by a compatible full flag. Each |Δa|≤4 gives the certified uniform estimate \`Lip(f),Lip(g)≤sqrt(320)\`, and \`Lip(f-g)≤2sqrt(320)\` for the induced Euclidean intrinsic length metric (and piecewise-linear paths). No claimed sharp gradient maximum. At vertices belonging to A1\{v}, f=1 and g=4; similarly B1\{v} has f=4,g=1. All other barycentre differences have magnitude ≤3. Affineness gives the **exact** common-domain norm \`||f-g||_infinity=3\`. This controls a real geometric comparison, unlike S111's mere event-vector distance.

For t<0 both sublevel sets are ∅; for t≥4 both equal X. At every t∈[0,1), [1,2), [2,4) the sublevels deformation retract *naturally up to homotopy* onto respectively A0,A1,A2 for f and B0,B1,B2 for g, including t=0,1,2 exactly. Proof: the full subcomplex on barycentric vertices with h≤t equals sd(A_j) or sd(B_j). On each simplex of sd(X) where at least one vertex is of height ≤t, the intersection of the sublevel with that simplex admits the standard PL straight-line normalization retraction to its low-vertex face; on intersections these agree, using weights on low vertices divided by their positive sum. If all vertices are above t the intersection is empty. This retraction is compatible with inclusions after passing to Ho(Top). This is the standard lower-star/sublevel realization lemma, not a new theorem. The transition 1 adds an essential H1 rank2; 2 adds H2 rank1; 4 kills all positive homology. Both nontrivial height functions have at least two distinct essential changes.

## T302. Exactly identical complete NATURAL integral persistent homology

At t<0 the persistence spaces are empty. At [0,1) the homology is H0=Z, all higher zero. At [1,2) both are a rank-two graph spine: H0=Z,H1=Z². At [2,4) A=T² and B=(S¹∨S¹)∨S² both have H0=Z,H1=Z²,H2=Z and zero higher. At [4,∞) both are contractible X: H0=Z and positive homology zero. All structure maps for [1,2)→[2,4) identify the two chosen 1-cycle generators as the *same integral Z² basis*; each birth H2 generator is the torus fundamental class respectively the sphere class and vanishes upon inclusion into X. H0 maps identically for t≥0. The compatible deformation retractions above extend the statement from the discrete filtration to ALL real t and equality cuts. Hence **H_n(L_f;Z)≅H_n(L_g;Z) as full natural R-indexed functors for every n** (likewise base-change to any coefficient ring). Persistent ordinary homology distance is exactly 0, rather than just equal Betti functions. This does NOT imply equal cup-ring persistence: at [2,4) H¹(A)∪H¹(A)→H²(A) is nonzero, whereas B's degree-one cup products vanish.

## T303. Finite positive homotopy obstruction stable under every WHOLE weak-equivalence replacement

For 0≤ε<1, suppose an ε-homotopy interleaving existed after arbitrary complete-diagram objectwise WE zigzags of both f and g. The induced ε-interleaving in \`Fun(R,HoTop)\` is necessary. At t=2, all F(2),G(2+ε),F(2+2ε) lie in their [2,4) plateaux, and F(2)→F(2+2ε) is an isomorphism in HoTop. One of the shift identities forces \`A→B→A\` to compose to that isomorphism, hence π1(A)=Z² must be a retract of π1(B)=F2 (up to chosen basepoints and conjugation). These spaces are path connected; arbitrary basepoints adjust only by conjugation and the induced composite still gives an injection Z²↪F2. This is impossible because each abelian subgroup of a nonabelian free group is cyclic. The argument does not rely on markings, CW embeddings or non-WE terminals and survives all arbitrary whole-diagram WEs. Therefore
\[
       1\le d_{\rm IHC}(L_f,L_g)\le d_{\rm HI}(L_f,L_g).
\]
This lower bound is a primary π1/commutator attaching obstruction. It is *not* a nonzero higher Toda/Massey/filler invariant, and does not prove strict HI>IHC.

## T304. An honest strict upper bound with both identities at all real t

Because |f-g|≤3 on the exact common X, literal inclusions \`L_f(t)⊆L_g(t+3)\` and \`L_g(t)⊆L_f(t+3)\` exist for every real t, including negative t, 0,1,2,4 and all terminal cuts. They are natural inclusions. Each composite is *exactly* the corresponding transition inclusion by 6 (not just a homotopy). Thus they give an attained strict 3-interleaving in the original diagrams, and
\[
             1\le d_{\rm IHC}(L_f,L_g)\le d_{\rm HI}(L_f,L_g)\le3<\infty.
\]
The positive bound is real and finite with equal terminals, but the lower and upper are **NOT matching**; exact distances, endpoint ε=1, and any same-category strict difference remain OPEN. It would be an overclaim to report the lower bound as sharp, to infer dHI>dIHC from homology0, or to call 4 a physically measured death-time.

## T305. Perturbative persistence with an honest scope

Let f',g' be continuous PL functions on this exact X with \`||f-f'||∞≤ρ\`, \`||g-g'||∞≤ρ\`. The standard sublevel inclusion interleavings on a common domain yield \`dHI(L_f,L_f')≤ρ\` and \`dHI(L_g,L_g')≤ρ\`. By triangle inequalities in the homotopy interleaving distances, 
\[
 \max(0,1-2\rho)\le d_{\rm IHC}(L_{f'},L_{g'})
 \le d_{\rm HI}(L_{f'},L_{g'})
 \le 3+2\rho.
\]
The lower bound uses T303 and dIHC-stability following from dIHC≤dHI. For ρ<1/2 this certifies a positive difference detectable beyond ordinary persistent homology of the *unperturbed* pair. For perturbed pairs ordinary homology distances need not remain zero, but \`d_H(L_f',L_g')≤2ρ\` follows from the zero-distance homology base pair and stability. This is an elementary corollary of established 1-Lipschitz stability, not a new optimal reconstruction theorem or HHA application.

## T306–T307. Honest failure and decisive countercontrol

The full example KILLS the false universal statement “identical natural integral persistent homology plus weakly equivalent terminals forces homotopy interleaving distance zero.” It ALSO KILLS S111's terminal-infinity obstruction as a constraint on *all* shared-terminal filtrations: here the terminal is literally the same contractible X and 1≤dHI≤3. But it does not improve generic sublevel stability, has a deliberately chosen cone-cancellation event, and π1/cup products already see the intermediate discrepancy. It offers no derived-only or HI-versus-IHC strictness, no naturally motivated data-analysis reconstruction family, and no independent 2026 original-source novelty case. There is **no HHA-quality claimed first theorem**.

Do NOT silently relabel these filtrations as real-world sensor functions or intrinsic Morse energy. Common-domain norm3 is a genuine \`||f-g||∞\` comparison on a specified Euclidean polyhedron, but the cone stage at 4 is synthetically chosen. The actual proposed S112 target demanded *more* (a geometrically meaningful nonclock application and/or strict HI>IHC). Its first-paper candidate is therefore RETIRED. A subsequent attempt must remove the easily visible π1/cup discrepancy and artificial cone-event dependence, not merely retune times.

## T308. Gate disposition

INTERNAL hand proofs T300–T305 and negative result T306–T307 only; no computer-generated mathematical certificate or independent referee. The published homotopy interleaving universality and persistent cup-product stability principles substantially preempt the apparent mechanism (original-source details PRIOR_ART). G1 HHA-significant original theorem **NOT PASSED**. G2 independent novelty **NOT PASSED**. Separate Lean, Palomar, manuscript, arXiv/HHA and external contact are unapproved; do not run them.