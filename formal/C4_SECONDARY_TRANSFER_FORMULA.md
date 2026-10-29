# S166 — explicit transfer of degree-two C4 secondary fillers

**Mathematical implementation blueprint — NOT a Lean-certified transfer theorem.**
The five-object arbitrary secondary data and the C4 no-tertiary-filler result
are formalized separately in `C4/FiveStageSecondary.lean` and
`C4/TerminalComponent.lean`. This note isolates the *missing* actual
chain-homotopy-equivalence transfer construction. Do not treat it as an
assumed bridge or a completed metric argument.

## Data and conventions

For each of five chain complexes, let
`a_i : Q_i → P_i`, `b_i : P_i → Q_i` be chain maps, and let
`K_i : P_i → P_i[+1]` be the genuine degree-one Mathlib homotopy
between `b_i a_i` and `1_{P_i}`. In the C4 characteristic-two
chain-complex setting, using the homological Hom differential `D`,

`D K_i = b_i a_i + 1`.

Let the original four closed adjacent maps be `x_i : P_i → P_(i+1)`.
Let `h_i` (for i=0,1,2) be the degree-one primary fillers, with
`D h_i = x_i x_(i+1)`. Let `z_i` (i=0,1) be the original degree-two
secondary fillers, with

`D z_i = h_i x_(i+2) + x_i h_(i+1)`.

Composition is written in source-to-target order and **is not**
commutative. The subscript of a filler denotes the leftmost stage.

## Actual candidate transfers

Transport adjacent arrows by

`X_i = a_i x_i b_(i+1)`.

The transferred primary, matching the correction in the already-certified
S165 `transferPrimary`, is

`H_i = a_i [h_i + x_i K_(i+1) x_(i+1)] b_(i+2)`.

For each i=0,1, the explicit secondary family to implement in Lean is

`Z_i = a_i [z_i + h_i K_(i+2) x_(i+2) + x_i K_(i+1) h_(i+1) + x_i K_(i+1) x_(i+1) K_(i+2) x_(i+2)] b_(i+3)`.

Every displayed term of `Z_i` has homological degree **two**. This
formula uses genuine **middle inverse homotopies** at two different
objects, rather than assuming `b_i a_i = 1` strictly.

## Differential algebra check to port into Lean

Write `T_i = b_i a_i = 1 + D K_i`. The required right-hand side is

`H_i X_(i+2) + X_i H_(i+1)`, i.e. between `a_i` and `b_(i+3)`,

`[h_i + x_i K_(i+1) x_(i+1)] T_(i+2) x_(i+2) + x_i T_(i+1) [h_(i+1) + x_(i+1) K_(i+2) x_(i+2)]`.

Using the characteristic-two Leibniz rule and `D x_i = 0`,

- `D(z_i) = h_i x_(i+2) + x_i h_(i+1)`;
- `D(h_i K_(i+2) x_(i+2)) = x_i x_(i+1) K_(i+2) x_(i+2) + h_i (D K_(i+2)) x_(i+2)`;
- `D(x_i K_(i+1) h_(i+1)) = x_i (D K_(i+1)) h_(i+1) + x_i K_(i+1) x_(i+1) x_(i+2)`;
- `D(x_i K_(i+1) x_(i+1) K_(i+2) x_(i+2)) = x_i (D K_(i+1)) x_(i+1) K_(i+2) x_(i+2) + x_i K_(i+1) x_(i+1) (D K_(i+2)) x_(i+2)`.

Adding these four equalities recovers exactly the expansion of
`H_i X_(i+2) + X_i H_(i+1)`.

## What still must be proved, not assumed

1. Define composition, addition and `D` for honest degree-one/two
   all-integer component families on arbitrary C4 chain complexes, with
   support and correctly typed index casts. Prove the necessary graded
   Leibniz equalities in pinned Lean.
2. Identify the S165 transported `Homotopy.hom` families with `H_i`
   above, preserving their actual endpoint equations.
3. Instantiate both `Z_0` and `Z_1` as genuine typed degree-two
   families and prove their two exact `FiveStageSecondaryData`
   coherences with **no** added assumptions.
4. Derive the tertiary comparison/boundary from a hypothetical strict
   square-zero replacement chain, then use
   `GlobalFourfoldDefiningSystem.no_tertiary_filler`. The higher
   correction at degree three must also be constructed, not presumed.
5. This finite-chain comparison still does **not** cover arbitrary
   whole-real both-lane objectwise quasi-isomorphism zigzags, shoelace
   replacement, derived two-shift or metric bounds.

These formulas are a specific next implementation target, not a
proof of the frozen metric theorem. No OptionD work, novelty screening,
outside review or publication actions.
