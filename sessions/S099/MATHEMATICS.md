# S099 MATHEMATICS — cubic-cup complete orbit reconstruction, decisive no-go (INTERNAL)

## Objects, finite geometry and quantifiers
Let G=(Z/2)^2, A=F2 with trivial action, H*(BG;F2)=F2[x,y], |x|=|y|=1. Every k in H³(BG;A) is a binary cubic a x³+b x²y+c xy²+d y³. Let P_k be the homotopy fiber of the map BG→K(F2,3) classified by k, with fiber K(F2,2), and let X_k=P_k^(4) mean the finite CW *four-skeleton of the explicit degreewise-finite simplicial model in S098 T235*, not the entire infinite 2-type. In simplicial degree p, the model consists of (g_1,…,g_p,b) with g_i in G and b in C²(Δ^p;F2), δb=k on the bar p-simplex; finite p-level because G^p and the cochain set are finite. Standard simplicial fibration/classification is an explicit classical input; face/degeneracy naturality comes from restriction and repetition. X_k is a genuine finite CW complex retaining π1=G, π2=F2, the first k-invariant and integral/mod2 cohomology through degree three. Higher homotopy and H4 of X_k are *not* equated with those of P_k. GL2(G) acts on k by substitution; Aut_G(A)=1. We do not attach a marking to maps in the comparison.

## T238 (PROGRAMME_PROVED, INTERNAL): the cubic cup kernel reconstructs ALL unmarked k-orbits
For every k (including k=0) the ordinary graded mod2 ring H^≤3(X_k;F2) intrinsically determines the one-dimensional subspace <k> of Sym³H¹(X_k;F2), where <0>={0}. In fact,
$
\ker\big(\operatorname{Sym}^3 H^1(X_k;F_2)
\xrightarrow{\smile^3} H^3(X_k;F_2)\big)=\langle k\rangle.
$
**Proof.** In the mod2 Serre cohomology spectral sequence of K(F2,2)→P_k→BG the fiber has H¹=0, H²=F2·u. The defining Postnikov transgression is d3(u)=k from E3^(0,2) into E3^(3,0)=H³(BG;F2). Other differentials cannot enter (3,0): d2 would have source (1,1)=0, d_r with r>3 would have negative source column. Thus the edge pullback in degree three has kernel exactly image(d3)=<k>. The edge map in degree one is an isomorphism H¹(BG)→H¹(P_k). Cup multiplicativity and naturality identify the indicated cubic product with that edge pullback on Sym³H¹(BG)=H³(BG), proving the formula. Inclusion X_k→P_k is a degree-three cohomology isomorphism, so it retains the relation and the H¹ products. An unmarked ordinary weak equivalence, or cohomology-ring isomorphism, induces a GL2(F2) change of degree-one generators, carrying one kernel line to the other. Hence two distinct GL2 orbits cannot have isomorphic ordinary mod2 cohomology rings through degree three. Conversely no claim that k-orbit equality produces a particular homeomorphism of independently chosen finite skeleta is needed for this no-go. QED.

**Complete orbit list** in mask convention bit0=x³, bit1=x²y, bit2=xy², bit3=y³:
| Representative | Entire GL2 orbit (decimal masks) | size | integral H2 of X_k |
|---|---|---:|---|
| 0 | 0 | 1 | (C2)^2 |
| 1=x³ | 1,8,15 | 3 | C2 |
| 2=x²y | 2,3,4,5,10,12 | 6 | C2 |
| 6=x²y+xy² | 6 | 1 | C4 |
| 7=x³+x²y+xy² | 7,9,14 | 3 | C2 |
| 11=x³+x²y+y³ | 11,13 | 2 | C2 |

For example x³ and x²y represent distinct orbits because their intrinsic one-dimensional cubic cup-relation lines are not GL2-conjugate; *even though* their H1 and H2 agree. The same argument simultaneously excludes any collision between the four requested nonmixed nonzero orbits, including purported primary-blind pairings. No Sq2 calculation is needed: **ordinary cup is already decisive**.

## T239 (PROGRAMME_PROVED, INTERNAL): exact integral H2 classification
For k=0, H2(X_k;Z)=(C2)^2; for k=x²y+xy², H2(X_k;Z)=C4 (S098 T236). For all other nonzero k, H2(X_k;Z)=C2. **Proof of last assertion.** H1(P_k;Z)=G; H2(BG;Z)=C2 (integral Künneth); H2(K(F2,2);Z)=C2. The integral homology Serre d3:H3(BG;Z)→H2(K(F2,2);Z)=C2 evaluates the mod2 transgression k on reductions of integral base 3-cycles. By integral Künneth, H3(BG;Z)=(C2)^3 and H3(BG;F2)=F2^4; mod2 reduction of integral H3 has rank three by universal coefficients, so its annihilator in H³(BG;F2) has dimension one. Every reduction of an integral cycle is annihilated by Sq1 on H² via mod2 Bockstein adjunction. Since Sq1(x²)=Sq1(y²)=0 and Sq1(xy)=x²y+xy²≠0, that annihilator is precisely <x²y+xy²>. Thus for each k outside {0,mixed} the integral d3 is surjective, kills the fiber H2, and H2(P_k;Z)=H2(BG;Z)=C2. The 4-skeleton retains H2. Mixed/zero extension resolution is via S098 mod2 UCT; do **not** infer the mixed extension from d3=0 alone. QED. H1 is always (C2)^2; H3 and H4 integral are NOT claimed computed, because T238 already kills the route and H4 of a finite skeleton requires accounting for the choice of 5-cells. No falsely complete invariant table.

## T240 (PROGRAMME_PROVED, INTERNAL): cyclic-local restriction does NOT imply global triviality
Restriction H³(BG;F2)→⊕_{H<C2²,|H|=2} H³(BH;F2) sends (a,b,c,d) to (a,d,a+b+c+d), so kernel={0,x²y+xy²}. The nonzero kernel k is Sq1(xy) and GL2-invariant. Restricted **Postnikov 2-types** for k=0 and mixed coincide on every cyclic subgroup, while globally they do not; T238 detects mixed by a vanishing cubic product, and T239 by integral H2. The cyclic family is NOT an open covering of BG; equality of restricted infinite 2-types does NOT provide compatible maps/isomorphisms of actual finite intermediate coverings of independently truncated X_k. No functorial finite CW gluing diagram, real-indexed coupled transitions, quantitative Top distance beyond clocks or genuinely new stable descent invariant follows. Classical restriction failure should not be rebranded as a new HHA application.

## T241 (COMPUTED_EXACT finite arithmetic, INTERNAL)
Python 3 standard library checker exhaustively enumerates the 16 cubics, 6 GL2 matrices, 120 unordered pairs, 3 cyclic evaluations and Sq1 coefficient table. Actual `python3 scripts/s099_cubic_orbit_check.py` check (local copy with precisely the committed script) produced `validation/s099_cubic_orbit_stdout.txt`: all assertions PASS. SHA256 script `ed2baa82d57b5856ef8503e310dac38073cd394665f2da99d2fb829377f49a45`; stdout `c2152cd15fec2ab24b56d31500bb30f6155113fa77ee32ff93f060964d5b8d16`. This is *arithmetic only* and not independent Serre/topology/novelty verification.

## Exact mathematical verdict
All promised nonconjugate low-degree-cup-invisible 2-type pairs FAIL before persistence. In particular proposed integral homology + primary Steenrod collisions cannot occur in the requested class because even the degree-three cup algebra recognizes k. A non-clock interleaving lower/upper theorem was **NOT PROVED**; no real-indexed maps were built or claimed. Stop this family, do not append artificial pulse clocks; investigate a different HHA problem S100. G1 original HHA theorem OPEN, G2 originality/significance NOT PASSED.