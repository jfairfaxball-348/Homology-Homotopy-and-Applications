# S052 MATHEMATICS — contractible collision saturation, and the original-sphere obstruction still open

**Status:** S052 completed as an internal proof-first investigation, not a solution of original GRID(5,2) or GRID(8,3). No exact dHI claim or novelty clearance.

## Frozen input and exact equations

F is empty before t=0, equals X_i on [i,i+1), 0≤i≤4, and a point from t≥5. Original chain:
S^160 --degree 2--> S^160 --theta_4--> S^130 --theta_4--> S^100 --degree 2--> S^100.
G is a point from t≥0 and empty before. Published-source-dependent INTERNAL bounds:
1=d_IHC < 5/4 ≤ d_HI ≤ 3/2; exact d_HI **NOT** known. A GRID(r,s) witness means a based whole-[L] diagram K (L=5s), objectwise-WE zigzag to A^s, K_L literally point, one propagated pointing, and **every** j→j+r, 0≤j≤L−r−1, literally constant. No weakening to vertexwise Ho(Top) or homotopy-null arrows.

For GRID(5,2), write e_i:K_(2i)→K_(2i+1) WE, d_i:K_(2i+1)→K_(2i+2) and a_i=d_i e_i. Five simultaneous obligations:
* j0: e_2 a_1 a_0 = 0_(0,5);
* j1: a_2 a_1 d_0 = 0_(1,6);
* j2: e_3 a_2 a_1 = 0_(2,7);
* j3: a_3 a_2 d_1 = 0_(3,8);
* j4: e_4 a_3 a_2 = 0_(4,9).
Endpoint 10 is literal point, but that does not imply these five interior arrows. At GRID(8,3), L=15, all SEVEN independent constraints are j→j+8 for j=0,1,2,3,4,5,6 (targets 8,9,10,11,12,13,14), source-target stage classes (X0,X2),(X0,X3),(X0,X3),(X1,X3),(X1,X4),(X1,X4),(X2,X4).

## T127 — three image collisions can always be freely manufactured in an ORIGINAL whole-WE class (PROGRAMME_PROVED, elementary)

**Theorem.** Let s,r be integers with 2s<r<3s, put L=5s. Let B:[L]→Top_* be ANY strictly based diagram with B_L=point and nonempty stages (in particular the ORIGINAL sampled sphere diagram A^s). For i=0,1,2 define
P_i^B=B(is→(i+2)s), V_i^B=B((i+2)s→is+r).
There is a natural objectwise weak-equivalence projection p:C→B, with C_L=point, such that for EACH i simultaneously V_i^C is noninjective ON im(P_i^C), and indeed two distinct points in that image collapse to the propagated basepoint. This does NOT assert any GRID zero equation in B or C.

**Exact construction.** I=[0,1] based at 0. At every j<L, set C_j=B_j×I^3; C_L=point. On edge h→h+1 for h≤L−2 let C act as B's edge times three coordinate maps, each either id_I or based constant z. All maps to terminal point are unique. For each coordinate i=0,1,2 put z precisely at the following finite edge sets Z_i, and identity elsewhere:
Z_0={r−1}, adding 2r−1 ONLY if 2r−1≤L−2;
Z_1={s−1, s+r−1};
Z_2={2s−1, 2s+r−1}.
These indices are valid nonterminal edges; in particular 2s+r−1≤5s−2 because r≤3s−1. Projection p_j to B_j is a strictly natural WE (product by contractible cube) and p_L=id_point. It transports the one propagated basepoint (b_j,0,0,0).

**Collision proof.** Fix i; take initial points (b_(is),0,...,t_i,...,0), t_i=0 and t_i=1. In coordinate i, all edges h∈[is,(i+2)s) are identity because its preceding z occurs at is−1 (if i>0) and its following z at is+r−1≥(i+2)s (since r>2s); for i=0 the first z=r−1≥2s. Thus after P_i^C, the images differ in coordinate i. The tail [(i+2)s,is+r) contains edge is+r−1 with z, so V_i^C maps both points to exactly the propagated basepoint. Both source points had identical original B coordinate b_(is) and zero other interval coordinates. All three i work simultaneously, regardless of B's maps or nonmonicity.

**Important hostile implication:** the T119/T123 necessary on-image-collision criterion (source-dependent on fourfold Toda) cannot, by itself, be a homotopy-invariant obstruction; the entire triple of collisions exists in a diagram whole-objectwise-WE to EVERY B, including the original sphere A^s, even when no GRID witness exists. The result is an internal elementary homotopy-theoretic *methodological kill*, NOT an obstruction against original spheres.

## T128 — preserve all strict zeros while saturating ALL three collisions (PROGRAMME_PROVED)

**Theorem.** With C as T127 and arbitrary B, for every 0≤j≤L−r−1 each of the THREE interval coordinate maps C(j→j+r)|I is the constant z. Consequently C(j→j+r) is literally the prescribed pointed zero iff B(j→j+r) is literally zero. In particular, if B is an actual GRID(r,s) witness, C is ANOTHER actual original-sphere GRID witness, now with collisions in ALL THREE prescribed tails rather than just at least one. Conversely C being a witness implies B has all zero relations (though B already assumed whole-WE to A when applying this to GRID).

**Complete interval-cover proof.** A window [j,j+r) of edges contains an element of each Z_i:
- i=0: if j≤r−1 it contains r−1. Otherwise j≥r, and the added edge 2r−1 exists: absence of that edge implies 2r≥L, which would make j≤L−r−1≤r−1, a contradiction. Now [j,j+r) contains 2r−1 since r≤j≤L−r−1≤2r−1; the last inequality holds from L=5s<3r because r>2s.
- i=1: if j≤s−1, it contains s−1 (since r>s). Otherwise j≥s; it contains s+r−1, because j≤L−r−1≤s+r−1 is equivalent to 5s≤s+2r, which follows from r>2s.
- i=2: similarly j≤2s−1 captures 2s−1, otherwise captures 2s+r−1; bound L−r−1≤2s+r−1 follows from 5s≤2s+2r and r>2s.
Thus EVERY window kills each I factor. A product map B(j→j+r)×(z,z,z) is constant to the propagated basepoint exactly when its B component is. This establishes the biconditional, not just one implication. The terminal stage is not one of the j+r targets (their largest is L−1); at terminal it stays literally point.

**What is not proved:** T128 starts from an unknown original-sphere GRID witness in the positive direction; it cannot create one from the original A if B has nonzero strict composites. It supplies no HHA theorem, no obstruction class and no distance verdict.

## T129 — actual ORIGINAL-SPHERE countermodel to collision sufficiency (PROGRAMME_PROVED)

Take B=A^s, the actual sampled sphere diagram, and instead use C'_j=B_j×I^4, j<L, and C'_L=point. Let the first three I coordinates be the T127/T128 edge words; let the FOURTH I coordinate be identity on EVERY nonterminal edge. The projection C'→A^s is one strict whole-[L] objectwise WE, not merely pointwise Ho equivalences. All three prescribed on-image V_i P_i collisions hold (by the first three coordinates), but **every** marked j→j+r map is nonconstant, because it is identity on the fourth I coordinate and has target j+r≤L−1. For each j choose source points differing only in coordinate 4; their images differ. Thus all L−r GRID strict zero equations FAIL in this actual original-sphere whole-WE class despite all three collisions. The fourth coordinate is contractible, so WE types and original higher homotopy information are unchanged.

This rigorously refutes any future claim that one collision, three collisions, or collision-location enumeration is a sufficient GRID witness test. It does not refute T119 necessity, does not disprove that *some other* model can be strict, and does not calculate an enriched tertiary operation.

## Serious attempted construction/obstruction routes and failures

(A) Start with the actual original A^s, append three special interval factors. All three tails become nonmonic on the correct pair images, and EVERY interval factor vanishes on every long window, but a main B composite remains exactly as nonconstant as before; no GRID K. Appending a fourth identity interval produces the explicit opposite control T129. No relation among original θ4 homotopy tracks is resolved.

(B) Try replace a null P_i by its strict fiber under V_i. The strict fiber of a weak equivalence need not be contractible as a point set or map-independently chosen; mapping-path WE spans from T122 repair basepoint transport but not all five overlapping literal zeros. Without compatibility across j=1,3, a local HEP nullification cannot give a whole K.

(C) Relative category Z_(L,r): T121 is an exact recognition/essential-image criterion; T126 correctly demands pointed-set enriched zeros. A naive simplicial ordinary idempotent-zero category is insufficient. A genuinely projectively cofibrant pointed-enriched bar resolution RELATIVE TO THE FIXED unpointed whole-[L] weak-equivalence class requires tracks for j1,j3 as well as even windows, face/degeneracy bookkeeping, 2-cells, an actual tertiary S² attaching map, a full change-of-zigzag indeterminacy quotient and an iff lifting theorem. None has been constructed in S052. π2 Map_*(S160,S100)≅π62^S is only T125's sanity degree, not an obstruction element. Classical DKS/BJT theory preempts generic priority claims.

(D) GRID(8,3) repeats T127–T129 with s=3,r=8. This supplies an actual original-sphere whole-WE family realizing all three collisions and separately violating ALL SEVEN strict zeros, not a positive or negative GRID decision. Same for each cofinal (r,s)=(10m+1,4m), m≥1; no positive cofinal family or negative above-endpoint grid is proved.

(E) T108 all-real whole-shoelace quotient and T112 necessity, including negative half-open cuts, N-a/N-b/I-F/I-G, remain inherited. S052 did not independently reproduce all model-category and stable-to-unstable comparison details. Source-dependent 1<5/4 lower and 3/2 upper unchanged.

## Exact open state and frozen fronts

No unrestricted original-sphere GRID(5,2) yes/no; no GRID(8,3) yes/no; no cofinal positive or above-endpoint negative rational example; no computed relative enriched tertiary S² class or full indeterminacy; no d_HI endpoint attainment or exact value. All five and seven constraints remain open simultaneously. No independent exact Adams/Moss/naturality and 2023–2026 priority certificate. Stage1 only, first novelty gate G2 NOT_STARTED, no Lean, Palomar, manuscript, arXiv or HHA. Preserve T66 all primitive/composite Q and every F_p plus ONE coherent integral Z splitting with original Höppner–Lenzing 1981 proof/priority unavailable; R5 16,471 strict cases OPEN; Hopf proposed flagship retired, derivative T84 unchanged.
