# A quantitative homotopy-interleaving gap over the cyclic-four group algebra

**FROZEN WORKING PAPER, 27 October 2026**. Internal argument; no full C4 Lean certificate or publication claimed. Source proofs: S076/S077/S113/S114. This is an editable first manuscript, to be completed concurrently with formalisation.

## Abstract

We construct a five-stage real-indexed persistence diagram of chain complexes over the characteristic-two group algebra of the cyclic group of order four. Its graded ordinary homology has interleaving distance one half from zero, its derived-category interleaving distance is exactly one, but its homotopy interleaving distance is at least five quarters and at most five halves. The lower bound allows arbitrary objectwise quasi-isomorphism zigzags of both full real diagrams, including nonzero acyclic replacements of zero. The obstruction is a choice-independent nontrivial fourfold Toda–Massey operation detected by a low-degree residue. After forgetting the group algebra action, the corresponding field-valued distances agree. The construction comes with finite exact arithmetic checks, which we distinguish from proof of the unrestricted diagram theorem.

## 1. Statement and definitions

Let k=F₂, B=k[C₄]≅k[t]/(t⁴) with t=g+1 in homological degree zero. Work in unbounded homologically graded Ch(right B) with projective quasi-isomorphism model structure. Define P_n=B (n≥0), zero for n<0, d_n=t on odd n≥1 and t³ on even n≥2. For i=0,…,4 let X_i=P[i], with adjacent chain map given by underlying degree-minus-one coefficients x_n=1 for odd n and t² for even n. Define the strict whole-real diagram F(u)=X_i for i≤u<i+1, zero for u<0 and u≥5, identities within each stage and x-composites between stages; O=0.

d_IHC is derived interleaving in Ho(Ch(B)^ℝ), NOT Fun(ℝ,Ho Ch(B)). d_HI is strict interleaving after arbitrary whole-real objectwise quasi-isomorphism zigzags on BOTH lanes, with an arbitrary acyclic replacement of the zero lane allowed. d_CohI compares the underlying k-graded homology diagram.

**Main internal paper theorem.** d_CohI(F,O)=1/2, d_IHC(F,O)=1 and 5/4≤d_HI(F,O)≤5/2. In particular the three distances have strict separation. In the forgotten B→k comparison, the field-valued distances all equal 1/2 by the field-specific theorem described in S113; the exact attribution and hypotheses must appear in the final references. No Top^ℝ assertion or equality at the 5/4 endpoint is made.

## 2. Resolution and universal fourfold obstruction

The annihilator equations ann(t)=(t³) and ann(t³)=(t) make P a projective resolution of k. Define underlying degree-minus-one sequences x_n=1 odd/t² even, h_n=0 odd/t even and z_n=0 odd/1 even. For a degree-minus-one family f, (Df)_n=d_(n−1)f_n+f_(n−1)d_n. Parity yields Dx=0, Dh=x², Dz=xh+hx; w=xz+hh+zx has w₂≡1 mod(t). Every boundary has zero such residue.

For ANY four cocycle representatives of the nonzero Ext¹ generator, a₁≡1 mod(t), a₂≡t² mod(t³). Every primary filler H satisfies H₂≡t mod(t²), and every secondary K satisfies K₂≡1 mod(t). Consequently EVERY terminal defining-system cocycle is 1 mod(t), so the complete nonempty fourfold bracket excludes zero, rather than merely having a nonzero selected value. See S076 T198, S077 §1, S113 T309 and S114. Complete shifted-sign/definition exposition and Lean formalisation are ongoing.

## 3. Derived interleaving

For the whole integer-stage diagram X include the terminal map X₄→0, and the free-linear-quiver diagram presentation E→V→X built from representables L_iX_i and L_(i+1)X_i. Its projective cofibrant cone allows vertex homotopies h and edge homotopies z to kill the TWO-unit natural shift η₂ in Ho(Ch(B)^ℕ). Apply left Quillen Kan extension ℕ→ℝ with its natural shift comparison, yielding η₂^F=0 in the WHOLE REAL derived diagram and hence d_IHC≤1. For ε<1, evaluate η_(2ε)^F at time 0: it is identity or the nonzero class x, so d_IHC≥1. This argument must be expanded as actual chain-level cone/derived categorical formulas; objectwise nullhomotopy does not suffice.

## 4. Quantitative homotopy obstruction

If a strict homotopy interleaving at ε<5/4 exists after arbitrary whole-diagram quasi-isomorphisms of BOTH lanes, enlarge to e=max(1,ε), replace the entire REAL shoelace poset diagram projectively cofibrantly, and quotient each first-lane object by the included acyclic opposite-lane object. The result is naturally objectwise equivalent to F and has every length-2e composite literally zero. The zero lane MUST NOT be assumed strictly zero before this argument.

With α=2e−2∈[0,1/2), sample 0,1,2+α,3+α,4+2α. All samples remain in the five original stages. The induced finite four-arrow chain has three double composites zero. Transport of the complete fourfold defining system along the objectwise equivalences would put zero in the bracket, contradicting §2. Thus d_HI≥5/4; F→F⁵ is zero, yielding a strict 5/2 upper bound. The real-shoelace cofibration, acyclic quotient and universal homotopy-transfer lemma MUST be formalised explicitly or identified as unformalised dependencies. No numeric endpoint claim.

## 5. Graded homology and forgetting coefficients

Each homological degree n=0,…,4 has exactly one k-interval [n,n+1) and structure maps vanish outside its stage, so d_CohI=1/2. Over Ch(k) the recorded field-specific theorem gives d_CohI=d_IHC=d_HI=1/2. Do not apply this field result to Ch(B).

## 6. Reproducibility

Run Python3 sessions/S076/check_c4.py. Historical PASS: equations to degree 40, 16 valid adjacent jets, 8192 primary jets, 524288 secondary jets and residue invariance. Bounded jet enumeration does NOT prove the all-infinite-representative theorem or model-categorical metric result.

## Writing and formalisation items

Finish full proof of free-quiver/real Kan and shoelace acyclic quotient/transfer; certify corresponding exact theorem in Lean if feasible; integrate existing citations faithfully rather than launching source-review campaigns; write final introduction/discussion and definitions. No journal registration, external review or submission authorised.
