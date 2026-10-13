# S022 exact reproducibility certificate (limited arithmetic scope)

## Identified finite scope
Seven rational coefficients in the dimension5 (lambda=3/2) Gegenbauer expansion of p(t)=(t+1)(t+1/2)^2*t^2*(t−1/2); polynomial terms to degree6. Exhaustiveness: loop k=6 down to0 exactly cancels a rational polynomial using standard Gegenbauer recurrence; remainder zero; asserts exact pre-stated list and nonnegative coefficients. Source 72-face count is inherited directly from repaired S021 script (36 tetra K, f-vector [12,48,72,36]) rather than claimed freshly counted by the S022 helper. No random seeds, Monte Carlo, floating eigenvalues, external packages, or Euclidean graph optimization.

## Actually executed local Python standard library checker
Command: `python /mnt/data/hha_s022_kissing_certificate.py`; Python3, fractions.Fraction and basic stdlib, no pip libraries.

Script SHA256: `a6d5d19ac6163a6807f8c1174892a1d3c46e526bb99f4a09731e598fe2f7eb0b`.
Observed actual output (exact):
```
Gegenbauer dimension 5 coefficients: ['37/840', '11/168', '131/1980', '87/1540', '146/4095', '4/231', '16/3003']
f(1): 9/4 f0: 37/840 bound: 1890/37 floor: 51
Induced star: source 72 triangles, high target singleton {a} adjacent to each, pairwise nonedges (from corrected S021 source graph).
Consequence: 72 > 51 so no exact graph Euclidean R^d, d<=5.
```
The check of 72 and adjacency is a mathematical deduction from corrected S021 source graph, not an assertion that this local checker freshly enumerated all 182 vertices. Original script source placed in repository at `scripts/s022_kissing_certificate.py` for repeat; use SHA of actually executed local source recorded above (identical content before git normalization), hosted CI static-only, not a mathematical validation of any topology beyond polynomial identity.

## Exact algebra versus topology
Positive semidefinite Gegenbauer kernels and reduction of ball packing to sphere angles are mathematical proof ingredients, not certified by Python. The upper bound 51 is weaker than published tau5<=44; the programme never claims a newly best code bound. Corrected S021 class hashes remain f0 65deabfaed606db2d756b38569de169bef073e32c388a774fe23de6d20e66741 and f1 ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351; old 138695... is invalid. No new full Gram / clique computation or Lean.
