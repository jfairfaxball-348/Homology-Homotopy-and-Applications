# S038 COMPUTATION — bounded exact diagnostics
**Preregistered finite scope:** finite chain P={0,...,10}, A={0,3,7}, all 66 nonempty P intervals, all 6 A intervals; use brute natural-transformation assignments over F2 (NOT formula-based Hom shortcuts) on P and A, and compare both sides of Hom_P(Q,rho^*R)=Hom_A(Lan_rho Q,R), 66×6=396 comparisons. Also form all 66²=4,356 rectangle tensor products on A and assert every resulting nonzero support is a Cartesian product. This is a finite directed-poset diagnostic only; it cannot reproduce no-maximal-element dense-real endpoint subtleties.

**Actual command:** python /mnt/data/hha_s038_cut_audit.py | tee /mnt/data/hha_s038_cut_audit.stdout; Python3 standard library; no randomization, all finite cases iterated.
**Executed source SHA256:** 25eb1ceb5c0cb741a8015fee2207c4d8a0db9de99942363381d6f8951405149e.
**Executed stdout SHA256:** 53a9f24b6544ac5ce6736fd4cc80eddec236eed588b0f07520f880a0412b9d51.
**Output:**
```text
PASS finite P=0..10 A=[0, 3, 7]; 1D intervals=66 Hom-adjunction comparisons=396; 2D rectangle products=4356
Nonaligned Q=[1,5]: naive critical restriction (0, 1, 0) Kan support (1, 0, 0)
Upper-in-gap Q=[1,4]: naive critical restriction (0, 1, 0) Kan support (1, 0, 0)
LIMIT: finite sampled index (terminal prefixes) does not certify dense-real open/closed cuts.
```
The script is archived as scripts/s038_cut_audit.py. Earlier first run failed due to a BUG in independent Hom enumerator naturality (used u(q) instead of u(p)u(q) for source transition); this was fixed and the above hashes are for the corrected rerun. No real-density, entire pd algorithm, statistical topology, CI or originality certified by this run.
