# S050 finite registration and two independent checkers

Pre-registered in PLAN: ALL 2^9 internal-arrow id/constant-zero words on pointed interval diagrams (L=10,r=5) and ALL 2^14 such words (L=15,r=8), plus exact r/s tail-index arithmetic for all reduced 1<=s<=16, 2s<r<3s. No objects here have the homotopy type of a noncontractible sphere. Each nonterminal vertex I=[0,1] pointed at 0; both id and constant 0 maps are WEs since I is contractible. Terminal K_L is literal point. Thus the finite class is complete by definition, but says nothing about other Top maps or WE replacement to A^s.

Independent implementations: checker A folds the exact functions on inputs 0,1 and detects whether output is [0,0]; checker B checks whether the discrete word contains any constant-zero edge, an elementary independent correctness proof for the restricted monoid. Both assertions agreed on every tested word and every constrained j.

Executed with Python 3 standard library via \`python /mnt/data/s050_grid_toys.py > /mnt/data/s050_grid_toys.stdout\` (working-container paths, not GitHub paths). Script SHA256 \`82bc604701193523648d13b221153a3b35b31a6d941268e9e0cbdf154c2f0632\`; stdout SHA256 \`ca8d9ae883580c37f060f00f3a5f7153b6c61b76e1861f8843e5eee91dcf622b\`. Repository mirrors at validation/S050/grid_toys.py and grid_toys.stdout; verify raw byte SHA independently before treating those hashes as corresponding to remote blobs.

Results: endpoint 472/512 diagrams satisfy only j0,j2,j4; example z indices [0,6] violates j1 and [2,8] violates j3. At 4/3, 16208/16384 diagrams satisfy only j0,j3,j6; violations for j1 [0,10], j2 [1,10], j4 [3,13], j5 [4,13]. (All omitted constraints were separately violated in some primary-satisfying toy diagram.) All reduced tail pairs in declared finite range satisfied is < L-r and (i+2)s < is+r < (i+3)s. Final script assertion PASS. Symbolic proofs in MATHEMATICS do not depend on these checks.

The actual full stdout is mirrored, not a claim of enumerating any sphere maps or all rational grids. **Hosted governance is static and not mathematical verification.**
