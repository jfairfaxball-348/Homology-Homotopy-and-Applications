# Frozen mathematical candidate: cyclic-four coefficient interleaving gap

**Owner-selected and frozen:** 27 October 2026. **Proof status:** detailed internal paper argument S076/S077/S113/S114; bounded exact Python jet checks; NO C4 Lean kernel certificate for the main metric theorem. No publication, acceptance or originality claim.

## Precise objects and theorem

Let k=F₂, B=k[C₄]≅k[t]/(t⁴), t=g+1 of homological degree zero, and use unbounded homological chain complexes of right B-modules with projective model structure and quasi-isomorphisms. Define P_n=B for n≥0, P_n=0 for n<0, d_n=t for positive odd n, d_n=t³ for positive even n. Put X_i=P[i], 0≤i≤4, with adjacent shifted chain maps defined by x_n=1 (odd n) and x_n=t² (even n). Define strict F:ℝ→Ch(right B) with F(u)=X_i for i≤u<i+1, zero outside [0,5), identity within each stage and x-composites between stages; O is constant zero.

In the precise S076/S113 metric definitions d_IHC lives in Ho(Ch(B)^ℝ), while d_HI is strict homotopy interleaving up to arbitrary zigzags of objectwise quasi-isomorphisms of BOTH ENTIRE ℝ diagrams, including arbitrary nonzero acyclic zero-lane replacements; d_CohI compares underlying k-graded homology diagrams. Frozen INTERNAL theorem:

    d_CohI(F,O)=1/2 < d_IHC(F,O)=1 < 5/4 ≤ d_HI(F,O) ≤ 5/2.

After forgetting B-action to Ch(k), all three corresponding field-valued distances equal 1/2, using the separately named field theorem in S113/S114. NOT ordinary Top^ℝ, NOT new fourfold product, NOT exact value or attainment of d_HI, NOT arbitrary ring generalisation.

## Comparative audit from the 137 sessions — proof completion criterion, NOT novelty

- Integral block/grid T28/T66/T69 (S010–S032): strong internal general algebra and independent Smith computations, but no Lean proof and no ready homotopical metric conclusion. Archive.
- Concrete Euclidean Hopf/Rips (S020–S028): corrected numerical Gram/cochain/finite complex certificates; remaining derived/coherent comparisons are not certified. Archive.
- Sphere Toda unpointed example (S035–S036): internal d_HC=1 and d_IHC=d_HI=3/2, no desired strict HI>IHC and no Lean. Archive.
- Modular cyclic-four gap (S076/S077/S113/S114): explicit infinite-choice obstruction, derived shift, arbitrary both-lane real shoelace lower bound and finite Python exact evidence; proof survived later internal reconstruction. Best precise nontrivial strict separation on paper. SELECT.
- Coherent CW example (S107): homotopy-category invisible phenomenon, but not a strict HI>IHC proof. Archive.
- Option D (S117–S137): rich TRUE pinned Lean certificates for D1/D2, real filtrations, actual cofiber quotient; desired universal arbitrary-Y/f/g and full-real R³ metrics remain unproved. Stop as first-paper target, preserve all files and Lean CI.

Selection answers strength of the EXISTING internal proof versus effort to finish, and deliberately makes NO novelty or journal fit appraisal. S115 archived retirement only concerned those now-removed tests.

## Mathematical proof map

1. Resolution: ann(t)=(t³), ann(t³)=(t), P resolves B/(t). Explicit parity formulas x,h,z satisfy Dx=0, Dh=x², Dz=xh+hx; terminal w=xz+hh+zx has w₂≡1 mod t, whereas boundaries have residue zero.
2. **Complete** fourfold obstruction: for every adjacent nonzero Ext¹ representative, a₁≡1 mod(t), a₂≡t² mod(t³); every primary H has H₂≡t mod(t²); every secondary K has K₂≡1 mod(t). Thus every legal terminal cocycle has residue 1, not just the chosen explicit one. See S076 T198, S077 §1, S113 T309, S114.
3. d_IHC=1: the whole integer free-linear-quiver E→V projective cone and coherent h/z fillers kill the TWO shift in Ho(Ch(B)^ℕ); left Quillen Kan extension to ℝ kills η₂ in the whole real diagram. Evaluation at zero rules out smaller shifts.
4. d_HI≥5/4: take an arbitrary strict real-shoelace representative after whole-diagram zigzags of BOTH lanes. Projectively-cofibrant total replacement and quotient by the acyclic opposite lane yield an equivalent F-lane with literal 2e-composites zero; sample 0,1,2+α,3+α,4+2α with α=2e−2<1/2. Complete fourfold homotopy transfer would force forbidden zero. **This projective-cofibration/quotient/transfer argument is the chief Lean engineering risk and must NOT be abbreviated or treated as already kernel proven.**
5. d_HI≤5/2: F→F⁵ is literally zero. d_CohI=1/2: each fixed homology degree is a one-unit interval.

## Exact computation evidence and limits

sessions/S076/check_c4.py and CHECK_OUTPUT.txt report PASS: explicit equations to degree 40; all 16 adjacent jets; 8192 compatible primary jets; 524288 compatible secondary jets; terminal invariant. Finite arithmetic does NOT certify all infinite-chain representatives nor any derived metric or arbitrary real shoelace model category. Rerun and record output in S138.

## Freeze and stop condition

No more target tournaments, new geometric universality, Hopf variations, exact endpoint research, novelty, HHA fit, prior-art search or external review. S138 begins algebra Lean and manuscript now. If a claimed theorem cannot be represented in the pinned mathlib setting, report smallest missing typed dependency and adjust implementation, NOT paper theorem secretly. Claim FORMALLY_CERTIFIED only when exact theorem and quantifiers compile. Preserve all historical results/contradictions in git history. Optional registry, arXiv and HHA release need new owner permission.
