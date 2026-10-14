# S046 mathematics — contractible-lane collapse and a strict quantitative separation

**Status:** T108/T109 are INTERNAL proof arguments using standard simplicial projective cofibrancy, left properness, stable bracket invariance and published original stable-stem tables; no machine or external referee verification. An exact dHI=3/2 proof or a strict target HI1 model has NOT been supplied. This is the first *source-dependent internal* positive distance gap for this programme, not an originality certificate.

## Fixed data, retained without changing one hypothesis

Let F be empty for t<0, equal to X_i on [i,i+1) for i=0,...,4, then point for t>=5; G is empty t<0, point t>=0. The fixed chain is
X0=S^160 --f0=2--> X1=S^160 --f1=theta4--> X2=S^130 --f2=theta4--> X3=S^100 --f3=2--> X4=S^100.
Primitive classes essential; adjacent composites homotopically zero; pi61^S=0 and the derived-[2] coherent null give dIHC=1 **INTERNAL** by S043 T100/T101. S042 T99 provides dHI<=3/2 via HEP; its former lower was rightly withdrawn in S043 because G' can be nonpoint. S044 T102 uses IWX2023 Table4/10 to exclude 0 from the classical <2,theta4,theta4,2> under published bracket conventions, not via a new Adams proof. All-Fp/all-composite/Q and one coherent integral Z splitting in frozen T66, its 1981 priority, strict R5 16471, retired Hopf, and T84 remain intact.

An epsilon strict homotopy interleaving requires arbitrary diagrams F'~F and G'~G by objectwise weak-equivalence zigzags in Top^R, and strict a_t:F'_t→G'_(t+epsilon), b_t:G'_t→F'_(t+epsilon) with BOTH shifted identities at EVERY real time and naturality for all s<=t. Its whole datum is one strict functor on the shoelace poset P_epsilon.

## T108 — simultaneous collapse of a weakly contractible G lane (INTERNAL, standard simplicial tools)

**Lemma.** Let epsilon>0 and let F',G' be a strict P_epsilon diagram, where G'_t is empty for t<0 and weakly contractible/nonempty for t>=0. Suppose the F'-lane is empty for t<0. Then there exists a strict P_epsilon diagram H_F,H_G, connected by objectwise weak-equivalence zigzags on each lane to F',G', such that H_G(t)=point for t>=0, empty t<0, and the *same epsilon* interleaving equations hold at all reals. H_F generally differs point-set-wise from F'. This is NOT unilateral G'→point with F' fixed.

**Proof, simplicial version.**
(1) Apply singular complexes to the entire strict shoelace, and take a projectively cofibrant replacement Q→Sing(D) in sSet^{P_epsilon}. This retains BOTH shifted identities, all naturality and ALL real cuts strictly, and produces objectwise weak-equivalence zigzags after realization. The category is small in a fixed universe. In a diagram of simplicial sets over a poset, each structure map of a projectively cofibrant diagram is a monomorphism: this is the filteredness assertion in original Lanari–Scoccola arXiv:2010.05378v3 Proposition 4.5 (or follows from projective cell attachments and the fact Hom_P(p,q) has at most one element). In particular, each G→F cross-arrow b_t:QG_t→QF_(t+epsilon), t>=0, is a simplicial monomorphism.

(2) For s>=epsilon let V_s be the simplicial subcomplex image of b_(s-epsilon):QG_(s-epsilon) ↪ QF_s. Each V_s is contractible in the weak homotopy sense: QG_(s-epsilon) is nonempty weakly contractible, hence V_s→Delta^0 a simplicial weak equivalence. Naturality N-b gives QF_(s→t)(V_s)⊆V_t for epsilon<=s<=t. We do *not* choose individual natural contractions.

(3) Define H_F(s)=QF_s/V_s (simplicial pushout QF_s ⊔_(V_s) Delta^0) for s>=epsilon; define H_F(s)=QF_s for s<epsilon. Quotient maps q_s form a strict natural transformation QF→H_F: for a crossing s<epsilon<=t use q_t F_(s→t), and for s>=epsilon<=t use the induced quotient morphism. Since V_s ↪ QF_s is a simplicial cofibration and V_s→Delta^0 is a weak equivalence, left properness of sSet ensures q_s is a weak equivalence. It is the **simultaneous alteration of the F row** that makes this legal; collapsing V_s while holding F fixed is generally invalid.

(4) Put H_G(s)=Delta^0 when s>=0, otherwise empty, with the evident functorial structure. Let a_s:H_F(s)→H_G(s+epsilon) be the unique arrow when target is point (and the empty-source arrow in negative cases). For s>=0 define b_s:Delta^0→H_F(s+epsilon) to be the distinguished quotient vertex of V_(s+epsilon). The b_s are natural because N-b maps V_s to V_t. When source is empty, use the unique map.

(5) I-F: for every real s>=0, QF_(s→s+2epsilon)=b_(s+epsilon) a_s (the original strict identity) has its image in V_(s+2epsilon). Therefore H_F_(s→s+2epsilon) is the *literal* constant map to the quotient vertex, equal to the new b_(s+epsilon)a_s. I-G: H_G_(s→s+2epsilon)=id_(Delta^0), equal to a_(s+epsilon)b_s. For s<0 the source is empty and both identities are the unique map. N-a is automatic for the unique maps to Delta^0, N-b by the V-inclusions, and all real same-lane naturalities already hold by the quotient construction.

(6) Realize the entire simplicial diagram. Geometric realization retains all strict equations, realization of q_s is an objectwise weak-homotopy equivalence, and |Delta^0|=point. The Sing/realization counits connect to the original diagram. Both lanes are related by full-diagram objectwise weak equivalences; no assumption of a coherent diagram-wide contraction of G' was used. QED internally.

**Hostile checks:** The proof needs *whole-shoelace* projective cofibrancy, not unrelated vertexwise CW models, so b_s are monomorphisms. Empty stages stay empty under objectwise weak equivalences. Quotients are assembled over *all real cuts*, not just integer times. The pre-quotient I-G identity is retained in Q by honest functorial replacement; it becomes automatic for the literal-point G quotient, not discarded. The changed F lane need not have the old point-set maps, but its homotopy diagram is unchanged by the natural objectwise weak-equivalence q. Nonpoint T107 is consistent: collapsing its G lane changes its F row and does not preserve its original nonconstant a0 or b0 maps pointwise. This is a standard model-category lemma, not asserted as original.

## T109 — rigorous range epsilon<5/4 excludes any target strict HI interleaving

**Statement (INTERNAL, source-dependent).** For the *unchanged* Wang–Xu sphere filtration against the original point G, no strict epsilon homotopy interleaving exists for any 0<epsilon<5/4, even after arbitrary full-diagram weak-equivalence replacements. Thus dHI>=5/4; combining S043 T101 and S042 T99 gives
              dIHC(F,G)=1  <  5/4 <= dHI(F,G) <= 3/2.
This does NOT assert dHI=3/2 or eliminate possible epsilon in [5/4,3/2).

**Proof.** Suppose some epsilon<5/4 works. By monotonicity of interleavings (shift both transformations and compose with internal structure maps), a strict epsilon<=1 interleaving implies a strict epsilon'=1 interleaving, which is still <5/4. Hence without loss 1<=epsilon<5/4. Apply T108 to obtain an objectwise weak-equivalent FULL real F-diagram H, strictly epsilon-interleaved with literal point G. Then for every real t>=0, the structure arrow H_(t→t+2epsilon) is literally a constant map (the I-F shifted identity).

Put c=2epsilon-2, so 0<=c<1/2, and sample *five* real times
   t0=0,   t1=1,   t2=2+c,   t3=3+c,   t4=4+2c.
For each i=0,1,2,3,4, t_i belongs to the ORIGINAL half-open cell [i,i+1): t4<5 uses c<1/2, with precise strict inequality. Moreover
t2-t0=t3-t1=t4-t2=2+c=2epsilon.
Thus the **three** consecutive two-arrow composites in the sampled strict chain
H_(t0)→H_(t1)→H_(t2)→H_(t3)→H_(t4)
are exactly structure arrows H_(t_i→t_(i+2))=H_(t_i→t_i+2epsilon), hence *literally constant* for i=0,1,2. All five objects and all four primitive arrows are linked by the SAME natural objectwise weak-equivalence zigzag to the fixed original sphere chain, since restriction from real diagrams to five chosen times preserves those zigzags.

Choose a basepoint at the first nonempty H-stage and propagate it along the four arrows. The three constant pair composites land at the propagated basepoints because they agree with two-step arrow images; hence the sampled chain is strictly pointed square-zero. In the point-set cone/track definition of the ordinary 4fold Toda operation, use *literal constant* pair nullhomotopies and compatible trivial secondary tracks on both overlaps: their resulting relative tertiary operation is the zero element. Consequently its fourfold Toda bracket contains 0. Standard weak-equivalence invariance of the full higher operation (or stable suspension-spectrum transport) carries this assertion along the full-chain weak-equivalence zigzags to
           0 in <2,theta4,theta4,2>.
But original Wang–Xu2017 Corollary 1.10 gives theta5 as a nonzero value, and the full indeterminacy requires care. IWX2023 original Table10 printed p228 gives this bracket value h5² (filtration 2) and indeterminacy h5 n; original Table4 printed p214 identifies h5 filtration 1 and n filtration 5. Under standard Adams filtration/classical bracket transport, the h5 n indeterminacy is filtration >=6 and cannot cancel the nonzero filtration-2 leading term h5². S044 T102 recorded this same *source-dependent* zero exclusion. Hence 0 cannot lie in the bracket. Contradiction.

The contradiction uses all replacements, both shifted identities, every real time and the actual target chain. QED internally, conditional on standard simplicial projective/left proper tools, higher-bracket invariance and the original published stable class/indeterminacy comparison.

**Endpoint precision.** At epsilon=5/4 we would have c=1/2 and t4=5, at the *terminal point* instead of X4; this sample no longer proves a contradiction. It proves only the **lower bound 5/4**, not dHI>=3/2. A claim that all possible HI thresholds are integer or half-integer for arbitrary real-parameter replacements was previously presented in S041 T97 but has not been independently justified at the fidelity needed here; we deliberately do NOT rely on that claim.

## Three rival routes tested; exact 3/2 still open

A (whole-shoelace homotopy-coherent Lan): T108 succeeds at categorical lane collapse, not at a matched 3cell for epsilon>=5/4. It supplies exact strict F-row weak-equivalence control by quotient, so no loss of original F's homotopy diagram, but does not preserve the fixed original point-set representatives.

B (relative mapping space/Reedy): sample-based zero Toda detects only the finite boundary permitting t0..t4 to remain in five active cells. At epsilon>=5/4 this combinatorial 5vertex obstruction no longer applies. A different relative diagram, intermediate moving thresholds or explicit boundary in a mapping-space fibrant replacement would be needed. We did not construct the complete relative 3cell; no invented obstruction group or claimed DKS cocycle.

C (stable reduced spectrum): the classical 4fold Toda operation remains a credible detector when a point-side strictification yields a five-stage square-zero chain. Passing from arbitrary UNPOINTED spaces to reduced spectra requires chosen basepoints; the propagated basepoints on the sampled chain give those locally. However no proof was produced that this detector is faithful to *all* epsilon≥5/4 configurations, nor an honest target HI1 countermodel.

## Verification boundary

- Exact symbolic clock differences, half-open inequalities, and N-a,N-b,I-F,I-G were independently recomputed in the proof above; no automated exhaustive search, formal build, or CI mathematical certification.
- Attempted falsification: naive unilateral G' contraction is invalid (S043/S045), independent local triple Toda zero is insufficient (S045), and no arbitrary equalizer=homotopy-equalizer shortcut is used. The construction instead depends on the *additional* monomorphism property of a whole-shoelace projectively cofibrant diagram; without that property the quotient could change the F homotopy type.
- Primary dependency sources: Lanari–Scoccola 2020/2023 Prop4.5, Prop3.10/12, Remark3.13; Wang–Xu 2017 Cor1.10; Isaksen–Wang–Xu 2023 Tables4/10; BJT2019 §7.A, and DKS1989 original selected text. The Adams differential/classical convention transport is NOT independently recomputed. External full-proof original DKS/HKM/Baues and full current novelty certification remain absent.
- This is an internally substantive answer to the *strict inequality* question but is NOT established as a new HHA article or as a completed first novelty gate.

**Outcome:** internal T108/T109 prove a conditional strict HI>IHC gap and lower dHI>=5/4; exact dHI=3/2 versus [5/4,3/2) OPEN. S047 future only, no formalisation or external action.
