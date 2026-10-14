#!/usr/bin/env python3
"""S032 independent exact order-cube census and two missing-premise Smith controls."""
from itertools import product, combinations
from math import prod
from sympy import Matrix, ZZ
from sympy.matrices.normalforms import smith_normal_form
import hashlib, json, platform, sympy

def cube_counts(shape):
    choices = [[(v,) for v in range(m)] + list(combinations(range(m), 2)) for m in shape]
    by_dimension = [0] * (len(shape) + 1)
    for choice in product(*choices):
        by_dimension[sum(len(coords) == 2 for coords in choice)] += 1
    n = prod(shape)
    formula = prod(m * (m + 1) // 2 for m in shape)
    assert sum(by_dimension) == formula <= n*n
    return {"shape": list(shape), "vertices": n, "all_cubes": formula,
            "dimension_counts": by_dimension,
            "koszul_cubes": sum(by_dimension[2:]), "N_squared": n*n}

def smith_invariants(matrix):
    if not matrix.rows or not matrix.cols:
        return []
    d = smith_normal_form(matrix, domain=ZZ)
    return [abs(int(d[i,i])) for i in range(min(d.rows, d.cols)) if d[i,i] != 0]

examples = {
    "constant_boolean_square": (Matrix([[1,-1]]), Matrix([[1],[1]])),
    "torsion_H0_2": (Matrix([[1,-1],[0,-2]]), Matrix.zeros(2,0)),
    "impure_composite_scalar_2": (Matrix([[1,-2]]), Matrix([[2],[1]])),
}
example_results = {}
for name, (d1, d2) in examples.items():
    assert d1*d2 == Matrix.zeros(d1.rows, d2.cols)
    s1, s2 = smith_invariants(d1), smith_invariants(d2)
    middle_rank = d1.cols - len(s1) - len(s2)
    example_results[name] = {
        "d1": [list(map(int, d1.row(i))) for i in range(d1.rows)],
        "d2": [list(map(int, d2.row(i))) for i in range(d2.rows)],
        "smith_d1": s1, "smith_d2": s2,
        "rational_middle_homology_rank": middle_rank,
        "all_nonzero_smith_units": all(v == 1 for v in s1+s2),
    }
result = {"environment":{"python":platform.python_version(),"sympy":sympy.__version__},
    "counts":[cube_counts(x) for x in [(2,2), (3,5),(4,4),(4,4,4),(5,4,3),(2,2,2,2,2,2)]],
    "smith_examples":example_results}
report = json.dumps(result, indent=2, sort_keys=True)+"\n"
print(report, end="")
