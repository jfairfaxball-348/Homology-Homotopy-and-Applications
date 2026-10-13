# S018 MATHEMATICS — T43 real rectangle-relative transfer, T44 decision, T45 noncollapse

**Grade:** PROGRAMME_PROVED by internal symbolic argument; neither external refereed nor machine-checked nor novelty-cleared. This concerns **all rectangles**, NOT all LLO blocks, all intervals, or a narrow prescribed family. Its algorithm has substantial prior-art overlaps; Stage2 remains CLOSED.

## Definitions and exact quantifiers

Fix a field F, n >= 2, and a finite chain G_i={s_i<c_{i,1}<...<c_{i,m_i}} in R with sentinel s_i below the coordinate of EVERY free generator and homogeneous relation in the input. Put G=product G_i and let pi:R^n -> G floor every coordinate to its greatest chain element, clamping the entire left tail to s_i. Write E=pi* (precomposition). For each product of nonempty order-convex coordinate intervals I in a poset P (including open/closed and unbounded real endpoints), R_I denotes the indicator diagram with F and identity arrows within I and zero elsewhere. X_rect(P)=add{R_I: I an axis-aligned rectangle}, finite additive sums and direct summands. E_X conflations are pointwise exact sequences remaining exact under Hom(R_I,-) for EVERY such rectangle. pd_X is the shortest X-relative admissible projective-resolution length; no value inferred from usual free resolutions.

**T43 (relative rectangle transfer).** For every finite-dimensional G-diagram V, every k>=0, any F, and n>=2,
    pd_X_rect(R^n)(E V) <= k  iff  pd_X_rect(G)(V) <= k.
Both sides use their OWN full rectangle families, not just finite grids treated as ordinary projective tests. In particular this holds for a finite free-presented M:R^n→Vect_F, since M≅E(M|G) for any such sentinel grid.

### Lemma A: real rectangles have rectangular left Kan images

For a real coordinate interval J and a grid grade g, the indexing set {t in R:pi(t)<=g} is an initial ray (-infinity,c_next), or all R for maximal g. The colimit of R_J on this ray is F iff the ray meets J and has not passed into a point later than its right endpoint where the structure map becomes zero; otherwise zero. As g increases this gives either zero or a consecutive interval of grid grades, with identity maps between nonzero stalks. This remains correct when J is open at either end, contains an infinite tail, or dies on the last unbounded initial ray. There is NO stalk-evaluation shortcut here.

For R_I=external tensor product over n coordinates, the left Kan colimit on the product of initial rays is the tensor product of the coordinate colimits (colimits over products, tensor as left adjoint over a field). Consequently Lan_pi R_I is zero or a G rectangle. Conversely E of a G rectangle is a real rectangle: the inverse image of a consecutive set of grid levels is a real interval on each axis, with true left-tail clamping. Restriction of any real rectangle along G↪R^n is zero or a grid rectangle.

### Lemma B: admissibility is NOT merely pointwise surjectivity

A finite G rectangle-X admissible epi P→V induces a pointwise epi E P→E V. For ANY real rectangle R_I, the actual adjunction
    Hom_R(R_I,E W) ≅ Hom_G(Lan_pi R_I,W)
turns the lifting condition for E P→E V into the G lifting condition for a G rectangle or zero (Lemma A). Thus E P→E V is genuinely X_rect(R) admissible. E sends finite G rectangle-projectives to real rectangle-projectives and is exact on kernels.

On G, enough relative projectives exist: for each of the finitely many rectangles J choose an F-basis of Hom_G(R_J,V), form P(V)=direct sum of that many copies of R_J and evaluate. The principal-upset rectangles occur among J and ensure pointwise surjectivity; the J summands ensure EVERY Hom(R_J,-) lift. K(V)=ker[P(V)→V] is a finite G diagram and the kernel sequence is X-admissible.

### Lemma C: projectivity reflection on the E-image

If V is a direct summand of finite G rectangles, E V is a summand of real rectangles. Conversely suppose E V belongs to add of real rectangles. End(R_I)=F for every nonempty real rectangle: within its support any two grades are linked through their coordinatewise maximum, so natural endomorphisms are one scalar. Hom of any two such indicators has dimension at most one. A finite direct sum of these has a finite-dimensional endomorphism ring, hence Krull–Schmidt for its idempotent summands. Therefore E V itself is a finite direct sum of real rectangles (up to isomorphism). Restrict at actual points G: V=(E V)|G, which becomes a finite direct sum of G rectangles/zero. Thus pd_real(E V)=0 iff pd_G(V)=0. NOTE this argument uses all-rectangle support; it is false if one substitutes ordinary free projectives.

### Induction in k (relative Schanuel)

For arbitrary V take the specific finite admissible rectangle cover 0→K→P→V→0 of Lemma B. Its E-image remains admissible and E K=ker(E P→E V). For ANY competing X-admissible projective epi Q→E V, the pullback and splitting via projectivity give relative Schanuel
    (E K) ⊕ Q ≅ ker(Q→E V) ⊕ (E P).
The same holds on G. Consequently pd_X(V)<=k iff pd_X(K)<=k-1, and pd_X(E V)<=k iff pd_X(E K)<=k-1. Apply induction and the k=0 lemma. Covers all k, including V=0 and pd=0, with no homological characteristic restriction. Finite presentation reduction: generators/relations between free principal upsets are constant under pi on each stratum, so their pointwise cokernel M also is E(M|G); every sentinel hyperface has zero stalk.

## T44 — explicit fixed-dimensional, fixed-length algorithm from FREE PRESENTATIONS

For each fixed n>=2 and fixed k>=0, on an input finite homogeneous presentation by principal upsets of an R^n persistence module M, decide pd_all-rectangles(M)<=k with polynomially many F-field arithmetic operations and exact comparisons of encoded generator/relation grade coordinates, in the EXPANDED fixed-n arithmetic model. A certificate consists of the chosen rectangle-cover matrices, syzygy matrices and final projective membership or Hom obstruction.

Construction: list the q distinct generator/relation grade coordinates per axis, add an actual prebirth sentinel, form G with s=|G|<= (q+1)^n. Compute M|G by stalk presentations/linear algebra and arrow maps. Enumerate ALL G rectangles, at most prod_i [|G_i|(|G_i|+1)/2] <=s², containing every principal upset. Build the X-admissible Hom-evaluation cover above and its pointwise kernel; repeat k times. Decide whether the k-th syzygy belongs to add(rectangles) using the finite-family endomorphism-algebra/minimal right-cover membership procedure proved in S010-T27: the Hom tops modulo factorizations through nonisomorphic intervals determine the minimal cover, and it is an isomorphism iff that syzygy is rectangle-projective. This tests ACTUAL relative pd, not ordinary pd. T43 transfers the result exactly to R^n.

For d=sum_g dim V(g) and B<=s², the nonminimal evaluation cover has at most B d copies and O(s B d) total dimensions. At each of fixed k steps the crude bound d_{j+1}<=s B d_j yields d_j<=s^{3j}d; naturality and Hom systems have polynomially many entries, and the S010-T27 minimal-cover linear algebra is polynomial in s,B,d_k. This proves polynomial arithmetic complexity for fixed n,k (a loose bound of the form (q+input_matrix_size+1)^{C(n,k)}), NOT an optimised exponent, NOT uniform polynomial when n,k are variables, NOT guaranteed polynomial BIT complexity over rationals and not a complexity result for arbitrary implicitly specified rectangle subclasses. No software run or numerical timing is asserted.

## T45 — concrete nonprincipal fp stress test kills free-pd substitution

Let n=2 and W=F_[0,1)×[0,1), the rectangle indicator. It is finite free-presented:
    0→P_(1,1)→P_(1,0)⊕P_(0,1)→P_(0,0)→W→0,
with coordinate-wise alternating incidence signs. The finite rectangle [0,1)² is ITSELF a relative projective, so pd_rect(W)=0, whereas ordinary free pd(W)=2: the displayed multigraded Koszul complex is minimal and its top square/Tor_2 at the (1,1) relation grade is nonzero. Its Hom(R_W,W) contains identity even though W vanishes on all prebirth sentinel faces. Thus the S017-T41 all-BLOCK Hom-vanishing argument CANNOT be imported into rectangle families. Over F_2 the signs coincide yet d²=0 by pairing; the top Koszul class remains nonzero. In n=3 or n=4 take W_n=F_[0,1)^n; its relative rectangle pd is 0 while ordinary free pd is n, witnessed by the tensor Koszul resolution. Zero module has both dimensions zero.

This is a genuine failure of the all-block free-dimension collapse, NOT a novel standalone HHA theorem: bounded rectangles are recognized as relative projectives by definition.

## Front B and C honest boundary

B: S017-T42 excludes the diameter-completing case. We did not construct two genuine bounded-dimensional Euclidean one-height/radius clouds, with r_1 strictly BELOW top-cloud diameter, identical entire homology AND π diagrams and nonisomorphic mixed cofiber cup/Hopf invariants. Neither an arbitrary flag complex, a three-height metric reduction nor a contractible-top S016 witness meets this target. Original Oudot–Waas proofs uninspected. NO new B theorem.

C: We found no all-hypotheses integer mixed [0,2]^2 or [0,2]^3 global natural idempotent theorem or non-splitting witness verified on EVERY edge, composite, subcube and Q/all F_p. No isolated induced band is a counterexample. This route remains OPEN.

## Significance and priority

T43–T44 are a complete **internal** fixed-n,k, ALL-RECTANGLE special-family answer to the LLO original Problem1 (which explicitly asks for efficient k>=1 relative resolutions for prescribed interval classes and finite free-presented R^n modules). They do NOT answer arbitrary interval classes or establish a new algorithmic lower bound. Direct strong prior art: original 2024 LLO §2.2 Kan, original Botnan–Oppermann–Oudot FoCM2025 §§3.1,4.3 **rank-exact lower-hook projectives** Thm4.11 / Prop4.17 and grid resolution transport, plus Asashiba et al. 2023 and S010-T27 polynomial listed finite-family algorithm. All-rectangle family differs from all-hook rank-exact, but the derivation is a natural composition of well-known tools; even if a precise fixed-k arithmetic upper bound is not written in those papers, no originality or HHA-significance claim follows. Crucially the argument supplies no indispensable *unstable homotopy* or new serious application. G2/Lean/Palomar/paper remain unopened; NO_VIABLE_HHA_FLAGSHIP_YET.
