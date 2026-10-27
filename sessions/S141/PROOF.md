# S141 — genuine integer-indexed C4 complex and residue kernel

**Entry:** main 304f3bbd92b092cebb0d20cfef29669880d3131f, tree 92a5686ac93e10f462ebb95b5706a57c3e63d298. S140 ordinary merge #169 has parents 6460ba80c258d17a480dc660df868edc7b53c628 and 716112858d93c602328b4e38db0442d839847c8f; main pinned Lean #40520030861 SUCCESS and integrity #40520031160 SUCCESS. No open PR at entry.

## Pinned formal output

- `C4.integerObject`: regular `ModuleCat.of B B` for integers n≥0 and `ModuleCat.of B (Fin 0 → B)`, a true zero module, for all n<0. This addresses the actual unbounded ℤ domain, not a finite-grid replacement.
- `C4.integerDifferential`: genuine ModuleCat morphism, multiplication by alternating t/t³ in nonnegative degrees and zero below; uses explicit categorical `eqToHom` transports.
- `C4.integerDifferential_square` proves all ℤ composites zero. `C4.integerResolution : ChainComplex (ModuleCat B) ℤ` is an actual object in the homological chain-complex category.
- `C4.positiveDifferential_exact_coeff` expresses all-degree coefficient exactness through genuine `coefficientLinear` maps, without claiming the categorical homology isomorphism.
- `C4.residueHom : B →+* ZMod 2` is a genuine unital ring homomorphism with a proved surjectivity and `residueHom_kernel` identifying exactly the principal (t) ideal. `residueHom_t_mul` verifies zero residue for t-multiples.

**Compiler evidence:** scratch c393380e50b9aa118fd2a3045986ed1314e1ba94, pinned hosted C4 and OptionD Lean #40522303891 SUCCESS, repository integrity #40522303279 SUCCESS, unchanged Mathlib revision and manifest. Earlier scratch Lean failures on absent ModuleCat object numeral, Lean 4 visibility, dependent categorical transports and associativity were corrected, not hidden. No added proof admissions or axioms.

## OPEN, do not promote

True polynomial quotient/group-algebra ring equivalence, B-linear augmentation chain map and categorical homology H₀≅F₂/H_n=0 for n≠0, shifts and ALL-choice global dg fourfold; whole-indexed free-quiver construction, ℝ Kan extension, derived upper and arbitrary whole-real both-lane zigzag strict lower bound remain uncompiled. The frozen full distance inequality is INTERNAL paper mathematics only.
