# S034 preregistered finite experiment and reproducibility

**Exact domain:** E=12 oriented nearest-neighbour edges of 3×3 grid, 4 square faces, each edge labelled 0/1. Full 4096 binary assignments. A label closes iff every face has XOR=0; independently generate 2^8 potentials on remaining vertices with p00=0 and take edge differences. This is 4096+256 exact finite cases; no truncation, floating-point or sampled primes.

**Initial independent JavaScript check actually executed in connector runtime** (node-independent V8): returned vertices9, edges12, faces4, assignments4096, closed256, potentials256, uniquePotentialPatterns256, equality=true. The exact JS edge-indexed face listing was [[0,6,1,2],[2,8,3,4],[5,10,6,7],[7,11,8,9]]. Code and output were generated during S034. Separate archived Python script `scripts/s034_shear_grid_check.py` is a full deterministic reproducer; its running status should be reported only if executed and recorded separately. No topology inference from finite arithmetic.

**Mathematical proof independently of enumeration:** cellular 1-cocycle rank=E−(V−1)=12−8=4, since rectangle is contractible; kernel size2^(12−4)=256, and 2^8 normalized vertex potentials give exactly this kernel. Proof in MATHEMATICS. Distinct enumerators test arithmetic only; not external verification.
