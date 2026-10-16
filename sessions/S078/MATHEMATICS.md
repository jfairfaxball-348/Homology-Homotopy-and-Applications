# S078 MATHEMATICS — a structural truncated-local ring separation and semisimple boundary

**Internal proof status:** T202, T203 and T204 argued in full below; not a Lean proof, external peer referee, published result, or journal originality clearance. The statement is for unbounded homological RIGHT chain complexes over ordinary degree-zero algebras and full REAL persistence diagrams. The source-dependent input to T203 is the September 2026 theorem for fields; no field-only theorem is applied to a nonsemisimple ring.

## T202 — all-N quantitative strict HI>IHC family

Let k=F_2 and for every integer N>=4 set B_N=k[t]/(t^N), an indecomposable commutative finite-dimensional local k-algebra. Put P_n=B_N (n>=0), P_n=0 (n<0), with d_n=t for odd n>=1 and d_n=t^{N-1} for even n>=2. It resolves the residue module k=B_N/(t): ker(t)=(t^{N-1})=im(t^{N-1}) and ker(t^{N-1})=(t)=im(t). It is a bounded-below complex of free B_N modules, hence dg-projectively cofibrant and fibrant in the projective model Ch(B_N). Homological shifts are P[i]_n=P_{n-i}, signs trivial in characteristic 2.

Let x:P[i]->P[i+1] be the homogeneous degree-zero chain map with underlying unshifted degree-minus-one coefficients x_n=1 for odd n>=1 and x_n=t^{N-2} for even n>=2. Direct computation d_{n-1}x_n+x_{n-1}d_n=0 for n>=2; [x] spans Ext^1_{B_N}(k,k)=k. For each width 2<=m<=N-1 define f_m as an underlying degree-minus-one map: (f_m)_n=0 for odd n and (f_m)_n=t^{N-1-m} for even n>=2. Write f_1=x. The maps f_m are higher homogeneous maps from P[i] to P[i+m] of degree m-1, all corresponding on unshifted P to degree minus one. Their Hom differential is (Df)_n=d_{n-1}f_n+f_{n-1}d_n. Exact identities for every 2<=m<=N-1 are

    D f_m = sum_{a=1}^{m-1} f_{m-a} f_a.                       (1)

At even n only the left factor f_1 has a nonzero odd coefficient; at odd n only the right factor f_1 has a nonzero odd coefficient. In either case the sum equals t^{N-m}. The differential of f_m equals t*t^{N-1-m}=t^{N-m}. For m=2: f_2 is a nullhomotopy of x^2; for m=3: f_3 is a coherent secondary filler of x f_2+f_2 x. The latter exists exactly as written for all N>=4, including N=4.

**Complete all-choice N-fold obstruction, not selected m_N.** In Hom_B(P,P) take ANY representatives a_{i,i+1} of the fixed nonzero Ext^1 class [x], indexed 0<=i<N; take EVERY possible defining family of higher degree-minus-one maps a_{ij} for 1<=j-i<=N-1 satisfying D a_{ij}=sum_{i<r<j} a_{rj}a_{ir}. The existence of at least one such family follows from a_{ij}=f_{j-i} above. The component at n=1 of each adjacent representative is congruent to 1 modulo t because boundaries of a degree-minus-one chain map there reduce to zero in Hom(P,k), and its chain-map identity at n=2 gives

    t a_{i,i+1}(2)+t^{N-1}a_{i,i+1}(1)=0,
    a_{i,i+1}(2) = t^{N-2} mod t^{N-1}.                       (2)

Induct on the width m=j-i (2<=m<=N-1). Suppose every proper width q has at n=2 the leading term t^{N-1-q} modulo t^{N-q}; note for q=1 this is (2). At n=2 the defining equation reads

    t a_{ij}(2)+t^{N-1} a_{ij}(1)
       = sum_{i<r<j} a_{rj}(1) a_{ir}(2).                     (3)

The UNIQUE summand with lowest t-adic valuation is r=j-1: its left width one has (1) coefficient 1 mod t, and the right width m-1 has leading t^{N-m}. All other summands have right width <=m-2 and therefore lie in (t^{N-m+1}). Since m<=N-1, the term t^{N-1}a_{ij}(1) does not affect the leading t^{N-m} coefficient. We obtain

    a_{ij}(2) = t^{N-1-m} mod t^{N-m}.                       (4)

For the terminal missing (0,N) cell the obstruction cocycle W=sum_{0<r<N} a_{rN}a_{0r} has at n=2

    W_2 = a_{N-1,N}(1) a_{0,N-1}(2)
          + terms divisible by t = 1 mod t.                 (5)

Any boundary at this component has form (Db)_2=t b_2+t^{N-1}b_1, divisible by t. Thus W is not a Hom boundary and zero is excluded from the ENTIRE N-fold defining-system bracket for EVERY representative and EVERY filler, not merely from one minimal A-infinity structure. The auto-equivalence freedom at each vertex is Aut_{D(B_N)}(k[i])=k^×={1}; no hidden nonzero scalar choices. This proof explicitly handles all higher choices and the unbounded resolution, with no finite truncation argument standing in for the universal proof.

**Whole derived 2-shift nullity.** Define X on N (nonnegative integers) with X_i=P[i] for i=0,...,N and X_i=0 for i>=N+1, with all consecutive arrows x and terminal edge X_N->0 included. The standard free-linear-quiver projective presentation E=directsum_{i=0}^N L_{i+1}X_i -> V=directsum_{i=0}^N L_i X_i -> X gives an objectwise split underlying-graded injective first arrow, with cone a whole projectively cofibrant replacement of X. The natural two-unit shift eta_2 has component x^2 for i<=N-2 and zero later. In the total Hom complex from the free-quiver cone to X shifted 2, choose vertex homotopies f_2 at i<=N-2, zero later, and edge compatibility homotopies f_3 at i<=N-3, zero later. The equations Df_2=x^2 and Df_3=xf_2+f_2x exactly give D(h,z)=eta_2, including boundary edges. Hence eta_2^X=0 as a WHOLE morphism in Ho(Ch(B_N)^N), not merely at stalks.

Left Kan extension along the integer-to-real inclusion j:N->R is left Quillen since restriction preserves objectwise fibrations and trivial fibrations for projective diagram models. F_N=Lan_j X is empty (zero) before 0, equals P[i] on [i,i+1) for 0<=i<=N, and is zero from N+1 onward. Although Lan(X^2)->(Lan X)^2 is not an isomorphism at all negative real times, it is a natural comparison carrying the zero derived eta_2^X to derived eta_2^{F_N}=0. Thus zero morphisms supply a derived 1-interleaving of (F_N,0). Conversely for epsilon<1, eta_{2epsilon}^{F_N}(0) is id_{P0} if 2epsilon<1, and [x] if 1<=2epsilon<2; both nonzero in D(B_N). Therefore

    d_IHC(F_N,0)=1.                                           (6)

**Parametric real shoelace lower bound.** More generally, let m>=4 and any model category Ch(B) projective real diagram F have m+1 successive unit-length stages quasi-isomorphic to cofibrant-fibrant P_0,...,P_m with fixed adjacent Ho(Ch(B))-maps and complete m-fold all-choice Toda zero excluded. Suppose whole derived eta_2=0. For epsilon<1+1/(2 floor(m/2)), if a strict epsilon-interleaving existed after arbitrary whole-diagram weak equivalences on BOTH lanes (the second lane an arbitrary WHOLE acyclic diagram), inflate epsilon to e=max(1,epsilon) preserving interleavability. Projectively cofibrantly replace the ENTIRE real shoelace diagram Q. Every comparable arrow Q(p)->Q(q) is a cofibration of cofibrant complexes: each projective generating cell represented at a source object evaluates on an arrow as either 0->(generating cofibration), identity on the generating cofibration, or zero, and cellular pushouts/transfinite composition/retracts preserve these arrow cofibrations. In particular Q_O(u-e)->Q_F(u) is a cofibration with acyclic source, for EVERY real u.

The natural whole-real quotient C(u)=Q_F(u)/Q_O(u-e) is therefore objectwise cofibrant and whole weakly equivalent to F by the exact acyclic-kernel sequence; no assumption that the O lane is literally zero. The strict shoelace factors Q_F(u)->Q_O(u+e)->Q_F(u+2e), so C(u)->C(u+2e) is LITERALLY zero for ALL real u. Put alpha=2e-2, so 0<=alpha<1/floor(m/2), and select m+1 stage times

    s_i = i + floor(i/2)*alpha,        0<=i<=m.              (7)

Each s_i lies in [i,i+1), while s_{i+2}-s_i=2+alpha=2e. Thus b_{i+1}b_i:C(s_i)->C(s_{i+2}) equals zero STRICTLY for i=0,...,m-2, even for arbitrary whole weak replacements. Coherent whole weak-equivalence of C to F transports all adjacent classes to the fixed ones; if necessary account explicitly for vertex autos.

Choose strict homotopy inverses u_i:P_i->C(s_i), v_i:C(s_i)->P_i and homotopies H_i satisfying D H_i=id_C+u_i v_i (plus sign in characteristic 2). For all i<j transfer the chain as T_{ij}=v_j b_{j-1} H_{j-1} ... H_{i+1} b_i u_i, omitting intermediate H for neighbors. Differentiation uses D H=id+uv; every id term has a strictly zero consecutive b b factor, and every uv term splits into a product T_{rj}T_{ir}. This constructs all m-fold defining fillers INCLUDING a terminal T_{0m}, making the all-choice obstruction a boundary. Contradiction. Therefore

    d_HI(F,0) >= 1+1/(2 floor(m/2)).                          (8)

Apply m=N with the complete nonzero bracket (5), the whole eta_2 (6), and F=F_N. Since F_N->F_N^{N+1} is literally zero all reals, zero maps provide a strict (N+1)/2 interleaving, yielding T202:

    d_IHC(F_N,0)=1 < 1+1/(2 floor(N/2))
                    <= d_HI(F_N,0) <= (N+1)/2.               (T202)

For N=4 this recovers S077's 5/4, for N=5 gives >=5/4, for N=8 >=9/8. This proof does NOT assert the lower endpoint is attained or exact d_HI, and does NOT switch the original Top-valued paper target.

## T203 — semisimple F2 coefficients give equality for all diagrams

Let A be ANY finite-dimensional semisimple F2-algebra. By Wedderburn–Artin and Wedderburn's little theorem each finite division ring over F2 is a finite FIELD, and A is a product of matrix rings over finite extension fields F_{2^d}. Exact Morita equivalence of ordinary right module categories transports chain complexes, quasi-isomorphisms, projective-model derived diagram equivalences and strict interleavings of all real diagrams without changing epsilon. It thus preserves both d_IHC and d_HI. In each field factor the 12-Sep-2026 Kuribayashi–Naito–Wakatsuki–Yamaguchi Theorem 3.3 gives d_IHC=d_HI for persistent Ch(field); products preserve the equality (distances are the maximum of component distances, including infinity), hence

    for ALL F,G in Ch(A)^R: d_IHC(F,G)=d_HI(F,G).             (T203)

This is a precise SUFFICIENT equality boundary, not a universal converse. A nonsemisimple arbitrary A need NOT be Morita-equivalent to one of B_N and no assertion is made for all such A. The external input is field-only, never an illicit forgetful use of the field equality on B_N.

## T204 — genuinely distinct coefficient rings, limits

Each B_N is commutative local and indecomposable, nonsemisimple with radical (t) and Loewy length N. If B_M and B_N were Morita-equivalent, their centers would be isomorphic. But Z(B_N)=B_N has F2-dimension N, so M!=N excludes Morita equivalence. In particular B_4 and B_8 are independent non-Morita-equivalent natural group-algebra cases k[C4], k[C8] (t=g+1), while B_5 is an additional truncated local algebra NOT a finite 2-group algebra (dimensions of finite group algebras are powers of 2). This is not a universal classification of all finite-dimensional local algebras or a claim of independent novel m_N operations.

**Boundary and gate:** a finite-dimensional semisimple coefficient class has universal equality; an infinite pairwise non-Morita-equivalent indecomposable local family fails it quantitatively. All real diagram quantifiers and arbitrary whole zigzag replacements are included. Internal G1 proof complete; G2 independent new conceptual HHA utility NOT PASSED because classical cyclic higher A-infinity operations and general rectification/Toda are known. Original integral five-sphere Top^R remains OPEN, owner switch required before any Lean or paper work.
