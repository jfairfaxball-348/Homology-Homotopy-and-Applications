# S051 finite toy test (not topological computation)

Pre-registered in PLAN: only the (L,r)=(10,5) and (15,8) individual window independence witnesses constructed by T124. Exactly 5+7 binary id/zero diagrams and (5×5)+(7×7)=74 window evaluations; a function-composition checker on two test inputs and independent intersection-of-zero-set checker agree for each. Each internal vertex is the *contractible* interval, terminal K_L point. This does not enumerate all words, all spheres, all Top maps or all objectwise-WE zigzags.

Local Python 3 standard library script `validation/S051/interval_checks.py`: sha256 `245a0d0e0561ce1e614dbb89aa98912f98a005a09c0d8c5eaf259e7b85785774`.
Exact stdout mirror `validation/S051/interval_checks.stdout`: sha256 `b90784ed9b2be896a849043d230296e2e80341c685d572532f50c8adb1551018`.

```
L=10 r=5 independent=5 test_cases=25 status=PASS
L=15 r=8 independent=7 test_cases=49 status=PASS
All bounded toy checks passed; no sphere/topology WE existence was tested.
```

Independent symbolic full-all-L,r proof is in MATHEMATICS T124; these local finite checks are sanity checks, NOT the proof. GitHub Actions checks STATIC catalogue/integrity only, not mathematical verification.
