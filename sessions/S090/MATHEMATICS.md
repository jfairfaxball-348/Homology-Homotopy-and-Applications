# S090 MATHEMATICS — exact finite-CW two-lane no-go results

## Actual verdict

NO pair proving d_HI>d_IHC in ordinary UNPOINTED Top^(R,<=) was constructed or ruled out generally. Below are complete, INTERNAL and mathematically elementary pruning results T210–T212. No literature novelty or HHA readiness is claimed. Earlier S089 five 2-local spheres remain OPEN with conditional higher-bracket transfer.

For nonempty finite CW X and any T>0, let P_X^T(t) be EMPTY for t<0, X on [0,T), and the POINT on [T,infinity); use identity arrows within each stratum and unique arrows between strata. Every stage is finite CW, including empty and point. Let HI use arbitrary objectwise-WE WHOLE real replacements of BOTH lanes, and IHC use Ho(Top^R), NOT (HoTop)^R.

## T210 — exact same-support two-lane single-pulse rigidity

For every nonempty finite CW A,B and T>0,
\[
d_{\mathrm{HI}}(P_A^T,P_B^T)=d_{\mathrm{IHC}}(P_A^T,P_B^T)
=\begin{cases}0& A\simeq B\ \text{weakly},\\ T/2&A\not\simeq B.\end{cases}
\]

**Upper at epsilon=T/2:** Choose points a in A, b in B. Define the whole-real natural transformations F->G^epsilon and G->F^epsilon: from an empty source the unique map, between nonterminal stages a constant map with value b/a respectively, to a point the unique map, and between terminal points the identity. These maps are natural across every stratum, including t<0, t=0, t=epsilon, t=T and all positive times: the only nontrivial squares compose constant maps with a collapse to the point, hence agree. Both 2epsilon-shift targets at t>=0 are point; for t<0 source is empty. Therefore BOTH shifted interleaving composites equal their structure maps strictly for EVERY real t. So dHI<=T/2, without any replacements.

**Lower for non-equivalent A,B:** Suppose epsilon<T/2 admits a Ho(Top^R) interleaving phi:F->G^epsilon and psi:G->F^epsilon. Evaluate at 0 and epsilon. Since 0,epsilon,2epsilon all lie in [0,T) and the structure arrows within this interval are identities, naturality gives phi_0=phi_epsilon and psi_0=psi_epsilon in HoTop. Both interleaving identities at 0 then give psi_0 phi_0=id_A and phi_0 psi_0=id_B. Thus A and B are isomorphic in HoTop; finite CW Whitehead theorem yields a weak equivalence, contradiction. Every strict interleaving after ANY two-whole-diagram WE zigzags induces such an IHC interleaving of originals, so the lower bound covers arbitrary nonmonic, nonpoint, backward/forward replacements, not merely a fixed model. Hence dIHC>=T/2 and equality.

**Equivalent A,B:** A weak equivalence u:A->B extends over the complete real pulse diagrams by identities on terminal points and unique maps on empty stalks. It is a natural objectwise WE of whole diagrams. Replacing P_A^T by P_B^T makes both lanes identical, with a strict zero interleaving. Thus both distances are zero. QED.

This eliminates ALL two-nonpoint-lane SAME SUPPORT single-pulse candidates irrespective of CW attaching complexity. It does NOT eliminate multi-transition higher coherence.

## T211 — explicit finite-CW homology-blind family with NO HI>IHC gap

Let A=CP^2=S^2 union_eta e^4, attached by the actual Hopf map eta:S^3->S^2. Let B=S^2 wedge S^4=S^2 union_constant e^4. These are finite CW with one 0-, one 2- and one 4-cell. Their integral graded homology groups agree; the whole real persistent homology diagrams of P_A^T and P_B^T are naturally isomorphic: H0 is Z on [0,infinity), H2 and H4 are Z on [0,T) followed by zero, every other H_i zero. Thus homology-module interleaving distance is ZERO for all T.

But their homotopy types differ: a degree-two generator x of H*(CP^2;Z) has nonzero square generating H4; every degree-two class on S^2 wedge S^4 squares to zero. No cohomology RING isomorphism is possible. T210 gives exactly
\[
d_{\mathrm{HI}}(P_A^T,P_B^T)=d_{\mathrm{IHC}}(P_A^T,P_B^T)=T/2>0,
\quad d_I(H_*P_A^T,H_*P_B^T)=0.
\]
Arbitrarily large T gives a homology-versus-HOMOTOPY metric gap by scaling, but NEVER a HI-versus-IHC gap. The cup-product distinction is textbook mathematics, not original HHA-level novelty.

## T212 — ALL real multi-stage CW 0-type rigidity on BOTH lanes

Let F,G be arbitrary R-indexed diagrams of CW complexes, including empty stalks, each connected component of each stalk WEAKLY CONTRACTIBLE. Then
\[
d_{\mathrm{HI}}(F,G)=d_{\mathrm{IHC}}(F,G)
=d_{\mathrm{Set}}(\pi_0 F,\pi_0 G)
\]
with ordinary strict Set-valued distance on the entire real line.

**Proof:** CW path components are open. Give pi0(F_t) the discrete topology. The canonical continuous quotient F_t->disc(pi0 F_t) is a weak homotopy equivalence, since it induces the pi0 bijection and all higher homotopy groups of every component vanish. These maps are strictly natural for EVERY real structure arrow, giving a WHOLE-diagram objectwise-WE map F->disc pi0 F, likewise G. Any set interleaving is a strict Top interleaving of the corresponding discrete diagrams, giving dHI<=dSet. Conversely the functor pi0 sends any whole-diagram objectwise WE to a natural set isomorphism, descends to Ho(Top^R), and preserves shifts and both interleaving identities; hence dSet<=dIHC. Since dIHC<=dHI, equality follows, including infima and infinite distances. QED.

This rigorously kills all multi-transition two-lane finite forest and weak 0-type CW architectures. It does not apply to connected CP^2 or S2 wedge S4: both have equal pi0 set diagrams, yet T211 gives positive equal HI/IHC, an explicit countermodel to omitting the 0-type condition.

## Candidate impact and exact missing bridge

The CP2/wedge Hopf-versus-trivial four-cell trial has both nonpoint finite CW lanes and equal homology but its obstruction is objectwise homotopy inequivalence, NOT a genuinely *relative, higher naturality* obstruction. All one-pulse pairs are killed by T210. Two-lane 0-types, even with arbitrarily many nonidentity component arrows, are killed by T212. S040's older five-stage all-essential primitive wedge map n=i1 p2 with n^2 literally constant is a point-target no-gap control, not an independent witness.

No new explicit 3–7-stage pair with more than one essential transition AND (i) a genuine Ho(Top^R) epsilon-interleaving including both identities, (ii) all-WE-zigzag-invariant strict obstruction, (iii) a real a<b quantitative clock was derived. The exact missing bridge is a **concrete replacement-invariant relative higher-coherence obstruction in ordinary unpointed Top^R**; DKS and Toda background alone do not instantiate it. An unsuccessful candidate search does NOT prove universal equality or nonexistence. G1 Top strict OPEN; HHA G2 NOT PASSED; no Lean or publication.
