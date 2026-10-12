# S003 mathematics dossier — arbitrary finite-chain integer diagrams

**Status:** internally reasoned complete finite-CW theorem S003-T5, with independently stated and checked auxiliary facts. NOT novel-certified, NOT Lean checked, NOT a claimed new HHA paper. See source comparison and geometric limitations below.

## S003-T5 — unrestricted finite one-parameter three-cover transgression

**Theorem.** Fix N>=0 and, for each t in {0,...,N}, finite-rank free abelian groups A_t and B_t. Let alpha_t:A_t -> A_{t+1} and beta_t:B_t -> B_{t+1} be **arbitrary** homomorphisms: not assumed injective, split, surjective or rank preserving. Let M_t:B_t -> A_t satisfy alpha_t M_t = M_{t+1} beta_t for every t<N. Then there are finite CW complexes X_0 subset ... subset X_N and three CW subcomplexes U_{i,t} subset X_t, nested in t for each i, with X_t=U_{1,t} union U_{2,t} union U_{3,t}, satisfying:

1. The three double intersections U_{1,t} cap U_{2,t}, U_{1,t} cap U_{3,t}, U_{2,t} cap U_{3,t} and the spaces U_{2,t}, U_{3,t} are contractible at every t; the triple intersection T_t is connected and homotopy equivalent to a wedge of rank(B_t) circles, and U_{1,t} is homotopy equivalent to a wedge of rank(A_t) two-spheres.
2. There are persistence-module isomorphisms H~_1(T_*)=B_*, H~_2(U_{1,*})=A_* respecting precisely beta, alpha (not merely ranks).
3. For the cover MVSS, the **integral d_2** is the prescribed natural transformation M (up to one coherent orientation convention); H~_3(X_*)=ker(M_*), H~_2(X_*)=coker(M_*), and H~_q(X_t)=0 for all other reduced q.
4. One explicit inductive CW construction has dimension(X_t)<=t+3. NO uniform three-dimensionality, simplicial algorithm, functorial canonical choice, or novelty is asserted.

**Proof; algebra and strict topological extension.**

Base t=0. Pick pointed graphs G_B=vee^{b_0} S^1 and E_A=vee^{a_0} S^2 with the rank-zero wedge interpreted as a point. Let T_0=G_B and Y_0=E_A. The unreduced suspension S(T_0) is homotopy equivalent, relative to the collapsed common basepoint spine, to vee^{b_0} S^2. The natural Hurewicz map pi_2(Y_0)->H_2(Y_0) is an isomorphism. Hence the columns of M_0 are induced by a based cellular map f_0:S(T_0)->Y_0, chosen to collapse the suspension of the basepoint.

Inductive input: T_t is a connected finite based CW space homotopy equivalent to G_t=vee^{b_t}S^1; Y_t is a based finite simply connected CW space homotopy equivalent to E_t=vee^{a_t}S^2. The maps f_t:S(T_t)->Y_t induce M_t and restrict *literally* to the maps selected at every previous time.

Choose a based map h:T_t->G_{t+1}=vee^{b_{t+1}}S^1 inducing beta_t on H_1. Existence: a homotopy inverse T_t->vee^{b_t}S^1 followed by a graph map sending each generator to a word with prescribed abelianization; both are based up to standard basepoint adjustment. Choose k:Y_t->E_{t+1}=vee^{a_{t+1}}S^2 inducing alpha_t on H_2; existence: a based homotopy inverse and finite pinch/degree maps on spheres. Replace target spaces by the **mapping cylinders** T_{t+1}=M_h and Y_{t+1}=M_k; their domain-end inclusions T_t subset T_{t+1}, Y_t subset Y_{t+1} are cellular cofibrations (with cellular attaching models), and each cylinder retracts to its target G_{t+1}, E_{t+1}. In particular homology transition maps are exactly beta_t and alpha_t, including nonsplit/noninjective cases.

Select g:S(G_{t+1})->E_{t+1} inducing M_{t+1} on H_2. Compare the two composites on S(T_t), both mapping into Y_{t+1}: the old f_t followed by Y_t inclusion and the suspension S(h) followed by g and E_{t+1} inclusion. Under the mapping-cylinder retraction to E_{t+1}, their induced H_2 homomorphisms are alpha_t M_t and M_{t+1} beta_t, equal by hypothesis. Both source S(T_t) and target Y_{t+1} have the homotopy types of finite wedges of 2-spheres; consequently based homotopy classes of maps between them are classified by the induced H_2 matrix (pi_2=H_2 and the wedge universal property). They are therefore based homotopic. Their suspension-basepoint spines can be kept collapsed; this is equivalently the based reduced-suspension statement and its natural quotient by a contractible spine.

Apply the homotopy extension property to the cofibration S(T_t) subset S(T_{t+1}) (or explicitly extend the homotopy over the suspended mapping-cylinder collar). This yields f_{t+1}:S(T_{t+1})->Y_{t+1} which equals f_t **on the old suspended subcomplex** and induces M_{t+1} after retraction to E_{t+1}. The relative extension exists because the map defined on the far end by g agrees up to homotopy over the cylinder; the collar homotopy fixes the old end. After cellular approximation relative to the fixed old subcomplex, all maps are cellular. This completes induction; the coherence for all earlier indices is automatic because the indices form a chain and restrictions are literally equal.

For every t apply exactly the three-cover cone construction of S002-T1 to f_t: put A_t=C_uT_t, B'_t=C_vT_t, S_t=A_t cup_{T_t} B'_t, W_t=C_w S_t, U_{1,t}=M_{f_t}, U_{2,t}=C_w A_t, U_{3,t}=C_w B'_t, and X_t=M_{f_t} cup_{S_t} W_t. Use the same labelled cone vertices and collar coordinates at all stages. Strict inclusion of f_t and all underlying CW pairs makes these literal nested **subcomplexes**, not just commuting maps in the homotopy category. Intersections: U1 cap U2=A_t, U1 cap U3=B'_t, U2 cap U3=C_wT_t, and triple=T_t. The first three are contractible. U1 retracts to Y_t.

The cofiber LES is natural in t, and for each t, H~_*(S_t) is Z^{b_t} in degree 2 and zero elsewhere, while H~_*(Y_t) is Z^{a_t} in degree 2 and zero elsewhere. Thus there is an exact natural sequence of integral persistence modules
0 -> H~_3(X_*) -> B_* --M--> A_* -> H~_2(X_*) -> 0,
and every other reduced total homology group vanishes. The Mayer–Vietoris cover spectral-sequence d_2 identifies with S_t -> Y_t in H_2 by the two-cone transgression argument in S002-T1; the identification is natural by inclusions. This proves all claimed assertions.

Dimension: dim T_0<=1, dim Y_0<=2. Each mapping-cylinder step adds at most one to the respective former dimensions. Hence dim T_t<=t+1 and dim Y_t<=t+2; dim S_t<=t+2, both mapping cone and W have dim <=t+3. All attachments are finite. Zero ranks, zero matrices, non-injective maps and changes in rank are covered by the same argument. QED.

**Critical proof boundary.** This is a finite CW construction **of unbounded dimension as N grows**. It does *not* automatically yield a 3D realization, one-critical bifiltration, fixed simplicial triangulation, canonical functorial assignment, or multiparameter rectification. All those stronger assertions need separate proofs. The idea is a standard mapping-cylinder cofibration and is not plausibly a stand-alone novel publication without further substantial restrictions.

## Worked integral tests (symbolic, not numerical search)

**Nonsplit torsion death.** Two stages, A_0=A_1=B_0=B_1=Z; alpha_0=beta_0=multiplication by 2; M_0=M_1=multiplication by 4. The naturality square reads 2*4=4*2. At both stages H~_3=0, H~_2=Z/4. The map on H~_2 is multiplication by 2 modulo 4, hence non-injective (the class of 2 dies), although the A and B transitions are injective. This cannot be modeled with S002 adapted wedge bases, but S003-T5 models it by nested finite CW three-covers.

**Non-injective maps.** Take A_0=A_1=Z, alpha=0; B_0=B_1=Z, beta=0; M_0=M_1=id. The stagewise kernels and cokernels vanish and T5 realizes both zero local transition maps through mapping-cylinder inclusions, despite each stage's local homology remaining Z. Inclusion of spaces does not imply injection in homology.

**Vanishing ranks.** Choose a stage with B=0 or A=0; graph/sphere wedges become points, their cylinders remain CW and the connecting-map LES works unchanged.

## Adversarial self-test and novelty caveat

The tempting false statement "any nested graph model handles non-split B inclusions" is *false*: top-degree homology of graph subcomplex inclusions is always primitive; see GEOMETRY_OBSTRUCTIONS.md. The tempting false statement "two matching path maps on homology give strict multiparameter coherence" is *unproved* and cannot be inferred from the chain inductive HEP. The T5 proof uses the special chain's absence of incomparable joins.

**Dependence:** elementary classification of based homotopy classes [vee S2,vee S2] by integer H2 matrices; graph maps for integer abelianizations; mapping-cylinder retract, relative HEP; finite CW pushouts; suspension isomorphism; standard cofiber LES; S002-T1 d2 identification. No external original-proof theorem is claimed here.
