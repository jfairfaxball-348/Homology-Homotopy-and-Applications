# S054 MATHEMATICS — classical Toda-indeterminacy reduction, NOT zero-exclusion

## Fixed objects and exact unclosed theorem

Work in ordinary Top^R, F=empty before 0, X_i on [i,i+1) for i=0,...,4 and point after 5, with X0=S^160 --degree 2--> X1=S^160 --theta4--> X2=S^130 --theta4--> X3=S^100 --degree 2--> X4=S^100; G empty before 0, point afterwards. Desired theorem d_HI(F,G)>d_IHC(F,G), independent of exact d_HI. Historical S053-T130/T131/T132 yield d_IHC=1 by ordinary published pi61/Freudenthal inputs and d_HI>=5/4 **only on the unproved hypothesis** 0 not in the FULL classical stable fourfold bracket <2,theta4,theta4,2>. Do not promote the hypothesis because of nonzero C-motivic Table10.

## S054-T134: explicit classical indeterminacy upper-control from inspected PRIMARY Xu2016

Zhouli Xu, Geometry & Topology 20 (2016), 1611–1624, §5, Lemma 5.1 proof (printed p1620) states a *general* indeterminacy bound: if a fourfold Toda bracket <a1,a2,a3,a4> is defined, ai in stable stem n_i, its indeterminacy is contained in the union of the triple bracket types
    <a1,a2,pi_{n3+n4+1}>,
    <a1,pi_{n2+n3+1},a4>,
    <pi_{n1+n2+1},a3,a4>.
See https://msp.org/gt/2016/20-3/gt-v20-n3-p08-p.pdf (original publisher PDF, visually inspected p1620 and its continuation p1621). Xu applies the general rule to FOUR DIFFERENT theta4 brackets, not to our theta5 bracket; do not transplant his "zero indeterminacy" conclusion. His four computed bracket words concern sigma^2 and sigma, NOT <2,theta4,theta4,2>.

For (a1,a2,a3,a4)=(2,theta4,theta4,2), (n1,n2,n3,n4)=(0,30,30,0), the full classical ambiguity is therefore constrained (under Xu's bracket conventions) to the triple-bracket families
    A = union_{x in pi31^S} <x,theta4,2>,
    B = union_{y in pi61^S} <2,y,2>,
    C = union_{z in pi31^S} <2,theta4,z>.
Here the output degree is n1+n2+n3+n4+2=62. The degree computation is direct: 0+30+1=31, 30+30+1=61 and 30+0+1=31. This is a **necessary upper control on the indeterminacy, not an equality, not an evaluation of A/B/C and not a proof that the bracket avoids zero**. Ordinary stable theta4^2=0, 2theta4=0 and the published 2-primary vanishing in stem61 justify existence of the relevant defined operations on the 2-primary side; applying a full integral claim requires explicit odd-primary control too.

## S054-T135: critical correction — pi61=0 alone does NOT erase B

Even when pi61^S=0 integrally (or after 2-localisation where its 2-primary part vanishes), the family B contains the formally zero middle map y=0. The **triple Toda bracket <2,0,2> has the standard primary indeterminacy** 2*pi62^S + pi62^S*2 = 2*pi62^S, and contains 0 (take constant null tracks). Under the usual stable triple-bracket convention it is exactly 2*pi62^S. This follows directly: varying either chosen nullhomotopy changes the representative by pre/post composition with 2, and every element of 2*pi62^S arises by one variation. Therefore declaring B=0 merely because pi61=0 would be a logical error *unless* one independently establishes 2*pi62^S=0 in the relevant 2-primary group or other operation-specific restrictions. We have NOT verified the full 2-primary group law of pi62^S in this session.

The precise prospective sufficient criterion is: prove that the difference between any possible zero value and the Wang–Xu value theta5 is an allowed element of Xu's ambiguity set, then independently show theta5 lies in none of A,B,C (including every indeterminacy choice) with correct classical 2-primary and any odd-primary bookkeeping. Xu gives one control on that difference, not a presently computed final answer. Conversely, an explicit compatible classical defining system producing zero would refute this candidate's proposed Toda obstruction; no such system was constructed here.

## S054-T136: a source-proved synthetic/classical falsification control, NOT a refutation of the target

Burklund–Isaksen–Xu, *Classical Stable Homotopy Groups of Spheres via F2-Synthetic Methods*, Peking Mathematical Journal 9 (2026), 433–455, online 11 April 2025, original open publisher full text https://link.springer.com/article/10.1007/s42543-025-00098-y, Lemma 3.3/Remark 3.4. A synthetic Toda bracket detected by M h1 has a CLASSICAL analog <eta,4 overline{kappa}_2,2> which **contains zero**, as the original remark explicitly states. In other words, even unusually close synthetic analogs can have extra classical indeterminacy; nonzero synthetic detection is not enough to assert classical zero exclusion. This is not the same bracket <2,theta4,theta4,2>, so it supplies no counterexample to F,G, only a falsification of naive transfer logic. The extra comparison theorem would have to control all classical null tracks and any lambda/tau inversion ambiguities.

## S054-T137: independent recheck of whole-real replacement reduction / clocks

Check S053's P_e shoelace construction as a single poset diagram of arbitrary both-lane replacements. Taking projectively cofibrant simplicial Q yields monomorphic all-lane structure maps because projective representable cells are upward-closed cones and attach without identifications (unlike pointwise cofibrancy). At u>=e collapse the weakly contractible cross-image V_u=im(QG_{u-e}->QF_u); preservation of V via N-b defines HF maps; left properness makes QF_u->QF_u/V_u a WE. I-F forces every length-2e arrow out of F at t>=0 to be literally constant; I-G and N-a survive collapse to the point G lane. QF,QG empty t<0, so no negative map from nonempty to empty is smuggled in. At e=0 one may first enlarge to e=1 by shift monotonicity; the quotient construction only needs e>=1. For 1<=e<5/4 let c=2e-2 in [0,1/2), sample t=(0,1,2+c,3+c,4+2c), whose three length-two jumps are 2e and whose last point remains <5; at e=5/4 the last hits the literal point and is NOT excluded. All three sampled adjacent composites can be made strictly pointed zero. This is conditional proof framework T130/T131, not an independent classical bracket computation.

A different local check: on any poset functor D, the four equations N-a, N-b, I-F, I-G are exactly two-row strict naturality and shifted identities. The image V construction uses N-b for quotient functoriality and I-F for constant 2e maps; the G point-lane identity uses I-G. This avoids illicitly replacing only G while fixing F.

## S054-T138: independent derived-side audit (published pi61 premise)

At integer stages the unique F->G^1 in the derived diagram category and G->F^1 obtained by propagated basepoints have second identity on G literally. The F identity reduces to nullity of the length-two natural diagram morphism from (A->B->C) to (C->D->E), NOT just three vertexwise zeros. Model a cofibrant 3-object source by iterated mapping cylinders A_c subset B_c subset C_c. Its derived natural-mapping space is an iterated homotopy pullback of ordinary mapping spaces because restriction along CW cofibrations gives mapping-space fibrations. Given null tracks for 2theta4 and theta4^2, the successive compatibility obstructions are loops in Map(A_c,D) and Map(B_c,E), whose based contribution is pi161(S^100), stable pi61^S; evaluation basepoint contribution vanishes as S^100 simply connected. Assuming published pi61 vanishing, adjust one track and then the other rel endpoints to obtain a SINGLE derived natural nullhomotopy; keeping the corrected first track during the second adjustment is essential. The left-derived Kan extension from integer stages to all-real step diagrams requires the projective model structure and terminal floor(t) at every t>=0; negative t empty, other half-open boundaries unchanged. Hence the inherited conditional d_IHC<=1 proof survives this independent definitional check, but there was no new primary Adams calculation, Lean formalisation or external referee certification.

For e<1, evaluating the length-2e F structure arrow at t=0 gives identity X0->X0 when 2e<1 and degree2 X0->X1 when 1<=2e<2. A morphism factored through point in Ho(Top^R) would make these null, impossible: degree2 is nonzero integrally on H160 and identity is nonnull. Hence d_IHC>=1, **subject to the standard category comparison and source proof**. Use 'internally verified with published input,' not 'FORMALLY_CERTIFIED.'

## Unclosed exact proof dependencies

(1) Full CLASSICAL pi62^S group law including 2*pi62 and classes with theta5 detection; (2) all x in pi31 classical triple families A/C, with ADAMS/Moss hidden extensions and COMPLETE indeterminacy; (3) convention-compatible proof of Xu's difference-to-membership criterion for ALL classical defining systems including coherent nullhomotopies; (4) pointed whole weak-equivalence invariance (T122 and original DKS/BJT) and unstable suspension of chosen theta4 representatives; (5) final 2023–Oct2026+ exact Top^R priority/HHA audit. None is replaced by complex-motivic Table10 or static GitHub CI.

**Verdict:** No proof of 0∉<2,theta4,theta4,2>_classical and no proof of 0∈ bracket. Therefore no independently certified d_HI>d_IHC for the original pair. No exact HI/GRID work required.