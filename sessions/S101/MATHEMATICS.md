# S101 MATHEMATICS — balanced non-graph fold, genuine triple and complete-space models, UNSOLVED COMPATIBILITY

**Status:** INTERNAL rigorous elementary assertions T247–T249 plus one fixed arithmetic test T250. These are **NOT** a 3D admissible three-cover construction; HHA first theorem remains OPEN.

## Fixed data, all maps, quantifiers

Use P={00<10<11,00<01<11} and S006's strict labelled three-cover definitions. At ALL grades A_p=Z and ALL A arrows are identity. B00=0, B10=Z<r>, B01=Z<s>, B11=Z<e,f>. The two upper B arrows send r↦e and s↦e. All maps out of B00 are zero. Transgression M00:0→Z is zero, M10(r)=M01(s)=1 and M11(e)=1, M11(f)=0; naturality is 1=1 along each upper arrow. Here M is *genuinely nonzero at both sides and top*. We are not imposing any mixed-label membership equality beyond S006.

## T247 — all S100 integral *complete-space* necessary conditions pass, while B fails graph-admissibility (PROVED)

K=ker M has K00=K10=K01=0 and K11=Z<f>; C=coker M has C00=Z and C10=C01=C11=0. The A bottom latching delta_A:Z→Z² maps 1↦(1,−1), hence split injects (primitive vector, Smith diagonal 1). delta_K:0→0 is split, D_K=0, lambda_K:0→Z<f> is injective, and coker(lambda_K)=Z. Meanwhile E=ker(delta_C:Z→0)=Z. The S006 torsion comparison is 0≅0 and the **full** S100 T242 exact sequence reads 0→Z→Z→0→0, including its free-rank *equality* rank(K11)=0+rank(E)=1.

However D_B=B10⊕B01≅Z² and lambda_B:D_B→B11 sends (a,b)↦(a+b,0). Its rank is 1, kernel Z<(1,−1)>; in particular B is NOT graph-admissible (failure is injectivity, not simply an index-two torsion defect). The B bottom arrows are trivially split because B00=0. The datum is an explicit consistent test that simultaneously escapes the S005 graph-class sufficiency theorem and S100's **enumerated** necessary obstructions. This does NOT establish a new geometric invariant nor imply a cover exists.

## T248 — actual strict finite triple-intersection T-square, minimum top dimension TWO (PROVED)

Take T00 a point, T10 and T01 two based circles which intersect in precisely that point. Let V=T10∨T01 and h:V→S¹ have degree +1 on each circle. Form the finite mapping cylinder M_h, with the two input circles as literal subcomplexes, and wedge at a target vertex a further new circle F. Define T11=M_h∨F. Then every T_p is a finite connected CW complex of dimension≤2 and has reduced homology exclusively in degree 1, precisely B_p. Indeed M_h deformation retracts to its target circle, so H1(T11)=Z<e>⊕Z<f>, H2(T11)=0; both input-circle inclusion classes map to e. All named triple meets satisfy T10∩T01=T00, with cellular interiors disjoint on the two inputs.

Top dimension 1 is impossible for ANY literal graph T11 with this exact square: the oriented edge chains of two embedded distinct side circles meeting in only a vertex have disjoint supports in C1(T11); with C2=0 they represent independent elements of H1(T11) (boundaries cannot identify them). Their demanded equal image e≠0 contradicts independence. Thus minimum dimension for **the triple square alone** is exactly 2. This is NOT a minimum dimension assertion for the complete three-cover.

## T249 — actual meet-exact finite 3D TOTAL-space square with precisely K and C (PROVED, but NOT cover-labelled)

Let X00=S², X10=D³_+, X01=D³_−, both closed three-disks with common boundary S² and disjoint interiors, and X11=D³_+∪_{S²}D³_−≅S³. The X squares are literal CW subcomplex inclusions after compatible triangulation, X10∩X01=X00; all total dimensions ≤3. Reduced integral H2 is Z at 00 and zero elsewhere, while reduced H3 is Z at 11 and zero elsewhere, so total H2 and H3 diagrams match respectively C and K computed in T247. The Mayer–Vietoris connecting H3(X10∪_{X00}X01)→H2(X00) is an isomorphism Z→Z, exactly the balanced E-to-K11 rank required by T242. Inclusion F=X10∪X01→X11 is identity, hence primitive on H3.

This is a **compatibility sanity check of the complete spaces only**, not a single valid three-cover realizing the specified A,B,M. The T diagram from T248 lives independently; no U1,U2,U3 decomposition on this X, no literal pair-overlap complex and no Čech d2 have been constructed. No assertion is made that the two independent geometric models can be superposed.

## T250 — fixed bounded Smith/naturality test (COMPUTED_EXACT, not proof of existence)

Exactly one integer square, not a bound-complete search over arbitrary matrices: `scripts/s101_balanced_fold_check.py`, expected captured stdout `validation/s101_balanced_fold_stdout.txt`. Locally executed Python 3 + SymPy, two assertions of naturality, rank/SNF of delta_A and lambda_B, and sharp E/K rank. Script SHA256 `337260139d32659936a39dd85f8e4d6c16ab5880d7ebf0c3a6cfbe61cb797417`; stdout SHA256 `ea1de902d6dffaf8160b7c3dc6feae17ab49403f4c660fbb82b24db5645dc4ec`. Container execution used the local authored script, not a freshly pulled Git checkout. Independent simple matrix check: delta_A=(1,−1), lambda_B=[[1,1],[0,0]], M11=[1,0], K11=ker[1,0]=Z f, E=Z. This verifies the asserted arithmetic only.

## Scientific verdict and exact open issue

Both pieces of **geometry** exist: an actual minimal 2D non-graph triple filtration and an actual 3D total-space filtration satisfying every full MV H2/H3/rank datum. It is **UNKNOWN** whether there are *simultaneously* finite strict meet-exact U1,U2,U3 of dimension≤3, contractible U2,U3 and each pair overlap, pure H2(U1)=A, pure H1(T)=B, with d2=M and actual X exactly as required up to the given diagrams. A direct substitution of T11 (dimension2) into the S005 double-cone + suspension + final cone construction has dimension at least 4, and is no 3D solution. Conversely that construction's dimension cost is not a general 3D impossibility proof. No cover-level higher-coherence invariant, full B-non-graph realisation, new nonclock persistence theorem or HHA G2 application was proved. Stop pretending standard MV arithmetic is an originality breakthrough.