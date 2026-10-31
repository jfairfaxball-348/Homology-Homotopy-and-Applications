# S173 BUILD — exact evidence and genuine blockers

Entry remote `main` `d8e26a32e98ea641506c589eef2d6b662c16220a`, S172 PR #206 ordinary two-parent merge verified, merge parents `c761eddc57a3b7b98ce3efef17a24a75434453d0`, `6ab309155aa0f4c546146a0690e138ef237ddf7d`. Its independently checked merged-main Lean #41131900311 and integrity #41131899897 succeeded.

- S173 poset module and C4 root import source `80150b0cb72002688fc2c0212112b81d3da82d20`: full Lean #41183206087 SUCCESS and integrity #41183206031 SUCCESS.
- Initial interpretation source `c0985749f23217192f271b112f6c0f5cccda50d1`: Lean #41183306304 FAILED, due to underscore metavariables in `change`, extra tactic after closed goal, and nondefinitional crossing-map elaboration. NOT certified.
- Revised interpretation source `0d4f65fceedae809e6cd1b44680fe1138a40da68`: Lean #41183461155 FAILED, narrowed to a definitional mismatch on the **mono hypothesis** in the final whole-real quotient theorem. NOT certified.
- Follow-up code `c02cd3d9a13e9c5fa68dfc5aa30176c016cd046a` explicitly normalizes restriction functors. Check the pinned CI run on the actual final proof head, not previous status or authored notes.
- Documents propose the unnormalised bar algebraic substitute; no Lean file containing its construction has been certified. Pinned Lean remains 4.35.0-rc2 / Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55, OptionD untouched.

Integrity check needs session closeout + STATE update + S174 prompt to agree; intermediate failures while installing the handoff are not evidence of the final result. Before saying verified, require exact source/head Lean success, integrity success and independent post-merge main runs.
