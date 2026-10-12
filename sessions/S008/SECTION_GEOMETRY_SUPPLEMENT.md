# S008 reconciliation supplement to merged PR #8

# S008 — Actual simplicial sections and their integral extension

All coefficients below are Z unless specified. These are internal prose proofs, not Lean, and no originality claim is made. T20–T22 discharge the geometric gap left by S007-T18. Dependencies: nerve preserves products and is fully faithful on categories; natural transformations give nerve homotopies; cellular homology; integral bisimplicial Eilenberg–Zilber; VHT Theorem 1.1 (its explicit homotopy is coefficient-independent); and standard homology spectral-sequence convergence. No mathematical program was run.

## T20. A literal finite two-height construction

Let F:P→Q be an order map of nonempty finite posets with connected nerves. Define C(F) with elements the disjoint union P, Q, {c}. Keep the original orders on P and Q; add p<c for every p∈P and p<q precisely when F(p)≤q. There are no comparisons c↔Q or Q→P. These prescriptions are transitive: p≤p' and F(p')≤q imply F(p)≤q; q≤q' preserves the relation. They define a poset, not a category with unintended extra arrows. Put X=N C(F); height is 0 on P∪{c} and 1 on Q. This is a finite simplicial set in the usual sense of finitely many nondegenerate simplices (degeneracies are infinite). In fact its nondegenerate chains form a finite ordered simplicial complex.

Let L=P∪{c} and E(F)={(p,q):F(p)≤q}, ordered coordinatewise. VHT Definition 2.9 literally gives

- S_h[0]=N L (contractible, terminal object c),
- S_h[1]=N Q,
- S_h[0,1]=N E(F).

Proof of the third equality, including q-simplices: Δ1×Δq=N([1]×[q]); by full faithfulness a map to N C is a functor [1]×[q]→C. The height condition selects a chain of crossing arrows. The left endpoint cannot be c. The functor is exactly a coordinatewise chain of (p_j,q_j)∈E(F), and conversely any such chain gives the functor. Faces and degeneracies delete/repeat the j-th pair. Horizontal d0 is (p,q)↦q and d1 is (p,q)↦p∈L.

Projection π:E→P has order section i(p)=(p,F(p)), with iπ≤id. Hence N E≃N P. The endpoint to Q composed with i is F, and the endpoint to L composed with i is P↪L. Thus this computes actual section spaces and maps, rather than assuming that a cofiber has those sections.

### Repeated heights: an essential correction

Repeated-height sections are NOT necessarily literal horizontal degeneracies. We do not delete them at chain level. For a constant height word of length p+1, the section space is the nerve of the poset of monotone [p]→L or [p]→Q, homotopy equivalent to L or Q by evaluation and constant diagrams. For a mixed word 0^r1^s, r,s≥1, it is N W_(r,s), where W consists of chains

p0≤…≤p_(r−1) in P, q0≤…≤q_(s−1) in Q, F(p_(r−1))≤q0.

Evaluation e:W→E sends the chain to (p_(r−1),q0). The section k:E→W repeats these two entries. To check ke≃id, define J(w) to have all left entries p_(r−1) and unchanged right entries. Then w≤J(w) and ke(w)≤J(w), with ek=id. These inequalities are natural order maps, giving two actual nerve homotopies. Deleting a last left or first right entry changes the evaluations by a coordinatewise inequality; other faces leave them unchanged. Therefore on vertical homology all mixed words are identified coherently with H_q(P), all constant words with H_q(L) or H_q(Q). Horizontal degeneracies become isomorphisms onto these word summands.

Consequently the RAW integral E1 page has, for each p,q, one copy H_q(L) for word 0^(p+1), one copy H_q(Q) for 1^(p+1), and p copies H_q(P) for the mixed words (p≥1). The normalized E1 row is precisely

H_q(P) --(−j_*,F_*)--> H_q(L)⊕H_q(Q)

in horizontal degrees 1 and 0. This is a normalization AFTER vertical homology. It is not an assertion that the double complex itself has only two columns. E2 is its kernel/cokernel; E2_(p,q)=0 for p≥2, so all d_r for r≥2 vanish. Integral normalization uses abelian groups and does not require a field. This also independently checks VHT Proposition 3.11 for subdivision number 1 without overreading repeated words.

### Total geometry and the actual horizontal filtration

Let D=P⊔Q with the same crossing order, omitting c. Its order map r:D→Q is F on P and identity on Q, and id_D≤inclusion∘r. Thus |ND|≃|NQ| via a homotopy fixing Q, with the restriction on P equal to |NF|. No simplex of NC contains both c and an element of Q. Hence

|NC|=|ND| ∪_(|NP|) cone(|NP|).

The inclusion of |NP| is a simplicial cofibration. Its mapping cone therefore has a homotopy equivalence to Cof(|NF|) induced by r, fixing the Q summand. This is a map of pairs relative to Q; it is not used to assert an arbitrary filtered chain equivalence.

In the section total complex, F0 Tot is exactly the vertical chains of S_h[0]⊔S_h[1]=NL⊔NQ. The diagonal evaluation and integral Eilenberg–Zilber comparison restrict here to the ordinary inclusions of the two levels in X. Thus the NATURAL abutment subgroup F0 H_n is the image of H_n(NL)⊕H_n(NQ)→H_n(X). In positive degrees it is the image of H_n(Q)→H_n(Cof F). Because E2 has no columns p≥2, F1 H_n=H_n(X), and the exact extension is

0→coker F_*:H_n(P)→H_n(Q) → H_n(X) → ker F_*:H_(n−1)(P)→H_(n−1)(Q) →0

in positive degrees, with the usual reduced conventions in degree 1. The chain-level relative mapping-cone calculation below determines this specific subgroup and quotient. We have calculated the natural filtration; we have NOT claimed equivalence of all pre-homology horizontal filtered complexes.

## T21. Fully specified finite simplicial f0/f1 pair

Start with the simplicial complex K on vertices 1,…,6 whose maximal faces are

123,124,135,146,156,236,245,256,345,346.

Every edge occurs twice; vertex links, in order, are the cycles

1: 2–3–5–6–4–2; 2: 1–3–6–5–4–1; 3: 1–2–6–4–5–1;
4: 1–2–5–3–6–1; 5: 1–3–4–2–6–1; 6: 1–4–3–2–5–1.

Thus K is a connected closed triangulated surface, with χ=6−15+10=1, hence RP² by the classification of closed surfaces. The following independent chain calculation specifies a useful essential circle and avoids relying on a diagram. Contract the spanning tree {16,26,36,46,56} in the 1-skeleton. Let the remaining oriented edges 12,13,14,15,23,24,25,34,35,45 represent a,b,c,d,e,f,g,h,i,j. The oriented triangle relations give

a+e−b=0, a+f−c=0, b+i−d=0, c=0, d=0, e=0,
f+j−g=0, g=0, h+j−i=0, h=0.

Hence b=a, f=i=−a, j=a, all other variables zero, and 2a=0. The three-edge circle T=∂(456) (456 is NOT a face) represents j=a, the generator of H1(K)=Z/2. K has H2(K;Z)=0 and its sum of all triangles is the nonzero mod-2 fundamental cycle.

Let K' be the stellar subdivision of 123 with new vertex w: replace 123 by w12,w23,w31, leave the other nine faces unchanged. Let ΣK' be the simplicial suspension with vertices n,s, and let A=B=K'∨ΣK', identifying vertex 6 of the first copy with the suspension vertex s. Copies are otherwise disjoint. Define the simplicial g:K'→ΣT⊂ΣK' by

1↦4, 2↦5, 3↦6, w↦n, 4↦s, 5↦s, 6↦s,

where target 4,5,6 are vertices of the SUSPENSION equatorial copy. This is based at 6/s. Its three subdivided northern faces map to n45,n56,n64. The only nondegenerate southern faces are 124↦s45,135↦s46,236↦s56; the remaining faces collapse to edges or vertices. These are exactly the six faces of ΣT, each once modulo 2. Thus g sends the mod-2 fundamental cycle to that of ΣT; suspension of the previously computed T-generator shows this is the nonzero H2(ΣK';F2) class.

Define f1:A→B to be g on K' and constant at the basepoint on ΣK'; f0 is constant on all A. Both are finite explicit vertex maps. Both maps vanish on all REDUCED INTEGRAL homology: the only nonzero groups of A,B are H̃1=H̃2=Z/2; g goes from K' (H2 integral zero) to ΣK' (H1 zero), and the suspension summand of A is collapsed. The induced mod-2 H2 maps differ, so we make NO assertion that all coefficient theories see identical section data.

Let P=Q be the face poset of the specified wedge complex A=B, including nonempty faces only. Let F_i(σ) be the set of f_i-images of the vertices of σ; this is a nonempty target face even for collapsed simplices, and defines an order map. Define X_i=N C(F_i) and h_i as T20. This is an explicit finite combinatorial description of BOTH height complexes and every simplex/section, requiring neither a search nor an unspecified simplicial approximation.

### Integral extension at chain level

For the standard CW chain models of A,B (RP²∨ΣRP²), use C3=Z w, C2=Z u⊕Z v, C1=Z t, d3(w)=2v, d2(u)=2t, d2(v)=0. Cellular approximation of g has f1_1=f1_3=0, f1_2(v)=0, f1_2(u)=k v_B for some ODD integer k. Oddness follows from the mod-2 simplicial calculation above and the generator represented by ΣT. This does not require pretending that the triangulated simplicial chain matrices already are these small cellular matrices. Based cellular homotopies change k by an even integer; the resulting extension class only uses k mod 2.

The reduced mapping-cone differential is d(b,a)=(d_B b+f(a),−d_A a). Its degree-2 cycles have basis x=v_B and y=t_A (shifted). Degree-3 boundaries give 2x and kx−2y for f1, or 2x and −2y for f0. Therefore

H̃2(X1)=<x,y | 2x=0,kx=2y>≅Z/4 (k odd),
H̃2(X0)=<x,y | 2x=0,2y=0>≅(Z/2)².

For odd k, kx=x, so x=2y, and y has order exactly four: the homomorphism y↦1 mod4, x↦2 respects both relations and is inverse to the generator presentation. This is a direct proof, no Smith-normal-form computation. The same cellular cone also gives H1=Z/2 and H3=Z/2 for BOTH examples, zero higher reduced homology, and H0=Z. In particular omitted H3 or H0 does not create a hidden difference in the integral E2 page.

The two RAW E1 homology pages, with their horizontal maps, are isomorphic by T20; the normalized E1 has H0(P)=Z → Z⊕Z with (−1,1), positive H1,H2 maps zero into 0⊕Z/2. Thus the common nonzero E2 terms are

E2_(0,0)=Z;
E2_(0,1)=E2_(0,2)=E2_(1,1)=E2_(1,2)=Z/2.

All later differentials vanish. The ACTUAL horizontal filtration on H2 is

X0: 0⊂<x>≅Z/2⊂(Z/2)²;
X1: 0⊂<x>=<2y>≅Z/2⊂Z/4.

Each quotient is Z/2. The second extension represents the nonzero class in Ext¹_Z(Z/2,Z/2); the first is zero. Consequently early INTEGRAL HOMOLOGICAL section data and all differentials do not determine the integral abutment, even for a finite ordered complex with only two heights. Full section spaces as diagrams, integral chains, or mod-2 data were NOT asserted identical. The false splitting claim is NOT attributed to VHT, which explicitly uses fields.

## T22. Competing geometric rigidity and extension range

Within the T20 class, if there is q*∈Q with F(p)≤q* for every p (or q*≤F(p) for every p), then the pointwise inequality to a constant order map gives an explicit nullhomotopy of NF. The cofiber is Q∨ΣP up to based homotopy, relative to Q, and the H_n filtration sequence splits. A finite zigzag of comparable order maps to a constant is also sufficient. This is a checkable geometric sufficient condition, NOT an iff, NOT a universal two-height rigidity theorem, and NOT a new replacement for Ext algebra.

For general m,n≥2, the CW map from A=M_m(1)∨M_m(2) to B=M_n(1)∨M_n(2), quotient M_m(1)→S² followed by degree k and the 2-skeleton of M_n(2), with the other summand collapsed, yields identical zero reduced integral homology maps for all k but

H̃2 Cof(f_k)=<x,y | nx=0,kx=my>.

The extension 0→Z/n→H̃2→Z/m→0 has class k in (Z/n)/m(Z/n). To verify this directly, choose a lift y of the generator of Z/m; then my=kx. Changing the lift to y+ax changes k by ma, and changing k by nb has no effect. Conversely these changes define equivalences of presentations fixing subgroup and quotient. Every extension admits just such a lift/presentation. The section-poset construction realizes any chosen finite simplicial model of this map; ordinary finite simplicial approximation gives existence, unlike T21 which provides literal vertex data. This demonstrates the full classical extension mechanism rather than one isolated torsion example. No novel extension classification is claimed.

## Result and boundary

C08 GEOMETRIC OBLIGATION CLOSED for the explicit two-height pair, with raw/normalized pages and actual abutment filtration. It is a concrete counterexample to an internally proposed integral reconstruction claim, not a correction to a published field theorem. The ingredients are standard nerve mapping cylinders, Moore spaces and extension algebra. No substantial new HHA application or priority-cleared flagship has emerged. C07 and C11 were therefore pursued within S008; see INTEGRAL_BLOCKS.md and FILTERED_RELATIVE_MORSE.md.
