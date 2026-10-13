# S028 reproducibility and exact coverage

Environment: CPython 3.12.14, Linux-6.18.44-x86_64-with-glibc2.39, Python standard library only for the new construction/checker. Independent checker imports no constructor and is read-only. The mathematical interpretation still uses simplicial homotopy/PL facts, integral LES and UCT; it is not Lean formalisation.

Commands actually executed from repository root:
```sh
python scripts/s028_integer_cofiber.py
python scripts/s028_independent_check.py
python scripts/validate_repository.py
```
The constructor writes the complete finite certificates. The checker reads them and rederives every graph clique by neighbourhood intersections, every signed cocycle/cycle equation and every centered rational Gram entry. Raw outputs are committed as certificates/constructor.stdout and checker.stdout. Full SHA256 values for scripts, certificates and scientific replays are in certificates/SHA256.json. Constructor SHA `1e99f7c65b4a61ef6bdc8df7a52bd5a2d0aedf975e07b3d0f5465152b269f269`; checker SHA `5639fc311d58e3ce2c1558d16cac4e1e8769595fa9679b21edd2741f02a18cfc`. Constructor stdout SHA `6b3e7a6759e1a08764417e72fd265ada58360f970d627f11f2a49aaa8876f796`; checker stdout SHA `4d7d1da1124f0eb8ea69d53c41210ebd9acc1a5c6fe4b0d7211a9a6ac460e967`.

Scope is exactly n=2 versus constant0 on common K2:20 source vertices/90 edges/140 triangles/70 tetrahedra, source320 face vertices plus14 target face vertices; N334,55611 unordered pair classes per model. Shared short edges1516; high edges4276(f0)/2888(f2). Cylinder f-vectors:
- f0:[334,4276,21224,51120,64080,40320,10080].
- f2:[334,2888,7558,7798,2796].
Cocycle supports321/438, relative4-cycle supports1680/2760. Integral AW pairings0/2. Target generator pairings−1; cycle boundary is ±the primitive subdivided source fundamental chain. All degree3 cocycle identities and degree5 cup identities checked. No mod2 substitute.

All334² Gram entries/model verified exactly as rational integers over denominator7451940800, zero row sums and exact recovered distances. Positivity on1-perp lower33067/66800 and rank333 use the analytic norm argument, not floating eigenvalues. All12 component partitions compared literally; all their H0 arrow maps then agree by induced maps of named vertices. All128 free-pair collapses of Bminus are checked independently. Source integral boundary ranks19/71/69 and target3/3 obtained by exact unimodular unit cancellation; all nonzero Smith invariant factors1, zero residual differentials. Relative Betti[0,14,1,0,1] and no torsion follow from integral LES/order retraction. A full dense relative Smith decomposition was not run.

Two independent corruption tests were run on transient copies: changing one signed w coefficient and changing one Gram numerator each caused AssertionError/exit1; originals remained untouched. Exact rejected tests are in MUTATION_CHECKS.json.

Actual original-script replays (raw stdout/stderr committed under replays): s020_certificate, s022_kissing_certificate, s023_recolored_null, s024_star_certificate, s025_gap_certificate, s026_cofiber_aw, s026_k66_certificate, s026_exact_gap and s027_uniform_margin all exited0. The original optional s023_homology.py exited1 because NetworkX was not installed in this execution environment. No missing-dependency run is described as PASS; the new full integer certificate does not depend on it. The existing workflow continues to run static governance only, not these scientific scripts.

No arbitrary-n exhaustive construction, finite f4 certificate, infinitely many computed pi groups, strict frozen R5 feasible/UNSAT certificate or Lean build. T64 all-pi and dHI conclusions use the explicit mathematical proof. No originality result follows merely from these finite checks.
