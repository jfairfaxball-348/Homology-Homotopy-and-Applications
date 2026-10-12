# S009-T25 — Integral rigidity for monomorphic three-cubes (internal proof)

## Exact theorem and NOT the unrestricted C11 conjecture

Let C={0,1}^3 with coordinatewise order. Let M:C→Free_fg(Z) be a commutative diagram, and assume **every map M(x→111) is injective** (including all composites). Assume **every** structure-map cokernel is torsion-free. Suppose M⊗Q and M⊗Fp are block-decomposable in the precise LLO sense for **every** prime p (all six 2-faces and full 3-cube are middle-exact in those fields). THEN M is a direct sum over Z of **principal-upset block modules** Z[↑v], v∈C, with identity arrows on each support, and there is one simultaneous basis compatible with all eight modules and every natural map.

The forward implication holds trivially for any such direct sum. This is a complete **monomorphic subclass** of the proposed 3-cube theorem, NOT its resolution: general primitive morphisms can have kernels. We make no originality claim; underlying lattice splitting and field Koszul/UCT methods are classical.

### Step 1 — embed the entire diagram in the top lattice

Identify all M(x) with subgroups of D=M(111) using the injective composite. Put U=M(110), V=M(101), W=M(011), A=U∩V, B=U∩W, C'=V∩W, T=U∩V∩W.

Top square ${100,110,101,111} is integrally middle exact: for its free Koszul complex K2→K1→K0, middle exactness over Q and all Fp implies H1(K;Z)=0 (UCT: H1⊗Q=0 and H1⊗Fp=0 for every p; finitely generated H1 must vanish). Hence M(100)=A, because the map M100→U⊕V is diagonal (injective), and ker[(u,v)↦u−v] is the diagonal of U∩V. Similarly M010=B and M001=C'. Apply middle exactness to the lower square ${000,100,010,110}: injectivity gives M000=M100∩M010=T. Thus **all eight** vertices are intersections of U,V,W inside D. Every map is inclusion. All these subgroups are primitive in D by hypothesis, hence free.

### Step 2 — exact integral Koszul/Čech calculation, with extremal torsion

The full 3-cube complex is (sign conventions immaterial to homology)
0 → T → A⊕B⊕C' → U⊕V⊕W → D → 0,
where degree 3 is T and degree 0 is D, and the arrows are alternating inclusions. Kernel in degree 2 is precisely the image of T: if (a,b,c) has zero at U,V,W, then all three entries are the same signed element of T. Thus H2=0. A degree-1 cycle is a triple (u,v,w), u+v+w=0. Sending it to w identifies its quotient by the pair-overlap boundaries with
H1 ≅ ( W ∩ (U+V) ) / ( (W∩U)+(W∩V) ).
Indeed w occurs iff w=−u−v; differences of lifts with the same w are diagonal elements of U∩V, and the remaining degree-2 boundaries alter w by exactly B+C'. Finally
H0 = D/(U+V+W), H3=0.
These formulas use actual inclusion matrices, not ranks alone.

For a bounded chain complex of finitely generated free Z modules, UCT gives 0→H_i(Z)⊗Fp→H_i(Fp)→Tor_1(H_{i−1}(Z),Fp)→0, and the Q version is ordinary tensor. If H1(K⊗Q)=H1(K⊗Fp)=0 for all p, then H1(K;Z)=0 **and** H0(K;Z) is torsion-free. This latter condition is essential: ignoring H0 would miss the unsaturated triple sum. Thus
(W∩(U+V)) = (B+C'), and S:=U+V+W is primitive in D.
For any 2-face whose top is a free subgroup X and sides Y,Z with bottom Y∩Z, H1 over all fields is zero iff Y+Z is primitive in X: integral H1 is already 0 and UCT detects Tor(X/(Y+Z),Fp). Apply to the three **lower** faces to obtain
A+B primitive in U, A+C' primitive in V, B+C' primitive in W.
The three upper faces also imply U+V, U+W, V+W primitive in D; this is a useful redundant cross-check.

### Step 3 — choose one genuine global integral basis

T is primitive in A,B,C'. Choose direct complements A=T⊕A0, B=T⊕B0, C'=T⊕C0. (For example A/T embeds D/T, which is free; likewise intersections of primitive subgroups are primitive.) Then A+B=T⊕A0⊕B0, A+C'=T⊕A0⊕C0, B+C'=T⊕B0⊕C0, all internal direct sums because pair intersections are T.

The lower-face saturation just proved allows free complements U0,V0,W0 with
U=T⊕A0⊕B0⊕U0,
V=T⊕A0⊕C0⊕V0,
W=T⊕B0⊕C0⊕W0.

Their sum is **direct** in D. For a relation t+a+b+c+u+v+w=0, allocate (t+a+b+u)∈U, (c+v)∈V, w∈W. Then w∈W∩(U+V)=B+C', and w∈W0, so w=0. Now t+a+b+u=−(c+v) lies in U∩V=A; the displayed direct sum for U forces b=u=0, and the direct sum for V forces c=v=0; finally T⊕A0 forces t=a=0. Thus
S = T ⊕ A0 ⊕ B0 ⊕ C0 ⊕ U0 ⊕ V0 ⊕ W0.
Because S is primitive in D, choose D=S⊕D0.

Choose arbitrary integer bases of these eight free direct summands. They give a SINGLE Z-basis of D, and each embedded M(x) is literally spanned by a subset. Since every structure map is inclusion, these restricted bases give natural simultaneous splittings, not just pointwise splitting.

Supports: basis vectors in T have ↑000; A0 has ↑100; B0 ↑010; C0 ↑001; U0 ↑110; V0 ↑101; W0 ↑011; D0 ↑111. Every support is an n=3 **block** in Definition3 of LLO (iterated induced bands/birth block/full block). This completes the proof including zero-rank cases. The construction also works over a PID if "primitive" means quotient free and all necessary residue-field tests are available, but the quantified S009 theorem is deliberately over Z.

### Scope and nonclaims

- No universal all-primitive-cube theorem: if M(x→111) has a kernel, its vertex cannot be identified with a top sublattice and all foregoing steps fail; no equivalence or reduction is asserted.
- Not every arbitrary interval on C is a block. The eight principal upsets are blocks; extra indecomposables and death blocks in non-injective cubes are not covered.
- Not a general three-height section-spectral-sequence theorem or finite-grid gluing result.
- No Lean, exhaustive numerical enumeration, topological application beyond the standard integral H_* functor, or novelty certificate. T25 is a mathematically complete internal restricted lemma, potentially a routine corollary of standard lattice theory.

### Why the main target remains open

LLO (2024 arXiv v4, HHA 2026) establishes field n-block criterion, relying on field-vector-space splitting. Luo–Henselman-Petrusek (2025/2026) establishes PID interval bases over totally ordered indices, not the universal cube. T25 removes kernel/death behavior rather than solving their obstruction. A genuine counterexample to full C11 must have primitive **all** maps, Q/Fp block decomposition for **all** primes, and at least one noninjective top composite; a claim based only on joint nonprimitive images would fail some Fp exactness.