# S150 PROOF — integer-indexed shifted C4 dg component constructors

Entry main `bea16028802dae24abe6b3b6bd0ae93e47f5325b` (S149 two-parent merge). Complete theorem remains frozen and not certified.

Source C4/ShiftedDG.lean certifies, for every integer s,n, actual B-linear morphisms `globalXComponent s n` between `integerShiftResolution s` and `integerShiftResolution (s+1)`, together with degree+1 fillers `globalHComponent s n` and `globalZComponent s n` into shifted complexes s+2/s+3. The definitions cover all integer degrees, including negative and zero endpoint terms, by zero morphisms where target is zero. The characteristic-two `regularDx_commute` theorem converts the previously certified all-natural-degree categorical D x=0 equality into the equality required of regular B-module maps. `integerResolution_d_transport` closes the dependent eqToHom transport through index arithmetic.

**Verified:** exact scratch source `553f990b228ea9b5b072e8bba5649861f7293374` with Lean #40676684048 SUCCESS, static integrity #40676683857 SUCCESS, no sorry/admit/axioms, pinned toolchain/manifest.

**NOT verified:** the chain-map naturality proof `globalXComponent_naturality`, a genuine `globalXChainMap`, all global dg h/z equations, full arbitrary-choice homotopy-equivalence invariance, construction of whole-real F and all numeric distance inequalities. The scratch branch s150-global-chainmap-test contains attempts only and is NOT promoted. The theorem is not finished.
