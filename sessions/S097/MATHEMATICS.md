# S097 MATHEMATICS — genuine two-stage lift torsor; unmarked-equivalence obstruction (INTERNAL)

**Result status:** T231–T233 are proof-level INTERNAL standard-homotopy calculations with explicit dependencies. No HHA-original homotopy interleaving theorem is obtained. Do NOT promote G2 or claim that a secondary class is an invariant of arbitrary unmarked complete real diagrams.

## T231. Independent base attachments do not interact at the terminal object

Let K be any based CW complex and alpha:S^{r-1}->K, beta:S^{s-1}->K continuous cellular attaching maps. Put X_1=K cup_alpha D^r and X_2=X_1 cup_{i beta} D^s, where i:K->X_1 is canonical. By the literal quotient description, X_2 is canonically homeomorphic, relative to K, to
\[
(K\sqcup D^r\sqcup D^s)/(x\sim\alpha(x)\ (x\in\partial D^r),\ y\sim\beta(y)\ (y\in\partial D^s)).
\]
It is simultaneously the pushout of alpha and beta and has the same terminal space after swapping attachment order (with suitably renamed filtration stages). Thus the terminal object has no *new* cross-term in its attaching data beyond the two based maps alpha,beta. This statement does NOT assert that filtered diagrams are identical after rearranging clocks or that all Toda operations in K vanish. It kills the simple S097 proposal to infer a novel coupling solely from two nontrivial cells that both attach into K.

## T232. Coupled SECOND attachment into the first cofiber has a nontrivial 12-element lift torsor

Fix integer n>=5. Take alpha=eta_n^2:S^{n+2}->S^n, the nonzero stable class of order two, and let
\[
C=S^n\cup_{\eta_n^2}D^{n+3},\quad i:S^n\hookrightarrow C,\quad q:C\to S^{n+3}=C/S^n .
\]
An actual based map beta:S^{n+3}->C has **quotient degree two** when q_*(beta)=2 in pi_{n+3}(S^{n+3})=Z. Such maps are genuine nontrivial second attaching maps: attach D^{n+4} by beta to form Z_beta=C cup_beta D^{n+4}. q degree 2 ensures beta is not homotopic to a map factoring through i:S^n->C.

**Careful exactness argument.** Stabilize the cofiber triangle S^{n+2} --eta_n^2--> S^n --> C --> S^{n+3}. In the STABLE homotopy category it yields the exact sequence
\[
\pi_1^S\xrightarrow{\eta^2\circ-}\pi_3^S\xrightarrow{i_*}
\pi_{n+3}^S(C)\xrightarrow{q_*}\pi_0^S
\xrightarrow{\eta^2}\pi_2^S .
\]
The rightmost map Z->Z/2 is reduction modulo two. On the left, the generator eta maps to eta^3=12nu in pi_3^S=Z/24; its image has order two. Consequently
\[
\mathrm{im}(q_*)=2\mathbb Z,\qquad
\ker(q_*)\cong (\mathbb Z/24)/\langle 12\nu\rangle
\cong\mathbb Z/12.
\]
Freudenthal applies to pi_{n+3}(S^n) (n+3 <= 2n-2 for n>=5) and to pi_{n+3}(C), since C is (n-1)-connected; it identifies these with the displayed stable groups. Hence the degree-two *unstable* lifts exist and, after selecting one beta_0, form a torsor {beta_k | k in Z/12}, with beta_k=beta_0+i_*(k nu). The choice of beta_0 is noncanonical. All additive formulas concern based homotopy classes of maps from a sphere. We **do not** invoke the false general assertion that an unstable cofibration automatically yields a long exact sequence on pi_*.

**Cellular invariant control.** Z_beta has reduced integral cellular chains only in degrees n,n+3,n+4, with differential d_{n+4}=2 into degree n+3 and zero elsewhere. Thus \widetilde H_n(Z_beta;Z)=Z, \widetilde H_{n+3}(Z_beta;Z)=Z/2, and all other reduced integral groups vanish. All Z_beta have identical integral graded homology; all positive cup products vanish because 2n>n+4. Mod-two cohomology has one generator each in degrees n,n+3,n+4, with Sq^1:H^{n+3}->H^{n+4} nonzero (ordinary Bockstein of the degree-two cellular boundary). This does **not** establish equality of the full Steenrod module: Sq^4:H^n->H^{n+4} is a plausible parity detector and must be computed without an unjustified diagonal approximation.

## T233. Coaction shears kill 10 of 12 naive distinctions under unmarked weak equivalence

The cofiber pinching/coaction mu:C->C vee S^{n+3} induces, for every delta in ker(q_*) <= pi_{n+3}(C), a based self-map f_delta:C->C obtained by composing mu with id_C vee delta and the fold. It fixes S^n on the nose (with standard cellular model) and satisfies q f_delta=q up to homotopy, since q delta=0. It is a homology isomorphism (identity on the two nonzero reduced integral cellular degrees) and thus, by simply-connected CW Whitehead, a weak homotopy equivalence.

For any degree-two beta, the **stable** coaction formula gives
\[
[f_\delta\circ\beta]=[\beta]+\delta\,\deg(q\beta)
=[\beta]+2\delta\quad\text{in }\pi_{n+3}(C).
\]
Freudenthal again identifies these with the actual unstable homotopy classes at n>=5. Therefore f_delta beta_k is homotopic to beta_{k+2j} when delta corresponds to j in Z/12. An extension across the attached (n+4)-cell gives a homotopy equivalence Z_{beta_k}->Z_{beta_{k+2j}} compatible with f_delta on C and identity on the lower S^n. On the THREE-stage diagrams S^n -> C -> Z_beta (and on their all-real, equally clocked, death-to-point versions) these stage maps form, after standard mapping-cylinder strictification for a homotopic attaching square, a zigzag of whole-diagram objectwise weak equivalences. Thus any supposedly model-independent d_HI or d_IHC distinction among **even translated** beta choices is FALSE: they have distance zero.

The elementary shear action on Z/12 has exactly two orbits: {0,2,4,6,8,10} and {1,3,5,7,9,11}. This supplies an UPPER bound of TWO candidate unmarked types, **not** proof they are inequivalent: other automorphisms can conceivably identify the remaining two classes. Nor do we know that parity escapes Sq^4. No general all-real **positive metric** lower bound follows from this calculation.

## Gate verdict and next scientific question

S097 produced an exact choice-indeterminacy torsor and a destructive full-diagram WE orbit argument, not the requested HHA theorem. The actual all-primary-Ste enrod equality is NOT proved (specifically Sq^4 is suspect); neither remaining orbit inequivalence nor genuine two-lane non-clock dHI/dIHC separation is proved. A relative marked torsor is not an invariant of arbitrary unmarked Top^R diagrams. Treat the naive secondary-coherence flagship as KILLED and do not spin up new interval timings to conceal this failure. G1 desired theorem OPEN; HHA G2 NOT PASSED. T232/T233 rely on classical stable stems, cofiber exactness, Freudenthal and Whitehead and are not independently HHA original. No Lean, Palomar or manuscript.
