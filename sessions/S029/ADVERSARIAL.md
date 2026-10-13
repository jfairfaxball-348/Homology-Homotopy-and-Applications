# S029 hostile checks and hypothesis sharpness

## A1. Removing composite purity really breaks the assertion

Take the one-axis chain 0<1<2 with groups Z, Z², Z and primitive *adjacent* maps
 A=(1,0)^T:Z→Z²,  B=(2,1):Z²→Z.
Their Smith nonzero factors are 1,1, but BA=(2), not primitive. For every field k this 1D diagram decomposes into interval modules (also at p=2, where the bottom→top rank drops from 1 to 0); over Q and every F_p it is B_1-decomposable. It has no integral interval decomposition, because every composite in an integral interval sum has only 0/1 Smith factors. Pull back along first-coordinate projection P_n→{0,1,2} for n=2,3, taking identities on all other axes. This gives an explicit all-field B_n-decomposable example whose primitive generating edges coexist with a nonprimitive composite. **It does not satisfy S029's actual hypothesis**, hence is a sharp negative control rather than a counterexample.

## A2. Removing a bad-prime field condition breaks the conclusion even when every composite is primitive

On the Boolean square let bottom=0, each side=Z and top=Z². Send the two side generators to e1=(1,0) and e1+2e2=(1,2); arrows from bottom are zero. Every comparable map has primitive cokernel (each column is a primitive vector, bottom maps have free cokernel). Over Q and F_p for p≠2, the square is the sum of two principal upsets. Over F_2 the two top images coincide, so middle Koszul H1=F_2 and it is **not** a block sum. Inflate this square along the coordinate clamp {0,1,2}→{0,1}, x↦min(x,1), and along extra independent full axes to obtain explicit two-/three-dimensional examples. Each primitive composite remains primitive; one missing residue field is fatal. This is NOT a counterexample to T65 because F2 fails.

## A3. Three failed routes repaired before T65

* S010 Boolean death-kernel formula ∩ker[b→b+e_j] cannot simply be transplanted to 3-level v: for a genuine D_v with v_j=1 it kills its own desired generator, so it fails even on a rank-one block.
* Kernels b→v+e_j do not control maps b→y with y_j>v_j but other coordinates smaller than v, so a natural D_v injection would be unjustified. Use axis-only a_j=(v_j+1)e_j instead (Lemma B).
* An arbitrary splitting projection M(h_i)→K'_i may act nontrivially on the image from coordinate i=0, invalidating slab naturality. The joint saturated sum K'_i⊕im(l_i→h_i) is essential (Lemma C).

## A4. What the checker does not prove

The independent finite script enumerates all 19,56 supports, tests representative unimodular conjugate block diagrams and exact pairwise Smith ranks, and verifies death-source dimensions. It does NOT enumerate all integer representations, prove a global no-counterexample claim by finite search, check every prime experimentally, or certify correctness of the abstract Krull–Schmidt/UCT arguments. The actual general theorem rests on the written proof.

## A5. Priority attacks

Original LLO is field-valued, so its printed statement does not immediately imply the integral theorem. Original Höppner–Lenzing projective-diagram-freeness makes the final latching step classical, not novel. Later ring-valued persistence decomposition literature needs direct proof-level examination before an originality gate. No certified original HHA flagship yet; a purely integral persistence-structure theorem also requires a substantive homotopical application and novelty screen.