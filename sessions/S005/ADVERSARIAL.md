# S005 adversarial and false-generalization tests

**Critical validation:** The claimed improvement requires ONE primitive *joint* map δ_A, not individual primitive lower maps. If a01=×3 and a10=×2, δ=(2,−3) has a left inverse because 2(−1)+3(1)=1, despite neither individual arrow splitting. The upper A maps ×3 and ×2 commute. The B identity square and M=(1,2,3,6) commute on all four edges. Integral coker groups are exactly 0, Z/2, Z/3, Z/6; H3=0.

**Attack 1:** “Joint injectivity is enough” FALSE. δ=(2,−4) injective but quotient torsion Z/2. MV forces torsion H2(U1,10∪U1,01), which cannot embed as such in a 3D top U1 with H3=0 and free H2; T12 rules it out.

**Attack 2:** “Two zero arrows can be repaired in 3D” FALSE. Two D3 containing common S2 yield S3 at the join, and a 3D H3-free top cannot contain it; explicit D4 fill is possible in dimension four.

**Attack 3:** “A top Y mapping cylinder on its 3D latching union is still 3D” FALSE. It generally produces 4-cells. T13 instead attaches top 2-spheres and only 3-cells, using the split joint δ to obtain H2(V_Y) free and H3(V_Y)=0.

**Attack 4:** “Any integral H2 matrix automatically extends literal 2-parameter maps” FALSE without topology. T13 uses B nested rose generators, common basepoint suspension spine, two disjoint lower Y cylinders, strict agreement on S00, top 2/3-cell enlargement and relative cellular representatives.

**Attack 5:** “The graph B condition is NECESSARY for all degree-pure total-3D covers” NOT PROVED. Naive U2-latching MV assumes cross-grade membership distribution that is not implied by K10∩K01=K00 for each labelled K. An edge can already belong to U2 at grade p yet enter U1 only at higher q, so U2,p∩Pq can strictly contain Pp. The universal nonprimitive B obstruction remains open.

**Attack 6:** Potential hidden π3 of the top Y. T13 only requires Y11 simply connected with π2=H2 by Hurewicz and H3=0. It never asserts Y11≃wedge S2 or existence of a 3D mapping cylinder over 3D input. Relative 3-cell classes have identity coefficients, making the new H3 zero.

**Attack 7:** H2 torsion in a 3D subcomplex of a 3D H3-free/H2-free-top K is impossible by the exact pair sequence, not because inclusion on H2 is automatically injective. T12 explicitly allows nonzero free kernels.

No mathematical finite enumeration, source-code computation, Lean, Palomar, manuscript, external action or novelty gate.
