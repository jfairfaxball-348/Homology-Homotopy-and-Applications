# S125 ADVERSARIAL
- All N≥2 including N=2: Mathlib Fact finrank identity uses 2≤N and arithmetic N−1+1=N; nonzero constant vector shown via coordinate zero.
- Empty/complete graphs and isolated vertices: no extra graph hypotheses beyond symmetry; original positive centered Gram and exact rank N−1 pass through unchanged.
- Directed asymmetry is not silently allowed: input hsym explicitly retained throughout; diagonal edge values ignored by hollow D.
- All vector B rows and columns: Bu=0 proven algebraically, not assumed from B²=G. Hermitian symmetry only needed to transfer row to column sums.
- Exact equality i=j: q_i−q_i=0 gives D_ii=0. Offdiagonal epsilon>0 prevents coincidence and distances exactly 1.
- Strict norm versus squared norm: reuse compiled RealizedFlag.lean with nonnegative norm and nlinarith, no illicit replacement of radius by radius squared.
- All finite sets: empty and singleton clauses vacuous; larger sets equivalent by each distinct pair.
- Weak unit-radius relation has same off-diagonal graph as strict at radius 1, but this supplemental statement is not exported as an S125 Lean theorem.
- No tested geometric radius/height monotonicity, coherent topological maps, D2 or R³ D6–D8; no Palomar/novelty.