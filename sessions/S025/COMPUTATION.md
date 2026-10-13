# S025 computation — what actually ran, and what did not

## Scope and environment

2026-10-13 locally executed in the working container: Python 3, stdlib fractions/hashlib/itertools/random. NetworkX3.6.1, scipy1.17.0 available, but S025's graph hash and VC scripts used Python stdlib only. No GitHub workflow executes any scientific scripts. The original repository S020/22/23/24 scientific scripts were READ, but were NOT independently executed byte-for-byte in this session. Do not backfill phantom transcripts.

### Independent exact graph recreation

Command: `python /mnt/data/hha_s025/vc_search.py`; local SHA256 `f3a92cc143a85cd59e5510fd4c2cfd86aa6de1305b566bf4d7c42a8690041fb8`. Script explicitly contains all 36 tetra obtained from unchanged S020 fixture, constructs all 168 source nonempty faces plus 14 nonempty proper tetrahedral target faces, evaluates each 16,471 unordered pair for each of the two maps, and serialises the full 182×182 0/S/M/L matrix with the S023 canonical ordering.

Recorded exact assertions PASS:
```text
g hash and edge count PASS
f hash and edge count PASS
g high=1572 / f1 high=1524 / common short=644
g SHA256=8cce60227b889db047c72e1bb73aaff6b27448d58097e8ebeaed58286c7d0a23
f1 SHA256=ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351
```
These are deterministic finite assertions, but S025 does not claim local byte-identity of original GitHub scripts or independent full 182-column homology checker execution. Original S024 full-star count32/30 is sourced from earlier verified code and is NOT independently retested here.

### Non-exhaustive five-dimensional necessary-invariant screening

In each high graph, regard closed graph neighborhoods (self-neighborhood INCLUDED, because Euclidean radius ball contains its own centre) as finite traces of same-radius 5D balls. A set of seven selected columns shattered by those neighborhoods would contradict the VC bound ≤6 for Euclidean balls in R5. Tested greedy 100 independent seeded searches and 350 seeded 7-column bounded swap hill climbs with random choices, 75 steps each, using the exact pair matrices. Local output:
```text
g greedy 7 columns: 46 of128 patterns; best local 7 columns 61 of128
f1 greedy 7 columns: 44 of128 patterns; best local 7 columns 65 of128
```
Greedy runs found shattering at size4 but not at size5; this is NOT an exhaustive maximum-VC calculation and not a proof that a 7-shattered subset does not exist. No such witness found. Neither SAT nor UNSAT in R5.

### Exact rational threshold gap

Command: `python /mnt/data/hha_s025/gap_certificate.py`; local SHA256 `662627fa8943b3f763360042795366551b5c8f8a51f0862b392763f65dca5be8`. The source of this arithmetic-only checker is committed as `scripts/s025_gap_certificate.py`.
```json
{
  "n": 182,
  "num_pairs": 16471,
  "epsilon": "1/18200",
  "delta_lower_bound": "1/582400",
  "max_square_radius_shift_bound": "1164801/84797440000",
  "minimum_squared_threshold_gap": "1/36400",
  "height_two_delta": "1/291200",
  "claims": "ARITHMETIC_PASS_ONLY"
}
```
This verifies exact rational inequalities used in T57, NOT the Hopf-class cup calculation, derived square invariance, all π_j, or originality. Neither numeric d5 optimisation nor a rational coordinate checker with all strict 16471 constraints was performed in S025.

Scientific scripts are not included in hosted static Action. CI governance status is reported separately.
