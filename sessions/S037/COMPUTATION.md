# S037 exact finite diagnostic, properly scoped
Preregistered P={0,…,15}, sparse A={0,3,7,11,15}; enumerate all 136 contiguous finite intervals Q=[lo,hi]. Compute EACH left Kan quotient at every critical level by explicit GF2 relations x_p=x_q for p<=q inside cut and x_p=0 if q lies beyond Q. Independently test every image has dimension ≤1 and its support is a single consecutive interval in A. This tests the *discrete one-dimensional Kan lemma* only; 2D follows algebraically from tensor of left Kan colimits, not an enumerated 2D run. No topology/Toda proof or general complexity certified.

Executed 2026-10-14 Python3: `python /mnt/data/hha_s037_kan_test.py | tee /mnt/data/hha_s037_kan_test.stdout`. Source SHA256 df31dfeb8137c2cec23c8ceed2004b24814b5a98cea12807672c3194ffed6685; stdout SHA256 7aa8a782163e843fad9f46e55f097722e11cdb81bc6a4c24854c3cb32c0049fe. Output:
```
PASS 1D left Kan rectangular support; explicit GF(2) colimit; intervals 136 critical levels 5
Product of two such left Kan calculations is a rectangle because colimits over products commute with field tensor product.
BOUNDARY [1,5]: [1, 0, 0, 0, 0]
BOUNDARY [1,6]: [1, 1, 0, 0, 0]
BOUNDARY [1,7]: [1, 1, 0, 0, 0]
```
The tensor statement in stdout is a mathematics observation, not a separately executed finite check. Run is a finite falsification aid, not a substitute for categorical proof. Source included in scripts/s037_kan_test.py.