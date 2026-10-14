# S044 MATHEMATICS — T102 source-dependent Toda zero exclusion, T103 HI ladder

## Unchanged example and inherited proof
Sphere chain: X0=S^160 --f0=2--> X1=S^160 --f1=theta4--> X2=S^130 --f2=theta4--> X3=S^100 --f3=2--> X4=S^100. F(t) is X_i for i<=t<i+1, point t>=5, empty t<0; G(t) point t>=0, empty t<0. All primitive arrows essential and pair composites null in Ho(Top), theta4^2=0 and 2theta4=0.

S043 T100 established internally eta²=(f1 f0, f2 f1, f3 f2) is zero IN Ho(Top^[2]) by mapping-cylinder cofibrant QX, iterated pullbacks of cofibration-induced restriction fibrations and successive endpoint-relative loop fillings using pi_1 Map(S^160,S^100;0)=pi_161(S^100)=pi61^S=0. The common middle path remains compatible throughout the second lift. It did NOT invoke the false assertion Eq(P,Q)=homotopy Eq(P,Q) merely because one leg is a fibration. S043 T101 derived Lan_(N0→R) yields full eta_F² zero, followed by both homotopy-category interleaving identities and essential-arrow lower bound: dIHC(F,G)=1 INTERNAL. This does not strictify original consecutive composites.

## T102 — positive, SOURCE-DEPENDENT zero-exclusion proof
Original Wang–Xu2017 Cor1.10: theta5 is a nonzero stable 62-stem member of classical fourfold <2,theta4,theta4,2>. Isaksen–Wang–Xu2023, Table10 printed p228, row (62,32), identifies theta5 by h5² and records the bracket's full listed indeterminacy h5 n. Table4 printed p214 gives h5 stem31 Adams filtration1 and n stem31 filtration5.

Let F^r be decreasing Adams filtration of the 2-primary 62-stem. The source-stated NONZERO detection h5² has nonzero grade-2 image, i.e. theta5∈F² but theta5∉F³. Every element in the published indeterminacy h5 n is in F^6⊆F³. If theta5+delta=0 for some delta∈F^6, then theta5=-delta∈F³, contradiction. Therefore no bracket element theta5+delta is zero. On the interpretation of the full bracket/classical comparison in the cited 2017/2023 papers, 0∉<2,theta4,theta4,2>. At odd primes zero-exclusion follows from a nonzero 2-primary image. Stable realisation is legitimate since dimension 100 supports the target stable 62-stem: 162<=2*100-2=198.

**Precise limitation:** this is a filtered-group deduction dependent on externally published Adams computations and on the table describing the *full* relevant classical/2-local indeterminacy. S044 did not independently prove the Adams differentials, convergence or full classical comparison; an exact original-text peer review of those conventions remains obligatory before claiming fully independent certification. Mere words 'strictly defined' or 'contains theta5' do not imply zero-exclusion without this step.

## T103 — necessary strict ε=1 interleaving relations for arbitrary WE replacements
For a hypothetical strict real HI1, restrict to integer stages of complete replacements X_i'=F'(i), U_i=G'(i), arrows f_i:X_i'→X_(i+1)', u_i:U_i→U_(i+1); transformations a_i:X_i'→U_(i+1) and b_i:U_i→X_(i+1)'.
All U_i are objectwise WE to point (**weakly** contractible, not assumed literal singleton). Strict naturality and the TWO shifted identities give, wherever indices exist:
(N-a) a_(i+1) f_i = u_(i+1) a_i,
(N-b) b_(i+1) u_i = f_(i+1) b_i,
(I-F) b_(i+1) a_i = f_(i+1) f_i,
(I-G) a_(i+1) b_i = u_(i+1) u_i.
These are necessary, not claimed sufficient for the full-real HI: all half-open boundaries, negative indices, noninteger times and whole-index zigzags remain to be checked for any proposed construction.

I-F factors each consecutive length-two map through U_(i+1), NOT through literal point. Since all U_i may be nonpoint and only weakly contractible, T102 cannot be applied to conclude any such pair composite is strictly zero. S042 T98 overclaimed this and S043 correctly downgraded it.

### Route A1: contractions in the U ladder — INCOMPLETE
If an objectwise projectively-cofibrant replacement of the *whole strict interleaving category* gave contractible CW U_i with contractions H_i, then b_(i+1) H_(i+1) a_i are pair-composite null tracks. Naturality can compare successive tracks through u_i and lead to SECONDARY fillers in U_(i+2). But the fourfold bracket demands a SINGLE tertiary relative homotopy with all corner and face identifications; existence of separate contractible fillers is insufficient absent an explicit proof that the *entire common boundary* factors compatibly into one contractible space. No full higher cube/relative lift was constructed. Replacing only the U-side stages by points destroys the displayed strict equalities and is not allowed.

### Route A2: cone construction — INCOMPLETE
Null eta_F² in Ho(diagrams) admits homotopy-level factorisation via contractible cone-like models. Producing strict a,b NATURAL over every real time with both b^1 a=eta_F'^2 and a^1 b=eta_G'^2 in a single pair of diagrams is a stronger relative simultaneous rectification problem. The cone attempt furnished no proof of the opposite strict identity, hence no valid strict HI1 countermodel.

### Route A3: fourfold strict-zero rectification — INAPPLICABLE without bridge
Original Blanc–Johnson–Turner2019 §7.A fourfold Toda theory obstructs making all three pair composites literally constant in an entire F' replacement. It does not directly forbid factorisation through contractible U_i with N-a,N-b,I-F,I-G. Original Lanari–Scoccola2023 Prop3.10 constructs the all-replacements bridge for a THREE-arrow Toda case, but a four-arrow higher coherent extension is not automatically its corollary. DKS1989 and HKM2002 are substantial priority/correctness antecedents, their entire original proofs not read.

## Exact outcome
Under inherited internal HEP and integer restriction results, dHI(F,G)≤3/2 and the only alternatives are:
(A) (dIHC,dHI)=(1,1), requiring construction of strict HI1 through some G' objectwise weakly contractible; or
(B) (dIHC,dHI)=(1,3/2), requiring a rigorous ALL-replacements proof that N-a,N-b,I-F,I-G force 0 in the fourfold bracket (or equivalent no-go).
**Neither (A) nor (B) is proved.** Fourfold Toda 0 exclusion is the only positive new sub-result. No original HHA-ready theorem, no novelty gate, no Lean/Palomar/manuscript/arxiv/HHA/contact. Frozen T66 all-composite Q/each Fp integral Z and original 1981 uninspected, R5 16471 OPEN, retired Hopf, T84 derivative preserved.
