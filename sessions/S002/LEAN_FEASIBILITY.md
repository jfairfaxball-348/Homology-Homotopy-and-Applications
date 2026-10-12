# Lean 4 feasibility — architecture only, no build

**No Lean project/toolchain/mathlib pinned or run during S002.** There are no compiled theorems. Candidate C02 needs structures beyond the elementary Z-module matrix lemma; avoid silently proving only a rational/homological surrogate.

Potential layers:
1. Finite index `Fin (N+1)` and free finitely generated abelian group functors; `LinearMap`, `Matrix`, `Submodule`, direct summands and compatible adapted bases (likely approachable, moderate).
2. CW complexes, (unreduced) suspensions, mapping cylinders and mapping cones, actual subcomplex intersection/pushout and Mayer–Vietoris naturality (major mathlib survey required, high).
3. `HomologyGroup` / chain complexes and exact sequences; transgression under cover spectral sequence, especially `d₂` (significant potential library gap, very high).
4. Explicit finite filtered CW subcomplex diagram and strict map extension; mapping cone homology kernel/cokernel (substantial, high).
5. **Admissible staged route:** formalise the matrix persistence naturality / exact algebraic kernel–cokernel statement first, then geometric realization once support is confirmed. An algebraic-only theorem cannot be relabelled full geometric formalisation.

Feasibility judgment: elementary algebra 3/5, exact geometric T3 1/5; no estimated code size or fictional mathlib paths. Audit actual mathlib HEAD and toolchain in a separately authorised later stage only.