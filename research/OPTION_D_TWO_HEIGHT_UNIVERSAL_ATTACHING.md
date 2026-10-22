# Option D continuation — universal two-height attaching obstruction in Euclidean Rips persistence

> **S129 CORRECTION (22 October 2026; supersedes contradictory radius claims below).** The fixed `d3StrictRips` uses `‖q i−q j‖ < r` for distinct pairs. Thus short edges are ABSENT at r=a; the short-edge graph exists only at a<r≤b, including r=b; the complete graph exists only at r>b. Born singleton vertices exist at ANY radius including negative r (radius bounds only distinct pairs). The claimed sample q_p at r=a is invalid. To test a hypothetical δ-interleaving with 2δ<b−a, choose η with 0<η<b−a−2δ and sample actual parameter `((p₁,p₂),a+η)` instead. This has no changes through two δ-shifts and preserves the same conditional c_N=(b−a)/2 lower bound IF the universal derived-cofiber realisation, objectwise-WE invariance and both-lane coherent comparison obligations are independently established. The old “negative-radius empty” and four radius strata descriptions are wrong; there are three radius regimes (discrete/selected flag/complete), plus empty objects where no vertices are born. Finite-complex ordinary union-to-terminal inclusion is now Lean-certified in S129, but NO general homotopy pushout/cofiber or universal D6/D7/D8 is Lean-certified. This erratum controls all older contradictory passages of this note.

**19 October 2026 · proof-first research addendum, NOT a numbered session.**

**Status.** Internal complete human-readable argument subject to standard relative triangulation, homotopy colimit, and Hopf invariant results. No external referee, novelty/prior-art/G2 audit, Lean, Palomar, manuscript, or new numbered-session prompt. Owner has explicitly asked to continue combining previously proved results and to decide downstream steps themselves. This document extends and strengthens \`research/OPTION_D_SYNTHESIS_PROOF.md\` without amending S116/conditional S117 governance. In particular it does **not** revive the retired C4 first-HHA-paper candidate, claim a Top^R strict HI>IHC gap, or purport to clear HHA novelty.

## A. Improvement over the previous Option D synthesis

The preceding D4 theorem uses the punctured **three-cube**, an S^1 bottom, three height coordinates plus radius (real **four** parameters), an integral three-block homology diagram, and lower bound 1/(2000N). Its proof also uses a legitimate but conservative interior radius sample r=1.

Here a **two-cube** suffices. In the Hopf specialization, only \`H_2\` is nonzero in positive degrees, with two singleton-supported integral blocks, the entire full real \`Ho(Top)\`-valued pointwise diagram is unchanged, and the filtration uses only **radius + two heights = three real parameters**. The no-event corner must be sampled at an interior radius a+eta>a, yielding the stronger sharp-plateau lower bound

\[
d_{\mathrm{HI}}(F_f,F_g)\ \ge\ c_N
:=\frac{\sqrt{1+\epsilon}-\sqrt{1-\epsilon}}2
=\frac{\epsilon}{\sqrt{1+\epsilon}+\sqrt{1-\epsilon}}
>\frac{1}{200N},\quad\epsilon=\frac1{100N}.
\]

No optimality of the full interleaving distance, no minimal number of *all possible* persistence parameters, and no fixed-size/fixed-dimensional family is claimed.

## B. Universal square theorem

**Theorem D6 (finite attaching-map universality for two-distance Euclidean Rips).** Fix \`n>=1\`, a connected finite simplicial complex \`Y\`, and two maps

\[
f,g:S^{n+1}\longrightarrow |Y|.
\]

Suppose their homotopy cofibers \(\operatorname{Cofib}(f)\) and \(\operatorname{Cofib}(g)\) are not weakly homotopy equivalent (for example, a named integral cohomology-ring invariant distinguishes them). Then for some \`N>=2\` there are two sets of \`N\` distinctly labelled points in \(\mathbb R^{N-1}\), with *identical binary 2-coordinate vertex birth vectors* and with exactly two positive pairwise squared-distance classes

\[
1-\epsilon,\qquad 1+\epsilon,\qquad \epsilon=1/(100N),
\]

whose full radius-plus-two-height flag Vietoris–Rips diagrams \(\mathcal F_f,\mathcal F_g:\mathbb R^3\to\mathrm{Top}\) satisfy:

1. Their full pointwise-homotopy-category diagrams are naturally isomorphic as functors in \(\mathrm{Ho}(\mathrm{Top})^{\mathbb R^3}\). In particular their complete natural integral/field (co)homology and cup-ring diagrams coincide. This does NOT identify the objects in the homotopy category of *whole diagrams*.
2. At any strict middle radius \(a<r\le b\), and binary height coordinates, a coherent strict Boolean square has vertex homotopy types \(S^n,D^{n+1},D^{n+1},Y\); its derived punctured-square comparison has homotopy class \(f\) or \(g\) respectively, and its homotopy cofiber is \(\operatorname{Cofib}(f)\) or \(\operatorname{Cofib}(g)\).
3. Under the unrestricted, diagonal-translation homotopy-interleaving distance, allowing arbitrary **entire-diagram** objectwise-WE zigzags of BOTH inputs,
\[
d_{\mathrm{HI}}(\mathcal F_f,\mathcal F_g)
\ge c_N
=\frac{\sqrt{1+\epsilon}-\sqrt{1-\epsilon}}2
>\frac{1}{200N}>0.
\]
4. There are at most \(4\cdot 3^2=36\) radius/height product strata (negative-radius empty, discrete, short-edge flag, and all-pairs simplex; and three strata per birth coordinate). This bound concerns strata, not point number, ambient dimension, simplicial dimension, or computational complexity.

**Meaning of universality.** The theorem is conditional ONLY on a difference in the genuine attaching-map *homotopy cofibers*, not on a predetermined Hopf invariant. It transports any such finite attaching-map distinction into positive geometric homotopy-interleaving distance while making all pointwise homotopy-category data coincide. It does not assert that distinct maps always have non-equivalent cofibers.

### Proof, Step 1 — a literal common punctured square

Build the ordinary CW \((n+1)\)-disks \(D_1,D_2\) using a **single shared** boundary \(A=S^n\), with inclusions \(A\hookrightarrow D_i\). Their literal union is

\[
L=D_1\cup_A D_2\cong S^{n+1}.
\]

Let \(P=B_2\setminus\{11\}=\{00,10,01\}\). For \(\theta=f,g\), define a strict \(B_2\)-space diagram

\[
X^{(\theta)}_{00}=A,\quad
X^{(\theta)}_{10}=D_1,\quad
X^{(\theta)}_{01}=D_2,\quad
X^{(\theta)}_{11}=M_{\theta},
\]

where \(M_\theta\) is the mapping cylinder of the map \(\theta:L\to |Y|\), and all structure maps are literal inclusions of the proper \(A,D_i,L\) subspaces into the cylinder. The three proper objects and all maps among them are LITERALLY THE SAME for f and g. Both terminal cylinders deformation-retract onto the same \(|Y|\).

Since \(A\hookrightarrow D_i\) are CW cofibrations, the (homotopy) pushout of \(D_1\leftarrow A\to D_2\) is their ordinary union \(L=S^{n+1}\). Thus

\[
\operatorname{hocolim}_{P}X^{(\theta)}\simeq L,\qquad
\bigl(\operatorname{hocolim}_P X^{(\theta)}
\longrightarrow X^{(\theta)}_{11}\bigr)\simeq\theta,
\]

and the canonical derived cofiber is \(\operatorname{Cofib}(\theta)\). The natural comparison is *coherent-square data* and does not factor through four disconnected choices of homotopy classes of arrows.

In \(\mathrm{Ho}(\mathrm{Top})\), every map from either contractible \(D_i\) to either connected terminal \(M_\theta\simeq Y\) is the unique homotopy class of unpointed maps of these types. The bottom-to-top map factors through \(D_i\), hence is also nullhomotopic. The remaining proper arrows are common, and both terminal objects may be identified with \(Y\). Therefore the two **pointwise-homotopy-category B2 diagrams** are naturally isomorphic despite differing coherent derived comparisons.

### Proof, Step 2 — finite flag induced-subcomplex model with matching labels

Choose triangulations of the shared proper union \(L=S^{n+1}\) and the common finite target \(Y\). By simultaneous simplicial approximation and a common finite refinement of \(L\), obtain triangulated mapping-cylinder models for f and g which **agree on the entire strict proper diagram**. Relative triangulation of finite mapping cylinders preserves all proper inclusions. Apply one (possibly further common) barycentric subdivision to make terminal complexes flag and each proper subcomplex vertex-induced. Indeed a barycentric vertex is a face of the original triangulation; if every vertex in a barycentric simplex represents a face in a given proper subcomplex, their chain simplex lies in that subcomplex. The induced proper subcomplexes obey
\[
K_{10}\cap K_{01}=K_{00},\quad K_{00}\subset K_{10},K_{01},
\]
with all other meet conditions automatic. This is a literal meet-exact Boolean square.

If the two finite terminal flag complexes have unequal vertex counts, attach enough **terminal-only free leaves**, one new edge ending at a new vertex per leaf, to the smaller terminal complex to match counts. This leaves terminal homotopy type, proper diagrams, and derived cofibers unchanged, and adds no cliques of size three. Each leaf can be given birth vector (1,1). The two terminal complexes now have \`N\` labels in bijection; the proper complexes and label sets coincide exactly. Every existing vertex has a unique least birth grade among 00,10,01,11 because meet-exactness holds. Thus both carry the same binary birth function \(w:V\to B_2\), and the subcomplex at grade \(p\) is precisely the vertex-induced part on \(w(v)\le p\). All models are finite. No numeric upper bound on \`N\` has been established.

### Proof, Step 3 — exact two-distance Euclidean transfer

Assign to each of the two terminal flag complexes its own hollow \(N\times N\) squared-distance matrix \(D^2\), with off-diagonal value \(1-\epsilon\) for graph edges and \(1+\epsilon\) for nonedges. With centering projector \(J=I-\mathbf1\mathbf1^T/N\), let \(G=-JD^2J/2\). Relative to the equilateral squared-distance matrix, the perturbation \(E\) satisfies \(\|E\|_2\le(N-1)\epsilon<1\). On \(\mathbf1^\perp\),
\[
z^TGz\ge\frac12(1-(N-1)\epsilon)\|z\|^2>0,
\]
and \(G\mathbf1=0\). Hence \(G\) is PSD of rank \(N-1\), giving \`N\` distinct Euclidean points in \(\mathbb R^{N-1}\) with exactly these distances. This is the complete double-centering proof of the Euclidean realization, not an assumed triangle inequality. Put vertex height \(w(v)\in\{0,1\}^2\).

For \(0\le r<a=\sqrt{1-\epsilon}\), the selected points are isolated; for \(a\le r<b=\sqrt{1+\epsilon}\), the selected flag Rips complex is the desired vertex-induced \(K_p\); for \(r\ge b\) it is a simplex on the selected vertices. Before radius zero, all complexes are empty. The two clouds have exactly the same vertex birth labels, hence the same discrete and simplex strata.

At each middle-radius grade p, the proper members are respectively \(A,D_1,D_2\) (after subdivision) and the terminal members have homotopy type Y; the B2 diagrams are isomorphic in \(\mathrm{Ho}(\mathrm{Top})^{B_2}\) by Step 1. At low radius, matched labelled discrete sets give identical component maps and height arrows; every map from a discrete selected set to any connected middle-radius member is unique up to unpointed homotopy on each component; and at high radius all targets are contractible. Maps across intervening radius strata are compatible for the same reasons. Consequently the **complete** real \(\mathrm{Ho}(\mathrm{Top})\)-valued diagrams are naturally isomorphic. Their homology/ring shadows agree, including H^0 component structure. This does NOT promote the isomorphism into \(\mathrm{Ho}(\mathrm{Top}^{\mathbb R^3})\).

### Proof, Step 4 — quantitative obstruction with both interleaving identities

Sample the actual birth thresholds and a strictly interior short-edge radius. For a hypothesised delta with 2delta<b−a choose eta satisfying 0<eta<b−a−2delta:

\[
q_p=((p_1,p_2),a+\eta)\in\mathbb R^3,\qquad p=(p_1,p_2)\in B_2.
\]

With nonnegative diagonal shifts \(s<b-a\), each \(\mathcal F_\theta(q_p)\to\mathcal F_\theta(q_p+s\mathbf1)\) is literally an identity on the selected simplicial complex: the short edges have appeared at \(a\), the long edges cannot appear before \(b\), low heights 0 remain below 1, and high heights 1 remain above that threshold. Because \(b-a<1\) (indeed <0.01 at our epsilon), the two vertex-height plateaux hold simultaneously. The same no-event property holds NATURALLY for every edge of the four-object square.

Assume a \(\delta\)-homotopy interleaving with \(0\le\delta<(b-a)/2\). Take actual full-diagram zigzag-WE representatives \(A'\simeq\mathcal F_f\), \(B'\simeq\mathcal F_g\), with strict interleaving maps \(u:A'\to B'(\delta)\), \(v:B'\to A'(\delta)\). Entire-diagram naturality through zigzags and the literal no-event condition imply that the structure maps of A' and B' at every q_p, q_p+\delta, q_p+2\delta are weak equivalences.

In \(\mathrm{Ho}(\mathrm{Top})\), the first interleaving identity
\[
v_{q_p+\delta}u_{q_p}=A'(q_p\le q_p+2\delta)
\]
is an isomorphism, so \(u_{q_p}\) is split monic. The second identity
\[
u_{q_p+\delta}v_{q_p}=B'(q_p\le q_p+2\delta)
\]
is an isomorphism, so \(u_{q_p+\delta}\) is split epic. Naturality gives
\[
u_{q_p+\delta}\,A'(q_p\le q_p+\delta)
=B'(q_p+\delta\le q_p+2\delta)\,u_{q_p},
\]
whose two flanking structure maps are invertible; therefore \(u_{q_p}\) is also split epic. A split mono and split epi are inverse isomorphisms. Thus all four u-components at q_p are weak homotopy equivalences, and (crucially) form ONE strictly natural morphism of **coherent** B2 diagrams. With the full-diagram zigzags and the plateau WE arrows on the B' lane, they identify the two original strict four-vertex coherent square diagrams by a zigzag of objectwise WEs.

Homotopy pushout and homotopy cofiber are invariant under these natural objectwise weak equivalences of coherent B2 diagrams. Their cofibers \(\operatorname{Cofib}(f)\) and \(\operatorname{Cofib}(g)\) must be weakly equivalent, contradicting the hypothesis. Hence no \(\delta<(b-a)/2\) interleaving exists and the infimum satisfies
\[
d_{\mathrm{HI}}\ge\tfrac12(b-a)=\frac{\epsilon}{\sqrt{1+\epsilon}+\sqrt{1-\epsilon}}.
\]
Strict concavity of the square root gives the denominator \(<2\) for \(0<\epsilon<1\), yielding the simpler strict bound \(d_{\mathrm{HI}}>1/(200N)\). This argument uses **both** strict identities and all whole-diagram WE replacements, avoiding the invalid single-composite two-out-of-three argument corrected in S026. QED.

## C. Block-simple Hopf application

**Corollary D7 (three-real-parameter, single-positive-degree Hopf family).** For every pair \(k,\ell\in\mathbb Z\) with \(|k|\ne|\ell|\), apply D6 with \(n=2\), \(Y=S^2\), and \(f=k\eta\), \(g=\ell\eta\), where \(\eta:S^3\to S^2\) is a Hopf generator. Their cofibers are
\[
C_k\simeq S^2\cup_{k\eta}e^4,\qquad
C_\ell\simeq S^2\cup_{\ell\eta}e^4.
\]
The ordinary integral Hopf invariant/cellular cup theorem yields primitive generators \(x\in H^2\), \(y\in H^4\) with \(x^2=ky\), respectively \(x^2=\ell y\). Any graded integral ring isomorphism multiplies each generator by a unit \(\pm1\), hence requires \(|k|=|\ell|\), contrary to assumption.

At the intermediate radius, the four-object integral homology module has exactly
\[
H_0=\mathbb Z[B_2]\quad\text{(constant)},\qquad
H_2=\mathbb Z[\{00\}]\oplus\mathbb Z[\{11\}],\qquad
H_i=0\ \text{for }i>0,\ i\ne2.
\]
Both positive-degree summands are elementary singleton-support interval/block modules with no torsion; all maps from the bottom generator to the top factor vanish, since they pass through a contractible singleton. The full pointwise \(\mathrm{Ho}(\mathrm{Top})^{\mathbb R^3}\) diagrams, and hence all natural homology, cohomology-ring, componentwise homotopy-group diagrams, coincide, but the **coherent** derived-square cup products and positive homotopy-interleaving distance differ:
\[
d_{\mathrm{HI}}(\mathcal F_{k\eta},\mathcal F_{\ell\eta})
\ge\frac{\sqrt{1+\epsilon}-\sqrt{1-\epsilon}}2
>\frac1{200N}.
\]
As \(|k-\ell|\) grows, the integral coherent cup-square difference is unbounded, though \(N=N(k,\ell)\) and ambient dimension may grow. This is a *stronger and simpler internal synthesis* of S014's Hopf-cell mechanism and S026/S027's quantitative all-zigzags metric technique than the four-real-parameter D4 note; it does **not** assert a new published theorem.

## D. Metric and height perturbation stability

**Corollary D8.** Keep one D6 pair with matching labels. Perturb each cloud's pairwise *distance* by at most \(\rho\), and each label's two birth coordinates by at most \(\rho\) independently; require the new clouds to remain Euclidean labelled clouds (not necessarily in the same dimension). For each original/perturbed pair, the identical vertex-label inclusions give strict \(\rho\)-interleavings: every selected vertex and edge at z remains selected/present at z+\rho, and the round-trip maps are the canonical inclusions. Therefore
\[
d_{\mathrm{HI}}(\widetilde{\mathcal F}_f,\widetilde{\mathcal F}_g)
\ge c_N-2\rho
>\frac1{200N}-2\rho.
\]
For \(0\le\rho<1/(400N)\) the rightmost expression is strictly positive. The pointwise block decompositions need not remain literally unchanged under perturbation; what persists is the **positive whole-diagram coherent metric separation**. This is a labelled geometric stability statement, not invariance under arbitrary changes to labels or point count.

## E. Checks, nonclaims, and handoff

* **Arithmetic checks reproducible on paper.** The common proper span in n=2 is two 3-balls glued along one S^2, hence S^3; the proper two-cube's only positive integral H is bottom H2=Z. On the top S2, H2=Z, every bottom-to-top H2 arrow is zero via contractible singles. The Gram bound is strict since \((N-1)/(100N)<1/100\). The two defining interleaving identities yield actual pointwise weak equivalences of the **coherent** selected squares.
* **Primary source and external novelty intentionally NOT tested.** This note uses internal S014/S026/S027, the preceding Option D note and named classical facts. Neither a standard construction nor its synthesis is claimed new relative to research literature.
* **Non-claims.** No strict comparison \(d_{\mathrm{HI}}>d_{\mathrm{IHC}}\) in one category, no ordinary unpointed Top^R gap, no determination of exact dHI, no fixed embedding dimension or fixed N, no universal arbitrary-map cofiber distinguishability, no machine-checked proof, no HHA significance pass.
* **Owner boundary.** Proof and candidate are recorded only. No change to authoritative STATE, NEXT_SESSION_PROMPT, S115 C4 retirement, S116 recommendation or S117 execution. NO new session/novelty checks, Lean, Palomar, paper, journal, preprint or external contacts. Owner chooses any follow-up after reviewing this strengthened internal proof.

**Suggested owner-facing theorem:** *Every pair of finite attaching maps of an (n+1)-sphere to the same connected finite complex whose cofibers have different homotopy types admits two-distance Euclidean Rips realisations with just two binary height coordinates, identical full pointwise homotopy-category persistence, and a robust quantitative positive whole-diagram homotopy-interleaving gap. In particular an arbitrarily large integral Hopf coefficient hides behind only two torsion-free singleton homology blocks in one positive degree.*
