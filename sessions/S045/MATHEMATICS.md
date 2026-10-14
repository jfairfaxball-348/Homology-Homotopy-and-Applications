# S045 MATHEMATICS — whole-shoelace CW replacement and local coherence

## Unchanged decisive question

X0=S^160 --f0=2--> X1=S^160 --f1=theta4--> X2=S^130 --f2=theta4--> X3=S^100 --f3=2--> X4=S^100. Whole-real F has Xi on [i,i+1), point from 5, empty before 0. G is point from 0 and empty before 0. S043 T100/T101 INTERNALLY established dIHC(F,G)=1; S044 T102 uses published IWX Adams filtration to conclude zero is excluded from the classical fourfold bracket UNDER source conventions. S041 relative HEP gives dHI<=3/2. Exact dHI=1 versus 3/2 OPEN, not a verified HHA-original gap.

Let F',G' be ARBITRARY weak-equivalence replacements in the strict HI definition, with F' stage objects X_t and G' stage objects U_t (for t>=0 weakly contractible). For integer i write f_i:X_i→X_(i+1), u_i:U_i→U_(i+1), a_i:X_i→U_(i+1), b_i:U_i→X_(i+1). Strict 1-interleaving imposes simultaneously
(N-a) a_(i+1)f_i = u_(i+1)a_i;
(N-b) b_(i+1)u_i = f_(i+1)b_i;
(I-F) b_(i+1)a_i = f_(i+1)f_i;
(I-G) a_(i+1)b_i = u_(i+1)u_i.
All real versions hold for any t<=s and the two identities at every t, not only integers. None may be omitted.

## T104 — full strict shoelace *CW* replacement (INTERNAL, standard model-category consequence)

**Statement.** Let P_epsilon be the shoelace category of TWO ordered copies of R, with same-lane morphisms s<=t and cross-lane morphisms (F,s)→(G,t), (G,s)→(F,t) iff t>=s+epsilon. Suppose D:P_epsilon→Top is a strict interleaving diagram in compactly generated weak Hausdorff spaces and every object D(G,t) for t>=0 is nonempty weakly contractible. Then there is another strict shoelace diagram D_CW and a NATURAL objectwise weak-homotopy-equivalence zigzag D_CW→D such that every D_CW(p) is the realisation of a simplicial set and hence CW, and every D_CW(G,t), t>=0, is actually contractible. Every strict diagram identity and every real cut is preserved. This does not mean D_CW(G,t) is literally one point or that there is a chosen natural contraction.

**Proof.** P_epsilon is a small category relative to a chosen universe (its objects form a set); the strict natural transformations and both shifted identities are precisely a functor on P_epsilon, since all parallel composites agree as arrows of its poset. Apply Sing objectwise to D, obtaining a diagram Sing(D)∈sSet^P. The projective model structure exists for diagrams over any small category in simplicial sets, with objectwise weak equivalences and fibrations. Take a projectively cofibrant replacement q:Q Sing(D)→Sing(D). Geometric realisation is functorial, so |Q Sing(D)| is STILL one strict P-diagram, not a separately modified G-lane. The composite |Q Sing(D)|→|Sing(D)|→D is natural, objectwise a weak homotopy equivalence (realisation of simplicial weak equivalence; natural Sing–realisation counit). Geometric realisations of simplicial sets are CW complexes; each G-stage is weakly contractible by two-out-of-three and therefore contractible by Whitehead (nonempty CW complex). Entire real indexed source/target zigzags inherit the weak equivalences. All equalities are categorical equalities of a P-diagram and therefore persist strictly. QED.

**Hostile boundary:** Q need not make a diagram-wide contraction of the U-subchain strict or preserve a preselected endpoint homotopy: projective cofibrancy of the FULL shoelace does not identify its restriction with a contractible object by a strict natural contraction. A diagram of contractible CW spaces is objectwise equivalent to points, not equal as a diagram preserving mixed maps. Hence T104 removes the CW replacement worry but DOES NOT furnish the tertiary Toda filler or prove dHI>=3/2. The result is standard model-category technology, not an original HHA theorem.

## T105 — exact staircase basepoint lemma (INTERNAL elementary proof)

**Statement.** For a finite strict ladder satisfying T103, choose any x0∈X0 and recursively x_(i+1)=f_i(x_i). Put z_(i+1)=a_i(x_i)∈U_(i+1). Then, wherever defined,
u_(i+1)(z_(i+1))=z_(i+2) and b_(i+1)(z_(i+1))=x_(i+2).
Thus ALL relevant maps f0..f3, a0..a2, b1..b3, u1..u2 of the four-arrow ladder are simultaneously strictly pointed with these choices, including the entire common U2 basepoint. No arbitrary unpointed path transport is required for these local generators.

**Proof.** By (N-a), u_(i+1)a_i(x_i)=a_(i+1)f_i(x_i)=a_(i+1)(x_(i+1))=z_(i+2). By (I-F), b_(i+1)a_i(x_i)=f_(i+1)f_i(x_i)=x_(i+2). By definition f_i(x_i)=x_(i+1) and a_i(x_i)=z_(i+1). Every listed map preserves its selected endpoints. The other two equations (N-b,I-G) remain valid as *pointed* equalities on their overlapping named nodes because they were strict equations before choosing basepoints. This does NOT select a point for the unused initial U0, nor a global pointed natural zigzag between any arbitrary F' and the original sphere diagram. For local Toda analysis X_i are simply connected CW-type, so LS2023 Lemma3.8 supplies basepoint-independence after weak equivalences. QED.

## T106 — all length-three local Toda obstructions vanish (SOURCE-DEPENDENT consequence of LS2023)

Fix three consecutive f_i,f_(i+1),f_(i+2). The strict identities produce the commuting span/square
f_(i+1)f_i = b_(i+1)a_i through U_(i+1),
f_(i+2)f_(i+1) = b_(i+2)a_(i+1) through U_(i+2),
u_(i+1)a_i=a_(i+1)f_i,
b_(i+2)u_(i+1)=f_(i+2)b_(i+1).
By T104 and T105 the U objects may be genuinely contractible CW with strict pointed arrows on this local finite diagram. The CONVERSE construction in Lanari–Scoccola2023 Proposition3.10 (its displayed A→B diagonal and cone maps alpha,beta) therefore applies to this four-X-object restriction and proves that the *ordinary threefold* Toda bracket contains zero. This uses the original published three-arrow proof, NOT a new independent cone theorem and NOT a fourfold extension.

For the target five-sphere chain, the two overlapping triple brackets already vanish for independent pi61^S reasons; this calculation neither forces the secondary zero choices to match along every common face nor supplies a single TERTIARY filler. The same chosen z2 is a pointed common middle U2 node, but one shared basepoint is not a coherent three-dimensional homotopy.

## T107 — complete, genuinely nonpoint, all-real strict control example

This is a COUNTER-CONTROL to the false assertion that the four strict equations are mutually inconsistent when G' is nonpoint. It is NOT an interleaving for the Wang–Xu four-essential-arrow chain and does not refute its bracket.

Fix n>=2, a based sphere (S^n,p), interval I=[0,1]. Define F' to be empty t<0, S^n in each [i,i+1) for i=0,1,2,3,4, point t>=5. Within cells identity, across integer boundaries f0=id, f1=constant p, f2=id, f3=constant p and f4:S^n→* (plus terminal identities), using composites for nonadjacent t<=s. Define G' empty t<0 and I t>=0. Its structure map on a nonnegative time pair t<=s is identity when floor(t)=floor(s) and CONSTANT ZERO when floors differ. This is a functor since any composite that crosses a cell boundary remains constant zero. The natural G'→G is objectwise WE, so I is a legitimate nonpoint replacement of the point filtration.

Define a_t for t in [0,1) by any fixed NONCONSTANT continuous based a0:S^n→I (a0(p)=0, e.g. rescaled height); set a_t constantly 0 at every later nonnegative cell, with singleton tail also sent to 0. Define b_t for t in [0,1) by any fixed NONCONSTANT based path b0:I→S^n (b0(0)=p); set b_t constantly to p in cells i>=1 with sphere codomain, and to the unique point when codomain is terminal. Empty sources at t<0 have unique maps. These maps are constant within each cell.

Checks at EVERY real t<=s: within cells both naturality squares commute by identities; crossing at least one cell boundary makes the G' comparison maps constant zero. (N-a): when crossing f0=id, a1 f0=0=u1 a0; all subsequent a maps zero. (N-b): crossing from the first cell f1 b0 is p since f1=constant; later all b maps p and all f preserve p; these equal b_(j)u for every later crossing. (I-F): each two-cell F map is constant p or terminal: f1f0, f2f1, f3f2 and all later length-two maps; b_(t+1)a_t is exactly that constant. (I-G): any two-cell U structure map is 0, and a_(t+1)b_t=0 since t+1 lies in a later cell. For t<0 equations have empty source; for t>=5 tail terminal checks hold. Thus the full REAL epsilon1 interleaving equations hold including both strict identities. Notice a0 and b0 do NOT factor through one point as point-set maps, so naively replacing U by points does not preserve THESE original transformations. Nonetheless this control F has all length-two composites literally constant, hence it carries NO nonzero fourfold Toda obstruction.

## Core failed route and exact outstanding extension

One can now require: start with a whole-shoelace CW diagram from T104; select common staircase basepoints from T105; use the local threefold cone diagrams from T106 with contractible U1,U2,U3 and their arrows. The STILL-MISSING step is a *single* relative tertiary extension over the 3-dimensional gluing boundary: the two local secondary cone fillings must be chosen so that all overlap/corner restrictions match, INCLUDING the face forced by I-G (a_(i+1)b_i=u_(i+1)u_i), not merely N-a,N-b,I-F. No proof that the entire boundary is the image of a map into ONE contractible U space; no proof it is null in the requisite mapping space; no explicit full-real nonpoint strict HI1 model for the original five-sphere chain. Do not quote BJT2019 fourfold strict-zero-composite criterion as if it *proved* this missing all-replacements bridge.

**Result:** T104 and T105 are genuine internally reasoned reductions; T106 uses original LS2023 threefold construction; T107 is an exact symbolic all-real control. They do NOT settle the exclusive binary target. dIHC=1 (S043 INTERNAL), dHI∈{1,3/2} OPEN. Stage1/G2 still closed. T66 original 1981 not inspected, R5 16471 open, Hopf flagship retired and T84 retained. No Lean/Palomar/manuscript/arXiv/HHA/external contact.
