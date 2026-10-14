# S039 MATHEMATICS — four-stage point-target homotopy-interleaving equality

Status: INTERNAL human-readable proof T87–T89, source-priority unverified, NOT machine-certified. This is a nontrivial restricted equality theorem, **not** a universal d_HI=d_IHC theorem and NOT a d_HI>d_IHC witness. Finite CW means ordinary finite CW homotopy type of the original stages; comparison zigzags may contain path objects.

## Exact setting
Let A,B,C,D be nonempty path-connected simply connected finite CW complexes. Choose cellular maps f:A→B, g:B→C, h:C→D (unpointed maps, with choices of compatible points allowed). Define a covariant real diagram F by empty space t<0; A on [0,1); B on [1,2); C on [2,3); D on [3,4); and * on [4,infinity). Transitions are the consecutive composites. Put G(t)=empty for t<0 and * for t≥0. Write η_F^a(t):F(t)→F(t+a), and use the three genuinely different distance notions:
- HC: interleavings in Ho(Top)^R (pointwise homotopy-category diagrams).
- IHC: interleavings in Ho(Top^R) (homotopy category of the whole diagram).
- HI: strict interleavings after objectwise weak-equivalence zigzags of real diagrams.
Both interleaving identities must hold for every t; ε is real, not only integer/half-integer.

Let θ:(A→^f B)→(C→^h D) denote the canonical *derived-arrow* natural square (g f, h g), with its coherent comparison representing the actual strict commutative square (h g) f = h (g f). Define predicates:
P0: each of A,B,C,D is weakly contractible;
P1: each of f,g,h is nullhomotopic as an unpointed map;
P2: θ factors through the point-arrow in Ho(Top^[1]) (equivalently θ lies in the point-arrow component of the derived arrow mapping space);
P3: h g f:A→D is nullhomotopic.
P0⇒P1⇒P2⇒P3; P1⇒P2 uses one homotopy of g for both components and the mapping-space comparison, not merely vertexwise nullity. These predicates are invariant under diagrams' objectwise weak equivalence as used in the proof; P1 may be replaced by the existence of a zero-arrow strict model if desired.

## T87 — a coupled two-window strictification lemma (four-stage chain)
**Lemma (internally proved).** If P2 holds, there is a zigzag F≃F' of objectwise weak equivalences of **full real diagrams**, whose four nonterminal stages have finite CW homotopy type, and in which g'f' and h'g' are BOTH literally constant maps (to compatible points). The proof does not assert f',g',h' individually constant.

Proof. First replace f by A↪B'=Mf using its ordinary mapping cylinder. The arrow (A→B') is projectively cofibrant, B'→B is an objectwise homotopy equivalence and can be propagated across C,D to obtain a comparison of the full chain. Relabel B'. The derived arrow mapping space into C→D is
 RMap_[1]((A→B),(C→D))
  ≃ Map(A,C) ×^h_(Map(A,D)) Map(B,D),
where the two maps are postcomposition with h and restriction along f. Because f is a CW cofibration, Map(B,D)→Map(A,D) is a fibration on suitably fibrant compactly-generated or simplicial mapping-space models; the ordinary pullback for a cofibrant arrow models the homotopy pullback. P2, with connected C,D, yields a path from θ to a point-arrow factorization, comprising H_A:g f~c and H_B:h g~h(c), together with a compatible 2-homotopy from h H_A to the restricted H_B. Arbitrary independent nullhomotopies would NOT supply this last datum.

Use HEP of A↪B to extend H_A and deform g through maps B→C to g' with g'|A=c literally. The path in the homotopy pullback supplies the compatibility making the induced nullhomotopy h g'~h(c) *relative to A* (equivalently a based nullhomotopy of the descended map B/A→D). This is the exact relative-lifting step: the homotopy-of-homotopies can be rectified using the fibration of mapping spaces from B to A, or by HEP applied to A×I inside B×I. Without P2 it can fail, as the LS Toda square demonstrates.

Write q:B→B/A, and g'=\bar g q. Form the (reduced only in notation, ordinary) mapping cylinder C'=M(\bar g) with bottom inclusion j:B/A↪C' a CW cofibration and homotopy-equivalence retraction r:C'→C, rj=\bar g. Replace g' by g''=j q, and h by h'=h r. Then g'' f is strictly constant since q f collapses A to its basepoint; h' j:B/A→D is based nullhomotopic by the relative null above. HEP for j deforms h' to h'' with h'' j literally constant, so h''g'' is also literally constant. Their constant points are automatically compatible since h''g''f=h''(g''f).

To justify **full diagram** equivalence rather than changing a last map only: (i) a mapping-cylinder replacement has a stagewise equivalence respecting its neighbouring arrows; (ii) a single arrow homotopy in a linear chain has an explicit span of diagrams: for a homotopy H on edge i→i+1, replace each stage from i+1 onward by its free path space X_j^I, use H as incoming map and apply later arrows pointwise to paths; endpoint evaluation at time 0 or 1 gives natural objectwise weak equivalences to the two original chains. Apply this to the g and h deformations. At each nonterminal stage, finite CW models are available; no claim is made that free path spaces are finite CW. The lower empty and terminal point strata extend every comparison uniquely. QED.

### Independent obstruction audit
The rectification does NOT follow from [gf]=[hg]=0 separately in Ho(Top). It uses θ=0 in Ho(Top^[1]). For the spheres (2,η_3,2), P3 holds and gf,hg are separately null, but P2 fails by the nonzero Toda class, agreeing with S036 T77/T78 and showing why the missing derived-arrow hypothesis is indispensable.

## T88 — exact HI=IHC formula for ALL four-stage diagrams against the point filtration
**Theorem (internally proved).** Under the setting above,
  d_IHC(F,G) = d_HI(F,G) =
  0       if P0;
  1/2     if not P0 and P1;
  1       if not P1 and P2;
  3/2     if not P2 and P3;
  2       if not P3.
Every value in the formula is ATTAINED as a strict interleaving after an objectwise-equivalent replacement. No such equality is asserted for arbitrary G or longer chains; d_HC may be smaller, as in the LS Toda benchmark.

**Necessity, including real boundaries.** An ε-IHC interleaving factors the canonical shift η_F^(2ε) through G^ε in Ho(Top^R), because its first identity is ψ^ε φ=η_F^(2ε). Restriction to each integer stage, or to the arrow on times {0<1}, preserves objectwise weak equivalences and thus gives valid necessary equalities in Ho(Top) and Ho(Top^[1]). For 0≤ε<1/2, each Xi→Xi at t=i is identity (since 2ε<1); this factorization through a point implies all Xi weakly contractible, P0. For 1/2≤ε<1, evaluation at t=0,1,2 gives f,g,h respectively, so all null, P1. For 1≤ε<3/2, restriction to {0<1} gives exactly θ:A→B to C→D, since F(2ε)=C and F(1+2ε)=D, forcing P2 as an arrow morphism, NOT merely pointwise squares. For 3/2≤ε<2, evaluation at t=0 gives the composite hgf:A→D, forcing P3. At ε=2 all nonterminal targets are * and no condition is required. The lower bounds hold for arbitrary real ε, including each indicated strict inequality and all half-open stage endpoints. They also rule out smaller infimum through any unseen non-half-integer windows.

**Sufficiency, with BOTH strict identities.** Under P0, F→G is an objectwise weak equivalence; strict 0-interleaving of a point replacement. Under P1, change each of f,g,h by individual nullhomotopies to literal constant maps, using the single-edge path-space span from T87 repeatedly; hence η_F'^1 is pointwise the literal appropriate constant for every real t. Under P2 use T87, obtaining all length-two composites literally constant and hence all longer composites constant compatibly. Under P3 use the older S037 T82 composite-cofibration HEP argument: mapping-cylinder factor the first two arrows, deform the last h so hgf becomes literal constant. Thus η_F'^(2m) for m=1/2,1,3/2 respectively is a strictly compatible constant natural transformation wherever its codomain is nonterminal.

For any of these cases put φ:F'→G^ε equal to the unique map to the point wherever defined, and put ψ:G→F'^ε equal to one family of compatible selected points. Choose x0∈A and propagate x1=f'(x0), x2=g'(x1), x3=h'(x2); at times t≥0 the section picks the propagated point of F'(t+ε), with the basepoint in the terminal point stalk and empty-domain maps unique. This is a STRICT natural transformation on all reals. The composition ψ^εφ is exactly η_F'^(2ε), since each surviving 2ε structure map is literally constant with value the propagated point; φ^εψ=η_G^(2ε) identically, including negative, boundary and terminal times. Therefore the claimed strict ε-interleavings exist. Since d_IHC≤d_HI and the necessary tests meet the sufficient thresholds, the formula follows. QED.

**Attainability of nonzero cases** (no need to claim new objects): P1 but not P0 e.g noncontractible spheres with constant arrows; P2 but not P1 e.g choose f nonnull and g constant; P3 but not P2 the original LS sphere/Toda example; not P3 e.g chains of identity maps of S^3. The P0 case all points. These exhaust the five numerical strata.

## T89 — precise obstruction for the next search
The two overlapping 2-step windows (gf,hg) in a four-nonterminal-stage *point-target* filtration can NEVER by themselves give d_HI>d_IHC: P2 is precisely the coherent joint condition and T87 rectifies it. The first potentially different point-target threshold with three overlapping length-two composites requires at least FIVE nonterminal stages A→B→C→D→E; then a morphism in Ho(Top^[2]) must be compared with simultaneous strict vanishing of the three composites after arbitrary diagram replacements. The two-arrow T87 lemma does not itself settle this. For arbitrary non-point targets even four stages are not excluded. No assertion that five stages suffice for a counterexample.

## Algebraic reserve T90 — hostile priority
Original LLO arXiv:2402.16624v4 §1.1 Problem1 fixes an interval class and k and explicitly studies k=0, referring to existing Koszul techniques for higher k. The programme's S018-T43/T44 already gave all-real rectangle transfer/field arithmetic; S037 T79–T81 supplied finite-grid F2 polynomial bit work; S038-T84 is their synthesis, not newly discovered here. SoCG2020 original DOI 10.4230/LIPIcs.SoCG.2020.22 Theorem12 gives weak exactness iff 2-grid rectangle decomposition, while Chachólski et al. FoCM2025 (doi 10.1007/s10208-024-09660-z) and Botnan–Oppermann–Oudot FoCM2025 (doi 10.1007/s10208-024-09672-9) supply substantial relative machinery but have differently scoped relative families. Asashiba et al 2023 also develops interval resolutions. No proof-level identity with our precise bit complexity input was established, and equally NO priority clearance: without an indispensable homotopical application T84 cannot be an HHA flagship. No unfounded assertion that the full arbitrary-family LLO Problem1 is solved.

## Frozen
S030 T66 full product-chain coherent integral Z splitting including composites/Q/all prime fields preserved, original Höppner–Lenzing 1981 full JPAA proof UNINSPECTED. S023 strict R5 16,471 pairs OPEN. S028 validated Hopf benchmarks retained, proposed flagship RETIRED. No Lean, Palomar, manuscript, arXiv, HHA or third-party communication.
