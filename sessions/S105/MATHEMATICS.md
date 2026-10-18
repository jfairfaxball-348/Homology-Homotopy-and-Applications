# S105 MATHEMATICS — relative-fiber kernel succeeds; finite nonclock persistence challenge fails

## Exact setting and inherited CW input
All claims INTERNAL and not machine formalised. Work first in based compactly generated weak Hausdorff spaces or based simplicial sets with weak homotopy equivalences, and homotopy-coherent derived functors. A square Q=(A→B,A→C,B→D,C→D) is a strict based square. Put P_Q=hocolim(B←A→C) and let u_Q:P_Q→D be the canonical comparison in the homotopy category, modelled by functorial projective/cofibrant replacements. This is a map in the derived arrow category, not just two unconnected homotopy types. Its homotopy fiber E_Q=hofib(u_Q) has a canonical homotopy fiber-to-P_Q map. For connected based diagrams the homotopy LES supplies

 O_n(Q):=im(pi_n E_Q→pi_n P_Q)=ker(pi_n P_Q→pi_n D), n≥2.

The *subgroup with its embedding into pi_n(P_Q)* (more naturally the isomorphism class of the kernel-in-source pair) is the invariant. The bare homotopy type of E_Q alone is NOT asserted to distinguish diagrams.

### T264 — whole-square weak-equivalence invariance, without a chosen filler
An objectwise based weak-equivalence natural transformation Q→Q' induces weak equivalences hocolim(B←A→C)→hocolim(B'←A'→C') and D→D', compatible with the comparison map in the derived arrow category. After homotopy pullback along *→D, the induced fibers are weakly equivalent (right derived pullback). The two pi_n rows and comparison maps commute. Thus O_n(Q) identifies naturally with O_n(Q'), embedded in pi_n(P), for all n≥2. An arbitrary zigzag has the same effect. No preferred nullhomotopy is selected. This is standard homotopy-fiber LES and homotopy-(co)limit functoriality, not an independently novel homotopy theory theorem. No claim is made that arbitrary unpointed/non-connected diagrams inherit a canonical basepoint identification.

### T265 — S104 mixed pair is separated by the relative-fiber boundary
Recall A=S6, B=A∨S7_b, C=A∨S7_c, P=S6∨S7_b∨S7_c. Define alpha=[j_b,j_c]∘eta²_13:S15→P. Hilton's basic mixed [b,c] summand pi15(S13)=Z/2 contains alpha nontrivially. Let D0=P∨S16 and D1=P∪_alpha e16, each giving a literal cofibration square Q_i. Their incoming homotopy pushout is P. The relative homotopy LES (D_i,P), whose relative pi16 is Z with attaching boundary 0 or alpha, gives

 O_15(Q0)=ker(pi15(P)→pi15(D0))=0,
 O_15(Q1)=ker(pi15(P)→pi15(D1))=<alpha>≅Z/2.

Thus the derived relative fiber diagram detects an intrinsically mixed attaching class that the *bare* total cofiber S16 forgets. In the long exact fiber sequence, the image of pi15(E_Q1)→pi15(P) is precisely <alpha>; no unexplained secondary choice or indeterminacy is introduced. Collapsing either private sphere sends alpha to zero. The statement is invariant under arbitrary entire-square objectwise WE zigzags, but is elementary relative CW homotopy, NOT a first HHA theorem.

## Finite full-real two-parameter test (literal CW and all boundaries)
Fix real L>1. For i=0,1 define F_i^L:R²→Top_* by:
- if x<-1 or y<-1 or x≥L or y≥L: F_i^L(x,y)=*;
- if -1≤x<0 and -1≤y<0: A;
- if 0≤x<L and -1≤y<0: B;
- if -1≤x<0 and 0≤y<L: C;
- if 0≤x<L and 0≤y<L: D_i.

For t≤s the structure map is identity in a grade region, the indicated composite of CW inclusions A→B,C→D_i within [-1,L)², or the unique based constant map whenever the source or target is *. This is well-defined and strictly functorial: any path among occupied regions is a composite in the commuting CW square; once an upper coordinate reaches L no later point reenters support; entering from x<-1 or y<-1 starts at *. Both axes genuinely introduce private H7 classes, and the mixed attaching map uses both. All values are finite based CW and all nonzero support is contained in a bounded real rectangle (not necessarily a sublevel-set inclusion filtration: deaths are collapse maps). We do not claim all maps are inclusions.

### T266 — entire primary persistence package agrees
All F0^L and F1^L vertices have naturally isomorphic integral graded homology, cup products and mod2 primary Steenrod diagrams, including EVERY arrow: inside the support this follows S104 T260, entering and exiting maps have zero reduced maps on either side. In particular d_I(H_*(F0^L;Z),H_*(F1^L;Z))=0, and the natural primary diagrams agree on the nose up to canonical generator identifications. This does NOT assert equality of homotopy-category interleaving d_IHC.

### T267 — finite TWO-SIDED homotopy interleaving bounds, but only clocks
Let d_HI^*(F0^L,F1^L) denote diagonal-shift homotopy-interleaving distance for based R² diagrams allowing arbitrary whole-diagram objectwise WE zigzags (all reals). Then

                         L/2 ≤ d_HI^*(F0^L,F1^L) ≤ (L+1)/2.

UPPER: For any t in the support, t+(L+1,L+1) is outside support. Thus both structure maps F_i(t)→F_i(t+(L+1,L+1)) are literally based constant, and outside support every source already is *. At epsilon=(L+1)/2 the zero natural transformations F0→F1(epsilon) and F1→F0(epsilon) are an actual STRICT epsilon-interleaving: BOTH composites equal the prescribed 2epsilon structure maps on every real grade. Hence the same upper bound for homotopy interleaving, with no replacements required.

LOWER: If 0≤epsilon<L/2, choose 0<t_x,t_y<L-2epsilon. Then t,t+epsilon,t+2epsilon all lie in the open D-plateau (0,L)². Any homotopy interleaving after arbitrary objectwise WE replacements yields the two shift identities in Ho(Top_*) at t. By naturality along t≤t+epsilon within constant-identity plateaux, the forward and reverse maps are independent of t in the homotopy category, so their composites give identity on D0 and identity on D1. Thus D0≃D1. This contradicts S104 T262, since |pi15(D0)|=2|pi15(D1)|. The reasoning uses the *entire* diagram and both interleaving identities and survives all objectwise-WE zigzags. Therefore no epsilon<L/2 works, and the infimum is at least L/2.

BOUNDARY: At epsilon=L/2 the above choice of t is impossible, so this proof asserts neither attainment nor strict inequality; d_HI may lie anywhere in the closed interval. At epsilon=(L+1)/2 the zero interleaving is attained. No exact distance claim.

### T268 — explicit FAIL of nonclock/HHA target, not of T264–T267
Although both axes have genuine changes and all real boundaries are valid, the quantitative bound is precisely a *terminal plateau lifetime* obstruction plus generic zero-interleaving half-support-span. Replacing mixed alpha by ANY two non-equivalent finite CW terminal spaces with isomorphic primary data yields the same bounding argument. It does not isolate a persistent crossed-bracket obstruction after removing individual pulse clocks, and therefore FAILS the specific S105 non-clock application gate. In particular:
- It is a positive **finite** comparison d_HI^*>0 versus d_I(H_*)=0 of different invariants, not d_HI>d_IHC in one category.
- It says nothing about unpointed Top^R strict HI>IHC, which remains OPEN.
- Merely changing box lengths or replacing alpha by higher Whitehead operations cannot make the same clock argument a novel HHA theorem.

## Adversarial verdict / next route
T264–T267 are internally proved classical consequences; T268 kills the claimed novelty/significance of the S104→S105 relative-fiber-and-bounded-support approach. No stability theorem beyond the basic diagram-derived invariance of a kernel is claimed. Source-first Gate G2 HHA NOT PASSED. S106 is a DIFFERENT route: seek finite vertexwise-weak-equivalent *but whole-diagram inequivalent* coherence examples with controlled shifts, so a terminal-plateau weak-type mismatch cannot supply the lower bound. Proof first, novelty audit next; no Lean or external actions.
