# S074 mathematics — an explicit finite dg-module strict separation

**Result:** an unconditional INTERNAL proof in a declared weaker category, with no sphere-homotopy-group input and no equality of competing Toda conventions. This is a new candidate, NOT an owner-approved first-paper switch or an externally certified/novel HHA theorem. Original ordinary unpointed integral Top^R problem remains unproved. The specific sphere-spectrum candidate is discontinued as an active automatic route: UNRESOLVED / NOT READY, not disproved.

## 0. Required sphere-first attempt and abandonment

Fix the ordinary stable simplicial symmetric-spectrum model in pointed simplicial sets and the strict representative word S68_(2)→S68_(2)→S54_(2)→S40_(2)→S40_(2), with arrows 2,sigma²,sigma²,2. Its derived defining-system problem has three primary path spaces and two secondary homotopy fibres; the terminal lies in pi2 Map(S68,S40)=pi30^S_(2). The proposed comparison evaluates Kochman's cone extensions into those paths and squares, then compares their complete homotopy fibres after stabilisation. Evaluation on fixed face equations works (T193). No map inverse or pi0-surjectivity proof on the stabilised all-representatives fibres was obtained. A model-equivalence slogan cannot supply it. The independent Adams/tower route also produced no calculation of the complete BBG set, and no literal counterexample to the asserted sphere equality was found. These are failed attempts, not proof of nonexistence or a computed zero.

Xu §5's classical nonzero word and pi29_(2)=0 remain source facts in their own setting; a fresh independent whole-derived spectral IHC proof was NOT completed. Therefore alternatives A/B/C of the S074 sphere task failed: that specific spectral candidate is now UNRESOLVED / NOT READY and retired from the automatic next-session route. All earlier numeric claims remain conditional. The fallback below is a genuinely different concrete algebraic example; it imports no sphere theorem and changes neither the official integral Top target nor any release gate.

## 1. The precise theorem (S074-T194)

Let k=F2. Define the small k-linear dg category A on objects 0,...,4. For each i<j with 1<=j-i<=3 it has a free generator g_ij:i→j of cohomological degree 1-(j-i). There is NO generator g_04. Morphisms are all directed composable paths, identities included; there are no additional relations. Composition is concatenation, written right-to-left. Set

    d(g_ij)=sum_{i<r<j} g_rj g_ir,

and extend by the Leibniz rule. Signs disappear over F2. Each term of d² inserts two distinct internal cuts and occurs twice, so d²=0. Let R be the unital category algebra (sum of the five identities). Its total k-dimension is 30. RIGHT dg R-modules are equivalently contravariant dg functors A→Ch_k. Use the usual projective model category M=dgMod-R: weak equivalences are quasi-isomorphisms and fibrations are degreewise surjections. It is pointed, cofibrantly generated and left proper. Every object is fibrant (Keller, On dg categories, §3.2 Thm3.2). Projective cofibrations are graded-split monomorphisms with cofibrant cokernel. Left properness here can also be checked directly: pushing a quasi-isomorphism along a monomorphism leaves the quotient complex unchanged, and the short exact sequence comparison gives a quasi-isomorphism. Write P_i=A(-,i); these are cofibrant representable modules, with enriched Yoneda identification Hom_M(P_i,P_j)=A(i,j).

Write a_i=g_{i,i+1}, h_i=g_{i,i+2} and k_i=g_{i,i+3}. Thus |a|=0, |h|=-1, |k|=-2, and

    d h_i = a_{i+1} a_i,
    d k_i = a_{i+2} h_i + h_{i+1} a_i.

Let F:R→M be 0 for t<0, P_i on [i,i+1) for i=0,...,4, and 0 for t>=5, with consecutive maps a_i and their actual composites. Let O be the identically zero diagram. Define dHI with strict epsilon-interleavings after arbitrary zigzags of whole-diagram objectwise quasi-isomorphisms of BOTH inputs. Define dIHC by interleavings in Ho(M^R), not Ho(M)^R. Then

    dIHC(F,O)=1,       5/4 <= dHI(F,O) <= 5/2.

In particular dHI>dIHC. No exact HI value or assertion at epsilon=5/4 is made. All modules/stage maps are finite-dimensional; replacements are unrestricted dg modules. No assertion for ordinary topological spaces, sphere spectra, or vector-space complexes with the R-action forgotten.

## 2. Complete finite algebra (S074-T195)

Paths from i to j correspond to compositions of j-i with parts 1,2,3. Their counts by span 0,...,4 are 1,1,2,4,7. Summing across all endpoints gives 5+4+6+8+7=30, with graded dimensions (15,10,5) in degrees (0,-1,-2).

In A(0,4), degree -2 has basis

    u=k_1 a_0, v=h_2 h_0, w=a_3 k_0.

Degree -1 has basis p=h_2 a_1 a_0, q=a_3 h_1 a_0, r=a_3 a_2 h_0. Direct differentiation gives du=p+q, dv=p+r, dw=q+r. Hence c=u+v+w is nonzero and closed; the kernel of d in degree -2 is exactly k·c. There is NO degree -3 morphism, so H^-2 A(0,4)=k·[c]. Each A(i,i+2)^-1 has sole basis h_i with nonzero differential; each A(i,i+3)^-2 has sole basis k_i with nonzero differential. Consequently the three equations dH_i=a_{i+1}a_i FORCE H_i=h_i and the two equations dK_i=a_{i+2}h_i+h_{i+1}a_i FORCE K_i=k_i. The resulting terminal expression is exactly c, never zero. This is the full defining-system computation for these fixed actual arrows, not a selected-filler calculation. Adjacent degree-zero morphism spaces have basis a_i and no degree -1 terms; thus a_i represents a nonzero class and has no different cohomologous representative. Endomorphism degree-zero identity classes are nonzero as well.

## 3. Direct obstruction to ANY cofibrant strict-double-zero replacement (S074-T196)

We prove the needed invariance by a literal homotopy-transfer calculation, NOT by identifying any named classical Toda convention.

Suppose a strict chain of cofibrant dg modules C_0 --b_0→ ... --b_3→ C_4 has b_{i+1}b_i=0, and is isomorphic to the P-chain in Ho(M)^[4]. All objects are fibrant; choose closed maps u_i:P_i→C_i and v_i:C_i→P_i representing inverse isomorphisms. Choose degree -1 endomorphisms s_i of C_i with

    d s_i = id_Ci + u_i v_i.

Such s_i exist since the inverse equality holds in the homotopy category of cofibrant-fibrant dg modules, whose morphisms are H^0 of the enriched Hom complex. The transferred edge v_{i+1} b_i u_i represents a_i. By the last paragraph of §2 it therefore EQUALS a_i as an actual degree-zero cochain.

For every i<j define a map of degree -(j-i-1)

    T_ij = v_j b_{j-1} s_{j-1} b_{j-2} ... s_{i+1} b_i u_i,

with no s in T_{i,i+1}. Differentiating replaces one s_r by id+u_r v_r. Terms using id vanish because they contain b_r b_{r-1}=0. Each remaining term splits the word at r. Thus, on the nose,

    d T_ij = sum_{i<r<j} T_rj T_ir.

For j-i=2, this forces T_i,i+2=h_i by §2. For span 3 it forces T_i,i+3=k_i. For span 4 it requires

    d T_04 = k_1 a_0 + h_2 h_0 + a_3 k_0 = c.

But T_04 lies in A(0,4)^-3=0, while c is a nonzero cochain. Contradiction. We needed neither side conditions s_i u_i=0, v_i s_i=0 nor u_i v_i=id. This covers arbitrary cofibrant C_i, not just finite-dimensional/free representables. A whole-diagram WE zigzag gives precisely the objectwise isomorphism commuting with edges used above; no faithfulness of Ho(M^[4])→Ho(M)^[4] is assumed.

## 4. Derived two-shift vanishes (S074-T197)

Let X:N→M be the integer sequence P_0,...,P_4,0,0,... . For i in N let L_i be the free covariant diagram functor left adjoint to evaluation at i. The standard free-quiver resolution is the objectwise exact sequence

    E=⊕_{i=0}^4 L_{i+1}P_i --D→ V=⊕_{i=0}^4 L_i P_i → X →0.

On the i-th summand D has the structure inclusion into L_i P_i and a_i into L_{i+1}P_{i+1}; the latter is zero for i=4. Including this last edge to the ZERO tail is essential. Exactness is the usual telescope identity: at vertex n, V(n)=⊕_{i<=min(n,4)}P_i maps to X_n by the path from i to n, and consecutive relations generate its kernel uniquely. D is degreewise split injective. The cone Q=Cone(D) with its augmentation q:Q→X is an objectwise quasi-isomorphism. Q is projectively cofibrant: E and V are sums of free diagrams on cofibrant modules, and its two-level cone filtration has cofibrant subquotients V and E[1].

For any target diagram Y, the enriched mapping complex Hom(Q,Y) has a degree-n element given by vertex maps U_i:P_i→Y_i of degree n and edge maps V_i:P_i→Y_{i+1} of degree n-1. Its differential is

    δ(U,V)=(dU_i, dV_i + Y(i→i+1) U_i + U_{i+1} a_i).

This follows immediately from the two summands of D; characteristic two removes all signs. Take Y=X shifted by 2. The canonical structure map eta:X→Y, precomposed with q, is represented by (a_{i+1}a_i,0) at vertices i=0,1,2 and zero elsewhere. The degree -1 element

    U_i=h_i (i=0,1,2),    V_i=k_i (i=0,1),

with all remaining entries zero, has differential EXACTLY eta q. The vertex equations are dh_i=a_{i+1}a_i. The two nonzero edge equations vanish because dk_i=a_{i+2}h_i+h_{i+1}a_i. All later edge targets are zero, including the last edge at 4. Thus eta=0 in Ho(M^N), not merely at individual vertices. No tertiary filler is required for this free-quiver mapping complex.

Pass to real times by left Kan extension along N→R. It is zero for negative times and evaluates X_floor(t) otherwise, so it produces F. Left Kan is left Quillen since restriction preserves projective trivial fibrations/fibrations; in this particular chain it also preserves objectwise quasi-isomorphisms by its displayed evaluation formula. Left Kan of Y maps naturally to F^2, identically at t>=0 and via zero at t<0. Hence the real eta:F→F^2 factors through the left-Kan image of the zero derived map just constructed, and vanishes in Ho(M^R). The unique crossings F→O^1 and O→F^1 now satisfy both derived interleaving identities: the F-composite is zero=eta, and the O-composite is zero=its identity. Thus dIHC<=1.

For epsilon<1, evaluation at t=0 of eta_{2epsilon} is either id_P0 (2epsilon<1) or a_0 (1<=2epsilon<2). Both are nonzero in Ho(M). An interleaving with O in the diagram homotopy category would make eta_{2epsilon} zero, impossible after evaluation. Therefore dIHC=1.

## 5. Strict lower bound: ALL whole replacements of BOTH real lanes

Assume an epsilon-HI interleaving with epsilon<5/4. Enlarge its parameter to e=max(1,epsilon)<5/4 by postcomposing crossings with structure maps. Encode the strict interleaved replacement pair as one diagram on the real shoelace poset P_e (same-lane order; cross relation s+e<=t). Choose ONE projectively cofibrant whole-shoelace replacement Q. Restrictions Q_F,Q_O are connected by whole objectwise quasi-isomorphisms to F,O.

Every comparable structure map in a projectively cofibrant diagram on a poset is a cofibration here: for a generating free representable cell, the cell enters neither endpoint, both identically, or the later endpoint only; pushouts, successive attachments and retracts preserve the claim. Objects Q(x) are cofibrant by the same cell argument. This does not assert arbitrary Reedy diagrams on arbitrary categories have this property.

For every real u take the natural quotient

    C(u)=Q_F(u) ⊔_{Q_O(u-e)} 0.

The crossed map is a cofibration. Since Q_O(u-e) is acyclic, left properness makes Q_F(u)→C(u) a quasi-isomorphism. Moreover 0→C(u) is the pushout of that cofibration; hence C(u) is COFIBRANT. Crossed naturality gives one whole-diagram quotient map. The induced map C(t)→C(t+2e) is literally zero: on Q_F(t) its composite factors through Q_O(t+e), which is killed in the target, and on the other pushout generator 0 it is zero. This works at ALL real cuts, negative times and beyond time 5. Arbitrary acyclic/nonzero opposite lanes have not been replaced vertexwise by decree.

Put c_clock=2e-2 in [0,1/2) and sample times

    0, 1, 2+c_clock, 3+c_clock, 4+2c_clock.

They are strictly inside the respective half-open stages; each two-apart difference is 2e. Restrict C to these times. We obtain cofibrant C_i, literal b_{i+1}b_i=0, and an isomorphism to the P-chain in Ho(M)^[4] from the whole-WE zigzag. Section 3 gives a contradiction. Thus no epsilon<5/4 works and dHI>=5/4. At epsilon=5/4 the last sample is 5, so the proof deliberately says nothing about that endpoint.

Finally F(t)→F(t+5) is already zero for every real t: nonzero source requires t>=0, and then t+5>=5; negative source is zero. Unique zero crossings give a strict 5/2-interleaving with O without replacements. This proves the upper bound and completes T194.

## 6. Mathematical application, boundaries, novelty and design

The homotopical content is indispensable: the two secondary homotopies make eta_2 vanish in the DERIVED diagram category, but the nonboundary tertiary class c forbids any sufficiently small strict interleaving after all whole replacements. The obstruction is explicit and requires retaining the dg R-module structure. It is not the four-dimensional S073 toy and has a proven persistent-module application. A generic published higher-operation mechanism is not claimed original.

The 2026 Kuribayashi–Naito–Wakatsuki–Yamaguchi equality theorem is for Ch_k-valued persistence, not dgMod-R. Its Theorem3.3 therefore does not contradict T194. We have NOT proved a separation for dg modules over the ground FIELD. Nor have we calculated the image distance after forgetting R as a new theorem here. The finite 30-path script checks d²=0 and the endpoint kernel independently of the closed-form calculation; it does not certify the model-category/real-index argument.

G1 for this ALTERNATE theorem: INTERNAL COMPLETE PROOF, adversarially reconstructed in this session, pending a fresh referee. G1 for original Top^R: OPEN. G2: NOT PASSED / FAIL_TO_CLEAR; exact HHA originality and significance require source comparison beyond query silence. NO automatic paper switch, Lean or manuscript. Lean dependency design ONLY: finite F2 path algebra and dg Yoneda; projective dg modules; cone free-quiver resolution; real Kan extension; projective shoelace quotient; chain-homotopy transfer; clocks; metric infimum. No Lean/mathlib version/build was selected or run. The large categorical dependencies cannot be hidden as new axioms.
