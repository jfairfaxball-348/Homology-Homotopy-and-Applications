# S120 mathematics: actual centered quadratic

For Dᵢⱼ=d1SquaredDistance N edge i j and Gᵢⱼ=−1/2(Dᵢⱼ−Rᵢ/N−Cⱼ/N+T/N²), let Rᵢ=∑ₖDᵢₖ, Cⱼ=∑ₖDₖⱼ, T=∑ₖₗDₖₗ. If ∑ᵢxᵢ=0 then each of the three rank-one terms has quadratic pairing zero, since each contains a factor ∑x. Thus **exactly**, for every finite N, x and even directed edge predicate,

∑ᵢⱼ Gᵢⱼ xᵢxⱼ = −(1/2)∑ᵢⱼ Dᵢⱼ xᵢxⱼ.

S119 proved ∑Dᵢⱼxᵢxⱼ ≤ −99/100∑xᵢ² for N≥2 and ∑x=0, hence **∑Gᵢⱼxᵢxⱼ ≥ 99/200∑xᵢ²**. Source now compiles declarations `OptionD.d1_centered_gram_formula`, `d1_perturbation_symmetric`, `d1_squared_distance_symmetric` (symmetry hypothesis explicit), `d1_centered_mean_zero_identity`, `d1_centered_mean_zero_lower`. Corrected GitHub Lean job #39310425894 SUCCESS. No full-vector PSD/constant kernel/rank/Euclidean representation theorem, no metric threshold/D2 and no D6–D8 formalisation is proved here.
