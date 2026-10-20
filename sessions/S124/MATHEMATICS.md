# S124 MATHEMATICS — certified full-N Euclidean realisation; minimal N−1 still OPEN
Fix arbitrary N≥2, edge:Fin N→Fin N→Prop symmetric. D has D_ii=0 and D_ij=1±ε where ε=1/(100N)>0 and ε<1, and G=−JDJ/2. All statements are uniform, not computational N-specific.

OptionD/RealizedFlag.lean: epsilon<1 and nonnegative D; for distinct i,j squared D<1 iff edge, D>1 iff nonedge. Given **hypothetical** p:Fin N→EuclideanSpace ℝ (Fin(N−1)) with ⟪p_i,p_j⟫=G_ij, prove ‖p_i−p_j‖²=D_ij by polarization and S122 recovery; consequently ‖p_i−p_j‖<1 iff edge and the strict radius-one all-finset Rips simplex condition iff graph clique. This module does **not** assert existence of those N−1-dimensional points.

OptionD/SpectralRoot.lean: using the genuine pinned CFC.sqrt and native S123 PSD, construct B:Matrix (Fin N)(Fin N) ℝ with IsHermitian B and B*B=G. No arbitrary spectral axioms or changed Gram.

OptionD/FullPoints.lean: concrete column points p_i=WithLp.toLp 2 (fun k => B k i) in EuclideanSpace ℝ (Fin N). Their real inner product is ∑k B_ki B_kj = (B²)_ij = G_ij, using Hermitian B. The exact squared norm of p_i−p_j equals Gii+Gjj−2Gij=Dij. At distinct i,j, nonzero ε and norm≥0 imply strict radius-one norm <1 exactly on edges. All finite sets, including empty and singletons, satisfy strict Rips simplex iff clique. The ambient full-N theorem is unconditional; it is NOT the required EuclideanSpace ℝ (Fin(N−1)) embedding.

Unresolved: show B annihilates constants (e.g. from B²=G plus self-adjointness) and construct a dimension-N−1 isometry of the relevant subspace to exact EuclideanSpace ℝ (Fin(N−1)). Then apply compiled RealizedFlag conditional lemmas. Without this, full D1 minimal dimension is not Lean-certified; D2 and Option D D6/D7/D8 remain unformalised. No novelty or publication gate promotion.
