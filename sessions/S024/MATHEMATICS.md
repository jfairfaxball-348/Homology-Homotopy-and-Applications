# S024 mathematics — T54 complete mixed-star correction, T55 broad 5D spread obstruction, T56 robust Hopf square

## T54. Full induced-star maxima for the TWO fixed 182-vertex upper comparability graphs

Use exactly the 36 Madahar–Sarkaria source tetra, `P=P(K)=(168 nonempty source faces)`, `Q=P(boundary Delta^3)=(14 nonempty proper target faces)`. The valid g map sends a_i,b_i,c_i to letter i among a,b,c and d_i to d; the published Hopf map f1 sends x_i to x. The tagged mapping cylinder has source inclusion, target inclusion and source sigma < target tau iff f(sigma) is contained in tau.

**Proposition (internal, exact).** The largest induced K_(1,m) in the full high-threshold comparison graph G_g has m=32. In the full Hopf graph G_f1 it has m=30. In particular S023's facet SOURCE-ONLY numbers 31 and 27 were not the complete graph-star maxima; 32/30 are the corrected global numbers. This does not establish a d5 obstruction.

**Proof.** For a vertex v of any poset, its comparability-graph neighbours split into strict lower L_v and strict upper U_v. Every x in L_v is below every y in U_v by transitivity. Hence an independent neighbour set (=antichain) cannot use both parts. Its maximum cardinality is max(width L_v,width U_v). For each of the 182 vertices in each mapping cylinder, we form the two finite induced posets. For any finite poset S, width(S)=|S|−nu(S), where nu(S) is a maximum matching between left/right copies of S with i_L—j_R iff i<j. This is Dilworth's path-cover/matching reduction. Every strict comparator is generated directly from inclusion and f, so the 364 widths for each map exhaust all possible centers and leaf choices.

Python3 stdlib and a second independent NetworkX bipartite-matching implementation agree at EVERY center, with exact complete class SHA256s g `8cce60227b889db047c72e1bb73aaff6b27448d58097e8ebeaed58286c7d0a23`, f1 `ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351`, E_high (1572,1524), E_short (644,644). The largest g width occurs below target facet abd/acd/bcd (32), f1 below any of the four facets (30). At `(t,bcd)`, g strict lower neighbourhood has 85 vertices and matching cardinality53, so width32; f1 has 78 and matching48, so width30. Explicit witnesses consist of 29 g source triangles plus the THREE target singletons {b},{c},{d}; and 27 f1 source triangles plus the same THREE target singletons. In each witness, the triangles' images contain at least two target colours; this makes each triangle incomparable to each selected singleton. Equal-size different triangles are incomparable, and the three target singletons are incomparable. An actual independent checker derived antichains from alternating matching paths and checked every pair. See COMPUTATION for the full exhaustive histograms.

**Boundary:** A 32-star and 30-star exceed four-dimensional kissing24, independently reproving the d<=4 exclusions; both are BELOW the established dimension5 lower kissing bound40. Thus no d5 graph impossibility follows from these star sizes. An optimizer failure cannot repair this.

## T55. A broader, rigorously quantified Euclidean dimension-5 obstruction (not a graph-specific no-go)

**Theorem (internal elementary consequence of classical Jung/packing).** If N≥182 pairwise distinct points in R^5 have smallest pairwise distance s>0 and largest pairwise distance D, then D/s>7/5. More generally for N distinct points in R^d,
N ≤ (1+sqrt(2d/(d+1)) D/s)^d.

**Proof with all constants.** Let a minimum-radius enclosing closed ball have center 0 and radius R. There exist m≤d+1 boundary contact points y_1,...,y_m of norm R and positive weights lambda_i summing to1, with sum lambda_i y_i=0 (enclosing-ball optimality and Carathéodory). Their squared-distance weighted sum satisfies
2R² = sum_(i,j) lambda_i lambda_j ||y_i−y_j||² ≤ D²(1−sum lambda_i²) ≤ d D²/(d+1),
because sum lambda_i²≥1/m≥1/(d+1). Thus R≤sqrt(d/(2(d+1)))D, the standard Jung bound, here reproved.

The open radius-s/2 balls around the N points are pairwise disjoint (their boundaries may touch) and lie in the radius-(R+s/2) ball. Comparing d-dimensional volumes gives N(s/2)^d≤(R+s/2)^d, hence the asserted inequality. For d=5 and D/s≤7/5, sqrt(5/3)<13/10 since 5/3<169/100. Thus
N<(1+(13/10)(7/5))^5=(141/50)^5=55,730,836,701/312,500,000<182,
a contradiction.

**Application.** In the frozen 182-point two-threshold three-distance R181 certificates, distances lie in [sqrt(1−epsilon),sqrt(1+epsilon)] with epsilon=1/18200. Their diameter/separation ratio is <7/5. Hence NO FIVE-DIMENSIONAL POINT CONFIGURATION (indeed no d<=5) can preserve all THREE ACTUAL squared-distance levels, or even ANY replacement set of distinct distances with global D/s≤7/5. This genuinely extends the microscopic S021 T49 near-equilateral condition to a substantial global spread class, but critically it does NOT exclude faithful R5 realizations that distort distances so D/s>7/5. The theorem follows from classical geometry and is NOT HHA-level originality.

## T56. Explicit metric/height perturbation stability of the actual four-stage Hopf comparison

Keep epsilon=1/18200, the S023 3-class squared-distance model and cutoffs r0²=1−epsilon/2, r1²=1+epsilon/2, t0=1/2,t1=3/2. If each point is moved in its ambient R181 by Euclidean norm δ≤epsilon/32, and each height changes by at most 1/4, EVERY graph and every vertex subset at the four indexed (r_i,t_j) stays literally unchanged for each of g and f1. So the actual mixed cofiber cup-square distinction 0 versus ±1 and complete pointwise integral ring/π maps on that finite four-corner diagram are preserved.

**Proof.** For original distance d≤sqrt(1+epsilon) and displacement of each endpoint≤δ, triangle inequality gives |d'−d|≤2δ, hence |d'²−d²|≤4δ sqrt(1+epsilon)+4δ². With epsilon≤1 and δ≤epsilon/32 this is ≤(sqrt(2)/8+epsilon/256)epsilon <epsilon/2, smaller than every class-to-squared-radius threshold gap. Therefore each Rips edge decision at r0,r1 is identical. Heights 0/1 under perturbation≤1/4 do not cross thresholds1/2 or3/2. Flag complexes and structure inclusions are literally identical at all four corners, proving the full finite-square cup and homotopy persistence statements. This does NOT say full continuous-plane complexes remain literally identical: edges may split between formerly equal radii. The identity correspondence instead yields ordinary all-plane (2δ,1/4)-shift inclusions in both directions, a familiar function-Rips stability mechanism, not a novel claim.

## R5 feasibility attack and epistemic boundary

Four seeded SciPy L-BFGS-B experiments in d5, all 16,471 pair constraints, squared edge<=0.98 and nonedge>=1.02, 350 iterations per trial, did NOT satisfy even the weaker strict threshold1 decisions. Recoloured g seed2024: 562 edge and 1032 nonedge sign violations; seed2424: 565 and1018. Original f1 seed2024: 596 and1098; seed2424: 581 and1064. These are HEURISTIC numerical trials with no convergence theorem, no PSD infeasibility certificate and no faithfulness; they do NOT exclude R5. Both original exact R181 cloud diagrams and g/f1 cofiber cup calculation survive unchanged. No positive R5 witness exists in this session.

## Front A/C and HHA fit

A: count/description of succinct nonprincipal interval supports alone gives neither new k≥1 bit-complexity decision nor lower bound; the known S010/S018/FoCM2025 algorithms and counterexamples stand. No claim.

C: characteristic-wise rational/all-Fp decomposition of a grid is not a single integral natural idempotent commuting with all arrows/composites; no primitive counterexample or coherence theorem satisfying ALL quantified requirements derived. No claim.

Novelty: 2000 Hopf/CP2 attaching map, 2015 total homotopy cofiber, 2024 persistent cup products, 2026 persistent homotopy function-Rips and monoidal Rips already established. T54 is finite model correction; T55 classical Jung-volume; T56 standard gap stability. **NO_VIABLE_HHA_FLAGSHIP_YET. No Gate2/Lean/Palomar/paper/arXiv/HHA.**