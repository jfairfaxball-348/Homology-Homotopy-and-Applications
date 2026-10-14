# S034 — exact 3-type shear diagnostic, higher-cell boundary, and priority kill

## Objects and precise classifications

All spaces pointed, connected and taken in a model of based simplicial sets/compactly generated spaces where Eilenberg–Mac Lane objects are abelian group objects. Let (A=B=\mathbb F_2), (K_2=K(A,2)), (K_3=K(B,3)), and (E=K_2\times K_3). This is a simply connected 3-type with marked \(\pi_2=A,\pi_3=B\) and **zero** degree-four Postnikov class \(\kappa=0\).

For each pointed (c:K_2\to K_3), define **shear** (s_c:E\to E) by (s_c(x,y)=(x,y+c(x))). Since (K_3) is a group object, (s_c s_d=s_{c+d}) and (s_c^{-1}=s_{-c}) strictly in a suitable simplicial abelian-group model (homotopically otherwise). It induces identity on \(\pi_2\) and \(\pi_3\) because the cross term (K_2\to K_3) induces zero on \(\pi_2\), and its restriction on the (K_3) factor is identity.

The based **shear mapping space** is \(\mathcal S=\operatorname{Map}_*(K_2,K_3)\), NOT the entire based self-map space \(\operatorname{Map}_*(E,E)\). Its homotopy groups follow from representability and adjunction:
\[
\pi_0\mathcal S=[K_2,K_3]_* \cong\widetilde H^3(K_2;B)=\mathbb F_2\langle Sq^1u_2\rangle,
\quad
\pi_i(\mathcal S,0)\cong \widetilde H^{3-i}(K_2;B),\ i\ge1.
\]
In particular \(\pi_1\mathcal S=\widetilde H^2(K_2;B)=\mathbb F_2\langle u_2\rangle\). The same computation holds at either component by translation. These are nonzero but **standard Eilenberg–Mac Lane function-space calculations**. This does not identify the full homotopy groups of \(\operatorname{Map}_*(E,E)\) nor a DKS obstruction for unrestricted diagrams.

## T73 — fixed-edge square obstruction (internally proved; classical)

Put (E) at all four vertices of \([1]^2\), and choose the two outgoing maps from 00 to be (\mathrm{id}) and (s_c), with the two arrows entering 11 both identity (orient the (s_c) along 00→01). All four coefficient homomorphisms are (a=b=\mathrm{id}), so every edge satisfies (b_*\kappa=a^*\kappa=0).

Let \([c]=Sq^1u_2\ne0\). The two composites 00→11 are (s_c) and \(\mathrm{id}\), which are **not homotopic**, since restricting the second projection along (K_2\hookrightarrow E) distinguishes their \(H^3(K_2;B)\) classes. Therefore this *prescribed* edge diagram is not even a square in \(\operatorname{Ho}(\mathrm{Spaces})\); it admits no square 2-cell and no strict realization retaining these four edge homotopy classes. This does NOT refute existence of some coherent diagram from the coefficient and κ data alone: choose all identities and it is strict.

More generally, for any square with four shear edge maps whose labels are \(c_{bottom},c_{right},c_{left},c_{top}\in H^3(K_2;B)\), the two composites agree in Ho(Spaces) **iff**
\[
c_{bottom}+c_{right}=c_{left}+c_{top}.
\]
This follows from the shear composition law and the injective detection of shear components by restriction. Conditional on equality, a 2-cell exists. The choices of such a 2-cell **inside the shear mapping space**, up to homotopy relative its endpoints, form a torsor under \(\pi_1\mathcal S\cong\mathbb F_2\); this is an ambiguity of a chosen filler, **not** a newly discovered obstruction to existence. The full space of arbitrary 2-cells need not be this torsor.

**Naturality:** for a homomorphism of base coefficient groups \(a:A'\to A\) and target coefficient \(b:B\to B'\), labels transform as \(b_*\circ a^*:H^i(K(A,2);B)\to H^i(K(A',2);B')\) for \(i=2,3\). Composition/square compatibility and the homotopy torsor transform accordingly. Here naturality is classical cohomology functoriality, not novel persistence theory.

## T74 — [2]² complete strict-shear test (internally proved; classical)

For each of the 12 adjacent oriented grid edges of \([2]^2\), let its shear label be a class (c_e\in\mathbb F_2\). The compatibility condition on each of four elementary faces is that the sum of its four boundary labels vanish. This is the usual cellular 1-cocycle condition on a contractible 2×2 rectangle.

**Sufficiency:** Starting with (p_{00}=0), define a vertex potential (p_v\in\mathbb F_2\) by summing labels along any monotone path 00→v. Adjacent-square equations make it path independent. The resulting (c_{u\to v}=p_v-p_u\) for each generating edge, and choose actual pointed maps (P_v:K_2\to K_3\) representing (p_v\) (choose (P_{00}=0) and either the zero map or the fixed (Sq^1u_2\) representative). Define strict maps for **every comparable pair** (u\le v\) as (s_{P_v-P_u}\). Then
\[
s_{P_w-P_v}\circ s_{P_v-P_u}=s_{P_w-P_u}
\]
on the nose in the group-object model. They have the prescribed edge homotopy classes. Thus any closed assignment can be completed to an honest strict diagram in this *fixed-coefficient split-shear slice*. Necessity comes from functoriality on each face. The result is valid for [1]², [2]² and arbitrary finite product-of-chains grids **in this specific shear model only**, by the same path-potential proof. It says nothing about general k≠0 diagrams, variable A/B, non-shear lifts, or prescribed higher 2-cells.

**Finite check:** independently enumerated 4096 assignments, 256 closed; the 256 potential assignments with p00 fixed to zero give 256 distinct patterns, and the two sets coincide. See COMPUTATION and certificates. This verifies finite arithmetic, not homotopy coherence for arbitrary 3-types.

## Realization levels—do not conflate

1. One homotopy-fiber map: equality of degree-4 κ permits a chosen homotopy of classifying maps and hence a map inducing a,b; this is Møller–Scherer/classical single-arrow theory.
2. Ho-square: prescribed edge **map components**, not just a,b, must have equal composites. T73 produces a failure here; no square 2-cell exists for this data.
3. Homotopy-coherent square: when the composites agree, choose a specific 2-cell; π1 gives **choices** (possibly non-equivalent relative boundaries), not an automatic nonexistence obstruction.
4. Strict square: a homotopy-commutative square with chosen 2-cell can be rectified **up to objectwise weak equivalence** by a homotopy pushout/mapping-cylinder replacement. This does NOT mean strict equalities hold for fixed original representative maps or the rectification has literal Euclidean Rips inclusions.
5. More complicated diagrams: higher coherent extensions can be obstructed, but Dwyer–Kan–Smith1989 already gives an obstruction tower using homotopy groups of function complexes and cohomology of the indexing category. Calculating an example of \(\pi_1\) from degree-2 cohomology is **not** by itself an original obstruction theory.

## Competing fronts and decision

- **Binary succinct Front A:** no polynomial-bit algorithm or hardness reduction for nonprincipal *all-rectangles* relative resolution length≤1 for finitely presented \(\mathbb Z^2\)-graded \(\mathbb F_2[x,y]\)-modules with binary grades. An N² expanded grid from T69 can have size exponential in input bits; do not equate expanded with succinct complexity. Source-stated LLO Problem1 survives as an independent original research direction, not solved here.
- **Integral Front C:** S030 T66 all-comparable pure cokernels, Q and ALL prime field block splittings imply one global integral block splitting *internally*. No valid counterexample or external proof referee in S034; original 1981 genuine JPAA pages7–12 still uninspected. No sampled-prime adversary declared.
- **R5/Hopf:** S023 frozen all 16471 pair inequalities OPEN; S028 signed integral Hopf tests valid, flagship retirement reaffirmed. T73/T74 are **weaker** as novelty prospects than S028, not a rescue.

**Scientific verdict:** T73/T74 are fully specified and proved within their slice but classical, not HHA-significant original results. The hoped-for new mapping-space/derived-limit theory is covered in scope by existing DKS/Baues–Blanc; **retire this Postnikov-coherence line as present flagship**, not the entire research domain. No Gate2 or further-stage promotion.
