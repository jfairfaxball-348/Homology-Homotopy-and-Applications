# S052 COMPUTATION — preregistered finite sanity checks ONLY

Input ten cases: (5,2),(8,3),(7,3),(9,4),(10,4),(11,4),(12,5),(13,5),(21,8),(31,12). For each (r,s), L=5s, evaluate every j=0..L−r−1, each of 3 zero-coordinate words, 3 on-image collision slots, and 4th unmodified identity coordinate. Checker A executes coordinate operations on bit1; checker B computes independent set intersections with each prescribed edge interval. Both agree. No random trials or exhaustive sphere search. Python 3 standard library; local command:

```
python3 validation/S052/collision_saturation.py | tee validation/S052/collision_saturation.stdout
sha256sum validation/S052/collision_saturation.py validation/S052/collision_saturation.stdout
```

Source SHA256: `06c9a8b5d6f2be32ab8392222cdc969af13b5e189970369b329224b55787005c`.
Stdout SHA256: `edfc9b2935d75026fb2b7d1c47e02c05b28c9e6eb78c64e9df5b66df63ac33f9`.
Local exact stdout file provides each edge list and PASS. The symbolic theorem (T127–T129) is independent of these finite checks; no Top CW grid, hidden sphere map or relative obstruction calculation was performed. Hosted CI only checks static governance; do not mistake either test for mathematical formalisation.
