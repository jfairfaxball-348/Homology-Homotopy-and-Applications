# S104 MATHEMATICS — mixed Whitehead square defeats homotopy-total-cofiber completeness

## Category, definitions and claim
Work in based compactly generated weak-Hausdorff spaces with finite, well-pointed CW objects. A square has objects A, B, C, D and strict inclusions A→B, A→C, B→D, C→D. Define its **derived total cofiber** as hocofib(hocolim(B←A→C)→D), not the cofiber of an arbitrarily chosen homotopy. The derived construction is invariant under objectwise weak-equivalence zigzags of entire squares by the model-categorical derived homotopy-colimit property. For the cofibration squares below, the homotopy pushout is the ordinary CW pushout P, and hocofib(P↪D)≃D/P.

### T259 — a genuine mixed two-direction attaching class
Fix A=S⁶, B=A∨S⁷_b, C=A∨S⁷_c, with A→B and A→C the summand inclusions. Set P=B∪_A C=S⁶∨S⁷_b∨S⁷_c. Write j_b,j_c for its two S⁷ inclusions. Let
[
alpha=[j_b,j_c]circeta_{13}^{,2}colon S^{15}longrightarrow S^{13}longrightarrow P,
]
where the first displayed S¹³-to-P map is the Whitehead product and eta²:S¹⁵→S¹³ generates pi₁₅(S¹³)≅Z/2. (Composition order in the formula is Whitehead AFTER eta².) The Hilton–Milnor decomposition of pi₁₅(P) contains the direct summand pi₁₅(S¹³) from the basic mixed bracket [j_b,j_c]. No words of length≥3 contribute in degree 15 (their least sphere dimensions are at least 16 here); the mixed-bracket summand detects alpha as a nonzero element of order two. This is an intrinsically two-direction class: collapsing either private S⁷ summand annihilates alpha.

### T260 — two literal finite CW squares with identical primary persistence
Define D₀=P∨S¹⁶ (the trivial 16-cell attaching map) and D₁=P∪_alpha e¹⁶. These yield two strictly commuting squares Q₀ and Q₁:
[
egin{matrix}
 A&\to&B\
 downarrow&&downarrow\
 C&\to&D_i
end{matrix}
]
The schematic arrows mean the four canonical CW inclusions; the two A-to-private-cell directions and both inclusions into D_i are nonconstant and genuine. The literal intersections B∩C=A inside D_i, and P is their actual union. Both D_i have integral reduced homology Z in degree 6, Z² in degree 7 and Z in degree 16, zero otherwise. Cellular boundaries vanish because the attaching 16-cell has no 15-cell. At A,B,C and on ALL four arrows the homology modules coincide under the evident generator identification; the maps into D_i are canonical coordinate inclusions.

The entire reduced integral cup algebra at D_i is square-zero: every product of two positive-degree generators has degree in {12,13,14}, none of which occurs. The same holds at A,B,C, and all cohomology arrows preserve these identifications. Primary Steenrod operations on mod-2 cohomology agree on EVERY vertex and arrow: Sq¹ from degree 6 to 7 is zero because the 7-summands split off P and the 16-cell cannot affect Sq¹. No other positive Sq from degree 6 or 7 can land in an occupied degree, except Sq¹ just considered: the jumps to 16 are 10 and 9, larger than source degrees 6 and 7 and vanish by instability. Thus the whole four-object integral-homology, cup-ring and primary-Sq diagrams are naturally isomorphic.

### T261 — identical derived total cofibers
Each Q_i is a cofibration square on the incoming edges, so hocolim(B←A→C)≃P. The map P→D_i is a CW cofibration; its homotopy cofiber is D_i/P, canonically homeomorphic to S¹⁶ for BOTH i=0,1. Thus tcofib(Q₀)≃S¹⁶≃tcofib(Q₁), even though their maps into D have different unstable attaching information. This equality survives arbitrary whole-square objectwise WE zigzags after deriving all constructions. It is NOT an assertion of equality of the whole diagrams, or of ALL conceivable square-based mapping-space invariants.

### T262 — actual inequivalence detected by pi₁₅
The CW pair (D₁,P) is 15-connected, with relative pi₁₆(D₁,P)≅H₁₆(D₁,P)≅Z, whose attaching boundary sends generator 1 to alpha in pi₁₅(P). The long exact relative homotopy sequence gives pi₁₅(D₁)≅pi₁₅(P)/〈alpha〉. In contrast the trivial attachment in D₀ gives pi₁₅(D₀)≅pi₁₅(P). All groups here are abelian in degree 15. By Hilton–Milnor and Serre finite generation/rational homotopy of spheres, pi₁₅(P) is finite (its summands have no rational degree-15 generator). Since alpha is a nonzero order-two element, |pi₁₅(D₁)|=|pi₁₅(D₀)|/2. Consequently D₀ and D₁ are not weakly homotopy equivalent, and Q₀,Q₁ cannot be connected by a zigzag of objectwise weak equivalences of entire squares.

This is a rigorous no-go for the *completeness* of the proposed derived total-cofiber plus primary-data signature, not a no-go for all coherent two-parameter invariants.

### T263 — honest whole-R² numerical comparison, and its limitation
Extend Q_i to F_i:(R²,≤)→Top_* by the quadrants x<0,y<0↦A; x≥0,y<0↦B; x<0,y≥0↦C; x≥0,y≥0↦D_i, with the canonical inclusions and identities (all real boundaries specified). The maps compose strictly because the square commutes. All integral persistent homology groups/rings/primary-Sq diagrams are naturally isomorphic: their ordinary graded integral-homology interleaving distance is 0.

With diagonal shifts (x,y)↦(x+epsilon,y+epsilon), **no finite epsilon homotopy interleaving** of F₀,F₁ exists, even allowing arbitrary objectwise WE zigzags of BOTH whole R² diagrams. Indeed evaluate both shifted interleaving identities at any upper-right quadrant t sufficiently far from all cuts; all four F values and relevant structure maps are the constant D₀ or D₁ with identity maps. The two interleaving arrows then become mutual homotopy inverses in Ho(Top_*), contradicting T262. Thus d_HI(F₀,F₁)=+infinity versus d_I(H_*(F₀),H_*(F₁))=0. This is a correct extended-metric separation of DIFFERENT invariants, **not** a strict d_HI>d_IHC statement in the same Top category. It arises from permanent unequal terminal homotopy types; it is NOT the requested finite, genuinely non-clock persistence law or an HHA original application.

## Status and limitations
Internal T259–T263 rely on classical Hilton–Milnor, pi₂^S=Z/2, relative Hurewicz/LES and homotopy-colimit invariance. No independent external referee or Lean kernel. The case Q₀/Q₁ meets the literal finite-CW two-parameter, mixed-attachment and full-primary matching challenge; it *kills* the specified tcofib-completeness hypothesis. General higher homotopy-mapping-space invariants might still detect alpha, and no useful sharp finite two-direction distance law has been proved. Publication gate G2 NOT PASSED.
