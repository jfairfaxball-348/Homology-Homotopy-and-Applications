# S026 actually executed local computations; finite scope / reproducibility
Environment: container Python 3 standard library for AW and gap, plus separate independent developmental SciPy/NetworkX screen. The committed certificate scripts use Python>=3.10 stdlib ONLY. Local read-only Git clone failed DNS "Could not resolve host github.com"; scripts were executed against a locally transcribed EXACT 36-line TETRA fixture from live scripts/s020_certificate.py (local s020 stub only), not byte-for-byte execution of original hosted S020 script. The committed scripts parse that same frozen TETRA from the actual repository on checkout. No need for network to rerun:
  python scripts/s026_cofiber_aw.py
  python scripts/s026_exact_gap.py
  python scripts/s026_k66_certificate.py

Independent local AW command `python /mnt/data/hha_s026/s026_cofiber_aw.py`, source SHA256 `366108791a5c752e1bf0704d38c7e2101ca7b51618b96bcc26321acb781a2055`; captured output SHA256 `5ecb0e75f596c1ec5a2e198d2870749765ad465b538f6c2c876791e851ddd1ea`. Output (exact, not floating):
```
{"AW_pairing": null, "R3": 4554, "R4": 2916, "all_R4_cycle": false, "cup_cochain_support": 0, "cup_nonzero": false, "d3_rank": 2375, "edges": 1572, "fvector": [182, 1572, 4434, 5418, 2916, 540], "graph_sha256": "8cce60227b889db047c72e1bb73aaff6b27448d58097e8ebeaed58286c7d0a23", "map": "g", "short": 644, "source_primitive_support": 0, "vertices": 182}
{"AW_pairing": 1, "R3": 3168, "R4": 1440, "all_R4_cycle": true, "cup_cochain_support": 1, "cup_nonzero": true, "d3_rank": 1439, "edges": 1524, "fvector": [182, 1524, 3936, 4032, 1440], "graph_sha256": "ca062fbabeffacdb4f05af32135adb85e01f5368b17bbe36fdc705b53732c351", "map": "f1", "short": 644, "source_primitive_support": 206, "vertices": 182}
S026_EXACT_F2_TOTAL_COFIBER_AW_PASS
```
Every ordered chain and every relative 4-simplex enumerated; exact mod2 cochain system and all cofaces, no sampling. The alternate original longer local code independently yielded same mod2 outcomes; compact committed script checked fresh.

Local exact gap: `python /mnt/data/hha_s026/s026_exact_gap.py`, SHA256 `2fdae1cc7d30ffbbecf0b65085bbfcfc4f94b06433d3d70b8f9bdec55c1c84cf`, output SHA256 `eb93c010c7cd8c82f3a84a79ed3509ee03a2faae4b367b4764ff6caee119df15`. Output:
```
{"all": "ARITHMETIC_PASS_ONLY", "enhanced_bound": "1/145603", "epsilon": "1/18200", "height": true, "lower_event_q0": true, "lower_event_q1": true, "old_bound": "1/582400"}
```
No machine homotopy-interleaving proof, just exact arithmetic.

Local exact necessary K6,6: `python /mnt/data/hha_s026/s026_k66_certificate.py`, SHA256 `a06c7fae50078dfb3b915ebea8b27cbdd6f89b1a37e80977279575812d772b38`, output SHA256 `33abf11ebc7b1cb1325cf386f149b954855783febc6af4decf5abe7de99b45da`:
```
{"graph": "null_g", "has_induced_K66": false, "potential_pair_edges": 21, "screened_pairs": 324, "tested_candidate_6sets": 0}
{"graph": "hopf_f1", "has_induced_K66": false, "potential_pair_edges": 36, "screened_pairs": 288, "tested_candidate_6sets": 28}
S026_EXACT_NO_INDUCED_K66_PASS (NOT R5 UNSAT)
```
Exact finite bitset/relation/matching enumeration. Exhaustive six-cliques only in necessary-pair graph; proof of completeness MATHEMATICS. This does NOT test 16471 d5 distance inequalities or infer feasibility.

S020/S022/S023/S024/S025 scripts NOT replayed byte-for-byte in this local runtime. Main hosted S025 Action38402659398 success static governance only; no hosted AW/job check as of entry. No Lean build, Palomar verification or external source data downloaded to local Python.
