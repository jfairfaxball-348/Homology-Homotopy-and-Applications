# S032 mathematics: exact expanded-input bit complexity, no new HHA flagship

## T69 — polynomial bit decision for an explicitly expanded integral grid diagram

Let P=∏_{j=1}^n {0,…,m_j−1}, m_j≥2; N=|P|=∏m_j. An input is (a) this explicitly expanded grid and all integer stalk dimensions at most r, (b) at least adjacent-arrow integer matrices with integer entries represented in binary using at most B bits each, together with the promise—or a deterministic direct test—that these define a commuting functor. Alternatively every comparable map is explicitly supplied; verify all functor identities by exact matrix multiplication. Assume a finite free Z module at each vertex. The explicit matrix input length is at least N, and r,B are bounded by its length.

There is a deterministic **polynomial bit-time decision** for the conjunction:
(i) coker M(x≤y) torsion-free for *each* comparable x≤y (including composites);
(ii) M⊗Q and M⊗F_p satisfy the Lebovici–Lerch–Oudot B(P) block-decomposition criterion for **every** prime p.

By S031-T67, (ii) is exactly the vanishing of integral middle Koszul homologies H_i(K_C;Z), 1≤i≤k−1, plus torsionfreeness of H_0(K_C;Z), for **every** order-theoretic k-cube C (2≤k≤n); equivalently for each differential all nonzero Smith elementary divisors are units, and for every interior degree the rational rank equality rank_Q d_i + rank_Q d_{i+1} = rank K_i. The conclusion is **independent of** T66. If one additionally accepts the internally proved but externally unrefereed T66, the conjunction is equivalent to a single coherent Z[B(P)] block decomposition; no formal or peer-refereed correctness certification is claimed for that conditional last step.

### Polynomial-size enumeration proof
At axis j a cube chooses either a singleton coordinate (m_j choices) or a strictly ordered pair (binom(m_j,2) choices). Thus cubes of all dimensions number exactly
C_all = ∏_j (m_j+binom(m_j,2)) = ∏_j m_j(m_j+1)/2 ≤ ∏_j m_j²=N².
Only dimensions≥2 require Koszul tests. Any cube has at most 2^n≤N vertices. In degree i the Koszul chain group is a direct sum of at most binom(k,i) stalks, of rank at most 2^n r≤N r; each differential is an integer matrix of dimensions at most N r. There are at most nN² differentials and at most N² comparable-map purity tests. Verify maps and cube chain identities (d²=0) by ordinary exact matrix products.

With all comparable matrices explicitly supplied, each Koszul matrix entry has bit length at most B (up to fixed signs), and classical deterministic polynomial-bit Smith/rank algorithms apply; **do not** model a naive Euclidean row-reduction implementation as a polynomial-bit complexity proof. With only adjacent matrices supplied, construct any comparable map along a monotone path of length L≤∑_j(m_j−1)≤N−1. Each product of L matrices whose dimensions are at most r and entries ≤2^B is bounded in absolute value by r^{L−1} 2^{LB}, hence bit length O(N(B+log(r+1))). Compatibility can be checked by elementary diamond commutations, or by explicit comparison of all paths if encoded as all comparable maps. Therefore all matrices processed have polynomial bit length and polynomial dimensions in the expanded input size. Polynomial-bit Smith/rank algorithms (e.g. standard modular or Kannan–Bachem variants) decide all conditions without factoring determinants or enumerating primes. This establishes the claimed bit complexity for **recognition**, not a published algorithm for small-coefficient explicit integral conjugating bases.

Boundary: n=1 has no k≥2 cubes; the classical one-parameter field interval theorem makes (ii) automatic, but **all-composite** purity still must be checked to infer integral splitting. r=0 and empty chain groups work with rank zero and no nonzero Smith invariants. Unequal axes work because the counting is coordinatewise.

### Crucial input restriction
For a succinct grid described by O(n) generators, N=2^n may be exponential. Thus polynomial in expanded N is NOT polynomial in succinct encoding size; neither an upper bound nor NP-hardness for the actual LLO Problem1 nonprincipal relative resolution length fixed k≥1 follows. No decision or hardness claim for that open question.

## T70 — two logically independent exact Boolean-square failure controls
(1) H0 purity cannot be omitted. Let bottom=0, two middles=Z and top=Z²; inject middles into top by columns (1,0)^T, (1,2)^T. Every comparable structural arrow has pure image. The square Koszul d1 has matrix [[1,-1],[0,-2]], Smith factors (1,2). Middle H1(Z)=0 but H0(Z)=Z/2; UCT gives mod2 H1≠0. Rational and all odd-p middle tests pass, so a finite prime sample does not replace all-prime exactness.

(2) Composite purity cannot be omitted even when every cube passes Koszul. Pull back the single chain Z --×2→ Z to a Boolean square along its first coordinate and use identity arrows in the second coordinate. One orientation of the square has K=(Z→Z²→Z) with d2=(2,1)^T, d1=(1,-2); d1d2=0, rational H1=0 and all nonzero Smith factors equal 1, H0 torsionfree. Yet first-coordinate comparable arrow ×2 has coker Z/2, so the diagram cannot be a direct sum of integral 0/identity thin blocks. This separates the LLO all-field test from integral coherence.

The two controls satisfy different subsets of the premises and are **not counterexamples** to T66 or the S032 conjunction.

## Hostile review of the underlying conditional lifting theorem
S030-T66 still depends on simultaneous L_v axis-exit kernels (not individual adjacent kernels), all-composite purity, finite field Krull–Schmidt, descending band death/ascending birth order, a *single* saturated H+I joint span admitting an integer projection, and the final saturated-projective latching step. The supplied internal proof checks exit and entry arrows by factoring through the selected global-coordinate extreme vertices; no inherited incompatible field bases are assumed. The S032 independent sheared (5,4,3) extraction confirms these specific formulas on one deliberately generated split module; it cannot exclude a nonsplit counterexample or certify the T66 general proof externally. No such counterexample was found **in the limited checks**, not in an exhaustive search.

## Homotopy challenge: NO RESULT PROMOTED
A module of integral homology groups of a multifiltration is not itself a new homotopy invariant. A derived total homotopy cofiber/Hopf cup-square comparison is an existing mechanism (Lanari–Scoccola, Munson–Volić, 2000 Hopf); S028 exact benchmark is retained but retired as HHA flagship. An attempted "integral Postnikov obstruction from block splits" would require an actual independent natural k-invariant or nonzero homotopical obstruction, a *nonstandard* example and fresh literature review. None was proved in S032, hence Gate2 is closed. The frozen S023 16,471-pair strict R5 question remains unanswered.

**Provenance and scope:** T69 uses LLO's existing field theorem and classical UCT/Smith and polynomial-bit integer algorithms. It is a useful rigorous explicit-input complexity sharpening **within the programme**, not novelty-cleared or an HHA claim.