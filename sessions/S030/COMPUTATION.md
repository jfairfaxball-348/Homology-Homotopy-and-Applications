# S030 computation: finite mixed diagrams, NOT universal search

Preregistration as in INPUT/PLAN: classify recursively specified supports by closed formula for m^n with (m,n)=(3,2),(4,2),(4,3),(5,2); take a finite collection of up/down/internal-band thin blocks, apply different unimodular upper triangular basis changes at each vertex; inspect **all comparable pairs** using integer Smith normal form; recover each selected interior interval multiplicity by two-sided rank inversion; compare exact supported counts and combinatorial bounds.

Executed locally: Python 3 with SymPy (ZZ Smith normal form, exact rational rank); command `python /mnt/data/s030_band_check.py`. Locally executed source SHA256 `ae2d054fc3dbf4cce1a458404d6eebffa585935b6de501e7527ac6b218d30f1d`; canonical indented JSON output SHA256 `853ae3e6aef92df44ada32ab16ca5550569bd4706f248b66c34dffcc66716ed6` (trailing digest line excluded). Checks:

| (m,n) | vertices | supports | pairs SNF | band inversions | result |
|---|---:|---:|---:|---:|---|
| (3,2) | 9 | 19 | 36 | 2 | all PASS |
| (4,2) | 16 | 37 | 100 | 6 | all PASS |
| (4,3) | 64 | 136 | 1000 | 9 | all PASS |
| (5,2) | 25 | 61 | 225 | 12 | all PASS |

All source code is archived in `scripts/s030_band_check.py`, captured output `sessions/S030/certificates/band_check.stdout`. The script enumerates *one deterministic family of mixed witnesses*, not every integer diagram or each prime. All-prime work is algebraic unit Smith criterion in MATHEMATICS; no finite p sampling proves universal decomposition. No Lean/Palomar, no R5 search, no remote mathematical workflow.