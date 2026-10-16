# S088 MATHEMATICS — cyclic covering-space model and the exact boundary of G1

## A. Hostile G1 audit, result OPEN by independent-proof criterion
Scope remains the full unbounded projective model category Ch(B_N)^R, B_N=k[t]/t^N, k=F2, N>=4, arbitrary real indices, TWO real lanes with all objectwise-WE zigzags and arbitrary acyclic second lane. No pointwise Ho(Ch)^R replacement or switch of category.

Rechecked the S087 argument at its dependencies:
- P is the free resolution with d_(2j+1)=t, d_(2j)=t^(N-1); d^2=0 and homology k in degree 0 only. Degree -1 self-map x_(odd)=1, x_(even)=t^(N-2), x_0=0 satisfies dx+xd=0; its Ext^1 class is nonzero from the n=1 unit.
- Two-column successor resolution has E0=sum h_i tensor X_i, E1=sum h_(i+1) tensor X_i, including X_(N+1)=0 and edge x_N=0. The vertex h=f2 and edge k=f3 equations hold with f2_even=t^(N-3), f3_even=t^(N-4); δh=Dk, including n=1,2 and last nonzero edge. Derived eta2 is zero on the WHOLE integer diagram, not just vertices.
- Left Kan j_! of integer step diagram along j:{0,...,N+1}->R is zero for u<0 and X_floor(u) on each half-open right interval. Every nonempty predecessor comma category has a terminal object, so j_! preserves objectwise WE, not merely WE between cofibrants; negative times and final cut are treated by zero source.
- The projective cofibrant comparable-arrow property for a set-sized poset is checked at representable cells (0->0, 0->cell, identity), then relative cell attachments, transfinite stages and retracts. In S087 this makes the acyclic second-lane cross arrow a degreewise split injection with cofibrant cokernel, giving a WHOLE real quasi-isomorphic quotient C and literal transition C(u->u+2e)=0.
- Real clock s_i=i+floor(i/2)(2e'-2): for e'<1+1/(2floor(N/2)), s_i belongs to [i,i+1) through i=N and s_(i+2)-s_i=2e'. The S087 transfer T_ij=v_j b_(j-1) H_(j-1)...H_(i+1)b_i u_i gives DT_ij=sum_r T_rj T_ir; all contributions containing two adjacent b maps vanish because b_(i+1)b_i=0.
- For an arbitrary defining system, the n=2 degree-minus-one relation t(a_ij)_2+t^(N-1)(a_ij)_1=sum_(i<r<j)(a_rj)_1(a_ir)_2 gives valuation (a_ij)_2=t^(N-1-(j-i)) modulo t^(N-(j-i)) for widths 1..N-1, assuming adjacent x class n=1 unit mod t. The r=j-1 term alone has minimal valuation. Thus terminal W_2=1 mod t, not a boundary. For N=4/5/8 the respective terminal width N-1 has leading term t^0. NO complete zero defining system was exhibited.

**Important limit:** These checks trace and stress-test the SAME S087 projectively cofibrant shoelace quotient + transferred Toda system. They are NOT a logically independent second all-real proof. The alternative bar/homotopy-coherent rectification route did not supply a standalone theorem converting EVERY whole-real two-lane e-interleaving to a nonvanishing invariant without invoking that same quotient-transfer. A separate categorical theorem with hypotheses verified for ALL R and acyclic O remains absent. No actual counterdiagram was found. Therefore G1 remains OPEN UNDER THE OWNER'S TWO-PROOF STANDARD (not refuted, no freeze).

## B. Internal cyclic-cover ghost theorem — actual geometric cellular source
Let r>=2, N=2^r, 1<=s<r, m=2^s, G=C_N=<g>, H=<g^m> (order N/m), Q=G/H=C_m; k=F2. Let E=S^infty be the unit sphere in countably infinite complex coordinates with scalar free G-action. E is contractible. The infinite lens CW complex L_N=E/G is BG and Y=E/H is BH; the residual action of Q on Y is free, with Y/Q=L_N. For r=2,s=1, the cover is RP^infty=BC2 -> L_4=BC4, with Q=C2 deck action.

Choose the standard equivariant lens-cell decomposition with one free k[G] generator e_n in each n>=0. Then the cellular chain complex C_*(E;k) is the 2-periodic resolution P_N:
  P_(N,n)=k[G], d(e_(2j+1))=(g-1)e_(2j), d(e_(2j))=(1+g+...+g^(N-1))e_(2j-1).
In characteristic two, t=g-1=g+1 and N_G=1+g+...+g^(N-1)=t^(N-1) because (g^N-1)/(g-1)=(g-1)^(N-1). The residual Q-equivariant cellular chains of Y are exactly C_*(Y;k)=P_N tensor_(kG) kQ=P_m. This is a literal cellular chain model, NOT the spurious assertion that tensor preserves arbitrary WE; only this explicit K-projective G-cellular complex is tensored.

The unique nontrivial character chi:G->C2 defines alpha∈H^1(BG;k)=Ext^1_(kG)(k,k). On P_N the degree-minus-one chain map
  x_(2j+1)=1 (j>=0), x_(2j)=t^(N-2) (j>=1), x_0=0
is a chain representative of alpha: dx+xd=0 by t*t^(N-2)=t^(N-1), and x_1=1 mod t detects the generator in Ext^1. In a bar model alpha acts by the equivariant cap operation; the above formula fixes a particular chain representative on the minimal equivariant cellular resolution. Identification is of the Ext/homotopy class, NOT a claim that all bar-cellular cap representatives assemble into equivalent long strict diagrams without coherence data.

Pass this chosen representative to Q-equivariant chains of Y. Since m<=N-2, t^(N-2)=0 in kQ and the degree-minus-one cellular representative becomes:
  x_m,odd=1, x_m,even=0, x_m,0=0.
It is a chain map and x_m^2=0 **literally**. For all n>=0, H_n(P_m)=k (degree 0 is kQ/(t), positive odd is ann(t)=(t^(m-1)), positive even is kQ/(t)). On homology, odd-degree x_m sends t^(m-1) to zero modulo t (because m>=2); even-degree x_m=0. Thus H_n(x_m)=0 in EVERY degree. Nevertheless x_m is NONZERO as morphism in D(kQ): if x_m=dh+hd for a degree-zero B_m-linear h, its n=1 component would require 1=t(h_0+h_1), impossible in kQ. Geometric reading: restriction chi|_H is trivial since H⊂<g^2>, so the nonequivariant cap action on H_*(BH;k) vanishes, while the Q-equivariant chain class survives. This is an explicit deck-action-sensitive derived ghost.

## C. A geometrically sourced chain-action persistence and its distances
Define X_i=P_m[i] for 0<=i<=N, X_(N+1)=0. For each i<N choose adjacent transition x_m shifted as a degree-zero chain map X_i->X_(i+1); set terminal X_N->0 to zero. For all real u put F(u)=0 for u<0 and u>=N+1, otherwise X_floor(u); maps within a unit interval are identity, across cuts are appropriate composites of x_m. This is a REAL persistence diagram of Q-equivariant CELLULAR CHAINS obtained from the covering Y->L_N and chosen cellular cap representative. It is NOT asserted to be the chains of an increasing filtration of spaces or to be independent of every possible strict cap representative; the constructed model and its maps are explicit.

For each n, the persistence module H_n(F(u)) has one k interval [i,i+1) for every i=0,...,min(n,N), with zero maps at every cut. Therefore d_CohI(F,0)=1/2 (the upper bound from length-one bars; lower at u=0 in H_0 with 2e<1). The η_(2e) component at u=0 equals id for 2e<1 and equals x_m, which is nonzero in D(B_m), for 1<=2e<2; hence d_IHC(F,0)>=1 and d_HI>=d_IHC. Since x_m^2=0, F(u->u+2)=0 for all u including negative u and final cut, giving a strict 1-interleaving with zero. Thus
    d_CohI(F,0)=1/2 < d_IHC(F,0)=d_HI(F,0)=1.
This extends T206's interpretation to a genuine infinite-CW cyclic covering, for N=4,m=2 specifically RP^infty->L_4 with residual C2. It does NOT produce a new strict HI>IHC difference, as both distances equal 1.

Forgetting the Q-action via the exact functor Ch(kQ)->Ch(k) preserves the homology barcodes and makes x_m nullhomotopic on underlying vector-space complexes: every chain complex of vector spaces splits into its homology plus contractible summands. By the ALL-REAL UNBOUNDED field equality in KNYW (2026) Theorem 3.3, the underlying field-valued diagram U(F) satisfies
    d_HI(UF,0)=d_IHC(UF,0)=d_CohI(UF,0)=1/2.
**Concrete use:** the factor-two gap is an equivariant-covering obstruction invisible to ordinary mod-two homology barcodes of Y, not a claim of a universal multiplicative stability theorem or a numerical improvement over known rectification theory.

## D. Sharp dimensional realisation obstruction
For m>=2, H_q(P_m)=k for EVERY q>=0. If Z is a finite-dimensional CW complex of dimension d with any ordinary degree-zero local system of kQ modules, C_q(Z;local coefficients)=0 for q>d and hence H_q=0 for q>d. The same holds for any finite simplicial model, and any bounded perfect complex over B_m has H_q=0 outside finitely many degrees. Therefore P_m, and each shifted stage X_i, cannot be quasi-isomorphic to ANY such bounded cellular/perfect complex. In particular no finite filtered CW/simplicial complex with conventional local coefficients can realise the whole F diagram in D(B_m). This is a proved obstruction, NOT a no-go for infinite CW, parametrised spectra or derived sheaf coefficient systems. The infinite lens cover above avoids the obstacle.

## E. Independent result/gate accounting
- New in-programme geometric construction: cyclic-cover deck-equivariant cellular chain model plus exact 1/2-versus-1 disparity and field-forgetful 1/2 comparison (INTERNAL MATHEMATICS, source-sensitive).
- Finite-dimensional/perfect realisability NO-GO: elementary proof above.
- G1 second independent all-real proof: NOT FOUND; the same S087 route survives this audit and no genuine counterexample was found.
- G2 original HHA-grade new conceptual contribution: NOT PASSED. Cyclic higher m_N and cap/cover phenomena have substantial prior art; the result is geometric but still cap-action *chain persistence*, not filtration by inclusion of observed spaces, and stability/naturality beyond fixed chosen model was not independently established.
- No exact d_HI endpoint for T202, no Lean, Palomar, paper, external contact or submission.
