# S048 proof-first plan and test registration (executed only S048)

1. Reconstruct the real-shoelace and finite [10] endpoint quantifiers from S046/S047, including all replacement zigzags, both shifted identities, half-open cuts and propagated pointings.
2. **Route A:** construct K by relative mapping cylinders and HEP. Verify whether success on one null pair composite preserves the cofibration required for each of the next two; a local relative nullity is not a global compatible tertiary filler.
3. **Route B:** attempt a structural no-go for K via monomorphisms. Examine maps 4->5,6->7,8->9, and check exact implications for the even-chain pair composites. Test separately whether this applies to arbitrary GRID rather than silently imposing extra cofibrancy.
4. **Route C:** reduce arbitrary rational epsilon strict interleavings to a finite uniform rational grid, prove both directions and two identities at all real times; use density/monotonicity only for an exact infimum characterization, not to infer endpoint attainment.
5. **Route D:** independently challenge finite epsilon>5/4 using 4/3 and other rational examples. Do not claim a whole interval absent a source-exact obstruction or explicit interleaving.
6. Directly compare original Lanari–Scoccola, Wang–Xu, Isaksen–Wang–Xu, BJT/DKS and 2026 scope as far as access permits; no invented Adams/Moss derivation or universal Top equality.
7. Freeze proofs, failures and gate status. One atomic authored commit and ordinary PR/merge if real hosted static CI succeeds. S049 FUTURE, UNEXECUTED.

Pre-registered diagnostic: use Python 3 standard-library Fraction with eps in {5/4,4/3,7/5,3/2}, exact sample mesh t=a/(24s), 0<=a<120s (i.e. t in [0,5)); check floor(s(t+2eps))=floor(st)+r and count of nonterminal length-r constraints max(0,5s-r). Independent symbolic proof supplied in MATHEMATICS; numeric output is not proof of every real t. Outputs and SHA256 recorded in validation/S048.