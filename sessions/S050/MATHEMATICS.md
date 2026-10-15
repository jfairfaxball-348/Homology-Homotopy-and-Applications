# S050 mathematics — tail-collision criterion, independent overlap relations, and the relative zero category

## Scope and fixed inherited assumptions

Let X0=S^160 --2--> X1=S^160 --theta4--> X2=S^130 --theta4--> X3=S^100 --2--> X4=S^100, with the fixed half-open F and literal point/empty G. Retain T108 whole-shoelace point-lane collapse, T112 rational GRID equivalence, T113 infimum, T116 monotonicity, T117 cofinal family, T118 five types, all INTERNAL. Nonzero <2,theta4,theta4,2> and natural transportation of zero-exclusion through arbitrary unpointed whole-[L] WEs are SOURCE-DEPENDENT (published Wang–Xu/IWX plus not-yet-complete comparison), not newly proved Adams/Moss or pointed comparison. The following T119 uses precisely this latter premise; label its final contradiction CONDITIONAL.

## Endpoint all-five equations, including j=1,3

For [10] K put e_i:K_(2i)->K_(2i+1) WE (i=0..4), d_i:K_(2i+1)->K_(2i+2) (i=0..3), a_i=d_i e_i. The five exact, basepoint-propagated length-five relations, **not only the three even-start relations**, are:

j=0: e2 a1 a0 = constant x5;
j=1: a2 a1 d0 = constant x6;
j=2: e3 a2 a1 = constant x7;
j=3: a3 a2 d1 = constant x8;
j=4: e4 a3 a2 = constant x9.

The e_i are weak equivalences because the original halfstep maps are identities, but they need NOT be injective. The j1 and j3 equations are not automatic from j0,j2,j4 in arbitrary weak-equivalence chains, as T120 exhibits. Homotopy nullity or multiplying an equation by e0/e1 is not literal cancellation of e0/e1.

## T119 — necessary collision on a *particular image* for every strict rational 1<epsilon<3/2 (PROGRAMME_PROVED CONDITIONAL)

Let r,s be positive coprime with 2s<r<3s, L=5s, and assume a GRID(r,s) witness K~A^s, with propagated vertices x. For i=0,1,2 set
P_i = K_(is -> (i+2)s) : K_is -> K_(i+2)s,
V_i = K_((i+2)s -> is+r) : K_(i+2)s -> K_(is+r).
Because 2s<r<3s, source is is, target is+r within **the same (i+2)-nd original X-stage**, strictly before (i+3)s and before L. Thus V_i is a WE as an arrow of the single whole-[L] zigzag, though not necessarily a monomorphism.

The strict GRID equation at j=is forces V_i P_i to be the literal constant x_(is+r). If each restriction V_i|_(im P_i) were injective as a set map, P_i would itself be literally constant: any y,z in im(P_i) have the same V_i image and hence y=z. Its unique image would be x_((i+2)s), by propagation. All three pair composites P0,P1,P2 in the ONE sampled five-object chain
K_0 -> K_s -> K_(2s) -> K_(3s) -> K_(4s)
would then be strictly pointed constants. Their trivial compatible null tracks would put zero in the original fourfold Toda bracket after restricting the SAME whole-diagram WE zigzag and applying the inherited pointed/stable invariance. This contradicts the retained source-dependent zero-exclusion. Therefore **at least one** i has two distinct elements y,z of im(P_i) with V_i(y)=V_i(z)=x_(is+r). This is an *on-image noninjectivity*, stronger than a generic nonmonic tail. It does not identify i, compute a homotopy obstruction, or prohibit K.

Concrete: GRID(5,2) has tails V_i of one halfstep (4->5,6->7,8->9), recovering and strengthening restricted T114. GRID(8,3) has tails of two within-stage WEs, (6->8,9->11,12->14). All cofinal (r_m,s_m)=(10m+1,4m) have tail length r_m-2s_m=2m+1 <s_m=4m (m>=1). Thus EVERY single potential above-endpoint/cofinal witness must exhibit an explicit image collision in one of its three tails. No finite amount of checking these necessary conditions proves a GRID absent or present.

This argument does not infer that arbitrary projective cofibrant replacement of K preserves constants; it does not. It excludes a **witness whose three tails are injective on the specified images**. In particular, a levelwise-injective filtered chain cannot serve as K, but arbitrary weak equivalences remain possible.

## T120 — even-start relations do not entail intermediate relations (PROGRAMME_PROVED elementary countermodels)

Take the pointed unit interval I=[0,1] at every K0,...,K_(L-1), terminal KL literal point, with x0=0. Put each internal arrow u_h:K_h->K_(h+1) either id_I or the constant-zero map z. Both are weak homotopy equivalences between contractible connected spaces and preserve 0; all propagated x_j=0. A composite u_(j+r-1)...u_j equals z iff the word includes at least one z, otherwise identity.

For endpoint (L,r)=(10,5):
* Put z at u0 and u6, all other internal u_h=id. j0,j2,j4 are z but j1 is identity and violates the required literal constant.
* Put z at u2 and u8, others id. j0,j2,j4 are z but j3 is identity and violates its constant.
Thus neither j1 nor j3 follows from j0,j2,j4 even in a fully pointed chain with all halfstage e_i WE and literal terminal point.

For GRID(8,3), (L,r)=(15,8), put z at u0 and u10, others id; j0,j3,j6 are all z (since each word respectively contains u0 or u10 for j3 and j6? ATTENTION: j6->14 uses u6..u13 and therefore contains u10; yes), while j1->9 is identity. In fact the finite exhaustive checker below exhibits counterexamples for each omitted j=1,2,4,5. These are **toy contractible diagrams**, NOT WE replacements of original noncontractible S^160/S^130/S^100. They refute a faulty simplification only; not a strict GRID witness for F.

## T121 — exact *relative zero-category* reformulation; NOT a computed 3-cell (PROGRAMME_PROVED categorical equivalence)

Define a finite category Z_(L,r) enriched in pointed sets, with objects 0,...,L, identity at each object, a formal zero morphism 0_(ij) for every ordered pair, and for i<j a nonzero morphism p_(ij) exactly when j-i<r. Composition of nonzero paths is p_(ik) if k-i<r and the formal zero 0_(ik) otherwise; composing with a formal zero gives zero. Let p:[L]->Z_(L,r) be the ordinary functor taking the unique increasing morphism i->j to p_(ij) when j-i<r, otherwise to the formal zero. There is a *pointed-set-enriched* functor category of Z_(L,r) diagrams in based sSet or based compactly generated spaces which sends each formal zero to the basepoint map.

A based strict representation D of Z_(L,r) with D(L)=literal point has underlying ordinary [L] diagram K=D p with **all** prescribed length-r arrows literal zero. Conversely an arbitrary GRID(r,s) pair (K,x0) canonically gives basepoints x_j by propagation and induces precisely such a D: any longer map is zero because it factors through the prescribed length-r zero arrow; the literal point terminal poses no exception. These constructions are inverse on the strict objects, and forgetting the pointings recovers exactly the original GRID witnesses.

After localizing [L]-diagrams at WHOLE-DIAGRAM objectwise weak equivalences, GRID(r,s) is therefore equivalent to A^s belonging to the essential image (on objects) of the restriction/forgetting functor from the full groupoid of such pointed Z-diagrams with D(L)=point to the unpointed [L]-diagram localization. This criterion is invariant **by construction** under replacing the target A^s by any whole-diagram WE zigzag, since it is a property of the target's equivalence class. It explicitly accommodates nonmonic arrows, and unlike a vertexwise Ho(Top) condition it remembers the entire diagram.

Crucial limits: This is a fully specified **recognition/lifting category**, not a computed homotopy fiber, mapping-space cofibrant/fibrant replacement, relative DKS cocycle, canonical boundary S²->Map, target π2 group, or indeterminacy. The naive ordinary 4fold Toda of even vertices does not automatically define the obstruction in Z_(L,r). Simply connected sphere stages make individual basepoint choices path-connected, but this alone is NOT an independently proved strict natural pointing equivalence for arbitrary UNPOINTED zigzags. The formulation deliberately forgets pointings at the target; deriving a pointed comparator and transporting Adams/Moss brackets for every zigzag is still open.

## GRID(8,3) test — all seven obligations, none discharged for fixed spheres

L=15,r=8, so the seven required j->j+8 literal zero composites are
0->8 (X0->X2), 1->9 (X0->X3), 2->10 (X0->X3),
3->11 (X1->X3), 4->12 (X1->X4), 5->13 (X1->X4), 6->14 (X2->X4).
All source and target refer to ORIGINAL stage types only, not assumed maps in K. In particular j1,j2,j4,j5 are genuine extra equations. The three tail WE maps required by T119 here are 6->8,9->11,12->14. The point-set interval toy countermodels show why they cannot be discarded. Nothing here proves or excludes an all-[15] WE to A^3 or the seven simultaneous nulls; the same bracket-based injectivity obstruction has no converse.

## Unrestricted constructive and 3-cell attempts — honest failure

Attempt A: introduce mapping-cylinder/path-space replacements near 4->5,6->7,8->9 and use T115 to kill one chosen nullhomotopic composite. A replacement of e2 or d2 changes the adjacent j1 and j2 relations; requiring all three tails injective would contradict T119, while allowing collapse does not supply a comparison of *all* five relations. No maps of the actual spheres completing a strict K were obtained.

Attempt B: try null tracks H_j for each of the five long zero relations in a fibrant mapping space, compare the two ways to null each overlap i<j< i+r, and then take tertiary compatibility around triples. A candidate secondary discrepancy lies in π1 Map_*(Q_i,R_(j+r)), and a candidate tertiary boundary in π2 Map_*(Q_i,R_(k+r)); however no relative cofibrant resolution of Z_(L,r) over the prescribed unpointed source zigzag, no coherent choice of all overlap fillers, no actual S² boundary, and no indeterminacy quotient were computed. THESE ARE SCHEMATIC TARGETS, NOT DEFINED OBSTRUCTION CLASSES, and may change when the needed relative resolution is chosen. Original BJT §7.A already develops genuine four-map operations. Do not infer a contradiction from a nonexistent computed cocycle.

## Distance, originality and frozen targets

No actual unrestricted GRID(5,2) or GRID(8,3) yes/no result; no negative rational grid above 5/4; no positive infinite cofinal family. Thus cannot improve source-dependent 5/4<=dHI<=3/2, decide endpoint attainment or dHI infimum. The finite map tests below are not topology evidence. No new flagship/HHA suitable novel theorem certified; first novelty gate NOT_STARTED. Preserve T66 full primitive/composites, Q/all Fp plus coherent Z splitting and original1981 priority caveat, R5 16471 OPEN, Hopf retired, T84 derivative.
