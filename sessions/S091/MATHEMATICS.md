# S091 MATHEMATICS — two independent multistage finite-CW equal-distance controls

**Domain:** ordinary unpointed Top^(R,<=), entire real line. \(d_{\mathrm{IHC}}\) uses \(\mathrm{Ho}(\mathrm{Top}^{\mathbb R})\), not \((\mathrm{HoTop})^{\mathbb R}\). \(d_{\mathrm{HI}}\) permits arbitrary complete whole-real objectwise weak-equivalence zigzags of BOTH lanes. All *input* stalks are finite CW.

## T213 (INTERNAL) — CP²/wedge three-active-stage exact equality, zero homology metric

For t<0 let both stalks be empty. On [0,1), F=G=S². On [1,2), set F=A=CP²=S² cup_eta e⁴ and G=B=S² wedge S⁴. On [2,3), set F=A wedge S⁵, G=B wedge S⁵. On [3,infty), both are the point. Within each stratum arrows are identity. Across first two transitions take the *actual cellular bottom-cell inclusions* S²->A/B then A/B->(A/B) wedge S⁵; across terminal cut collapse to point. All crossing maps are compositions; negative-time arrows are unique. Both nonpoint lanes have two essential non-weak-equivalence transitions: adding cells in degrees 4 and 5.

**Claim.** On all real times
\[
d_{\mathrm{HI}}(F,G)=d_{\mathrm{IHC}}(F,G)=3/2,\qquad
d_{\mathrm I}(H_*F,H_*G)=0
\]
for integral graded persistent homology. Explicitly H0=Z on [0,infty), H2=Z on [0,3), H4=Z on [1,3), H5=Z on [2,3), other reduced positive homology zero; structure maps preserve each surviving generator, hence complete homology diagrams are naturally isomorphic.

**Cup lemma.** Every map CP² -> B or -> B wedge S⁵ kills integral H2. Write x in H²(CP²;Z), x² generating H⁴, y in H²(target;Z), y²=0. If u*y=m x, then 0=u*(y²)=m² x², so m=0, equivalently H2(u)=0.

**All-epsilon lower in IHC:** An IHC epsilon-interleaving evaluates at every t as two morphisms in HoTop satisfying both composites. If 0<=epsilon<1, evaluate the **F-side** identity at t=1. F_1=CP² -> G_{1+epsilon}=B kills H2, but the canonical F_1 -> F_{1+2epsilon} lands in CP² or CP² wedge S⁵ (because 1+2epsilon<3), and induces nonzero injection H2. Contradiction. If 1<=epsilon<3/2, evaluate the **G-side** identity at t=0. The second leg F_epsilon=CP² -> G_{2epsilon}=B wedge S⁵ kills H2, whereas the canonical map G_0=S² -> G_{2epsilon}=B wedge S⁵ is nonzero on H2. Contradiction. In particular epsilon=1 is covered by the latter case; no missing endpoint. This rules out IHC interleavings for EVERY epsilon<3/2. Any strict epsilon-interleaving after arbitrary whole-WE zigzags of BOTH lanes induces such an IHC interleaving, hence the lower covers every possible replacement and zigzag.

**Strict HI upper at epsilon=3/2:** Choose compatible basepoints and define both maps on all real t by constant maps to those basepoints where source and target are nonempty, unique maps from empty sources, and identity on the terminal point when appropriate. All generative arrows preserve the basepoints, so all naturality squares commute literally, including the cuts 0,1,1.5,2,3. For every t>=0 both shifted composites land at t+3>=3 and are the unique point maps, equal to the canonical shift arrows. For t<0 source is empty and identity requirements are automatically unique. Thus BOTH epsilon-interleaving identities hold strictly for ALL real t. Combining upper and lower proves exact equality 3/2. This is a multi-stage *homology-blind* control and emphatically NOT a strict HI>IHC witness or HHA-original theorem.

## T214 (INTERNAL) — homotopic Hopf-track discrepancy eliminated by a WHOLE roof

Set X=S³, Y=S², Z=CP², f=eta:X->Y the quaternionic Hopf map, h:Y->Z the bottom-cell inclusion, g=eta∘u for u a nontrivial rotation of S³ isotopic to id for which g is a different continuous map. For example eta(q)=q i q^{-1}, u(q)=j q; choose continuous quaternionic left-multiplication path from j to 1 and H:X×I->Y with H(x,0)=g(x), H(x,1)=f(x). Diagram F has on [0,1),[1,2),[2,3) X->^f Y->^h Z, G uses X->^g Y->^h Z. Empty before 0, point from 3; identities within strata and compositions across all times. Input CW stages are finite, and both transitions on each lane are nonweak equivalences. Composite h eta is nullhomotopic due to CP² attaching cell, but no nulltrack identification is assumed.

**Claim:** for ANY f~g:X->Y and shared h:Y->Z, these three-stage entire-real diagrams have a natural objectwise-WE common roof; hence dHI=dIHC=0.

**Construct R1:** mapping cylinder R1=(X×I disjoint-union Y)/(x,1)~f(x), alpha:X->R1, alpha(x)=[x,0]. Define p1:R1->Y by p1([x,t])=f(x), p1(y)=y; q1:R1->Y by q1([x,t])=H(x,t), q1(y)=y. Both are continuous, p1 alpha=f and q1 alpha=g **on the nose**. Inclusion Y->R1 is a mapping-cylinder deformation retract, and both p1 and q1 restrict to identity on Y, so both are weak equivalences. Define K:R1×I->Y from q1 to p1, relative Y, as K([x,t],s)=H(x,t+(1-t)s), K(y,s)=y. At t=1, H(x,1)=f(x), so K descends to the quotient.

**Construct R2:** R2=(R1×I disjoint-union Z)/(v,1)~h p1(v), beta:R1->R2, beta(v)=[v,0]. Define p2([v,s])=h p1(v), p2(z)=z; q2([v,s])=h K(v,s), q2(z)=z. The q2 terminal gluing works since K(-,1)=p1. Strict naturality p2 beta=h p1 and q2 beta=h q1. Inclusion Z->R2 is a deformation retract and both p2,q2 restrict to id_Z; hence both maps are weak equivalences.

Define complete real R with X, R1, R2 on the three active stages, empty before 0 and point after 3, and arrows alpha,beta and terminal collapse. Then id_X,p1,p2 and id_X,q1,q2 (plus empty/point maps) are *strict NATURAL* objectwise-WE transformations R->F and R->G, including across every real cut and every composite. The whole diagram zigzag F<-R->G makes both diagrams equal to R under permissible HI replacements, giving a strict epsilon=0 identity interleaving. No finite-CW claim is needed for the intermediate replacement R1,R2; only the input F,G are finite CW, as required. No pointed category or weakened stalkwise homotopy functor is substituted.

Thus a selected Hopf nulltrack, choice or sign/rotation variant is **not** an all-zigzag relative obstruction. T214 does not prove all higher-coupled diagrams rectifiable, only the stated single-homotopic-arrow common-tail class.

## Verdict and first genuinely missing proof line

Two different nonpoint multistage architectures genuinely tested: A1 has exact a=b=3/2, A2 exact a=b=0. Neither supplies a real a<b, nor a positive all-WE higher coherence obstruction. The first missing positive lemma is an *instantiated*, choice-independent relative higher Top diagram obstruction that persists under arbitrary objectwise-WE zigzags of BOTH WHOLE diagrams, while a genuine pair of morphisms and TWO identities exists in Ho(Top^R). DKS/BBG/BJT's general machinery by itself does not instantiate that lemma. Universal equality is NOT established; original S089 2-local sphere candidate remains OPEN. G1 OPEN; G2 NOT PASSED. No Lean/Palomar/publication.