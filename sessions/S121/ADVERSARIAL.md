# S121 adversarial audit
- N=2: mean-zero subspace has dimension 1; G has the one-dimensional constant zero mode, so G is not positive definite on all vectors.
- Empty and complete undirected graphs: D class signs reverse and the 99/200 bound remains uniform.
- Directed `edge i j` need not yield D_ij=D_ji; S121 symmetry/column/PSD theorem demands explicit `hsym`, not a hidden assumption.
- The zero vector and every constant vector have zero centered form. Constant kernel uniqueness and rank in the pinned Matrix API remain unproved.
- `D_ij` is a *squared* distance target. Comparison to 1 on D must not be silently used as an actual metric threshold prior to constructing points.
- Scratch failed on tactic-level simplification, then compiled after repair. No finite numerical check or literature review is promoted to a general theorem.