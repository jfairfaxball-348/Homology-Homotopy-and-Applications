# S031 executable finite checks and reproducibility
Runtime actually used: Python 3, SymPy 1.14.0, deterministic random.Random. Code scripts/s031_integer_extract.py, same bytes available as session artifact. Local command: python /mnt/data/s031_extraction.py. Program source SHA256 c2cf09879493cefe1fcb92abde94717541fe14f99ae414784b71f985edbf2a54; stdout SHA256 c9a80127be0b36139fca72c9be92340af5925fd084c1633240d3a9ad1718a01b. Each direct-sum witness is sheared independently by explicit unimodular integer row operations at every vertex; the extractor receives only maps, never the hidden block labels except for a FINAL multiplicity comparison. It computes simultaneous bottom kernels, image sections, joint H+I integer projections, natural inclusions/retractions, residual integer kernels, unimodular stalk complements, and final natural birth bases. It checks all comparable pairs at every split and recovered multiplicities. It does *not* discover arbitrary integer input modules nor prove all-prime universal correctness; the hidden construction certifies the input hypotheses for these selected cases.

| Axes | Vertices | All comparable pairs | Chosen mixed blocks | Actual nonzero splits | Final births | Result |
|---|---:|---:|---:|---:|---:|---|
| 4x4 | 16 | 100 | 11 | 8 | 3 | PASS |
| 4x4x4 | 64 | 1000 | 14 | 11 | 3 | PASS |
| 3x5 | 15 | 90 | 9 | 6 | 3 | PASS |

Integer Smith example independent of extractor: d1=[[1,-1],[0,-2]] has Smith diag(1,2), rational rank2 and mod2 rank1, giving H0=Z/2 and H1(F2)=F2. Local SymPy command computed all displayed entries. Exact mathematical argument extends replacement 2->any prime, so no finite tested prime set certifies the universal hypothesis. Finite cube SNF theorem itself is proved symbolically using UCT, not validated by this small finite campaign. Source code notes: unimodular reducer asserts required unit invariants for constructed witnesses; no warranty for arbitrary nonpure input. Zero hosted CI must never be called proof.
