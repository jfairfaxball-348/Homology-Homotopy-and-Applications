# S121 mathematics: all-vector D1 centered Gram

For symmetric `edge : Fin N → Fin N → Prop`, N≥2 and ε=1/(100N), D_ii=0 and D_ij=1−ε on edges, 1+ε off edges. G=−JDJ/2 is precisely the already defined finite matrix. Exact finite sums show ∑_j G_ij=0 and ∑_i G_ij=0. Symmetry of G needs edge symmetry; row cancellation itself needs none.

For real vector x, m=(∑x_i)/N and z_i=x_i−m, ∑z_i=0. Finite bilinear expansion and row/column zero imply q_G(x)=q_G(z). Previous certified `d1_centered_mean_zero_lower` yields q_G(z)≥(99/200)∑z_i²≥0. These identities and their assumptions are Lean declarations in `OptionD/CenteredPSD.lean`, verified on scratch #39312760687. The ones vector is an explicit null mode.

Mathematically the inequality implies q_G(x)=0 only for constant x, but equality of matrix kernel with constants, rank N−1, spectral factor and p_i∈ℝ^(N−1) with ‖p_i−p_j‖²=D_ij have **NOT** been formalised. The flag/Rips graph and D2–D8 likewise remain beyond the compiled artifact.