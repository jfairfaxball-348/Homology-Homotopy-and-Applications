# S008 main mathematical dossier — actual two-height section spaces, integral extension

All proofs INTERNAL, human-readable, not Lean and NOT priority-certified. Terminology T20/T21 is programme-local, not novelty. VHT means Vaupel–Hermansen–Trygsland (HHA 2025; original 2022 arXiv:2201.12617v1).

## S008-T20: finite-poset two-height section/cofiber theorem (PROGRAMME_PROVED)

**Quantified construction.** Fix **any** nonempty finite posets P,Q and monotone map g:P→Q. Define a finite poset C_g whose elements are (0,p) for p∈P, an additional (0,*) at height 0, and (1,q) for q∈Q. Within height 0 retain P's order and impose p<* for all p; within height 1 retain Q's order. Cross-height relations are (0,p)≤(1,q) **iff** g(p)≤q; there is **no** relation (0,*)≤(1,q). There are no reverse-height relations. The transitive closure introduces no other relation: bottom precomposition is justified by monotonicity of g and terminal * has no outgoing relation. Thus C_g is a finite poset and height h_g:N C_g→N[1] is a simplicial map.

Let P^▹=P∪{*} (terminal cone), and set E_g={(p,q)∈P×Q:g(p)≤q} with coordinatewise order. By ORIGINAL VHT Definition 2.9, a (p,q)-section simplex is a map Δ^p×Δ^q→N C_g over Δ^p. Nerve is fully faithful, preserves products, and Δ^r=N[r]. Therefore:
- S_h[0] = N(P^▹) EXACTLY;
- S_h[1] = NQ EXACTLY;
- S_h[0,1] = N E_g EXACTLY (horizontal arrow/square category, not merely homology);
- horizontal faces e0 and e1 are nerves of s:E_g→P^▹, s(p,q)=p and t:E_g→Q, t(p,q)=q.
Any *strictly* increasing height sequence has length at most two, but repeated-height sections are NOT necessarily horizontal degeneracies. The original PR#8 claim that horizontal chain normalization deletes all repeated-height simplices was incorrect. For constant words, the section nerve is a poset of chains in the corresponding level, homotopy equivalent to that level. For mixed word 0^r1^s its section nerve consists of chains p0≤…≤p_(r−1), q0≤…≤q_(s−1), g(p_(r−1))≤q0. Evaluation to (p_(r−1),q0) retracts it homotopically to E_g: compare the chain with the intermediate chain whose left entries are all p_(r−1) and right entries unchanged; both the original and constant evaluated chain map to that intermediate chain by coordinatewise inequalities. Face maps respect these identifications on homology. See SECTION_GEOMETRY_SUPPLEMENT.md T20 for the complete check.

Therefore the RAW E1 page includes the constant and mixed word summands in every horizontal degree; AFTER vertical homology its horizontal normalization has only columns 0 and 1, H_*(NP^▹)⊕H_*(NQ) and H_*(NE_g), with endpoint differential. E2 has no p≥2 terms, so E2=E∞. No two-column equivalence of the full horizontally normalized double-chain complex is asserted.

**Strong deformation retract for mixed arrows.** Define r:E_g→P by r(p,q)=p, and j:P→E_g by j(p)=(p,g(p)). Then rj=id_P and there is a natural transformation jr⇒id_E from (p,g(p))≤(p,q). It induces simplicial homotopy |NjNr|≃id_|NE| and hence NE_g≃NP. Also t∘j=g, so t is homotopic to g∘r; s factors through inclusion NP⊂N(P^▹), which is nullhomotopic as the bottom poset has terminal *. For a separate total-space proof, omit * to obtain D=P⊔Q with the crossing order. The order map r:D→Q is g on P and identity on Q; id_D≤inclusion∘r gives a homotopy equivalence fixing Q. No chain in C_g contains both * and a Q vertex. Thus |NC_g| is literally |ND|∪_(|NP|)cone(|NP|), and the simplicial cofibration plus the relative-to-Q retraction identifies this mapping cone with Cof(|Ng|). VHT Theorem1.1 and integral Eilenberg–Zilber compute the same total-space homology. The horizontal abutment filtration is checked independently: F0 consists of vertical level chains, and the comparison maps it to the actual level inclusions. This identifies its positive-degree subgroup with im H_*(Q)→H_*(Cof g), while E2 concentration gives F1=H_*. No unproved filtered-chain identification is used.

**Boundary cases.** If P empty, E empty and the cone convention changes; excluded deliberately. If Q empty, no nonempty monotone map P→Q exists. For connected nonempty P,Q the H0 horizontal matrix is (1,-1), no unannounced reduced/augmented chain terms. For arbitrary disconnected P,Q the exact E1 statement remains valid; no claim of a single H0 generator. Section spaces also include horizontally degenerate sequences (0,0), (1,1), etc., handled by homology equivalences before E1 normalization, not asserted literally degenerate or empty.

This is a concrete **category-of-arrows / Grothendieck homotopy-cofiber realization** with classical simplicial-homotopy proof tools. Originality risk HIGH.

## S008-T21: two *actual* two-height section spectral sequences have equal E1, E2=E∞ but unequal integral abutments (PROGRAMME_PROVED, existential finite geometric instances)

Start with S007-T18. Let T be a standard finite triangulation of RP², and form the finite simplicial complex K=T∨ΣT based at a vertex of T identified with a suspension cone vertex. Thus |K|≃RP²∨ΣRP², reduced cellular chain groups have H̃1(K)=Z/2 and H̃2(K)=Z/2, no other positive homology. Let q:RP²→RP²/RP¹≅S² be the standard cellular quotient of the one-skeleton RP¹ and i:S²=ΣRP¹↪ΣRP² the two-dimensional cellular inclusion. On first wedge summand set f1=i q landing in ΣRP²; on second wedge summand collapse to basepoint. Let f0 be the constant based map. Both f_* on reduced H1,H2 are zero, but the oriented Moore cellular chain representation of f1 in degrees 2,1 is u_A↦v_B,t_A↦0; f0=0. (See S007 MATHEMATICS for complete cell degrees/boundaries.)

**Finite simplicial poset maps exist, without inventing a numerical subdivision bound.** By simplicial approximation, for some finite common barycentric subdivision sd^k K, there are simplicial maps γ0 (constant) and γ1:sd^k K→K whose geometric realizations are respectively homotopic to f0,f1 after canonical subdivision homeomorphism. Choose a sufficiently large common k and such a γ1; no explicit minimal k, list of simplices or executable algorithm certificate is claimed. Take P=face-poset(sd^k K), Q=face-poset(K), and g_i:P→Q induced by γ_i on nonempty faces (sending a face to its image simplex). Barycentric nerve realizations |NP|,|NQ| are homeomorphic to |K| (with subdivisions), and |Ng_i| represent f_i up to homotopy. Hence T20 gives **finite genuine simplicial height functions** h_i:N C_{g_i}→N[1], with exact section spaces E_{g_i}, P^▹, Q computed as above. Not a literal list of all finite vertices/maps; the existence proof is constructive up to an unenumerated simplicial approximation, a limitation for reproducibility.

For all q>0, H_q(S_h[0])=0, H_q(S_h[1])=H_q(K), H_q(S_h[0,1])=H_q(K), and horizontal d1=(0,-g_i*)=0 because f0*=f1*=0. In q=0 the terms are Z→Z⊕Z, 1↦(1,-1), identically for i=0,1. Thus THE ENTIRE integral E1 double-graded homology/horizontal differential is isomorphic for both h, so E2 and all higher E_r, all d_r, and E∞ are isomorphic; in fact E2=E∞ for each.

Explicit E∞ in total degree 2: E∞_{0,2}=coker(H2(P)→H2(Q))=Z/2 and E∞_{1,1}=ker(H1(P)→H1(Q))=Z/2. The extension short exact 0→Z/2→H2(NC_g;Z)→Z/2→0 need not split. T20 and S007 cellular mapping-cone relations yield:
- H̃2(N C_{g0};Z)=Z/2⊕Z/2;
- H̃2(N C_{g1};Z)=Z/4.

S007 chain audit repeated: for cofiber degree-2 cycles x=(v_B,0),y=(0,t_A), f0 relations 2x=0,2y=0; f1 relations 2x=0,x−2y=0. Hence Z/4 is real, no spectral-page ambiguity. This **closes S007's missing geometric realization** at the existence and exact section-category level. It is an actual theorem about a family of finite simplicial height maps, not a generic cofiber analogy.

**Scope and novelty.** The exhibited two-height example proves a substantive *non-determination by E∞* as a claim in the PROGRAMME; however, it is a direct manifestation of the classical nonsplit integral extension problem plus the already-published VHT nerve/section framework. It is not a new spectral sequence or collapse theorem, and NOT source-verified as an original HHA-ready mathematical result. The original PR#8 proof did not supply vertexwise γ1. SECTION_GEOMETRY_SUPPLEMENT.md T21 now supplies a literal facet list, stellar subdivision and finite vertex map, with symbolic checks; no computation or minimal-subdivision claim. Do not confuse the existence proof with an enumerated data set.

## Stronger sanity: other degrees

With connected K, q=0 horizontal Z→Z² injects and has cokernel Z. q=1: horizontal d1 zero gives E∞_{0,1}=Z/2; q=2 gives E∞_{0,2}=Z/2 and E∞_{1,2}=Z/2. Thus H0(NC)=Z, H1(NC)=Z/2, H3(NC)=Z/2, higher zero in both examples, only H2 group structure differs. Compare cellular cone LES to verify all boundary terms, not just order of H2.

## C03 restraint

Existing S006 T16/T17 concern strict dimension-three THREE-cover bifiltrations with pure-degree intersections; current height examples are simplicial-poset nerves, not automatically admissible C03 three-covers. Do NOT relabel or reuse as a C03 completion.

## Reconciled current status

PR#8 established the existence-level T21. The independently invoked S008 supplement corrects its chain-level normalization shortcut without retracting the actual section-space/cofiber statement or final homological result, and supplies a fully explicit finite simplicial pair and the natural integral filtration. See SECTION_GEOMETRY_SUPPLEMENT and SUPPLEMENT_ADVERSARIAL. T22–T24 are in that supplement and the two route dossiers; no S009 mathematics was executed.
