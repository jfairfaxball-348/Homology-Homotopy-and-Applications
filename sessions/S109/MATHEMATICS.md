# S109 MATHEMATICS — sharp triple-Čech relative cofiber, fatal cover-dependence and finite free-by-cyclic fallback

**Status: internally argued exact theorems/no-go, NOT peer-reviewed, original, Lean-certified or manuscript-ready.** All spaces are finite CW complexes (possibly empty), with the weak homotopy type of topological spaces. A finite indexed *subcomplex* cover may include repeated subsets, but our principal counterexample does NOT use repeats. All index maps in the bifiltrations below are literal CW inclusions.

## T281. The missing triple Čech cell is exactly a doubly suspended triple overlap

Let X=U∪V∪W be a finite CW complex covered by three CW subcomplexes, and let T=U∩V∩W. For any nonempty I⊆{0,1,2}, set U_I=∩_{i∈I}U_i. The **homotopy Čech blowup** B^(k) for k=1 or 2 is the quotient of
   ⨿_{∅≠I⊆{0,1,2}, |I|≤k+1} U_I×Δ^(|I|-1)
by the standard face identifications along U_I⊆U_J for J⊂I. Here B^(1) is the proper, vertex-plus-pairwise Čech blowup; B^(2) is the full three-set blowup. Empty intersections contribute no summand. The projection π:B^(2)→X forgets the simplex coordinate. It is a weak equivalence (indeed for a finite CW subcomplex cover it is a homotopy equivalence): each open cell e of X lies in a fixed nonempty set of cover pieces, so the fibre over e is a simplex on that set; the ordinary cellular induction on the CW skeleta contracts those simplex fibres in a cell-compatible way. This is the classical functorial blowup/nerve argument.

The passage from B^(1) to B^(2) attaches the **single family** T×Δ² along T×∂Δ²→B^(1). Because CW subcomplex inclusions and the simplex-boundary inclusion are cofibrations, B^(1)↪B^(2) is a CW cofibration. Thus the based quotient of the pair is, canonically and naturally,
   B^(2)/B^(1) ≅ (T×Δ²)/(T×∂Δ²) ≅ T_+ ∧ S².
Here T_+=T ⊔ {basepoint}, **not** T with a point of T selected as basepoint. In particular if T=∅ then the quotient is contractible, and if T is a nonempty point then it is S², not contractible. The homotopy cofiber is the quotient because the inclusion is a cofibration.

Composing B^(1)↪B^(2)→X and adjoining a disjoint basepoint to the unbased map, objectwise homotopy equivalence of the latter target gives
   hocofib(B^(1)_+→X_+) ≃ S²∧T_+ = Σ²(T_+).
This is a **natural weak equivalence of diagrams** in the homotopy category under inclusions of triples, not a canonical point-set homeomorphism X/B^(1), since B^(1) need not be a subspace of X. No assertion that the entire map B^(1)→X (its attaching extension, homotopy fibre, or higher Toda data) is determined solely by the unbased type of T follows. The **cofiber** is determined by the triple intersection; full Čech descent π is already a weak equivalence. All reduced integral homology groups of the cofiber are thus H̃_q≅H_{q−2}(T;Z) for q≥2, where H_0 is **unreduced**, and zero for smaller q; this is natural for levelwise inclusion maps.

The identical proof holds objectwise and naturally for any poset-indexed CW inclusion cover filtration t↦(U_t,V_t,W_t), including R² with empty negative grades. It is precisely the standard degree-two stage of the Čech/Bousfield–Kan bar filtration. **No priority claim of originality** attaches to T281.

## T282. Two genuinely distinct, proper indexed triple CW covers of the SAME all-real inclusion bifiltration

Let L be the 3-edge simplicial circle: 0-cells p₀,p₁,p₂ and oriented 1-cells e₀₁:p₀→p₁, e₁₂:p₁→p₂, e₂₀:p₂→p₀. Attach three permanent pendant edges a₀ at p₀, b₀ at p₁, c₀ at p₂ to three new free terminal vertices. Call the resulting finite connected graph K, so K deformation retracts to L≈S¹.

Introduce *two distinct further* pendant edges a₁ based at p₀, b₁ based at p₁, each with a new free terminal vertex. For t=(x,y)∈R² define the **same** union X_t for both experiments:
- X_t=∅ if x<0 or y<0;
- for x,y≥0, X_t=K ∪ (a₁ if x≥1) ∪ (b₁ if y≥1).
All transition maps are literal CW inclusions, and the two independent real thresholds x=1 and y=1 attach different physical cells. The origin and upper boundary x=0,y=0, x=1,y=1 follow the specified weak ≥ convention; there are no death collapses or terminal clocks. Each nonempty X_t is connected, homotopy equivalent to S¹, and the structure inclusion X_t↪X_s between any two nonempty comparable grades is a homotopy equivalence (adding tree leaves).

**Cover A — circular arcs / good cover.**
For nonempty X_t, put U^A_t = e₀₁∪a₀∪(a₁ if x≥1), V^A_t=e₁₂∪b₀∪(b₁ if y≥1), W^A_t=e₂₀∪c₀, always including the requisite endpoints. For empty X_t each piece is ∅. These are three pairwise distinct proper finite CW subcomplexes; each is a contractible tree. Their pairwise intersections are respectively {p₁},{p₂},{p₀}, and their *triple intersection T^A_t is empty*. Their union is literally X_t. Their full Čech blowup is homotopy equivalent to X_t; because there is no triple cell, B_A^(1)=B_A^(2), so the truncated comparison B_A^(1)→X_t is a weak equivalence for every t and its based homotopy cofiber D_A(t) is contractible.

**Cover B — cyclic-core intersection / bad cover but genuine cover.**
For nonempty X_t, put U^B_t=L∪a₀∪(a₁ if x≥1), V^B_t=L∪b₀∪(b₁ if y≥1), W^B_t=L∪c₀, each including the core L. For empty X_t all pieces are ∅. They are also three pairwise distinct proper CW subcomplexes with literal union X_t; all pairwise intersections and the triple intersection equal L. In particular T^B_t=L for all t with x,y≥0 and ∅ otherwise. T281 gives D_B(t) ≃ Σ²(L_+) for all positive-quadrant t. Using p₀∈L to split L_+ in the *based homotopy category*, D_B(t)≃S²∨S³, hence H̃₂(D_B(t);Z)≈Z and H̃₃(D_B(t);Z)≈Z. Every positive-quadrant structure map induces the identity on L, so these homology groups persist **isomorphically for all future x,y**, without any terminal death. Their presence is detected in the **actual derived cofiber** regardless of CW replacement choices. Cover B is **not** a good cover (its nonempty intersection L is noncontractible), a restriction that must not be hidden.

Compare the two **underlying unions**: they are the literally identical functor X:R²→Top, so their strict, derived, and pointwise homotopy interleaving distances all equal **0**. However D_A(t)≃* whereas D_B(t) has a permanent H̃₂≈Z class from all positive grades. For any finite ε≥0, the 2ε-structure map D_B(t)→D_B(t+(2ε,2ε)) is nonzero on this Z summand for any t in the positive quadrant. Thus D_A,D_B do not admit an ε-interleaving even at graded homology level. The derived and homotopy interleaving distances of these *cofiber diagrams* are therefore ∞ (for the standard diagonal shift convention). This remains true with all objectwise weak-equivalence zigzags on the whole cofiber diagrams, since integral homology is invariant under those weak equivalences.

**Consequent no-go:** Any proposed universal, cover-independent inequality d_HI(X,Y)≥c·d_I(D_coverX,D_coverY) for c>0 (or any nontrivial positive detection from a discrepancy of these truncated Čech defects) is FALSE without restrictive, comparison-compatible assumptions on the chosen covers. Here the union distance is 0 while the cover-relative defects are infinitely separated. This is a precise negative mathematical result against this **specific** attempted reconstruction/lower-bound programme, NOT a denial that appropriately controlled cover-dependent metrics or stable higher operations can exist.

Checks: finite cell lists are explicit; all triple/pairwise intersections calculated on the common subgraph, not inferred from pictures. All maps at negative grades are unique ∅ inclusions. Both x- and y-thresholds change the union by different cells. No numerical or computational enumeration is needed. No use is made of a false finite-support/collapse upper bound.

## T283. Good-cover and geometric robustness controls

1. At every positive grade Cover A is a genuine three-piece *good cover* with pairwise nonempty contractible intersections and empty triple intersection; its nerve is the cycle ∂Δ², recovering X_t≈S¹ by the classical nerve theorem. Cover B is a true inclusion cover but deliberately NOT good, and its full Čech blowup still recovers X_t. A claim that good-cover triples have invisible secondary data despite identical ordinary homology and different empty/nonempty triple nerves is impossible in this three-piece all-pairwise-nonempty special case: the nerve is either S¹ or contractible, already separated by H₁. This is a *restricted classical nerve argument*, not an obstruction for arbitrary nongood covers.
2. Taking a product with a finite contractible CW complex P gives analogous genuine covers of X_t×P with the same relative distinction, since pairwise/triple intersections distribute over product and L×P≈L. An arbitrary noncontractible P preserves the formal T281 cofiber identity but may change connectivity/goodness; do not claim strict distance invariance for every P.
3. A single-parameter diagonal pullback of X_t retains leaves at t≥1 but forgets that two independent coordinate thresholds generated them. One-axis data cannot establish a new higher-dimensional stability theorem. Exact CW cover descent remains true even with empty triple overlap and redundant cover pieces.
4. A noise or ε-shifted cover-compatible inclusion between **all indexed pieces and intersections** induces a strict shifted Čech blowup map and a map on Σ²T_+; this is functoriality of the bar construction. It is not an original stability theorem and does not provide a converse bound on union distance. Published 2023 functorial nerve and 2024 filtered MVSS/approximate nerve sources are immediate collision risks.

**HHA gate result:** The T281 statement is textbook relative skeletal bar filtration; T282 is a fully explicit falsifier to a *wrong conjectured cover-independent inference*, not yet a substantive original HHA application. We did NOT obtain two covers with equal full primary/pairwise homology data and a new intrinsic unstable triple attaching invariant, nor a nonclock sharp finite positive d_HI>d_IHC in the same geometric category. No original HHA theorem selected.

## T284. Material alternate route: finite free-by-cyclic mapping tori with the SAME homology and distinct fundamental groups

Let R=∨_{i=1}^3 S¹ be the finite 3-loop rose with π₁(R)=F₃=⟨a,b,c⟩. Let φ∈Aut(F₃) be φ(a)=a[b,c], φ(b)=b, φ(c)=c, where [b,c]=bcb^{-1}c^{-1}. Its inverse fixes b,c and sends a↦a[b,c]^{-1}, so φ is an automorphism. It induces the identity on H₁(R;Z)=Z³, since [b,c] abelianises to zero. Choose a based cellular graph map f:R→R that sends edges to these loop words and induces φ.

Form the finite 2-dimensional mapping torus M_f=(R×[0,1]) / ((z,1)∼(f(z),0)), and M_id=R×S¹. Their integral homology groups are the same:
   H₀=Z, H₁=Z⁴, H₂=Z³, H_k=0 (k≥3).
Proof: the cellular mapping-torus chain complex is the cone of 1−f_* on cellular C_*(R), shifted by one; since f_* acts as the identity on the graph's cellular chains in degrees 0 and 1 (the commutator contributes zero signed edge count), the differential on the two cone columns is zero. Equivalently the Wang exact sequence splits over free Z modules. This is a full chain calculation, not only a matching Betti-number guess.

By van Kampen π₁(M_id)=F₃×Z, which has center Z. Also π₁(M_f)=G=F₃⋊_φ Z. We prove Z(G)=1. If a central element is written (g,k)∈F₃⋊Z, commuting with every h∈F₃ gives g φ^k(h)g^{-1}=h. Since φ^k(b)=b and φ^k(c)=c, g centralizes BOTH noncommuting free generators b,c. The intersection of their centralizers in F₃ is trivial, so g=1. Then φ^k=id. But φ^k(a)=a[b,c]^k, and the reduced commutator [b,c] has infinite order, forcing k=0. Thus the only central element is the identity. Therefore π₁(M_id) and π₁(M_f) are nonisomorphic; the mapping tori are not homotopy equivalent despite identical integral homology.

This is a **classical IA free-group automorphism / mapping-torus mechanism**, used here as a precise internally proved alternative after the Čech route was killed. It does NOT yet supply persistent bifiltration comparison, homology module matching across several meaningful stages, a finite sharp *nonclock* HI bound, or an HHA novelty certificate. Indeed extending both spaces forever from an initial grade yields only the trivial infinite-survival lower bound, which is **explicitly excluded** from first-paper status. S110 must attack the missing meaningful quantitative and geometric application, not reannounce T284 as original.

## T285. Final S109 proof, application and originality verdict

- **T281**: PROVED INTERNAL exact natural triple-overlap cofiber of degree-1-truncated homotopy Čech cover: Σ² T_+. Classical.
- **T282**: PROVED INTERNAL explicit nonredundant proper-piece two-axis CW inclusion cover counterexample: same X_t, union HI=0, truncated-cofiber homology distance ∞. A strong no-go for a specified naive cover-invariant comparison, NOT a new comprehensive impossibility theorem.
- **T283**: PROVED INTERNAL restricted good-cover/nerve controls; source collision severe.
- **T284**: PROVED INTERNAL finite IA mapping-torus homology blind spot and π₁ center distinction; classical group-topological construction but a materially different future research entry.
- No full matched-primary plus pointwise-Ho pair yielding intrinsic secondary attaching persistence, robust positive nonclock geometric lower bound, new HHA stability/reconstruction application, theorem originality proof audit, or proof-level peer review. **G1 original HHA candidate NOT CLEARED. G2 originality/significance NOT PASSED.** The separate original ordinary unpointed Top^R strict HI>IHC question stays OPEN; S108 based R² equality remains exact. No Lean, Palomar, manuscript, arXiv/HHA or third-party contact.

## Source and epistemic limits

Published original abstracts/selected publisher excerpts and available author institutional records were checked (details PRIOR_ART); full Dwyer–Kan–Smith/Vogt/BJT or 2024 MVSS proofs and complete HHA28 issue census were NOT independently read. The relative bar/gluing and mapping-torus homology proofs above are author-internal mathematical arguments only; hosted CI is static governance. No finite numerical search or external computer certificate is claimed.
