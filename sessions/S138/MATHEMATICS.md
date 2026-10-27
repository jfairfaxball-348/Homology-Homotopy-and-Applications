# S138 MATHEMATICS — precise certified scope

Frozen INTERNAL theorem (unchanged): B=F₂[C₄]≅F₂[t]/t⁴, five-stage F:ℝ→Ch(right B), d_CohI(F,0)=1/2 < d_IHC(F,0)=1 <5/4≤d_HI(F,0)≤5/2, with arbitrary whole-real WE zigzags of BOTH lanes.

## Exact finite coefficient representation

`C4.B` is four coefficients `c0 c1 c2 c3 : ZMod 2`. Its additive operation is componentwise and multiplication is explicitly truncated convolution, matching arithmetic of (F₂[t])/(t⁴) at the coefficient level. `t`, `t2`, `t3`, `one`, `zero` are genuine coefficient vectors. Lean establishes t·t=t², t·t²=t³ and t·t³=t³·t=0. Lean also proves the coefficient description and existential *image ideal* characterisations of ann(t)=(t³) and ann(t³)=(t).

IMPORTANT LIMIT: An explicit four-coefficient structure with exact multiplication and annihilator identities is not yet a Mathlib `CommRing` instance nor a proved quotient-ring isomorphism. The ring-structure/isomorphism proof remains L1 and must not be quietly assumed when importing these lemmas into the eventual chain-complex category.

## Choice-universal n=2 theorem

For an arbitrary adjacent representative, `Adjacent a1 a2` expresses its unit residue and `t*a2+t³*a1=0`; Lean proves a₂ has zero coefficients of 1,t and coefficient 1 of t². For arbitrary primary fillers H, `Primary b1 a2 h1 h2` expresses `t*h2+t³*h1=b1*a2`; Lean proves h₂ has constant coefficient zero and t-coefficient one. For arbitrary secondary K, `Secondary c1 h2 j1 a2 k1 k2` expresses `t*k2+t³*k1=c1*h2+j1*a2`; Lean proves the constant coefficient of k₂ equals one. In particular `universal_terminal_residue` proves the terminal constant coefficient equals one for every admissible choice, and `universal_terminal_not_boundary` proves that no such terminal coefficient equals `t*f2+t³*f1` for any f₁,f₂. These theorems quantify over the entire finite coefficient type, not a selected x/h/z witness.

The selected degree-two x/h/z equations were also checked in Lean; infinite parity equations have not yet been lifted to an actual unbounded chain complex. This honest distinction separates proved *jet necessities* from the global fourfold bracket.

## Computation, exact and bounded

Exact unmodified S076 script `sessions/S076/check_c4.py`: Git blob SHA `4d22fec866c39d4cd5894b508e1410b4927b2b13`, SHA256 `52653eee774b5ad74a5b2d5375aae07fb66fed6bb9b0aa0531b6654563a22948`. Independent local Python 3.13.5 `python3 /tmp/check_c4.py` (exact copy, Git hash matches) yielded 39 degree checks n=2..40, 16 adjacent choices, 8192 primary choices, 524288 secondary choices, all PASS and terminal invariant PASS. Peak RSS about 95,632 KiB, elapsed 14.19 s. This does not enumerate arbitrary infinite defining systems or prove model-category metrics.

## Exact unproved L1/L2/L3 bridge

L1 needs a true coefficient ring/quotient isomorphism, actual unbounded free resolution P, shifts, x/h/z maps and homotopies for ALL degrees, an explicit complete fourfold defining-system type and transport from every actual chain-map choice to the certified n=2 hypotheses.

L2 needs projective diagram cofibrancy of the entire integer free-quiver cone and the complete (h,z) η₂ nullhomotopy (with terminal X₄→0 edge), then real Kan left Quillen and comparison. Evaluation at u=0 gives the derived lower bound.

L3 needs whole REAL shoelace projective replacement for arbitrary zigzags of both lanes, acyclic O-lane natural quotient, literal 2e-composite-zero, sampling 0,1,2+α,3+α,4+2α and fourfold homotopy transfer. Neither L2 nor L3 is Lean-proved. Manuscript §§4–5 spell obligations out, without pretending the finite coefficient certificate proves the distance inequalities.

No novelty, HHA fit, prior-art or external-review decision was made.
