# S077 — independent derivation and stress test of the natural cyclic-four separation

**Verdict scope:** Internal independent algebraic reconstruction and detailed model-category proof review; NOT Lean certification, independent human peer review, exhaustive outside proof reproduction, or HHA journal acceptance. S076 theorem T198–T200 survives the concrete attacks below; retain G1 as INTERNALLY CONFIRMED, not formally verified. The designated Top^R sphere claim is still OPEN.

## 1. Resolution, conventions, and complete operation

Let k=F_2, B=k[C_4] with generator g and t=g+1. In characteristic two g^4-1=(g+1)^4=t^4, hence B=k[t]/(t^4). All modules RIGHT modules, B commutative, all complexes homologically graded, differential lowering degree. Set P_n=B for n>=0, P_n=0 for n<0, and d_n=t for odd n>=1, d_n=t^3 for even n>=2. As ker(t)=(t^3)=im(t^3) and ker(t^3)=(t)=im(t), H_n(P)=0 for n>0 and H_0(P)=k. Each term is free; bounded-below projective P and all P[i] are cofibrant. Let X_i=P[i] for 0<=i<=4 with (P[i])_n=P_{n-i}; signs of shifted differentials disappear in char 2.

An underlying degree -1 family f_n:P_n->P_{n-1} is a degree-zero chain map P[i]->P[i+1]; a degree +(j-i-1) higher defining-system homotopy P[i]->P[j] uses THE SAME underlying degree -1, because the target is shifted by j-i. The Hom differential on these underlying degree -1 maps is
(Df)_n=d_{n-1}f_n+f_{n-1}d_n.
Set x_odd=1, x_even=t^2; h_odd=0, h_even=t; z_odd=0, z_even=1, for n>=1, and zero at unavailable indices. For every n>=2, direct substitution in both parity cases gives
Dx=0; (xx)_n=t^2; Dh=xx; (xh+hx)_n=t; Dz=xh+hx.
In particular the degree -2 terminal cocycle w=xz+hh+zx has w_n=1 for n>=2. At n=2 a boundary is t f_2+t^3 f_1 and is in (t). Thus w is not a boundary. Notice that z_2 is a valid map P_2->P_1, NOT P_2->P_{-1}; the derived homological shifts are essential. The class of x is nonzero because x_1 mod t=1 in Hom(P,k); this is the degree-1 Ext generator.

**All representatives, not a chosen m4.** Let a,b,c,d be arbitrary four degree-zero representatives of the same nonzero Ext^1 class, indexed underlying degree -1. For each such a: a_1=1 mod t, and Da at n=2 forces t a_2+t^3 a_1=0, whence a_2=t^2 mod t^3. For ANY primary H between adjacent reps, D H=ba implies at n=2
t H_2+t^3 H_1=b_1 a_2=t^2 mod t^3,
so H_2=t mod t^2. In particular H_2 has constant coefficient zero, with NO restriction on H_1 or higher components. For ANY secondary K with DK=cH+Ja, one obtains
t K_2+t^3 K_1=c_1 H_2+J_1 a_2=t mod t^2,
hence K_2=1 mod t. The resulting terminal component is c_1 K_2 + H_1 J_2 + L_1 a_2, reducing to 1 mod t; all boundaries reduce to zero. Choice of representative, ALL three primary fillers, BOTH secondaries and arbitrarily high components CANNOT change this conclusion. A contrary zero-valued defining system is therefore impossible. The explicit x,h,z proves existence of a defining system. This is an infinite-choice symbolic necessity argument, NOT a finite enumeration of infinite cochains.

All sampled C_i are homotopy equivalent to P[i] as cofibrant-fibrant B-complexes. Moreover Aut_{D(B)}(P[i]) = (Ext_B^0(k,k))^× = k^×={1}; thus arbitrary homotopy-equivalence conjugation cannot secretly change any adjacent [x] to a different nonzero scalar. This removes a potential quantifier loophole in T199(ii). The complete fourfold Toda/Massey terminal excludes zero, independent of the selected classical A-infinity m4.

Independent local diagnostic of ring multiplication (bit-coded B) executed outside the repository: checked n=2,...,79 separately for Dx=0, Dh=xx, Dz=xh+hx, w=1; enumerated 16 valid (a1,a2) jets, and verified every one of 256 adjacent jet-pairs has 32 primary (H1,H2) solutions with H2=t mod t^2; two independently chosen nontrivial triples with ALL their low-degree secondary solutions had K2 constant 1. This is a bounded spot check without stored output hash, NOT model-category verification or a claim to enumerate all infinite defining systems.

## 2. Derived shift vanishes as a WHOLE diagram

Take X on the integer line N with X_i=P[i] for 0<=i<=4 and X_i=0 for i>=5, all adjacent x except a_4:X4->0, which MUST be included. For L_i the left adjoint free diagram at integer vertex i, use the standard linear-quiver projective presentation
E=directsum_{i=0}^4 L_{i+1} X_i -> V=directsum_{i=0}^4 L_i X_i -> X ->0.
The edge differential is the incidence identity in the i-slot and x in the (i+1)-slot (zero for terminal), so at every vertex the E->V map is split-injective in the underlying graded module and its cokernel is exactly X(vertex). At vertices >=5 the last edge kills the residual tail. The mapping cone Cone(E->V) is a WHOLE projectively cofibrant replacement: its underlying graded cells have V and E[1], and the objectwise cone-to-X map is a quasi-isomorphism.

An arrow into X^2 is represented by vertex maps U_i (from X_i to X_{i+2}) and edge-coherence terms. The canonical eta_2 has vertex maps x^2 for i=0,1,2, and zero for i>=3. Define homotopies of the vertex maps by h at i=0,1,2 and 0 later (Dh=x^2). The edge compatibility failure for each of i=0,1 is xh+hx=Dz; use z as the edge part of the cone homotopy, zero on later edges including the terminal edge. The complete cone differential, rather than only objectwise maps, then exhibits eta_2^X=0 in Ho(Ch(B)^N). No fourfold obstruction is needed to kill a two-unit shift: z is exactly the secondary compatibility filler. One can check this by the two-term standard Hom-complex of the free-quiver resolution, whose total differential comprises vertex D and edge incidence: (h,z) kills (x^2,0).

Let j:N->R include the nonnegative integers. Restriction j^* preserves objectwise fibrations and acyclic fibrations, hence Lan_j is left Quillen on projective diagram structures; Lan_j(X)=F, the REAL zero-before-zero, constant-on-half-open-stage, zero-after-five diagram. For negative real u, Lan_j(X^2)(u) and F^2(u) need not agree; the natural comparison Lan_j(X^2)->(Lan_j X)^2 exists, and eta_2^F is its composite with Lan_j(eta_2^X). Since X is represented cofibrantly for the derived transformation, this proves eta_2^F=0 in Ho(Ch(B)^R), not merely after objectwise evaluation.

For 0<=2e<1, eta_(2e)^F(0)=id_{P0}; for 1<=2e<2, it is x:P0->P1. These are nonzero in D(B), proving no derived interleaving with zero for e<1; the zero morphisms become a derived 1-interleaving precisely because eta_2^F vanishes. Hence d_IHC(F,0)=1.

## 3. Unrestricted all-real HI obstruction

Take an arbitrary epsilon-HI interleaving after ANY WHOLE real-diagram weak-equivalence zigzags of BOTH F and the zero diagram, for epsilon<5/4. Its strict interleaving is a diagram on the real shoelace poset S_e with e=max(1,epsilon)<5/4. Cofibrantly replace this ENTIRE shoelace diagram by Q, not individual five sampled complexes, using projective objectwise quasi-isomorphisms. Q's F lane is whole weakly equivalent to F; its O lane is WHOLE acyclic but may consist of nonzero complexes.

For EVERY comparable p<=q in the shoelace poset, Q(p)->Q(q) is a projective cofibration in Ch(B). Proof: each representable generating cell L_p(A->B) evaluates on an ordered arrow p'<=q' as 0->(A->B), (A->B)->(A->B) by identity, or 0->0; cofibrations are stable under their cellular pushouts/transfinite composition/retracts, with induction via pushouts preserving the arrow cofibration. In particular Q_O(u-e)->Q_F(u) is a cofibration of cofibrant complexes for every real u.

Define the natural WHOLE real diagram C(u)=Q_F(u) pushout_{Q_O(u-e)} 0, i.e., the chain-complex quotient by the cross image. This is cofibrant and Q_F(u)->C(u) is a quasi-isomorphism for each u: the source Q_O(u-e) is acyclic and its injection is a cofibration, so the short exact sequence has acyclic kernel (or use left properness). The quotient construction commutes with every real u<=v and therefore C is a WHOLE weakly equivalent F diagram, not just a sequence of five pointwise equivalences. Strict interleaving factorisation Q_F(u)->Q_O(u+e)->Q_F(u+2e) shows the composite C(u)->C(u+2e) is LITERALLY zero for EVERY real u: Q_O(u+e) is killed in forming C(u+2e).

Set alpha=2e-2 in [0,1/2). Choose real times
s0=0, s1=1, s2=2+alpha, s3=3+alpha, s4=4+2alpha.
Each si lies in stage i; s2-s0=s3-s1=s4-s2=2e. Thus C_i=C(si) is a strict length-four chain of COFIBRANT complexes b_i with b_{i+1}b_i=0 for i=0,1,2. The WHOLE C~F equivalence yields a coherent identification of its adjacent arrows with [x] after transporting through D(B); no objectwise arbitrary identifications can change them because Aut_D(B)(k[i])={1}.

Choose strict homotopy equivalences u_i:P[i]->C_i, v_i:C_i->P[i] and homotopies s_i with D s_i=id_{C_i}+u_i v_i; these exist because the C_i and P[i] are cofibrant and all are fibrant. For j>i set
T_ij=v_j b_{j-1} s_{j-1} b_{j-2} ... s_{i+1} b_i u_i
(with no s for j=i+1). Each has homological degree j-i-1 across P[i]->P[j], corresponding to degree -1 on the unshifted P; the terminal T_04 has one higher degree and differentiates to all three terminal products. Leibniz differentiation uses Ds=id+uv; every id term multiplies consecutive b's and vanishes, leaving exactly
D T_ij = sum_{i<r<j} T_rj T_ir.
For (i,j)=(0,4) it makes the complete fourfold terminal a boundary. This directly contradicts Section 1's all-choice residue. Therefore no such e<5/4 exists, i.e. d_HI(F,0)>=5/4, even with arbitrary replacements of both whole lanes, nonzero acyclic O lane and all real times. F->F^5 is literally zero, so zero arrows give d_HI(F,0)<=5/2. No exact value is asserted.

**Failure tests:** (i) Forget B-action: the same underlying k-complexes fall under September 2026 field equality and the gap disappears; no contradiction. (ii) A mere selected A-infinity product would not exclude a zero-valued COMPLETE bracket; the explicit jet does. (iii) Arbitrary objectwise nullity of eta2 does not imply a whole derived nullhomotopy; the quiver cone with z is necessary. (iv) The acyclic O lane cannot be discarded until after constructing the whole quotient.

## 4. Odd-factor family

For finite odd-order H, Maschke makes the trivial kH-module k projective. For G=C4×H, each P_n tensor k carries projective right kG-action; the tensor resolution remains exact and consists of projectives. Degreewise Hom_{kG}(B⊗k, B⊗k)=B⊗End_{kH}(k)=B as a k-vector algebra, naturally compatible with differentials, so all formulas persist. This is only the SAME principal block padded by a semisimple factor. The family does NOT establish broad representation-theoretic novelty or classification.

**Conclusion G1:** no mathematical counterexample located; the quantitative strict result survives an independent internal proof audit in its exact natural Ch(B) scope. It does not establish the original Top^R goal, does not prove an exact endpoint and is not machine or externally checked.