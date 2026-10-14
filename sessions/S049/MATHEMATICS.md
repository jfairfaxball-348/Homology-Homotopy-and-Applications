# S049 mathematics — explicit grid lifting and cofinal rational threshold tests

## Fixed context and evidence class

All claims below refer to the unchanged five-stage original F, G and S048 rational definition GRID(r,s): 2epsilon=r/s reduced, L=5s, A^s_j=F_(j/s) for 0<=j<=L, and ONE K~A^s strict [L]-diagram via whole-diagram objectwise-WE zigzag, terminal K_L=literal point, coherently propagated x_j, and every literal length-r constant K_(j->j+r)=x_(j+r) for 0<=j<L-r. Extend K to all j>=L by point. No one may replace these literal constraints by independent nullhomotopies.

T108 (whole-real point-lane collapse), T112 (strict attained rational HI iff GRID) and the original bracket transport/zero-exclusion are inherited INTERNAL/source-dependent; independent total model/category and Adams certification is still incomplete. No new unconditional exact HI distance follows.

## T116 — direct rational GRID monotonicity via finite resampling (PROGRAMME_PROVED, internal)

**Statement.** Suppose GRID(r,s) holds, and let r',s'>0 be coprime with r'/s'>=r/s. Then GRID(r',s') holds. The proof uses no existence of any additional topological maps beyond the original witness and does not require T108.

**Construction.** Set L=5s, L'=5s', and define sigma:[L']->[L] by sigma(j)=min(L,floor(sj/s')). Given a GRID(r,s) witness (K,x), put K'_j=K_sigma(j) with the precomposed arrows; put x'_j=x_sigma(j). Because sigma is nondecreasing and sigma(L')=L, K' is a strict [L']-diagram with literal terminal point and propagated x'. Pull back the ENTIRE zigzag of objectwise weak equivalences for K~A^s along sigma, not unrelated maps at individual vertices. For 0<=j<L', floor(sigma(j)/s)=floor(j/s') (both before the terminal), so A^s_sigma(j)=A^{s'}_j *literally*, including the half-open stage boundaries and the terminal point. Thus K'~A^{s'} as one strict zigzag.

For a nonterminal GRID(r',s') equation, j+r'<L', and put a=sigma(j), b=sigma(j+r'). Since (s r'/s')>=r, floor(s(j+r')/s') >= floor(sj/s')+r. After capping by L, b>=min(L,a+r). If a+r<L, the original K_(a->a+r) is literally constant to x_(a+r), so its composite to K_b is literally constant to x_b (because x propagates); if a+r>=L, b=L and the map lands in literal point, hence is constant. In either case K'_(j->j+r') is the required literal constant to x'_j+r'. Thus all equations, one compatible vertex family and the whole-diagram WE condition hold simultaneously. QED.

This is a directed **witness transfer**, not an algorithm finding the initial witness. Its converse is not established.

**Explicit 5/4 to 4/3 test.** For (r,s)=(5,2), (r',s')=(8,3), sigma(j)=floor(2j/3) for j<=15. The seven j=0..6 constraints correspond to (a,b): (0,5),(0,6),(1,6),(2,7),(2,8),(3,8),(4,9). Each factors through an original a->a+5 literal constant; the two length-six cases use the subsequent propagated map. No point-set monomorphism is introduced. So any endpoint K automatically yields an explicit 15-vertex GRID(8,3), but existence remains unknown.

## T117 — exact single cofinal grid family for infimum 5/4 (PROGRAMME_PROVED conditional on T108/T112)

Define for m>=1
  r_m=10m+1, s_m=4m, epsilon_m=r_m/(2s_m)=5/4+1/(8m).
The positive numbers r_m,s_m are coprime: gcd(r_m,m)=1 since r_m=10m+1. Any prime dividing gcd(r_m,4m) would then divide 4; this is impossible because r_m is odd. The GRID has L_m=20m vertices plus terminal and L_m-r_m=10m-1 nonterminal literal constant constraints.

Under the inherited T108/T112 and the pre-existing dHI>=5/4, the following are equivalent:
(a) dHI(F,G)=5/4, with no assertion of attainment;
(b) GRID(10m+1,4m) holds for every m>=1;
(c) GRID(10m+1,4m) holds for arbitrarily large m.

Proof: (a) implies each epsilon_m>inf E is in the upward-closed feasible HI set E, and T112 gives (b). (b) trivially implies (c). If (c), feasible epsilon_m occur arbitrarily close to 5/4 from above, so dHI<=5/4; combine with the inherited lower bound to get (a). Moreover if ANY specified m has an impossible GRID(10m+1,4m), monotonicity and T112 imply dHI>=epsilon_m>5/4 (although equality/attainment at epsilon_m may vary). Conversely, a positive GRID(5,2) implies all the family via T116. No finite number of positive grid tests determines the infimum; no claim of compactness of witnesses of growing size is made.

## T118 — exact source/target stage-types throughout 5/4<epsilon<3/2 (PROGRAMME_PROVED, elementary)

Write delta=2epsilon so 5/2<delta<3 and let t>=0 satisfy t+delta<5. Then t<5-delta lies in (2,5/2). The only possibilities for the pair (floor(t),floor(t+delta)), using the original filtration stage indices, are:
 (0,2): 0<=t<3-delta;
 (0,3): 3-delta<=t<1;
 (1,3): 1<=t<4-delta;
 (1,4): 4-delta<=t<2;
 (2,4): 2<=t<5-delta.
All five ranges are nonempty throughout the OPEN interval. Proof: write t=i+u with i=0,1 or 2 and 0<=u<1; floor(t+delta) jumps from i+2 to i+3 exactly at u=3-delta (if the latter target occurs before the terminal cut); i=2 has only terminal-truncated lower piece. The intervals above partition [0,5-delta) exactly, respecting half-open boundary equality. QED.

Consequently, 4/3 is NOT a threshold forced by a change in the list of stage-pair types; a genuine 4/3 transition, if any, requires homotopical/coherence information beyond original filtration stages. All five source-target composites are null in the HOMOTOPY CATEGORY for the original chain: three adjacent pair composites 2 theta4, theta4², 2 theta4, and the two three-arrow composites factor through these. This checks only pointwise primary nullity; it is not a global GRID strictification.

For epsilon=4/3: delta=8/3, L=15, r=8. The seven j->j+8 arrows have stage types in order (0,2),(0,3),(0,3),(1,3),(1,4),(1,4),(2,4). For epsilon_m in T117, their five type counts are respectively 2m-1, 2m+1, 2m-1, 2m+1, 2m-1; the sum is exactly 10m-1. This is verified symbolically from the five intervals by multiplying their lengths by s_m=4m, and independently spot checked for m<=8.

## Unrestricted GRID(5,2) attack: route A (constructive) and route B (obstruction)

**Route A: mapping cylinders / path spaces.** Write e_i:K_(2i)->K_(2i+1), each a WE in any endpoint GRID because its original A-arrow is identity, and d_i:K_(2i+1)->K_(2i+2), representing one of the four primitive sphere-chain maps. The five required strict arrows have alternating shape
 e2 d1 e1 d0 e0 (j0), d2 e2 d1 e1 d0 (j1), e3 d2 e2 d1 e1 (j2), d3 e3 d2 e2 d1 (j3), e4 d3 e3 d2 e2 (j4).
These are all in ONE chain; j1 and j3 are especially important triple-primitive overlap conditions. Individual nullhomotopies for these composites exist in Ho(Top), but the five separate choices need one compatible zigzag and propagated vertex. Applying local HEP to a chosen cofibration can force a single map constant (T115), yet subsequent halfstage maps cannot all be forced injective (T114). Trying cylinders at j0,j2,j4 does not supply a common solution for j1,j3 or a natural comparison after altering overlapping maps. We found no explicit K for the original spheres.

**Route B: relative three-cell obstruction.** A legitimate relative DKS/BJT calculation must start with a category encoding five marked zero/constant composites, with a compatible objectwise WE lift of the whole chain, a pointing/whiskering system, and a fibrant/cofibrant mapping-object construction *in that relative category*. One must compute boundary null tracks at j0,j2,j4, the compatibility constraints at j1,j3, then a fully specified tertiary obstruction and its indeterminacy under changes of weak-equivalence zigzag. Simply applying the original nonzero fourfold Toda to the even-chain without verifying the three e2,e3,e4 injectivity hypotheses reproduces the restricted T114 only, not an unrestricted obstruction. No actual relative cocycle, its target group, or its zigzag invariance was computed; claiming a nonzero class would be unjustified.

**Nonmono cancellation diagnostic.** Let B=S^n wedge an interval at the sphere basepoint, p:B->S^n collapse the interval, a WE but not injective. Let f:S^m->B be any nonconstant map with image within the interval. Then p f is literally constant while f is not. This exact topology control demonstrates that the naive inference “postcomposition by a WE has constant composite, so original map constant” is false; it does not provide the requested five-sphere K.

## Exact open frontier and hypotheses

GRID(5,2) for arbitrary nonmonic K; GRID(8,3); a relative invariant 3cell and its full pointed/unpointed transport; positive epsilon in (5/4,3/2); dHI exact/endpoint attainment remain OPEN. T116-118 are internal elementary reductions, not new HHA publication-certified original discoveries. Frozen T66: all primitive and composite arrows, Q and every F_p, one coherent integral Z split, original1981 proof/priority caution. Strict R5 16471 OPEN; Hopf HHA flagship retired, T84 derivative. G2 not started; no Lean, Palomar, manuscript, arXiv, journal or third-party action.
