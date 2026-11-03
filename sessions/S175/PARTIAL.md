# S175 local certificate and integration handoff

The owner invoked S175 on 3 November 2026. Entry main was `956859c22a4af7754e58eb562f7cdd5abb10b75e`, tree `e46b83408d1fd54434d17ffc723b422d97524f4c`. The S174 closeout merge (PR #216) passed pinned Lean #41594110335 and repository integrity #41594110390.

The pinned local build checks `C4.groupAlgebraEquiv`, its generator and norm identities, and `C4.c4_distance_separation_groupAlgebra`. The theorem uses the canonical scalar inclusion for homology, every localisation at objectwise quasi-isomorphisms of entire real diagrams, and arbitrary zigzags of both replacement lanes. The transferred zero diagram is objectwise zero. The new declarations use only `[propext, Classical.choice, Quot.sound]`.

The manuscript uses the seven-stage cone resolution in §4 and the weak-data acyclic-lane transfer in §5. The crosswalk records the exact definitions and conventions.

Finish integration by verifying exact-head PR CI, the ordinary two-parent merge and independent merged-main CI, then record their evidence in the closeout and install the future S176 handoff. S174 remains the last completed session until those checks pass.
