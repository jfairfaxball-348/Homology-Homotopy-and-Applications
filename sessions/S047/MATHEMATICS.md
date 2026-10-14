# S047 mathematics — finite half-grid endpoint and sharp clock-packing lemma

**Verdict:** T110/T111 below are INTERNAL mathematical reductions conditional on S046 T108 and the quoted published fourfold-bracket computation. They do **not** construct the required strict 5/4 model, do not exclude a 5/4 model, do not establish dHI=3/2, do not remove the published-model dependency, and are not an HHA originality certificate. Exact unchanged Wang–Xu five-sphere dHI remains in [5/4,3/2].

## Fixed original filtration and quantifiers

F is empty t<0, X_i on [i,i+1) for 0<=i<=4 and point from t=5. Its arrows X0=S^160 --2--> X1=S^160 --theta_4--> X2=S^130 --theta_4--> X3=S^100 --2--> X4=S^100. G is empty t<0 and literal point t>=0. HI permits ANY full-real strict-shoelace F' and weakly contractible nonpoint G' connected by whole-diagram objectwise weak-equivalence zigzags to F and G; one must satisfy N-a, N-b, I-F and I-G at every real time. T108 (S046) is the all-replacements point-side collapse by **simultaneously** modifying the entire F row; it is never a unilateral replacement.

## T110 — sharpness of a one-chain real clock-packing method (INTERNAL)

**Statement (conditional obstruction).** Let m>=3 be the number of primitive arrows, with m+1 nonempty stages X0,…,Xm in successive unit half-open cells, followed by point, and let q=floor(m/2)>=1. Assume the m-fold Toda operation of the full fixed chain is defined, excludes zero, and is invariant under the relevant simultaneous diagram weak-equivalence zigzags (including compatible pointings / stabilization). Assume the T108 type simultaneous collapse applies to a strict interleaving of this F with point G. Then any strict homotopy interleaving must have epsilon >= 1+1/(2q); by taking an infimum dHI>=1+1/(2q).

**Proof.** Interleaving monotonicity lets us enlarge any 0<epsilon<1 to epsilon=1; thus assume 1<=epsilon<1+1/(2q). Set delta=2epsilon=2+c, where 0<=c<1/q. Collapse G' using T108 to obtain H weak-equivalent to F with literal point G. I-F now says all H_(t→t+delta) are literally constant for t>=0. Sample
[
t_{2j}=jdeltaquad(0le 2jle m),qquad
t_{2j+1}=1+jdeltaquad(0le 2j+1le m).
]
For i=2j or 2j+1, t_i=i+jc lies in [i,i+1) since j<=q and qc<1. And for all i<=m-2, t_{i+2}-t_i=delta, so each consecutive **pair composite** in one full (m+1)-object chain is literally constant. Propagate a basepoint from t0 along every arrow; the constant pair values coincide with these basepoints, as forced by the strict point-side shifted identities. Use the *same literal null composites* and coherent constant higher tracks to obtain zero in the full m-fold Toda operation, transported through one whole-chain weak-equivalence zigzag. This contradicts the assumed zero-exclusion; all zero-exclusion and transport hypotheses are essential. QED internally.

**Optimality of this clock method (not of HI).** If times s_i in [i,i+1) satisfy all s_(i+2)-s_i>=delta, then for m=2q, s_(2q)>=s0+qdelta>=qdelta while s_(2q)<2q+1. For m=2q+1, s_(2q+1)>=s1+qdelta>=1+qdelta while s_(2q+1)<2q+2. Either entails delta<2+1/q. Thus at delta=2+1/q there is **no** such (m+1)-vertex clock using all pair separations. This does not exclude other diagrams, staggered chains, relative 3cells, or a strict endpoint model. For m=4, q=2: epsilon<5/4 recovers S046 T109, and the original five-stage sampling route is provably exhausted at 5/4. m=3 yields 3/2 subject to its stated bracket hypothesis. The statement is about this precise sample method and a conditional higher-bracket hypothesis, not a universal new Adams class.

## T111 — exact finite half-grid formulation for an attained epsilon=5/4 (INTERNAL)

Define the finite [10]-diagram A by A_(2i)=A_(2i+1)=X_i for i=0,…,4, A_10=point, and structure maps equal those of F evaluated at t=k/2. Extend the index beyond 10 constantly by point. Let **GRID** be the existence of:
- a strict [10] diagram K with K_10=literal point and a whole-diagram zigzag of objectwise weak equivalences K~A;
- a vertex x0 in K0 and propagated vertices x_k=K_(0→k)(x0) for k=1,…,10;
- the FIVE strict equations K_(k→k+5)=constant_to_(x_(k+5)) for k=0,1,2,3,4. The k=5 case points to K10 and is automatic; stages beyond 10 are point.

**Theorem (conditional only on T108 and conventional real-diagram definitions).** The unchanged (F,G) admits a strict epsilon=5/4 homotopy interleaving, permitting arbitrary all-real objectwise-WE replacements on BOTH sides, **if and only if GRID holds.** This is an EXACT finite relative-diagram *existence equivalence*, not a determination of whether GRID holds.

*Necessity.* From any such interleaving, apply T108 to obtain a strict all-real H~F with literal point G and every 5/2-forward arrow H_t→H_(t+5/2) literally constant to its b_(t+5/4)-selected vertex. Restrict H to t=k/2, k=0,…,9, and replace its weakly contractible terminal H_5 by point K10 (map H5→point is a WE). This is a natural pointwise-WE finite-diagram zigzag to A. Set x0∈H0 and propagate x_k along the restricted maps, with x10 the unique point. For k<=4, I-F makes K_(k→k+5) literally constant to b_(k/2+5/4). The k=0 equation identifies x5=b_(5/4), and N-b propagates x5 along the later F structure maps, showing x_(k+5)=b_(k/2+5/4) for all k=0,…,4. Thus the five required equations hold simultaneously with their *actual* compatible distinguished vertices, not unrelated local nullhomotopies. Nothing about chosen F' point-set representatives was held fixed. QED.

*Sufficiency.* Given GRID, extend K as a [0,∞) index diagram by sending all indices j>=10 to point; its all-index weak-equivalence zigzag to A extends naturally since j→min(j,10) is monotone. Set H_t=empty for t<0 and H_t=K_floor(2t) for t>=0, using the extended K for all integers. This full-real diagram is connected by objectwise-WE natural zigzags to the original F because F_t=A_floor(2t). Put G_t=empty t<0 and point t>=0. Let a_t be unique into point when defined; for every t>=0 let b_t select the propagated vertex x_floor(2(t+5/4)) in H_(t+5/4), with the unique empty map for negative-source t. Naturality N-b is exactly propagation of the x_j; N-a is automatic. Since floor(2(t+5/2))=floor(2t)+5, the five stipulated K_(k→k+5) constants (and automatic point-tail maps for k>=5) imply I-F **at every real t**, including half-open boundary cuts. I-G is the point identity; at negative t both shifted identities have empty source and are uniquely satisfied. Thus (H,G,a,b) is a genuine strict epsilon=5/4 interleaving of whole diagrams. QED.

**Endpoint/infimum caveat.** If GRID is true, dHI=5/4 using T109. If GRID is false, it only rules out *attaining* the 5/4 endpoint; it does not alone rule out dHI=5/4 as an infimum approached from above, nor strict epsilon∈(5/4,3/2). No GRID witness or impossibility proof was obtained in S047.

## Hostile alternatives tested / exact target still unresolved

(A) Sliding-clock single chain: T110 proves the method is sharp at 5/4, not sharp for HI. Multiple staggered overlapping five-chains might detect a relative operation on the half-grid, but a complete joint obstruction and all-natural comparisons were not produced.

(B) Finite relative Reedy / 3cell: T111 identifies the complete finite **existence problem** (11 nodes, 5 constant five-step arrows, whole-diagram WE). It does NOT replace homotopy equalizers by ordinary equalizers; no computed nonzero relative tertiary obstruction class and no proof that all objectwise-WE replacements of K fail has been given.

(C) Constructive cone/cylinder: a candidate K would have to retain four essential original primitive maps and all related structure maps while satisfying the five simultaneous constant 5-step constraints. No strict GRID witness exists in this session's record; independent local nullhomotopies are insufficient. The prior HEP epsilon=3/2 upper remains.

## Prior benchmark and certification

The unchanged 4fold bracket is source-stated in Wang–Xu 2017 Cor1.10 and IWX 2023 Table10 (h5² with h5 n indeterminacy), Table4 h5 f1/n f5; zero exclusion is a *source-dependent* filtration comparison, not an independently redone Adams/Moss calculation. The finite formulation and clock lemma are new INTERNAL program deductions, not original literature-certified papers. The original LS Prop4.5 proof on posets supports the T108 mono step; a complete unpointed/pointed bracket invariant transport and external mathematical referee remains outstanding.

Frozen front T66: primitive plus all composites, decomposition over Q and all prime fields, ONE coherent integral Z block splitting (Höppner–Lenzing 1981 original full proof still uninspected). Strict R5 original 16,471 candidates OPEN, Hopf examples retired as HHA flagship, T84 retained. Stage1, G2 NOT_STARTED; no Lean, Palomar, manuscript, arXiv, HHA or contact.