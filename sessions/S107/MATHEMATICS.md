# S107 MATHEMATICS — finite CW coherent diamond with identical HoTop shadow

All results below are **INTERNAL mathematical arguments** (not external peer review, Lean, or an originality certificate). Work in compactly generated well-pointed CW spaces; the unpointed conclusion also holds after forgetting basepoints. Take n>=3 to keep all occupied objects simply connected. Let P be the diamond 00<10,01<11 with 00<11 forced by composition.

## T273: literal four-vertex finite CW diamonds

Choose the standard hemisphere decomposition S^n=D^n_+ ∪_{S^(n-1)} D^n_- and identify copies B=C=D^n by homeomorphisms fixing the boundary sphere A=S^(n-1). Let the common A→B and A→C arrows be boundary inclusions. Set terminal D=S^n.

Define Q_opposite with B→D the upper-hemisphere inclusion and C→D the lower-hemisphere inclusion. Define Q_fold with BOTH B→D and C→D equal the upper-hemisphere inclusion. Both diagrams are literally strict commuting squares because both composites A→D coincide with the equatorial inclusion; all four objects, all boundary-inclusion arrows, and their composites are finite CW maps. Choose basepoints on the common equator if based diagrams are desired.

Since each disk is contractible, all maps with a disk source/target become zero/unique in HoTop; and the diagonal equatorial map S^(n-1)→S^n is null because pi_(n-1)(S^n)=0. Therefore the IDENTITY vertex maps furnish a natural isomorphism
    Q_opposite ≅ Q_fold in Fun(P,Ho(Top)),
with all individual pi_k arrow diagrams automatically equal. This is stronger than the S106 vertexwise/rank matching. Their integral homology, cup rings, primary operations and all natural graded homology arrows agree. We do NOT equate this pointwise homotopy category with Ho(Top^P).

## T274: intrinsic homotopy-pushout degree distinguishes *whole* diagrams

Let V be the span A→B,A→C. The span inclusions are closed CW cofibrations; hence the ordinary pushout B∪_A C computes its (derived) homotopy pushout. It is the sphere S^n. Every strict P-square Q determines a CANONICAL comparison arrow
    kappa_Q : hocolim(B ← A → C) → D
in Ho(Top), natural under all objectwise weak-equivalence maps of P-diagrams (and hence under arbitrary such zigzags). No selected nullhomotopy or trivialisation of arrows is used.

For Q_opposite the comparison is the identity homeomorphism S^n→S^n, degree +1 with compatible orientations (±1 orientation-free). For Q_fold it factors through the contractible upper disk B=D^n, so it is nullhomotopic and degree 0. Equivalently, the cellular relative fundamental cycle [D_+]−[D_-] maps to a sphere fundamental class in the opposite case and to zero in the fold case.

If the squares were related by ANY zigzag of objectwise weak homotopy equivalences of entire strict P-diagrams, homotopy invariance of hocolim would provide a commuting diagram of isomorphisms comparing their kappa arrows. A weak equivalence cannot turn an isomorphism into a zero map S^n→S^n. Arbitrary automorphisms of A,B,C,D and coherent replacement zigzags are thus excluded. Q_opposite is homotopy cocartesian and Q_fold is not. This proves an honest comparison defect between Ho(Top^P) and Fun(P,HoTop).

**Minimality within finite posets of <=3 objects:** such a poset has no pair of distinct directed paths with the same endpoints in its Hasse quiver, hence is a free category on its Hasse graph. Its homotopy-coherent diagram on a forest of arrows is specified up to objectwise WE by vertex weak types and arrow homotopy classes modulo vertex autos: rectify a natural iso edge-by-edge using mapping-cylinder/path-object roofs with no competing path-equality to satisfy. This argument rules out the same type of full-diagram comparison defect at <=3 vertices. It is an internal rectification argument, not a statement that every 4-object poset is minimal/non-free.

## T275: all-real R² quantitative consequence

Set a=2,L=4. From either strict square Q define a strict full-real persistence functor E_Q: R²→Top_*:
- if x<0 or y<0 or x>=4 or y>=4, set E_Q(x,y)=*;
- in [0,2)×[0,2) set A;
- in [2,4)×[0,2) set B;
- in [0,2)×[2,4) set C;
- in [2,4)×[2,4) set D.
Maps in the same region are identities; across regions use the literal square arrows/composites; entry arrows from * and death collapses to * are the unique based maps. A monotone path cannot leave the upper-bounded support and reenter, so all boundary and transitivity checks hold. These are finite CW-valued step functors, **not inclusion-only filtrations**. Write E_1=E_Qopposite,E_0=E_Qfold. Their images in Fun(R²,HoTop_*) and all graded homology persistence modules are literally the same, hence pointwise-Ho interleaving distance and integral graded-homology interleaving distance are 0.

Claim:
    d_IHC(E_1,E_0)=1,  and  1<=d_HI(E_1,E_0)<=2,
where IHC denotes interleaving IN Ho(Top_*^(R²)), with arbitrary whole-diagram WE replacements, and HI the corresponding whole-diagram homotopy-interleaving distance. These are not claimed for ordinary unpointed Top^R or to be a strict HI>IHC gap.

**Lower, both distances:** for 0<=epsilon<1 choose low x_-,y_-∈[0,2−2epsilon) and high x_+,y_+∈[2,4−2epsilon). All four corners p_ij and their epsilon- and 2epsilon-diagonal translates remain in the SAME respective plateau. Restrict any hypothetical epsilon interleaving in Ho(Top_*^(R²)) to four corners; the two interleaving composites are the shift-2epsilon maps, equal to the identity at each vertex and natural across the four edges. The restriction and plateau identifications give inverse natural maps in Ho(Top_*^P), so an isomorphism Q_opposite≅Q_fold in Ho(Top_*^P), contradicting T274. This reasoning respects BOTH shift identities, all arbitrary whole-diagram WE zigzags, and the exact real boundary inequalities. Thus no epsilon<1 works for IHC, and d_HI>=d_IHC>=1.

**Upper IHC at epsilon=1:** use the point-valued zero natural transformations E_1→E_0(·+(1,1)) and E_0→E_1(·+(1,1)). Their composites are zero, while each 2-shift transition E_i→E_i(·+(2,2)) is NATURALLY based-nullhomotopic: the only occupied source region with nonpoint target after a 2-shift is A, where the map is the equator inclusion j:S^(n-1)→S^n; choose one based nullhomotopy of j, which is constant across the A plateau. Every arrow leaving A lands after 2-shift outside support, so these homotopies are natural; sources outside support are * and require constant tracks. Hence the structure natural transformations represent zero morphisms in Ho(Top_*^(R²)), exactly verifying both IHC identities. Therefore d_IHC<=1, proving equality. The chosen nullhomotopy is used only to prove a morphism is zero, NOT to define the obstruction T274.

**Upper strict HI at epsilon=2:** every 4-shift exits [0,4)² from every occupied grade. Both composites of the zero strict transformations are literally the 4-shift transitions, so a genuine strict 2-interleaving exists. This proves d_HI<=2 for the original diagrams, and hence for their homotopy interleaving. We do NOT assert equality, a strict dHI>dIHC gap or epsilon=1 HI impossibility.

The positive lower bound is NOT derived from a terminal-vertex-type mismatch: all matched vertices, supports and pointwise Ho arrows are identical, and two copies of E_1 have distance zero. It is a local intrinsic derived-square descent defect, though the finite upper bound is still the generic support clock.

## T276: categorical/novelty kill and honest HHA verdict

Homotopy pushouts, homotopy cocartesian squares, degree, and failure of the ordinary homotopy category to retain coherent square data are standard homotopy theory. The T273–T275 illustration is rigorously more faithful to S107's requested comparison kernel than S106 but is NOT an independently certified new structural persistence theorem or an HHA application. It proves d_HI>=d_IHC=1 rather than strict HI>IHC, and the sole established upper HI bound is the generic finite-support clock. No finite CW cover descent stability/reconstruction theorem, robustness under geometric noise, exact HI or source-independent novelty result was established. **HHA G1 originality/significance OPEN; G2 NOT PASSED.** Ordinary unpointed Top^R strict HI>IHC remains OPEN, not disproved. No Lean, Palomar or publication begins.

## Dependencies and checks
Topology input: CW hemisphere inclusions are cofibrations and pushouts compute hocolim; objectwise weak equivalences induce hocolim equivalences; pi_(n-1)S^n=0; a based nullhomotopy of the equatorial inclusion. Internal adversarial verification is sessions/S107/ADVERSARIAL.md. No exhaustive search/computation, so no code environment/output hashes or finite-certificate claims. Hosted governance CI (if successful) checks documents, not these mathematical arguments.