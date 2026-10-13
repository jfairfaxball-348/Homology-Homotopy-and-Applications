# S021 computation and independent checker audit

## Exact scope and completeness
Set-based reconstruction of all 36 tetrahedra and all 168 nonempty K faces, 14 target faces; full directed order relations and all 182·181/2=16471 unordered pairs each mode; directed relation transitivity checked exhaustively. Enumerated **all** flag cliques via networkx.enumerate_all_cliques and computed boundary ranks by independent GF2 bitset elimination. Recomputed full 72 triangle coboundary identity, 36-tetra 3-cycle and Alexander–Whitney pairing, 12 vertex links, 58 elementary collapse pairs. The given ten-edge cochain was verified independently; not invented afresh. Python 3 environment, numpy 2.3.5 and networkx 3.6.1 for auxiliary checks; standard-library-only repaired replay preserved in scripts/s020_certificate.py. The original S020 replay did not implement the null map, despite recording its SHA honestly.

## Real, completed outputs
- S020 BUGGY null graph digest: `138695182181e0bbb370e866fe081fe50403aa242266a24de715a2aaf641f5c3` (NOT correct null poset).
- CORRECT f0 digest: `65deabfaed606db2d756b38569de169bef073e32c388a774fe23de6d20e66741`, edges2244, short644; upper clique f=(182,2244,10992,26352,32976,20736,5184), GF2 ranks=(181,2063,8928,17424,15552,5184).
- f1 digest: `ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351`, edges1524, short644; upper clique f=(182,1524,3936,4032,1440), GF2 ranks=(181,1343,2592,1440).
- Both top Betti0=Betti2=1, others zero; degree2 cochain Hopf pairing −1; 58 free-pair collapse, links12.
- Anchored 181×181 Gram minimum numerical eigenvalue: buggy .49958003, corrected f0 .49960330, f1 .49961064; maximum numerical Cholesky residual <6×10^-16. Analytic centered Gram on 1⊥ ≥99/200; numerical evidence NOT substituted for exact proof.
- Components counts both: LOW/short 52, ALL/short 66, LOW/mid1, ALL/mid1.

Locally executed scripts: `python /mnt/data/hha_s021/independent_checker.py` and `python /mnt/data/hha_s021/topology_checker.py`. SHA256 of independent_checker.py: 8c17532bae9d17a2e400a22e7fe5fb9ef086770b9c07d7150109760d90699b11; output JSON f860b03882097adb3d17b3d673f15956fde9247c802397573c98993415a1ae7f; topology_checker.py fa3b89cf1f6af1cc346a1eda9c1bfecfbd06bdf984183464350dd689fe8c9031, topology output 69c2bd7501f4d249e32a2ad87cc5d0f08aa9dddfbbdc4320d97c3b438c7f613f. Independent source files reside in session conversation attachment space; the repository repair source is scripts/s020_certificate.py. Hosted CI checks static schema only, not these mathematical computations unless separately configured and observed.

Limits: NO independent full chain-level cup diagonal on the huge mixed cofiber; NO exhaustive π_j computation, NO small-d optimization exhaustive search, NO Lean/Palomar, NO verified originality. Exactness of rational distances follows symbolic construction; floating Cholesky only independently corroborates it.
