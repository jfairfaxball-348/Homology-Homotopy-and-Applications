# S043 MATHEMATICS — derived-[2] theta2 is point-null; exact IHC distance is 1

**Evidence status:** T100/T101 are INTERNAL mathematical arguments based on published stable stems and classical mapping-cylinder/Quillen tools; not machine formalised, externally refereed, or HHA-novelty certified. The nonzero 4-fold Toda class is NOT an obstruction to theta2 nullity. A genuine strict HI>IHC distance separation is NOT established: see the corrected audit of S042-T98.

## Fixed five-sphere datum and all endpoint conventions

Use based CW sphere representatives
A=S^160 --f=2--> B=S^160 --g=theta4--> C=S^130 --h=theta4--> D=S^100 --k=2--> E=S^100.
There are no changes to dimension, class, or arrows. Their first consecutive twofold composites gf, hg, kh are nullhomotopic: 2theta4=0, theta4^2=0, and theta4 2=0 in the stable range. All primitive arrows are nonzero. The stable 61-stem pi_61^S=0 is the Wang–Xu 2017 theorem (cross-checked in Isaksen–Wang–Xu 2023 Table of stable stems). Freudenthal: pi_161(S^100)=pi_61^S=0 since 161<=198. Likewise pi_160(S^100) is the stable 60-stem; no claim that this group vanishes.

For integer n≥0, let X_n=A,B,C,D,E,* for n=0,1,2,3,4,n≥5 respectively. Let i:N_0→R be the inclusion. F=Lan_i X has F(t)=empty for t<0 and F(t)=X_floor(t) for t≥0; all stages half-open. G(t)=empty t<0, point t≥0. The shift eta_F^2 at n=0,1,2 is theta2=(gf,hg,kh): X_{0..2}→X_{2..4}. This is a derived diagram map, NOT a triple of disconnected maps in Ho(Top).

## T100: explicit projectively cofibrant source and SIMULTANEOUS path

Let A_c=A and q_A=id. Let B_c=M_f be the mapping cylinder of f with closed cofibration i:A_c→B_c and homotopy equivalence retraction r_B:B_c→B satisfying r_B i=f. Let C_c=M_{g r_B}, with closed cofibration j:B_c→C_c and homotopy equivalence r_C:C_c→C satisfying r_C j=g r_B. The natural map q=(id,r_B,r_C):(A_c→^i B_c→^j C_c)→(A→^f B→^g C) is an objectwise homotopy equivalence. The latching conditions make QX=(A_c→B_c→C_c) projectively cofibrant in Top^[2], or after singular/cofibrant models in simplicial sets. Note that it is NOT legitimate to use the original source as already projectively cofibrant.

With target Y=(C→^h D→^k E), a derived mapping-space model is the ITERATED STRICT PULLBACK

P_1 = Map(A_c,C) ×_{Map(A_c,D)} Map(B_c,D),
P_2 = P_1 ×_{Map(B_c,E)} Map(C_c,E),

where the first maps into Map(A_c,D) are h_* and i^*, and the second maps into Map(B_c,E) are k_* pr_v and j^*. The restrictions i^*:Map(B_c,D)→Map(A_c,D) and j^*:Map(C_c,E)→Map(B_c,E) are fibrations because i and j are CW cofibrations. Thus each displayed ordinary pullback computes the corresponding homotopy pullback. **WARNING**: the tempting claim that an arbitrary equalizer Eq(P,Q) computes the homotopy equalizer merely because Q is a fibration is FALSE (e.g. P=Q=id on S^1). The iterative fibration argument, not that shortcut, is essential.

Points of P_2 are triples (u,v,w) satisfying both STRICT relations
v i = h u,  w j = k v.
The actual theta2 point has
u_0=gf q_A, v_0=hg r_B, w_0=kh r_C;
the zero point is all based-constant maps. These satisfy both relations, including their length-two transitive consequence.

For each of u_0,v_0,w_0 choose a based nullhomotopy u_t,v_t,w_t to the zero map. The fact that we can make these individual choices follows from gf=hg=kh=0, not from any invalid assertion about coherence. Their first two induced homotopies h u_t and v_t i are paths in Map(A_c,D) with *identical endpoints*, yet might disagree in their interiors. Their difference is a loop in Map(A_c,D). Since A_c=S^160 and D=S^100,
 pi_1 Map_*(A_c,D;0)=pi_161(S^100)=pi_61^S=0.
The two paths are therefore homotopic REL ENDPOINTS. Lift a rel-endpoints square through the Serre fibration i^*:Map(B_c,D)→Map(A_c,D) to replace v_t by a path v'_t, with unchanged endpoints, such that for ALL t,
                  v'_t i = h u_t.
This is a constructive path-lifting prescription (choice of nullhomotopies; fill the comparison loop; lift through a specified CW inclusion), not a fabricated closed-form Adams representative.

Now compare the two paths k v'_t and w_t j in Map(B_c,E). Their endpoints agree strictly: at t=0, k v_0=w_0 j; at t=1 both are zero. Since B_c≃S^160 and E=S^100, the evaluation fibration Map_*(B_c,E)→Map(B_c,E) and the fact that S^100 is 2-connected show in either the based or unpointed setting that
 pi_1 Map(B_c,E;0)≅pi_161(S^100)=0.
The same holds for Map(A_c,D). Fill this second comparison loop by a homotopy REL ENDPOINTS and lift it through j^*:Map(C_c,E)→Map(B_c,E), altering w_t to w'_t without altering u_t or v'_t. Therefore the path of triples
         (u_t,v'_t,w'_t), 0≤t≤1,
starts at theta2, ends at the zero natural transformation, and satisfies BOTH equations
        v'_t i=h u_t,  w'_t j=k v'_t
strictly and simultaneously at each t.

Track interpretation: the first loop filling is a second-order comparison of the two nullhomotopies around square 0→1, and the second one compares tracks for square 1→2 AFTER the first has been corrected. The common v'_t is not chosen independently twice. The compositional 0→2 relation w'_t j i = k h u_t holds by substitution; because [2] is freely generated by its two adjacent arrows, it imposes no *additional independent* strict equation. The second lift is precisely the required tertiary compatibility. Full ambiguity in the *existence* question is the two loop obstructions in pi_1 Map(A_c,D) and pi_1 Map(B_c,E), both zero; higher homotopy of these spaces may be nonzero and is NOT claimed to vanish. This proof says NOTHING about strictifying the ORIGINAL four arrows to make all their pairwise composites literally zero.

This establishes the **internal T100 conclusion**
theta2 = point morphism in Ho(Top^[2]).
The same holds unpointedly. Indeed S^100 has pi_1=pi_2=0, so the evaluation fibration Map_*(S^160,S^100)→Map(S^160,S^100)→S^100 identifies the relevant pi_1 groups, and connectedness of all spheres ensures unpointed constant maps can be chosen compatibly; we do not replace unpointed classes with based classes by fiat.

### Cross-check of the pullback method
For just one relation (four-stage arrow case), the same construction reduces to the familiar mapping-space homotopy pullback and permits a genuine Toda obstruction when pi_1 Map(A,D) is nonzero. For THIS five-sphere case its TWO pi_1 groups vanish even though the fourfold Toda operation can be nonzero: the 4fold obstruction is about a *different* relative strict-realization problem. No DKS cohomology group or 2-track class has been invented.

## T101: derived whole-real eta_F^2 is point and dIHC=1

Work in the projective model category of diagrams of spaces, or in a Quillen equivalent simplicial setting to manage size/enrichment. The inclusion i:N_0→R has left Kan extension Lan_i as a LEFT QUILLEN functor for projective diagrams (restriction i^* preserves objectwise fibrations and weak equivalences). Since each overcategory {n∈N_0:n≤t} has a terminal object floor(t) when t≥0 (and is empty when t<0), F is literally Lan_i X and derived Kan extension is obtained on a projectively cofibrant integer replacement without introducing extra homotopy-colimit fibres. Derived adjunction gives

 RMap_{Top^R}(F,F^2) ≃ RMap_{Top^{N_0}}(X,i^*F^2).

For n=0,1,2 the latter target is C,D,E, and for n≥3 it is point. All maps beyond n=2 and their compatibility are therefore unique. Restriction to the first three objects identifies the relevant derived mapping-space component with the T100 [2]-mapping space. The unit eta_F^2 maps to theta2, so **the entire real natural transformation eta_F^2 is the point morphism in Ho(Top^R)**; not merely at integer stalks. Negative t has empty source, half-open cut times belong to their right stage, and the n≥3 maps have point codomain. This is an exact real-index comparison, not a pointwise Ho(Top)^R argument.

For epsilon=1 let phi:F→G^1 be the unique point maps on nonempty sources (and the empty map where both are empty). Fix any a∈A and propagate a along f,g,h,k to compatible chosen points in B,C,D,E and then terminal *. This defines an honest strict psi:G→F^1 for all real t≥0, with unique empty maps for t<0, natural across all half-open boundaries. The composite psi^1 phi:F→F^2 is the point natural transformation and hence equals eta_F^2 IN Ho(Top^R), by the preceding derived adjunction. The other identity phi^1 psi=eta_G^2 holds strictly, since G is point/empty. Both required identities hold for every real time. Thus dIHC≤1.

For each epsilon<1, if epsilon<1/2, an identity noncontractible sphere persists under 2epsilon shift at t=0; if 1/2≤epsilon<1, the essential primitive map f at t=0 and/or g at t=1 persists. Any purported IHC epsilon-interleaving with G would factor these through a contractible point object, contradicting their nonzero class after restriction/evaluation. Hence dIHC≥1. Result:
                           dIHC(F,G) = 1.  [INTERNAL]

## Corrected HI frontier: do NOT claim a gap without proof against both replacements

S042-T98 claimed dHI=3/2 by nonvanishing of <2,theta4,theta4,2>, arguing every strict epsilon1 interleaving forces a weak-equivalent model with gf=hg=kh literally constant. The implication is NOT proved: by definition HI permits BOTH F'≃F AND G'≃G, and G' can have nontrivial *contractible* stages rather than literal singleton point stages. A strict 1-interleaving with such G' factors adjacent twofold maps through contractible G' stages. Those factors need not become literally constant simultaneously after replacing G' by *; the required simultaneous relative rectification is exactly the missing lemma. Lanari–Scoccola2023 Proposition3.10 proves a triple Toda analogue with contractible A,B and a cone argument, but its fourfold analogue does NOT follow automatically. Blanc–Johnson–Turner2019 §7.A demonstrates the fourfold operation obstructs strict zero-composite rectification, NOT without an additional proof the entire homotopy-interleaving diagram where both sides vary.

Wang–Xu2017 Cor1.10 establishes theta5 is IN the bracket, not merely from the word 'strictly defined' that zero is EXCLUDED. Isaksen–Wang–Xu2023 Table10 p228 records the explicit row: bracket <2,theta4,theta4,2>, contains theta5 detected by h5^2, indeterminacy listed as h5 n. A rigorous group-theoretic zero-exclusion with this full indeterminacy (and comparison of based/unpointed and all replacement models) still needs to be written, not assumed. The fact pi61=0 does not imply fourfold bracket zero: it kills selected track-loop groups but NOT its pi62 target or the extra relative strictification constraint.

Retain S042's independently given HEP upper bound dHI≤3/2 as INTERNAL (middle hg null => deform the middle adjacent triple composites to strict zero after mapping cylinder). Because dIHC=1 we have the verified INTERNAL interval 1≤dHI≤3/2. For this finitely staged family, the integer restriction argument of Lanari–Scoccola Lemma3.11 implies an epsilon<3/2 HI interleaving would yield a discrete 1-HI interleaving, so the only possible endpoint outcomes are dHI=1 or dHI=3/2 (subject to full transfer). Neither is certified here. NO verified dHI>dIHC witness, and no claim that the classical bracket already determines derived theta2.

## Unrelated frozen obligations
S030 T66 coherent integral Z block descent (primitive and ALL composites, Q and EVERY prime field); original Höppner–Lenzing 1981 JPAA full proof uninspected. S023 strict R5 all 16,471 pairs OPEN. S028 Hopf exact certificates retained but proposed HHA flagship RETIRED. S038 T84 all-real algebra is an in-house derivative of S018 and S037. No Stage2/Lean/Palomar/manuscript/arXiv/HHA/third-party contact.
