# S048 mathematics — rational strict-grid criterion and cofibrancy obstruction

## Fixed objects, previously established input, and evidence standard

Keep **unchanged** F: X0=S^160 --2--> X1=S^160 --theta4--> X2=S^130 --theta4--> X3=S^100 --2--> X4=S^100, F_t=X_i on half-open [i,i+1), F_t=* from t=5, F_t=empty for t<0. G_t=* for t>=0, otherwise empty. All strict homotopy interleavings use one whole-real objectwise-WE replacement zigzag of each lane, both naturality equations N-a/N-b and both shift identities I-F/I-G at **every** cut. The all-replacement, simultaneous contractible-G'-collapse T108 is INTERNAL standard-model-category reasoning (S046) and remains a stated prerequisite. IWX full zero-excluded fourfold Toda input and unpointed/stable transport remain published-source-dependent, not independently reconstructed.

No actual GRID witness or general no-go was constructed in S048. Earlier dIHC=1 and [5/4,3/2] HI bounds are retained only at their earlier INTERNAL/SOURCE-DEPENDENT grade.

## T112 — exact rational-grid equivalence (INTERNAL; conditional on T108 for necessity)

Let epsilon>0 be rational, write 2epsilon=r/s in lowest positive terms r,s and set L=5s. Define A^s_j=F_(j/s) for j=0,...,L (hence A^s_L=point), a strict finite [L]-diagram, with A^s_j=X_floor(j/s) for 0<=j<L. Define GRID(r,s) by the existence of:

(i) a **single** strict [L] diagram K with K_L=literal point and a WHOLE-[L]-diagram objectwise-WE zigzag K~A^s;

(ii) one vertex x0 in K0 with x_j=K_(0->j)(x0) propagated to all later j;

(iii) all literal equations K_(j->j+r)=constant_to_x_(j+r) for integers 0<=j<L-r. For j+r>=L they are automatic after extending K by point, so no extra nonterminal equations are being hidden.

**Theorem.** Under T108, the original pair (F,G) admits an attained strict epsilon-homotopy interleaving with arbitrary diagram replacements if and only if GRID(r,s) is true.

Necessity. Apply whole-real T108 to an arbitrary epsilon strict interleaving to obtain (H,point), objectwise-WE to (F,G), with H_(t->t+2epsilon) literally constant for every t>=0. Restrict H to j/s for 0<=j<=L. The terminal H_5 is weakly contractible: replace only that terminal object by literal point, mapping every previous H_j to it by the unique arrow. This is a whole-[L]-diagram objectwise-WE transformation, not an isolated replacement of a middle arrow. Pick x0 in H_0, propagate x_j. For 0<=j<L-r, the strict 2epsilon arrow at j/s equals K_(j->j+r) and is constant; its value is necessarily x_(j+r) by applying it to x_j. Thus all simultaneous equations hold. Negative times do not enter the finite restriction. Nothing requires point-set representatives of F to remain fixed.

Sufficiency. Extend K to the nonnegative integer line by K_j=point for j>=L and all terminal maps unique; this extension and the analogous A^s extension are whole-diagram weak-equivalent because the tail is terminal point. Define H_t=empty for t<0 and H_t=K_floor(st) for t>=0. Because F_t=A^s_floor(st), the finite zigzag extends to all reals via the monotone floor functor, including every half-open boundary. Keep G literal empty/point. Define a_t:H_t->G_(t+epsilon) uniquely. For t>=0 define b_t:*->H_(t+epsilon) to select x_floor(s(t+epsilon)); for negative source define the unique empty map. N-a automatic; N-b holds since x_j are propagated coherently. The arithmetic identity floor(s(t+2epsilon))=floor(st+r)=floor(st)+r holds for **all** real t, not just a sampled mesh. Thus, for every t>=0, H_(t->t+2epsilon) is one of the specified literal constants (or a unique tail-point map), equal to b_(t+epsilon) a_t. I-G is the identity on point for t>=0 and unique empty map for t<0. Both naturalities across t=0 and all half-open boundary cuts are preserved. Hence this is a strict whole-real epsilon interleaving with both identities. QED internally.

Special cases: epsilon=5/4 gives 2epsilon=5/2, L=10, r=5 and **five** nonterminal equations, exactly S047 T111. epsilon=4/3 gives (L,r)=(15,8) and seven equations; epsilon=7/5 gives (25,14) and eleven; epsilon=3/2 gives (5,3) and two. This theorem does **not** give existence of any of these K.

## T113 — exact rational infimum criterion (INTERNAL; no attainment assertion)

Let E be the set of all real epsilon>0 for which the strict interleaving exists with allowed replacements. Standard interleaving monotonicity gives that if epsilon lies in E, every epsilon'>epsilon lies in E. Given any epsilon in E and eta>epsilon rational, eta lies in E. Therefore inf E=inf(E intersect Q_>0), with the convention inf(empty)=+infinity. T112 identifies membership in the rational set exactly with GRID(r,s). Hence

dHI(F,G)=inf { r/(2s) : r,s positive coprime, GRID(r,s) holds }.

This equality is INTERNAL and inherits T108 in using the rational grids; it is not an effective finite decision algorithm, since infinitely many grids may be needed. In particular, combining the inherited lower dHI>=5/4 with rational density and the upper dHI<=3/2:

dHI=5/4 (possibly unattained) iff every eta>5/4 admits a rational r/(2s) in [5/4,eta) with GRID(r,s) true.

The forward direction uses the definition of infimum plus density/monotonicity; the backward is elementary. At eta exact 5/4 the S047 GRID(5,2) tests **attainment**, a different question. Ruling it out alone does not establish dHI>5/4.

## T114 — necessary failure of simultaneous halfstage monomorphisms (INTERNAL conditional obstruction)

Assume the **same** original stable fourfold Toda chain, with the full zero exclusion and suitable pointed/stable transport of the bracket along the single [10] diagram WE zigzag as in S046. Suppose K solves GRID(5,2). Write u2=K_(4->5), u3=K_(6->7), u4=K_(8->9). If all three u2,u3,u4 are injective maps (degreewise monomorphisms in sSet, or underlying injective maps of spaces), then:

- K_(0->5)=u2 K_(0->4) is constant by GRID at j=0; injectivity of u2 forces K_(0->4) literally constant.
- K_(2->7)=u3 K_(2->6) is constant by GRID at j=2; injectivity forces K_(2->6) literally constant.
- K_(4->9)=u4 K_(4->8) is constant by GRID at j=4; injectivity forces K_(4->8) literally constant.

Thus the single five-object **even-indexed** chain K0->K2->K4->K6->K8 has all three adjacent two-arrow composites strictly constant. Choose the propagated x0 point and its images x2,x4,x6,x8: each forced constant must land at the corresponding propagated point. The three literal null-composites admit constant compatible null and higher tracks, so the pointed classical fourfold Toda bracket of this even-index chain contains zero. Restricting the **same** whole-diagram WE zigzag K~A^2 to even vertices transports that zero to <2,theta4,theta4,2>, contradicting the explicitly retained source-dependent zero exclusion/transport premise. QED conditionally.

**Consequence:** No successful K can be a projectively cofibrant sSet^[10] diagram with these strict constants, since projectively cofibrant diagrams on the ordered chain have degreewise monomorphic forward structure maps (equivalently, their direct-Reedy latching maps are cofibrations). A levelwise cofibrant or CW-valued K is NOT excluded. A projectively cofibrant replacement QK->K of an arbitrary successful diagram **does not** preserve its literal constant maps: the composites QK_(j->j+5) need only become constant *after* composing with QK->K. This is exactly why the theorem is NOT a universal GRID nonexistence proof. At least one of u2,u3,u4 must have actual noninjectivity on a relevant map image in any witness.

The three strict conditions j=0,2,4 already force the conclusion under the added monomorphism assumption; j=1,3 impose further coupled constraints, not yet analysed by a complete obstruction cocycle. No claim of a nonzero computed DKS relative class or a newly proved stable stem is made.

## T115 — local HEP-killing lemma and failure of naive global iteration (INTERNAL)

Let i:A↪Y be a Hurewicz cofibration, v:Y->Z a map, and suppose a **chosen** homotopy from v i to a specified constant c:A->Z is given. The homotopy extension property extends that homotopy from A to Y starting at v. Its endpoint v':Y->Z has v'i=c on the nose and v'~v. If v is a weak homotopy equivalence, v' is also a weak homotopy equivalence, by homotopy invariance and two-out-of-three. This is valid in unpointed spaces with a fixed constant target and in suitably cofibrant pointed models. It explains why one nullhomotopic pair-composite can be killed after arranging its **source→intermediate** map to be a cofibration.

But applying such a v' to force the first GRID equation typically destroys injectivity/cofibration of the next overlapping source-to-target map: otherwise T114 would simultaneously force the original nonzero fourfold bracket to contain zero. It is therefore INVALID to iterate T115 three times without a new compatible relative lifting theorem. A pullback of mapping cylinders independently at each of j=0,2,4 is not a global [10] solution. Similarly local nullity in Ho(Top), local threefold operations or a homotopy equalizer equality are weaker than simultaneous literal constants in one K.

## Open mathematical obligations

(1) Prove or disprove existence of arbitrary **noncofibrant** GRID(5,2) K, including j=1,3; T114 kills only the all-three-mono subcategory.
(2) Exhibit a full-real strict epsilon interleaving for some rational epsilon in (5/4,3/2), or a real-parameter independent relative 3-cell obstruction applicable to all such epsilon. GRID(8,3) at epsilon4/3 is a useful finite test but has not been decided.
(3) Decide whether epsilon5/4 is attained, and separately whether it is the infimum; T113 gives precise quantifiers, not a decision.
(4) Independently audit LS poset projective model conditions over whole reals; zero exclusion including h5 n and stable-to-unstable transports; relative DKS/BJT classical prior art and 2023–2026 Top-specific developments.

Frozen: T66 on all primitive/composite arrows and Q/every F_p plus ONE coherent Z split remains INTERNAL; original Höppner–Lenzing1981 full JPAA proof not read. Strict R5 16,471 candidates OPEN. Hopf examples retired as HHA flagship; T84 retained. No Gate2, Lean, Palomar, paper, arXiv, HHA or third-party action.