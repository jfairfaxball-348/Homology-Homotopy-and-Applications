# S033 — two serious homotopy challenges; proofs, failures and boundaries

**Scope:** one Stage-1 source-challenged session on the actual main commit `bbee6119b17d3f9561b384c58ce59ed71c36dc83`. No theorem here is claimed priority-new, Lean-certified, externally refereed or HHA-ready.

## Challenge A — genuine Postnikov twisting, not a homology block restatement

**Proposed falsifiable goal A:** For a finite nontrivial product poset P and diagrams of simply connected 3-types with common graded homotopy-group functors, exhibit a new functorial obstruction to diagram equivalence which is not a mere restatement of objectwise Postnikov k-invariants, ordinary mapping-space coherence or standard cubical total cofibers. A purported completeness theorem must quantify over all maps and all higher coherence cells, not only edgewise equations.

**A1: conventional naturality theorem (proved internally but classical).** Let X,Y be simply connected 3-types with π₂=A,A' and π₃=B,B'; write κ_X∈H⁴(K(A,2);B), κ_Y∈H⁴(K(A',2);B') for *marked* k-invariants. Any map h:X→Y inducing a:A→A' and b:B→B' obeys
`b_*κ_X=(K(a,2))^*κ_Y` in H⁴(K(A,2);B').
Conversely the equality is sufficient for the existence of a *single arrow* inducing (a,b): represent κ by maps to K(B,4), select a homotopy witnessing equality, then map the homotopy fibers; if a,b are isomorphisms, the result is an equivalence by the long exact homotopy sequences and Whitehead. This is **not** a strictification theorem for an entire poset diagram: choices of witnessing homotopies on edges must be made coherently around squares and higher chains.

Proof necessity: apply naturality of Postnikov stages and the homotopy fiber classification; the square of classifying maps commutes in Ho(Top), yielding equality of represented H⁴ classes. Sufficiency for *one arrow* uses the homotopy-commuting square of Eilenberg–Mac Lane maps and a map of their homotopy fibers. Boundary: groups may be zero, markings and automorphism actions must be retained; it is false to infer an unmarked classification from equality of a particular representative.

**A2: decisive known example (not new).** Take A=B=Z/2. H⁴(K(Z/2,2);Z/2)=Z/2. κ=0 yields E₀=K(Z/2,2)×K(Z/2,3); κ=Sq²ι₂ yields E₁=hofib(κ). Both have π₂=π₃=Z/2, all other π zero, but their marked k-invariants differ, so they are not equivalent as marked 3-types. This exact example appears as Møller–Scherer (2009) Example 2.4, following Theorem 2.2: **A as a flagship fails the original-literature novelty test.** Taking these as isolated corners of a square does not change that conclusion.

**Hostile attack A:** Comparing only π-group functors does not classify homotopy diagrams; that is true but old. Edgewise Postnikov equations cannot be advertised as an iff for *coherent* multifiltrations: mapping-space π₁ obstructions and choices of 2-cells were not eliminated. There is NO proved new higher-coherence theorem in S033. A coherent Postnikov obstruction that genuinely exceeds the classical classification remains the separate S034 challenger.

## Challenge B — derived square cofiber; an exact Ext diagnostic

**Falsifiable goal B:** Produce two [1]²-diagrams of connected spaces with isomorphic full diagrams of all integral homology groups and of all homotopy groups, but differing coherent total cofibers; calculate a bona-fide homotopy-theoretic invariant, including coefficients and naturality. To be an HHA flagship, also demonstrate a genuinely new phenomenon outside LS Proposition 3.14 / Munson–Volić cubical homotopy theory, not just a new elementary witness.

Let n≥2, M_n=M(Z/n,2)=S²∪_n e³, K=K(Z,3). Write u∈H³(K;Z)=Z for the canonical generator. Cellular chains C₃(M_n)=Z, C₂(M_n)=Z with differential n; H₂(M_n;Z)=Z/n, H_i(M_n;Z)=0 for i≥3. By cohomology representability and the cellular cochain complex,
  [M_n,K]_* ≅ H³(M_n;Z) ≅ Z/n.
For residue a mod n choose f_a:M_n→K representing a, explicitly using the quotient pinch M_n→M_n/S²=S³→K of integer degree a on S³.

Define a strict commutative **based** square D_a on [1]² by D_a(00)=D_a(10)=D_a(01)=M_n and D_a(11)=K. Both lower primitive maps are identities; the upper two primitive maps are f_a. Both composites 00→11 equal f_a. This is a **diagram of maps**, not literally inclusion maps; a standard finite-poset mapping-cylinder/hocolim replacement rectifies it into a bifiltration by inclusions, with objectwise equivalences. The resulting inclusion filtration need not be finite because K is not a finite CW space.

**T71, exact example and distinction.** For n=2, D₀ and D₁ have exactly the same *integral homology-group* persistence functor in every degree and the same *homotopy-group* persistence functor for every i≥1, but are NOT weakly equivalent as coherent diagrams. Their total homotopy cofibers have H₃(C(D₀);Z)=Z⊕Z/2 and H₃(C(D₁);Z)=Z.

Proof of equality of group functors:
- All stalks coincide on the nose. Along edges inside the three M_n corners the maps are identities.
- For a map M_n→K, reduced integral homology maps all vanish: K is 2-connected, M_n has no integral homology in degree ≥3. Degree-zero maps are identities because all spaces are path-connected.
- K has π₃=Z and all other positive π groups zero. π₃(M_n) is a finite torsion group (for n=2, Whitehead's Γ(Z/2)=Z/4), hence any homomorphism to Z is zero. An independent elementary justification is that simply-connected finite CW M_n is rationally acyclic, so its finitely generated π₃ has zero rationalization. Thus ALL f_a induce zero on all π_i. (No claim about *mod-2* homology maps.)
- If D₀ and D₁ were weakly equivalent as coherent diagrams, then their images in Ho(Top)^[1]² would be isomorphic: a natural equivalence at the 00 and 11 vertices would conjugate the composite 00→11 of one into that of the other. But f₀=0 and [f₁]≠0∈[M₂,K]=Z/2. Impossible. In fact their total cofibers already distinguish them.

Proof of the cofiber groups: the derived latching object at 11 is hocolim(M_n←M_n→M_n)≃M_n, since the lower arrows are identities. Thus the total cofiber is hocofib(f_a). Choose K with 3-skeleton S³ and no 4-cells (one may attach dimension ≥5 cells to kill π₄(S³) and subsequent groups). The cellular mapping cone, through degree 4, has
  C₄=Z → C₃=Z⊕Z,   d₄=(a,n)^T,
and no d₃. Higher cells cannot affect H₃. Hence
  H₃(hocofib(f_a);Z)≅Z²/<(a,n)>≅Z⊕Z/gcd(a,n),
where Z/1=0. At n=2, a=0 yields Z⊕Z/2 and a=1 yields Z. This also gives a *parametric* exact family for every n≥2, not an HHA originality claim.

**T72 (functoriality, elementary).** For a source map u:M_m→M_n and target multiplication-by-t map K→K, the label of the composite (t·f_a)∘u is t·u^*([f_a])∈H³(M_m;Z). For arbitrary based M with H₂ torsion and H₃=0, [M,K(Z,3)]≅Ext¹(H₂(M),Z) naturally, so the label is functorial contravariantly in M and covariantly in target coefficient homomorphisms. This is exactly the integral UCT Ext term, not a newly invented spectral-sequence differential.

**Sharp failed enhancement:** D₀ and D₁ are distinguishable by H₃(-;F₂) maps. Modulo 2, the degree of f_a on the 3-cell is a mod 2, and cellularly H₃(M₂;F₂)≅F₂, H₃(K;F₂)≅F₂, so f₁ acts nontrivially and f₀ trivially. It would be FALSE to claim equality of persistence homology with all field coefficients. The original full S028 Hopf benchmark already achieves a stronger objectwise graded integral *ring* / π-blindness comparison and remains RETIRED as HHA flagship. B is a pedagogical Ext diagnosis, not a newly original derived cubical theory.

**Hostile attack B:** Munson–Volić 2015 developed total homotopy cofibers of squares/cubes; LS 2023 Proposition 3.14 already supplies a direct persistent-coherence comparison mechanism. The Moore-space calculation is standard UCT + cellular cone, distinguished by ordinary homology of the *derived* cofiber. It fails the source-cleared new-invariant novelty gate, and is not a new HHA-level flagship. No unjustified claim that H₃-cone gives new interleaving stability or low-dimensional Euclidean Rips witnesses.

## Competing Front A: succinct nonprincipal relative resolutions (unsolved)

**Exact possible input formulation** (a question, not a theorem): fix field F₂, n=2 and k=1, allow a finite Z²-graded presentation M=coker(⊕_{j=1}^r F₂[x,y](-b_j)→⊕_{i=1}^g F₂[x,y](-a_i)), with g+r sparse homogeneous terms, exponents/grades in binary, matrix over F₂[x,y] with monomial multiples determined by degree. Define interval-family X as all axis-parallel rectangles in the *full* product poset; ask whether the relative X-resolution length of M is ≤1 using the exact-category convention of original LLO Problem 1. Complexity measured in the **binary input length**, not number N of expanded stalks or listed rectangles. One must settle the precise passage from Z² indexing to LLO's R² finitely presented category, sentinel boundaries and finite-versus-unbounded rectangles before asserting a reduction.

Attempts: expanding binary exponents to a grid and enumerating O(N²) cubes is exponential in bits and is not a polynomial algorithm. That enumeration also does NOT prove NP-hardness: it is a failure of one method, not a lower bound. Existing explicit listed-family and rank-exact FoCM algorithms cannot simply be called solutions to this encoding. No correct hardness reduction, polynomial-bit algorithm, or complete resolution of even this fixed (n,k) problem obtained. Unsettled rather than retitled as a theorem.

## Universal integral block lift / frozen benchmarks

No T66 counterexample supplied: an actual refutation still requires *every comparable composite* pure cokernel AND rational plus every-prime block splitting with a single integral nonsplitting proof, not one bad prime. No claim of independent external referee validation. S030-T66, S031-T67, S032-T69 remain intact and internal. Frozen S023 strict 16,471-pair R⁵ classification remains OPEN. S028 signed integer Hopf coefficient two benchmark remains verified and **retired as proposed HHA flagship**.

## Scientific judgment

No HHA-grade new homotopy theorem, genuine novel Postnikov coherence invariant, or source-cleared novelty survives the two-option challenge. Stage1 still OPEN, Gate2 NOT_STARTED, no formal/Palomar/paper/preprint/journal work. Strongest *next* challenger: precisely characterize/kill higher coherence obstructions for 3-type diagrams under noninvertible two-parameter arrows, with source-by-source comparison with classical Postnikov, Dwyer–Kan, LS and cubical theory.