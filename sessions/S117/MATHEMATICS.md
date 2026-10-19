# S117 formal mathematics
Fix N≥2 and ε=1/(100N). For each hollow off-diagonal entry Eᵢⱼ of the perturbation from the equilateral squared-distance matrix, |Eᵢⱼ|≤ε. For arbitrary real x,y and |a|≤ε, prove
`-(ε/2)(x²+y²) ≤ axy`.
If xy≥0, (a+ε)xy≥0 and ε(x−y)²≥0 give the inequality. If xy<0, (ε−a)(−xy)≥0 and ε(x+y)²≥0 give it. This is the local two-term bound to be summed over off-diagonal pairs, not itself the complete matrix bound.

Since N≥2, N>0, ε>0 and 100N ε=1, one has (N−1)ε<Nε=1/100. Thus the eventual centered Gram positive bound satisfies `(1−(N−1)ε)/2>99/200`.

`OptionD.d1_pair_error_lower`, `OptionD.d1_row_error_small` and `OptionD.d1_strict_gram_margin` encode precisely these statements. An actual proof certificate depends on the hosted Lean job successfully compiling these declarations. NOT formally proved here: the sum inequality, full Gram PSD/rank, embedding or exact Rips filtration, and all D2/D6/D7/D8.
