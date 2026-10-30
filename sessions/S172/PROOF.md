# S172 PROOF — acyclic-monomorphism quotient quasi-isomorphisms (30 October 2026)

**Cold Lean certified source:** `abcb591f53646b73903687f1ecfa7c723f9037ff`; pinned OptionD+C4 Lean [#41131166960](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41131166960) SUCCESS and integrity [#41131166873](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41131166873) SUCCESS. Earlier narrower certified source `61758ccb3d99497588295707aed98e3b642bc2b4` passed Lean #41130939737 and integrity #41130939731.

The actual imported file `C4/AcyclicCokernelQuasiIso.lean` proves:

1. `monoCokernelSequence_shortExact`: the genuine complex-level short sequence of an arbitrary **monomorphism** `f : K ⟶ L` and its cokernel is short exact.
2. `quasiIso_cokernel_of_acyclic_mono`: if `K.Acyclic`, the actual projection `L ⟶ cokernel f` is a `QuasiIso` in **every integer degree**, by the long exact homology sequence, exactness and acyclicity at adjacent degrees.
3. `realShoelaceCokernel_projection_objectwise_quasiIso`: for any genuine full-real strict interleaving, if the **whole opposite lane** is objectwise acyclic and each actual backward crossing is monic, evaluation preserves cokernels and yields a `QuasiIso` quotient projection at **every real** `u`. This is a conditional **bridge theorem**, not a conditional version of the frozen metric theorem.

**Sharp boundary:** An arbitrary strict interleaving, even with an acyclic opposite lane, does NOT automatically supply monic crossings. S172 has not constructed the required projectively cofibrant replacement of an arbitrary whole-real shoelace-poset diagram, and has not shown arbitrary BOTH-lane weak-equivalence zigzags admit such a crossing. Hence the genuine complete C3 strict lower bound, C1 higher transfer, C2 derived cone, and quantitative C4 metric theorem remain OPEN. No finite grid, zero-lane literal replacement, `sorry`, `admit` or custom axioms were introduced. Do not claim the full theorem is certified.
