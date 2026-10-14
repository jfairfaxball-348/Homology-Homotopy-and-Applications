# S041 — relative insertion lemma and five-stage epsilon 3/2 frontier

**Status:** INTERNAL mathematical proof T95–T97, conditional on S039-T87's still-unrefereed relative quotient-cylinder rectification. NOT independently formally certified, NOT a source-cleared original theorem, NOT a universal (d_{HI}=d_{IHC}) assertion. Primary epsilon=1 case remains OPEN.

## Exact setting
Let (A\xrightarrow{f}B\xrightarrow{g}C\xrightarrow{h}D\xrightarrow{k}E) be a chain of nonempty path-connected simply connected finite CW complexes with continuous maps (unpointed, compatible choices of basepoints permitted). Let F be empty for real t<0, equal to A,B,C,D,E on [0,1),[1,2),[2,3),[3,4),[4,5), respectively, and point on [5,∞). G is empty for t<0 and point otherwise. HI, IHC, HC retain the exact S039 definitions; HI permits arbitrary objectwise weak-equivalence zigzags of whole real diagrams.

Define the length-three shifted derived square
[
\Theta_3:(A\xrightarrow{f}B)\longrightarrow(D\xrightarrow{k}E),\qquad
\Theta_3=(hgf,khg).
]
Its zero condition is a path in the **derived arrow mapping space**, not merely null of two underlying vertex maps. At ε=3/2 an IHC interleaving necessarily makes this square zero in Ho(Top^[1]), since η_F^3 factors through a point in Ho(Top^R).

## T95 — intermediate-factor insertion under a homotopy-compatible compressed rectification
**Statement.** Suppose a four-node compressed chain (A\xrightarrow f B\xrightarrow p D\xrightarrow k E) with (p=hg) can be replaced, by a full-diagram zigzag of objectwise weak equivalences, by a chain (A'\to B'\xrightarrow{p'}D'\to E') whose two adjacent composites (p'f') and (k'p') are *strictly constant*. Assume the compressed rectification can be chosen with B' unchanged after factoring f as a cofibration, and with (p') homotopy compatible with the original p under equivalences of B,D. This is exactly the relative form of S039-T87's construction, not a statement about arbitrary abstract unlabelled replacement chains. Then there is a weak-equivalent **five-node** chain (A'\to B'\xrightarrow{g'}C'\xrightarrow{h'}D'\xrightarrow{k'}E') preserving the homotopy type of intermediate C and with (h'g'f') and (k'h'g') literally constant.

**Detailed argument.** First replace f by an inclusion into its mapping cylinder and propagate the objectwise equivalence through all five stages; call the new objects A,B. Next replace g by the inclusion (j:B\hookrightarrow M_g=C_c) of its mapping cylinder and replace h by (h r_g:C_c\to D), where (r_g:C_c\to C) is the deformation retraction. Thus (j) is a closed Hurewicz cofibration, the full five-chain remains objectwise equivalent to the original, and p is literally (h_cj).

Apply the relative S039-T87 proof to the compressed four-chain (A\to B\xrightarrow{h_cj}D\to E). Since f was already made a cofibration, B need not change in that proof. It constructs a D' weakly homotopy equivalent to D (indeed via mapping-cylinder retractions in the cited proof), E' weakly equivalent to E, and (p':B\to D'), (k':D'\to E') with (p'f) and (k'p') strictly constant. Crucially the proof's edge deformations and mapping-cylinder comparison give a homotopy (p'\simeq s h_c j), where (s:D\to D') is a homotopy inverse to a deformation retraction (r:D'\to D); the claim is not that arbitrary zigzags supply such a strict s.

The cofibration (j:B\hookrightarrow C_c) has homotopy extension property. Extend the homotopy (s h_c j\simeq p') along j to a homotopy starting at (s h_c:C_c\to D'). Its endpoint (h':C_c\to D') satisfies **exactly** (h'j=p'). Hence (h'jf=p'f) is literally constant and (k'h'j=k'p') is literally constant. Also (rh'\simeq h_c), so the insertion is homotopy-compatible with the original (C\to D). The usual whole-chain path-space span for homotopic arrows (S039-T87) combines these homotopies and cylinder retractions into objectwise weak-equivalence zigzags of **entire five-stage diagrams**, extending with empty and terminal-point strata. The intermediate C_c has the homotopy type of the original finite CW C; no claim that every path-space intermediary is itself finite CW.

This proves the lemma in the precise relative construction used below. An unjustified stronger claim that *any* arbitrary unrelated four-chain replacement lifts through *every* intermediate factor C is NOT made.

## T96 — full strictification at epsilon=3/2, assuming S039-T87
**Theorem.** If the actual ε=3/2 IHC interleaving of (F,G) exists, then F admits an objectwise weak-equivalent five-stage real diagram F' with both (h'g'f') and (k'h'g') *literally constant*. Consequently a strict ε=3/2 HI interleaving exists. In particular **no dHI>dIHC phenomenon whose IHC threshold is 3/2 can arise in this five-stage point-target class**, conditional on T87.

**Proof.** The first IHC interleaving identity ψ^εφ=η_F^{2ε} factors the full 3-shift through G and therefore sends the restricted derived arrow Θ_3 to the point component in Ho(Top^[1]). Now regard (p=hg:B\to D) as the middle map of the compressed four-chain (A\xrightarrow f B\xrightarrow p D\xrightarrow k E). Its shifted derived arrow is **exactly** Θ_3: components pf=hgf and kp=khg, including the actual strict naturality square. Apply S039-T87 to obtain p'f and k'p' strictly constant in a weak-equivalent compressed chain. Apply T95 to reinsert C preserving its homotopy type, giving literal vanishing of both threefold composites in the full five-chain.

To obtain both strict interleaving identities for *every real t*, choose a point of A' and propagate along f',g',h',k' through stages, using the unique terminal point thereafter. Define φ:F'\to G^{3/2} to be the unique map to the point wherever a source exists and ψ:G\to F'^{3/2} to be the propagated compatible points. Both are strict natural transformations on the real poset. The first identity holds since each nonterminal length-three structure map (t∈[0,1) or t∈[1,2)) is exactly h'g'f' or k'h'g', while all later 3-shift targets are point; the second identity is automatic for G. At negative t sources are empty, and all half-open cut endpoints are assigned to the next interval as specified. Full diagram zigzags above make this a HI interleaving for F. QED (internally, dependent on T87).

**Additional independently checked cases:** If g or h is null, making that arrow constant kills both triple composites immediately. If f is null, make f constant and use the null class of khg plus iterated mapping cylinders B↪C↪D and HEP to kill khg without changing f; if k is null, dually factor A↪B↪C and use null hgf. The derived-arrow hypothesis is stronger than the vertex null needed in these cases. These four cases verify the endpoint argument independently of the compression lemma in elementary null-arrow regimes, but not its all-essential core.

## T97 — sharpened five-stage strictness frontier (relative to T87)
For 0<=ε<1/2, IHC implies all nonterminal stages contractible and strict zero-distance after replacement. For 1/2<=ε<1, it implies all four primitive arrows are null (strictify them individually). For 1<=ε<3/2, restricting the 2-shift at integer t=0,1,2 yields S040's derived [2] morphism Θ_2 zero as a *necessary* condition; T92 handles any null primitive. For 3/2<=ε<2, restriction to integer t=0,1 yields Θ_3 zero, and **T96 constructs a strict 3/2 interleaving**. For 2<=ε<5/2 the only surviving nonterminal 2ε-shift is khgf:A→E, null by IHC, and S040-T93 gives a strict 2 interleaving by composite-cofibration HEP. At ε=5/2 strict interleaving is unconditional.

Monotonicity of interleavings and the same integer-time stage restriction over each half-open threshold interval imply: whenever dIHC>=3/2, dHI=dIHC within this family (discrete attained thresholds). If dIHC<1, the same equality holds. The **only unresolved possible positive five-stage point-target gap** is
[
d_{IHC}(F,G)=1,qquad d_{HI}(F,G)=3/2,
]
necessarily with four essential primitive arrow classes and coherent Θ_2=0. Here an IHC 1-interleaving already implies a 3/2-IHC one by shift monotonicity; T96 gives dHI<=3/2. If strict 1-interleaving exists, equality instead. This is an exact *reduction of possible numerical cases*, NOT a witness or universal equality. No assertion that Θ_2 zero on the short subdiagram alone is sufficient for full-real IHC 1, nor that all-essential is sufficient for gap.

**S040 T94 control** W=S³∨S³, n=i1p2, n² literal point remains an all-four-essential no-gap example. No finite all-essential candidate with replacement-invariant strict 1 obstruction was found; no proof every Θ_2-zero chain strictifies.

## The genuinely remaining epsilon=1 obstruction
After rectifying first two pairs via T87, the third pair kh must be made constant **without breaking** gf=hg=constant. The obstruction is a *relative extension* problem: the homotopy class of k h with nullhomotopies compatible with the quotient-cylinder over the earlier g,f, not [kh] in HoTop alone. A naive application of HEP along h is invalid because h cannot usually be made a cofibration while hg is literally constant and g has nontrivial image: cofibrations are injective while hg collapses gB. One needs the homotopy fibre of simultaneous strict square-zero chain realizations over the derived-[2]-null component, or a source-theory DKS relative class, and must compute it on concrete finite CW objects. The relevant 2-track compatibility is essential; no cohomology class or nonzero fourfold Toda bracket has been independently computed here.

Stage1; no original HHA theorem certified, no gate progression. Frozen T66/1981, R5 16,471, Hopf retired.
