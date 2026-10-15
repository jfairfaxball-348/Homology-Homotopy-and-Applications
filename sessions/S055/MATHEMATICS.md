# S055 MATHEMATICS — genuine 2-local simplification and a sharply isolated unresolved criterion

## Unchanged target

In ordinary unpointed Top^R, F has empty stages before 0, S^160 --2--> S^160 --theta4--> S^130 --theta4--> S^100 --2--> S^100 on [0,1),...,[4,5) and literal point at t>=5. G is empty before 0 and point for t>=0. Desired first HHA theorem: d_HI(F,G)>d_IHC(F,G), with no requirement to compute exact d_HI. The *conditional* existing numerical implication is d_IHC=1 and 0 not in full classical <2,theta4,theta4,2> ⇒ d_HI>=5/4; no original strict gap is certified.

## S055-T139 — primary-source additive group calculation (SOURCE_STATED + rigorous arithmetic)

**Original** Isaksen–Wang–Xu, *Stable homotopy groups of spheres: from dimension 0 to 90*, Publications Mathématiques de l'IHÉS 137 (2023), §1.2 Corollary 1.3 Table 1, printed pp113–114 (publisher-hosted original https://www.numdam.org/item/10.1007/s10240-023-00139-1.pdf). Visually inspected the **actual table** on PDF pages 6 and 7, and its explanatory convention on printed p112. At k=31 the 2-primary v1-torsion column is `2^2` (two copies Z/2) and v1-periodic column is 64 (odd components 3,5,17); thus (pi31^S)_(2) = (Z/2)^2 ⊕ Z/64. At k=61 all three columns are trivial, hence pi61^S=0. At k=62 2-primary v1-torsion is `2^4`, v1-periodic trivial and odd component Z/3; thus (pi62^S)_(2)=(Z/2)^4, and crucially 2(pi62^S)_(2)=0. THIS IS NOT a computation in S055 of the full ring products or triple brackets. The result is SOURCE_STATED original table, not independently reconstructed Adams differentials. It corrects S054's unresolved exponent.

## S055-T140 — middle-family 2-local annihilation (PROGRAMME_PROVED, conditional on source Table 1)

Xu2016 original §5 Lemma5.1 bounds the differences between values of a defined classical fourfold word of degree pattern (0,30,30,0) by triple families A=⋃_{x∈pi31}<x,theta4,2>, B=⋃_{y∈pi61}<2,y,2>, C=⋃_{z∈pi31}<2,theta4,z>. Working **2-locally**, pi61=0 by IWX, so y=0. For the ordinary stable triple bracket with *zero middle morphism*, constant null tracks realise 0 and its standard primary indeterminacy is 2pi62+pi62·2=2pi62. By the original Table 1, **2pi62_(2)=0**, so
    <2,0,2>_(2)={0}, hence B_(2)={0}.
This is a rigorous positive conclusion, not merely removing an assumption. Integrally 2(Z/3)=Z/3 at stem62, so DO NOT claim B is integrally zero. But 2-localization is an exact functor on finite stable homotopy diagrams and sends every compatible classical defining system and its value to a 2-local defining system and value. Therefore 0 in the integral classical fourfold bracket would imply 0 in its 2-local image; conversely, proving 0 absent in the **full 2-local** bracket is sufficient for integral nonzero. No need to eliminate odd-primary B for this *one-way* obstruction strategy.

## S055-T141 — outer family complete primary-indeterminacy reduction (PROGRAMME_PROVED formally, source-dependent input)

For each x∈(pi31^S)_(2), theta4·x=x·theta4=0 in pi61 and 2theta4=0, so BOTH standard stable triple Toda operations are defined. The usual triple-bracket primary indeterminacies in degree62 satisfy
  Indet(<x,theta4,2>)=x·pi31+2·pi62=x·pi31;
  Indet(<2,theta4,x>)=2·pi62+pi31·x=pi31·x.
At the prime 2, the stable sphere ring is graded commutative; for two odd-degree31 classes their product differs only by sign; its ambient degree62 group has exponent2, so this sign is immaterial. Thus **one need only determine one value of each outer triple for each x modulo x·pi31**; the 2-primary group has 256 elements but additive-linearity of triples in x may not be assumed without its own coherent proof. This is not a claim the A and C families vanish.

### Conditional Adams-filtration kill criterion (NOT YET SATISFIED)

Classically theta5 is detected by h5^2 at Adams filtration exactly 2, so theta5 is NOT in F^3(pi62_(2)). Positive stable stem31 has no surviving Adams filtration-one Hopf element (Adams Hopf-invariant-one theorem excludes a permanent h5), so each actual pi31 class has filtration at least 2, making every product x·pi31 belong to F^4 by multiplicativity of the Adams filtration. **Therefore:** if, for EVERY x∈(pi31)_(2), EACH of <x,theta4,2> and <2,theta4,x> has **at least one** representative in F^3(pi62), then all their values have filtration >=3 (varying tracks adds only elements in F^4), hence cannot equal theta5. Together with T140 and Xu's full-compatible-systems indeterminacy containment, this would prove 0 excluded from the 2-local/classical fourfold bracket.

The antecedent is NOT independently proved. It requires a classical triple-Massey/Moss convergence calculation or a different geometric filtered null-track construction for all generators and all relevant x, including possible crossing differentials and representative nonlinearity. Furthermore, use of Xu's three-family **containment for every compatible classical defining-system difference** needs exact convention verification. The IWX 2023 original §2.4 Theorem2.16 with Remarks2.17–2.20 explicitly warns: Moss guarantees **one** bracket value from a Massey representative under no-crossing assumptions, not **every** value, and does not automatically produce zero when a Massey class dies. Multiplicative filtration of products does not by itself bound a triple Toda representative. A lazy 'filtrations sum therefore theta5 is absent' is INVALID.

The candidate list is now a tangible finite-additive-stem/classical-track problem rather than the full original ambiguity and group-law mystery: B is actually gone at the prime 2, and A/C need a SINGLE filtrational representative each, with their remaining primary indeterminacy filtered away. No Adams charts, triple operations, null tracks or crossing differentials were exhaustively computed; no success is claimed.

## S055-T142 — independent two-lane, all-real and derived audit (conditional only)

For e∈[1,5/4), original S053/T130–131 and S054/T137 use the WHOLE shoelace poset P_e and projectively cofibrant monomorphic both-lane replacement; quotient its contractible propagated G-image in F, not G alone. Naturality N-a/N-b and shifted identities I-F/I-G are all needed. Samples t=(0,1,2+c,3+c,4+2c), c=2e−2∈[0,1/2), have successive long-jump relations and last time <5; at e=5/4 the last is the literal point, so the same contradiction does not apply. Negative times remain empty; e<1 governed by monotonicity after enlarging to e=1. Ordinary arbitrary nonpoint weakly contractible G' and nonmonic F' cannot be silently replaced pointwise; only simultaneous *whole-diagram* replacement and a higher Toda homotopy-invariance statement is admissible. The latter still requires exact original DKS/BJT/HKM theorem-level transfer to all diagrams, including unpointed to pointed conversion. Our new π62 arithmetic does NOT verify it.

For derived IHC, projective cofibrant length3 source restriction mapping-space fibrations require **two compatible** null-track adjustments; pointwise pi61=0 is not equivalent to Ho(Top^R)-zero. The inherited S053/T132 + S054/T138 source-dependent d_IHC=1 proof remains plausibly consistent, but we have no independent full mapping-space/real Kan theorem certification, nor formal build. e<1 follows from a nonzero long arrow, conditional on the published source and original interleaving definition. No full all-replacement strict inequality is promoted.

## Claim status and exact open obligation

S055 makes the NEW and rigorously sourced/proved local result B_(2)={0}, the exact 2-primary group laws for stems31 and62 as stated in an original table, and the conditional filtration criterion. It does NOT prove 0 in or out of the full 2-local or full classical fourfold bracket; does not supply any zero defining system; and does not prove a publishable Top^R distance separation. Gate G1B/G2 still IN_PROGRESS and NOT PASSED. Exact d_HI, grids, sharp distance, Lean and manuscript are NOT next default objectives.

Frozen archival results unchanged: T66 requires primitive+composite rational/every prime decompositions plus one coherent integral splitting with original 1981 proof still a caveat; R5 16,471 strict cases OPEN; S028 Hopf flagship retired; T84 internal algorithm retained.
