# S002 mathematics dossier — finite covers, transgression and integral persistence

**Status:** detailed human-readable programme proof of elementary constructions; NO Lean/kernel check, NO novelty certification, NO paper/submission. This dossier separates classical algebraic topology ingredients from programme-specific assembly. The claimed proofs are subject to independent follow-up verification and literature audits.

## Notation and convention

All spaces below are finite CW complexes (and can be represented as polyhedra using compatible simplicial approximations); maps are cellular after cellular approximation. Homology is reduced singular homology with integral coefficients. A cover `X=U_1∪U_2∪U_3` consists of CW subcomplexes with cofibration inclusions. Intersections are literal intersections. For `T` a connected based finite CW complex, let `A=C_u T` and `B=C_v T` be distinct cones whose intersection is precisely `T`; their union `S=A∪_T B=ΣT` is the **unreduced** suspension. Let `W=C_w S`, and put `U_2=C_w A`, `U_3=C_w B`. Then `U_2∪U_3=W`, `U_2∩U_3=C_w T`; both U2 and U3, their intersection, A, B are contractible. All inclusions are subcomplex inclusions after CW pushouts.

## Theorem S002-T1 (three-cover transgression exact sequence)

Let `f:S=ΣT→Y` be any based cellular map, with `T` connected, `Y` simply connected, and let `U_1=M_f` be its mapping cylinder, including `S` as the domain end. Attach `W=C_w S` along this copy of S. Define `X=U_1∪_S W` with `U_2=C_w A`, `U_3=C_w B` as above.

1. `U_1∩U_2=A`, `U_1∩U_3=B`, `U_2∩U_3=C_w T`, `U_1∩U_2∩U_3=T`. Every pairwise intersection is contractible, as are U2,U3; `U_1≃Y`.
2. `X` is the mapping cone of f, and the homology connecting map gives a natural long exact sequence `…→ H̃_n(S) --f_*→ H̃_n(Y)→H̃_n(X)→H̃_{n-1}(S)→…`.
3. If `T≃∨^b S¹` and `Y≃∨^a S²`, then `H̃_3(X)≅ker(f_*:Z^b→Z^a)`, `H̃_2(X)≅coker(f_*)`; all other reduced integral homology groups vanish. The associated three-cover Mayer–Vietoris `d_2` transgression, from H1(triple intersection) to H2(U1), agrees up to the standard sign conventions with f_*.

**Proof:** The three literal intersection identities follow because the mapping cylinder meets the new cone W only along S, and the cones `C_w A`, `C_w B` meet in `C_w T`. `W` is contractible and U1 retracts onto Y. Therefore X is precisely `M_f∪_S CS`, the definition of the mapping cone. Its cofibration long exact sequence identifies all groups. Since `T` is connected, `H̃_2(ΣT)≅H̃_1(T)`, and when T is a wedge of b circles and Y a wedge of a 2-spheres only these degree-two groups are present. The relevant LES portion is `0→H̃_3(X)→Z^b --f_*→ Z^a→H̃_2(X)→0`. In the cover spectral sequence the only positive-degree E1 entries are `(p,q)=(0,2)` from U1 and `(2,1)` from the triple T (pair intersections acyclic); since all nonempty intersections are connected, the q=0 row is the augmented simplicial chain complex of a 2-simplex, leaving H0 only. The sole possible nonzero higher differential is `d₂:E²_{2,1}→E²_{0,2}`. The two-stage Mayer–Vietoris description identifies it: first `H̃_1(T)≅H̃_2(A∪B)` using the union of contractible A,B; then inclusion `A∪B=S→U1≃Y`. That is f_* (up to sign). Thus the map is natural in maps of such covers. QED.

**Adversarial checks:** For `a=b=0`, all reduced groups vanish; `T=*` gives S an interval, hence X≃Y; the formula holds. No assumption of contractibility of U1 was smuggled in. Coefficient ring Z matters: torsion in coker is visible, and field-rank calculations alone do not recover it. The nonempty/connectivity hypotheses are used in the spectral sequence's q=0 row. The claim is about integral homology, NOT the homotopy type in general.

## Theorem S002-T2 (matrix realisation at one time)

For **every** pair `a,b≥0` and integer matrix `M∈Mat_{a×b}(Z)`, there is a finite three-subcomplex CW cover satisfying T1 with `H̃_2(U1)=Z^a`, `H̃_1(U123)=Z^b`, all pairwise intersections contractible, and `d₂=M` up to basis orientations. Consequently `H̃_3(X)=ker M`, `H̃_2(X)=coker M`.

**Proof:** Set `T=∨^b S¹` and `Y=∨^a S²`. The quotient of the unreduced suspension `ΣT` by the suspension of the common wedgepoint (a contractible interval) is canonically a wedge of b 2-spheres; this quotient induces an isomorphism on H2. For the j-th sphere, use a based map to Y whose H2 image is the j-th column of M. Such a map exists by a pinch map to |integer coefficients| copies of S² followed by signed degree maps and inclusion into target wedge summands; for zero column take a constant map. Wedge the maps and precompose with the quotient `ΣT→∨^b S²`. This is f with H2 matrix M. Apply T1. All constructions are finite CW and continuous cellular maps; no machine search is assumed. QED.

## Theorem S002-T3 (finite filtration with split-injective transitions)

Let `0≤t≤N` be finite and suppose `A_t,B_t` are finite-rank free abelian groups, every structure map `A_t↪A_{t+1}`, `B_t↪B_{t+1}` is a **split injection**, and `M_t:B_t→A_t` is a commuting natural transformation. Then there exists a **nested finite CW three-cover filtration** `(X_t;U_{1,t},U_{2,t},U_{3,t})` as above such that, as persistence modules,
`H̃_2(U_{1,t})≅A_t`, `H̃_1(U_{123,t})≅B_t`, the cover transgression is exactly `M_t` after identifying compatible bases, and
`H̃_3(X_•)≅ker M_•`, `H̃_2(X_•)≅coker M_•`.
At every time all pairwise intersections, U2 and U3, are contractible.

**Proof (strict compatibility is essential):** Because the index is a finite **total order** and the injections split, choose bases for A_t and B_t inductively extending previous bases. The matrices for M_t have upper-left old blocks M_{t-1} and zero in the rows newly added at time t against old columns, by naturality. Realise `T_t=∨^{rank B_t}S¹` and `Y_t=∨^{rank A_t}S²` as nested based CW complexes with new wedge summands at each stage. Collapse the common suspension spine interval `Σ{*}⊂ΣT_t` at all t. On every old sphere the chosen map `g_t:∨^{rank B_t}S²→Y_t` is **literally** the previous map (not just homotopic), since its prescribed old column has no new-coordinate components. Define maps from each new sphere by finite based pinch and degree maps representing its new column; this makes `g_t` a strict extension of `g_{t-1}`. Set `f_t=g_t∘q_t`. Thus `f_t` strictly extends `f_{t-1}` under inclusions, allowing the mapping cylinders, cones and their three marked subcovers to be nested levelwise. The natural exact sequence of T1 now holds in the functor category of Z-modules indexed by the finite chain, and its kernel/cokernel identifications commute with all transition maps. QED.

**Boundary:** This proves existence as a finite *CW* filtered cover. A single compatible finite simplicial subdivision is plausible after choosing PL models, but is **not** separately machine-checked or asserted as an explicit triangulation algorithm. No general theorem for nonsplit injections, zigzags, arbitrary multiparameter diagrams or arbitrary modules is claimed. The proof is a familiar mapping-cylinder/cone construction repackaged as a three-cover realisation; its novelty remains OPEN.

## Sharp counterexamples to tempting auxiliary claims

- `M=[0]`: `H̃_2(X)=Z` and `H̃_3(X)=Z`.
- `M=[1]`: both groups vanish and the cone of degree-one `S²→S²` is contractible.
- `M=[d]`, `|d|≥2`: `H̃_2(X)=Z/|d|` and `H̃_3(X)=0`. All three models have the same **isomorphism types** of homology of every cover intersection, including `H̃_2(U1)=Z`, `H̃_1(U123)=Z`, and all pairs acyclic. Thus local intersection homology groups alone cannot determine the union, even under exceedingly sparse defects.
- Simplicial concrete `d=1` picture: let C=∂Δ², D=Δ², u,v two new vertices. `U2=u*D`, `U3=v*D`, `U1=(u*C)∪(v*C)`. Then U1 is a 2-sphere, U2 and U3 tetrahedra glued along D, each pair intersection is a disk, triple intersection C≃S¹, but total union is the (contractible) two-tetrahedron 3-ball. It falsifies any rule claiming a nonzero H3 class solely from nonzero H1 of the triple intersection.

## Theorem S002-T4 (one-cardinality intersection-defect homology)

Suppose `X=∪_{i∈I}U_i` is a finite subcomplex cover; every nonempty finite intersection `U_J` is **nonempty and connected**; and there is a fixed `s≥1` such that `H̃_q(U_J;Z)=0` for **all q≥1** whenever `|J|≠s`. Then, naturally for filtrations preserving these hypotheses and this common s,
`H̃_n(X;Z) ≅ ⊕_{|J|=s} H̃_{n-s+1}(U_J;Z)` for n≥1, with the convention that terms of nonpositive reduced homological degree are zero.

**Proof:** Use the finite Mayer–Vietoris/Cech double complex of cellular chains `C_{p,q}=⊕_{|J|=p+1} C_q(U_J)`; its total complex maps by augmentation quasi-isomorphically to the chains of X because the augmented horizontal simplex complex of faces containing each cell is contractible. Filter by p. The vertical homology E1 has q=0 a full-simplex chain complex because every intersection is nonempty connected, yielding at E2 only `E²_{0,0}=Z`; for q≥1 its only possibly nonzero column is p=s−1, where the direct sum of `H̃_q(U_J)` survives d1 since adjacent columns are zero. Higher differentials move p by at least two, so have no possible nonzero source and target among the positive-degree terms; none can originate from the q=0 row at E2. Thus E∞ has exactly one positive-degree column. There is consequently **no extension ambiguity** in any positive total degree, giving the stated natural isomorphisms. This proves the ordinary homology and levelwise persistence-module assertion, not an unstated homotopy wedge decomposition. QED.

**Novelty kill:** T4 is a very direct special case of the existing Mayer–Vietoris spectral sequence, including its persistent version, and is therefore NOT entered as a novel headline theorem. Crucially, T2's two distinct exceptional cardinalities show why T4 cannot simply be asserted without the single-cardinality condition.

## S002 theorem dependency diagram and first open gap

Classical CW pushouts/cofibration and suspension → cellular mapping-cylinder f → cone LES → T1 → wedge-of-spheres maps T2 → compatible bases and strict nested maps T3. T4 independently uses the elementary Cech double complex. None depends on finite numerical tests, computer-generated oracles, or Lean. Gap for a **publishable** theorem: demonstrate a substantial new frontier beyond standard mapping cones, persistent MVSS and extension machinery. Main concrete challenge is nonsplit-injective or genuinely 2-parameter transgression realisation with sharp obstruction, or a significant rigidity theorem imposing a useful bound. HHA fit is genuine homology, but a referee may reject the present realisation as a classical repackaging.