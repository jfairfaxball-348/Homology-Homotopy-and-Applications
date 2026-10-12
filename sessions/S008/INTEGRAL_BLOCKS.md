# S008-T23 — Exact integral-PID diamond criterion

Source boundary: Lebovici–Lerch–Oudot arXiv:2402.16624v4 (11 December 2024, accepted HHA version), Theorems 4/14 concern Vect_k. Definitions 7/9, Lemma 17 and §§5–7 proof were inspected. Lemma 17's automatic splitting of a death-block submodule uses the field setting; over Z a chosen nonprimitive submodule need not split. This is not a defect of their theorem.

## Exact statement

Let R be a PID and let A→B, A→C, B→D, C→D be a commuting square of finitely generated free R-modules, with maps f,k,g,h and gf=hk. Define α=(f,k):A→B⊕C and β=(g,−h):B⊕C→D. Put U=im g, V=im h, J=U+V. Primitive means quotient torsion-free, hence free and the inclusion split.

The square is a finite direct sum of standard free rank-one TWO-PARAMETER BLOCK modules on the diamond iff

(i) im α=ker β (integral middle exactness), and
(ii) U, V and U+V are primitive in D.

Here the only block supports are {00}, {11}, {00,10}, {00,01}, {10,11}, {01,11}, and the full diamond. These are the birth/death/band/full blocks, not all interval supports. A singleton at 10 or 01 and a three-point L are intervals but are NOT these blocks. Zero modules are allowed. No hypotheses about individual lower arrows are needed.

## Proof with actual module splittings

Necessity: each of the seven rank-one blocks is middle exact by direct check. Its U,V,J are spans of subsets of the top basis, so primitive. Direct sums retain these properties.

Sufficiency: K=ker α. Since A/K≅im α=ker β is free, choose A=K⊕A'. All outgoing maps vanish on K, so it is a summand supported at 00 (not merely a pointwise split with an unverified natural projection). Since J is primitive in D, choose D=J⊕D0. All incoming maps land in J, so D0 is a summand supported at 11. Remove these two summands. The remaining square has α injective and β surjective and

0→A' --α--> B⊕C --β--> J→0

exact. U,V remain primitive in J: J/U and J/V embed in D/U and D/V, respectively. Let I=U∩V. It is primitive in U and V because U/I embeds in D/V and V/I embeds in D/U. Choose complements U=I⊕U', V=I⊕V'. Their sum yields a direct decomposition J=I⊕U'⊕V': a relation i+u'+v'=0 forces u'∈U∩V=I, hence u'=v'=i=0.

The surjections B→U and C→V split (U,V free). Use chosen lifts of this decomposition to write

B=ker g ⊕ I_B ⊕ U'_B,
C=ker h ⊕ I_C ⊕ V'_C.

In these coordinates ker β is exactly ker g ⊕ ker h ⊕ diagonal I, since U',V' components cannot cancel. Identify A' with this kernel via α. The square now visibly splits into rank-one copies of

- K at 00,
- D0 at 11,
- ker g on {00,10},
- ker h on {00,01},
- I on the full diamond,
- U' on {10,11},
- V' on {01,11}.

All active arrows are identities in the chosen bases. This constructs one simultaneous integral basis at every vertex. In particular primitive lower images and diagonal images FOLLOW from (i)–(ii). This proves both implications for every finite rank including zero.

## Genuine joint-lattice obstruction with every arrow primitive

For each integer m≥2, set A=0, B=C=Z, D=Z², g(1)=(1,0), h(1)=(1,m). Both nonzero edge maps are primitive injections, and all other maps (zero-domain maps) have torsion-free cokernel. The joint matrix β has trivial kernel: b−c=0 and mc=0 imply b=c=0. Thus the square is integrally middle exact. But J has D/J≅Z/m: the second coordinate modulo m defines the quotient. Hence it is NOT integrally block-decomposable, despite every individual arrow splitting. Over Q it is the sum of the two upper bands. Over F_p for p dividing m, g and h coincide, so ker β has dimension one while A=0; middle exactness fails. Therefore this example is NOT block-decomposable over all fields, and no such all-fields claim is made. This is a two-parameter joint obstruction, not the one-arrow ×2 example from S007.

Geometric application (conventional): take a based rose R with loops x,y; the lower arms are two separate based circles, intersecting at the basepoint. At the top attach their reduced based mapping cylinders for the loop maps x and xy^m into R. Their source circles remain subcomplexes, the top deformation retracts onto R, and the common lower grade is a point. The square of H1 is exactly the above square. This gives a finite CW bifiltration of dimension two with pointwise free homology and primitive individual H1 maps, but no integral block basis. It is not a graph-only realization, since the cylinders supply 2-cells. Homology does real work in this application; the construction is still classical.

## Stronger adversarial fieldwise test

Let A=B=C=D=Z, f=3,k=2,g=2,h=3. Then α=(3,2), β=(2,−3). Their composite is zero; gcd(2,3)=1 shows β surjective, and ker β=Z(3,2)=im α. The full Koszul complex is split exact, so its reduction is exact over EVERY field, including characteristics 2 and 3. The field theorem therefore yields block decomposability of every field reduction. Yet U=2Z and V=3Z are individually nonprimitive in D. The integral square has NO block decomposition by T23. Thus all-field middle exactness alone is insufficient. This still uses edge saturation failure and must not be advertised as the all-arrow-primitive obstruction.

Conversely, on a diamond, if every arrow has primitive image and reduction over EVERY field is middle exact, then the integral square IS block-decomposable. To prove this without blindly transporting the field theorem, apply the universal coefficient sequence to the finite free Koszul complex. Vanishing of middle homology over Q and all F_p implies H1 over Z=0 (otherwise its nonzero free or p-primary part survives), and Tor(H0,F_p)=0 for all p implies H0=D/J torsion-free. Thus (i) holds, J is primitive, and primitive upper arrows give U,V primitive; T23 applies. This is the finite-diamond rigidity boundary. A purported all-arrow-primitive/all-fields counterexample on one diamond is impossible.

## Priority and next frontier

This is a complete internal integral diamond iff, but its proof is a compatible-basis argument for TWO sublattices plus a split exact sequence. We have not established that the statement is new in persistence or representations over PIDs. It is not a general n-parameter local-to-global theorem. The sharper unclosed route is a 3-cube / larger-grid integral theorem: do primitive arrow images plus all-field block decomposability force an integral block basis, or can three interacting saturated sublattices carry an arithmetic obstruction? Do not infer an answer from the two-lattice argument. Source Problem 1 asks efficient decisions for relative resolution length, generally over fields; the integral variation is internally proposed, not a source-declared open conjecture.
