# S020 COMPUTATION — exact finite campaign

## Preregistration and coverage
Deterministic finite scope, frozen before execution: all 36 source tetrahedra and 168 source nonempty faces, target 14 nonempty proper faces; all 182 vertices and all 16,471 unordered vertex pairs **for each cloud**. Finite tests: source tetra/triangle incidence, all 12 vertex links, Bminus elementary collapses, GF2 ranks, integer cochain identity on all 72 triangles, coherently oriented 36-tetra 3-cycle and integral Hopf evaluation, both graph types and connected-component partitions, exact distance-class serialization SHA256. No stochastic search or unbounded estimate.

Run with `python3 scripts/s020_certificate.py` (Python >=3.10, standard library only; no network). Local expanded stdlib checker was ACTUALLY run; script SHA256 f9c8fa344966f03f241047b71a495fc7a3ecccbfbeb37701a2d296cbb4698563 applies to that local variant, not yet the shorter GitHub replay script. Its outputs:
```json
{
  "source_fvector": [12,48,72,36],
  "GF2_boundary_ranks": [11,37,35],
  "all_vertex_links_are_S2": true,
  "Bminus_collapse_pairs": 58,
  "ball_face_counts": [101,117,50],
  "hopf_invariant": -1,
  "vertices": 182,
  "dimension": 181,
  "epsilon": "1/18200",
  "gram_min_eigenvalue_lower_bound": "99/200",
  "cofiber_extra_H1_rank": 14,
  "two_clouds": [
    {"kind":0,"high_edges":2244,"short_edges":644,"classes_sha256":"138695182181e0bbb370e866fe081fe50403aa242266a24de715a2aaf641f5c3"},
    {"kind":1,"high_edges":1524,"short_edges":644,"classes_sha256":"ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351"}
  ]
}
```
Serialization is all 182 rows sorted by (size of face, lex face), source faces before target faces; each entry one of 0,S,M,L, comma-separated with final newline. S=1−ε; M=1; L=1+ε. This supplies a complete rational Euclidean squared-distance matrix, positive Gram proof rather than decimal coordinates, and replay hashes.

**Checks NOT run:** no Sage/CGAL, no explicit floating coordinate matrix factorization, no complete programmatic π_j for all j (impossible finite direct exhaustive check), no independent software cup product on gigantic cofiber complex, no Lean, no Palomar. Topological mapping-cylinder and cup-square claims use standard proven propositions and exact cocycle finite verification.
