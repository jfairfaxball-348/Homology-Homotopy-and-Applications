# S027 reproducibility ledger
An independent Python3 stdlib exact rational checker for the universal explicit distance/height gap was executed locally for N=5,14,182,500,2500. The list is finite SAMPLE COVERAGE ONLY: the all-N theorem is proved symbolically in MATHEMATICS, without relying on this data. The checker does not construct f_n, any K_n, relative AW, d5 coordinates, or compute dHI.
Command: python /mnt/data/hha_s027/s027_uniform_margin.py (the session script is also committed as scripts/s027_uniform_margin.py). Script SHA256 b7ab73bf8fb5d83316dcf6f32780ed47a27319067ef24b6ed36e04472bf4f4e5, stdout SHA256 6176756f8b20308749168c9722b8329bbf24e79b732bcc4abf16a4a15d0fd47d.
Output:
~~~
{"N": 5, "delta": "1/8000", "epsilon": "1/500", "gram": true, "height": true, "lower": true, "upper": true}
{"N": 14, "delta": "1/22400", "epsilon": "1/1400", "gram": true, "height": true, "lower": true, "upper": true}
{"N": 182, "delta": "1/291200", "epsilon": "1/18200", "gram": true, "height": true, "lower": true, "upper": true}
{"N": 500, "delta": "1/800000", "epsilon": "1/50000", "gram": true, "height": true, "lower": true, "upper": true}
{"N": 2500, "delta": "1/4000000", "epsilon": "1/250000", "gram": true, "height": true, "lower": true, "upper": true}
S027_EXACT_RATIONAL_SAMPLE_MARGINS_PASS (symbolic proof separate)
~~~
Each N check uses Fraction and exact squared-radical implication algebra for lower and upper event margins, height margin and Gram norm bound. No statistical uncertainty in finite arithmetic; no all-N exhaustive computation. Previous S026 full 182-graph F2 AW script and K6,6 census not rerun in this invocation. No local Lean, GitHub Actions scientific computation, Palomar or new numerical R5 search.
