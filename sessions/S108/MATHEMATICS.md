# S108 MATHEMATICS — exact HI metric, cover-realisation no-go

**Evidence class: PROGRAMME_PROVED INTERNAL, not independently refereed, formalised, or first-paper-original.** Continue with exactly the S107 finite CW squares and full-real diagrams, based compactly generated CW spaces, n>=3. Denote opposite and folded strict squares by Q_1 and Q_0, and their supported R² diagrams E_1 and E_0. The S107 T273/T274 degree ±1 versus 0 comparison remains valid; it distinguishes *whole* squares in Ho(Top_*^P), even though Fun(P,HoTop_*) forgets the difference.

## T277 — degree-one pinch kills the common diagonal *strictly*

Let A=S^(n-1) be the equator of D=S^n=D^n_+ ∪_A D^n_-, based at a point of A, and let j:A→D be inclusion. Form q:S^n→S^n/A≅S^n∨S^n. Project to the sphere summand contributed by the upper hemisphere and send the other summand to the basepoint; choose its orientation to make the resulting based map
    f:S^n→S^n
have degree +1. Then f∘j is literally the constant based map. Since degree +1 is an integral homology isomorphism between simply connected CW spheres, f is a based weak homotopy equivalence (indeed a homotopy equivalence).

For either Q_i make Q_i' with precisely the same A,B,C objects and source maps but replace both terminal arrows u:B→D, v:C→D by f∘u and f∘v. All composites from A are now *strictly* constant. The square stays strict. Identity at A,B,C together with f at D is a strict natural transformation Q_i→Q_i' that is an objectwise weak equivalence. At n>=3 no relative basepoint exception occurs. Because f is degree one, the canonical hocolim comparison retains degree 1 for Q_1' and degree 0 for Q_0', so this operation does NOT improperly identify the two whole squares.

Apply the same construction to the high-high plateau of the complete real bifunctors E_i. Set identity transformations on all other occupied regions and points. Naturality holds on each plateau, every cross-cut arrow and the death/entry maps; therefore there is an *actual whole-real objectwise-WE natural transformation* E_i→E_i', with both replaced diagrams still genuinely inequivalent as entire diagrams.

## T278 — strict 1-interleaving and exact distance

For every real (x,y), the (+2,+2) structure map E_i'(x,y)→E_i'(x+2,y+2) is literally the constant based map:

* A source in the A plateau [0,2)² goes to the D plateau [2,4)² by f∘j=constant, including the exact lower boundaries x=0,y=0.
* B or C source has one coordinate ≥2 and therefore its +2 translated target has that coordinate ≥4, outside support.
* D source is likewise sent outside support.
* Any source outside support is the point; unique point maps are constant. There is no re-entry because coordinates only increase.

The two families of strictly zero natural transformations
    0:E_1'→E_0'(1,1),   0:E_0'→E_1'(1,1)
compose to zero in both directions, exactly equal to the just-verified strict 2-shift structure maps at *all* real indices. They are therefore a **literal strict 1-interleaving** in Top_*^(R²), without an arbitrary filler, hypothetical rectification, pointwise-only equivalence, or missing shifted identity.

S107 T275 supplies the independent obstruction for every 0≤ε<1: four-corner plateau restriction would make the two distinct whole CW squares isomorphic in Ho(Top_*^P), contrary to the homotopy-pushout degree. It applies to arbitrary whole-diagram weak-equivalence roofs and to either interleaving identity. Since d_IHC≥1 and d_HI≥d_IHC while the replacements above give d_HI≤1, we obtain, *with the infimum attained*,
    d_HI(E_1,E_0)=d_IHC(E_1,E_0)=1.
The pointwise-Ho and graded homology interleaving distances remain 0. **This disproves any claim that the S107 construction supplies same-category strict d_HI>d_IHC.** It does not resolve ordinary unpointed Top^R, other R² pairs, or the existence of such a strict gap elsewhere.

## T279 — literal inclusion bifiltration is NOT synonymous with an excisive cover

There is a genuine finite CW subcomplex-inclusion realisation of each four-corner **square** by choosing the standard CW decomposition whose equator A is a subcomplex. For Q_1: B=upper hemisphere, C=lower hemisphere, D=S^n. For Q_0: B=C=the *same* upper hemisphere embedded in D, A=equator. Thus all four arrows can be inclusions even for Q_0 (the two branch objects are different labels for the same subcomplex). The distinction is geometric and not just an artificial noninjective map.

But an honest two-set cover square has, by definition, A=B∩C and D=B∪C. Q_1 satisfies both: its comparison hocolim(B←A→C)→D is a weak equivalence. Q_0 satisfies NEITHER: B∩C=B (not A), and B∪C=B (not D). Its comparison maps via the contractible upper disk and is null S^n→S^n, so it fails descent because it is a *mis-specified cover*. The homotopy cofiber of the canonical comparison is contractible for Q_1 and is S^n∨S^(n+1) up to based homotopy for Q_0, as the homotopy cofiber of degree-zero S^n→S^n. The degree and cofiber statements are insensitive to square-wise whole-WE zigzags.

**General cover no-go:** Let t range in any real multiparameter poset and suppose A_t, B_t, C_t, D_t are finite CW subcomplexes with A_t=B_t∩C_t and D_t=B_t∪C_t for every t, with maps induced by compatible inclusions in t. At each t the pushout B_t∪_(A_t) C_t is literally D_t and computes the homotopy pushout because the intersection inclusions are CW cofibrations. These comparisons are natural in t. Hence the map of full-real diagrams
    hocolim(B←A→C) → D
is an objectwise weak equivalence, and its homotopy cofiber is objectwise contractible. Any proposed theorem detecting **nonzero** comparison defect inside this exact good-cover/excisive class is false. This is a standard homotopy-excision principle, not original HHA work.

Controls: product with a finite contractible CW factor preserves the square comparison equivalence/nonequivalence by product homotopy invariance and the actual intersection/union identities. For a genuine good cover, excision forces comparison equivalence even when all intersections are contractible. Collapsing to one parameter generally loses the two independent corner constraints and cannot justify an R² derived obstruction. The compactly supported E_i are not increasing inclusion-only filtrations because their death maps collapse to point. This does NOT conflict with the four-vertex inclusion model.

## T280 — stability/reconstruction and originality verdict

The candidate “persistent cover descent detects the folded square” is KILLED as a new theorem: folded square is not a valid cover; every actual CW two-set cover has trivial comparison defect by pointwise gluing plus naturality. The only available sharp metric in the original supported pair is 1=1, not an HI/IHC gap, and its upper bound comes from explicit terminal pinch/finite support, not robust cover reconstruction under geometric perturbation. No nonclock lower bound for the distance between two **actual** filtered CW cover filtrations, reconstruction from noisy overlaps, or genuinely novel stable result was proved. A plausible quantitative “approximate cover” claim would require new hypotheses and must confront Torras-Casas–Pennig 2024 and 2026 equivariant persistent nerve results.

The true theorem T278 is mathematically rigorous at the internal proof level, but is a worked elementary exact counterexample to a proposed route, not by itself an HHA first-paper result. HHA G2 remains NOT PASSED. No Lean, Palomar, manuscript or outside release.

## Proof dependencies and epistemic limits

T277: sphere equator quotient, degree-one pinch, Whitehead theorem for spheres; T278: strict naturality, support arithmetic, S107 T274/T275 lower bound; T279: CW inclusion cofibration, pointwise pushout computes hocolim, homotopy cofiber of null sphere self-map. No finite exhaustive computation, code or hash. Whole-real consistency argued case-by-case symbolically, not software verified or peer reviewed. In particular the claim is strictly for **based** Top_*^(R²) and its derived diagram category, not a general equality theorem for dHI and dIHC.
