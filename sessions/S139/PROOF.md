# S139 — all-degree periodic coefficient resolution: exact mathematical scope

**Entry main:** 8f35e0104e5d74490f11f773da721ea7faa3af72, tree 297d76d25f86ea906df0c9e999d0bcdf61ae394b (S138 PR #165 ordinary two-parent merge). ONE frozen target, no target comparison.

## Coefficient theorem proved for every degree
Use the coordinate algebra C4.B defined in S138; n≥0 means differential at homological degree n+1. Define
d(n)=t for even n and t³ for odd n,
x(n)=1 for even n and t² for odd n,
h(n)=0 for even n and t for odd n,
z(n)=0 for even n and 1 for odd n.

The Lean theorem names in C4/Periodic.lean are:
- `d_squared n`: d(n)d(n+1)=0 for ALL n;
- `exact_positive n a`: d(n)a=0 iff a=d(n+1)b for some b∈B for ALL n and ALL a;
- `Dx_zero n`: d(n)x(n+1)+x(n)d(n+1)=0 for ALL n;
- `Dh_xx n`: d(n)h(n+1)+h(n)d(n+1)=x(n)x(n+1) for ALL n;
- `Dz_xh_hx n`: d(n)z(n+1)+z(n)d(n+1)=x(n)h(n+1)+h(n)x(n+1) for ALL n;
- `terminal_unit n`: x(n)z(n+1)+h(n)h(n+1)+z(n)x(n+1)=1 for ALL n.

The proof splits n modulo 2 (omega). Each parity case reduces to one explicitly proved coefficient identity. The kernel/image equalities follow exactly from S138 `ann_t` and `ann_t3`; there is no degree bound. The proof includes n=0 (corresponding to d₁ and d₂) rather than relying on eventual periodicity. The quotient augmentation and negative-degree zero terms are NOT constructed as categorical data in this session.

## Adversarial boundary: what this does NOT prove
These are finite-coefficient identities universally quantified over the infinite NATURAL INDEX SET, not yet a genuine `CommRing C4.B`, `RingEquiv` to k[t]/(t⁴), `ChainComplex (ModuleCat B)`, actual shifts, `dg-Hom` definition, complete all-choice fourfold operation or either full-real derived/strict metric theorem. The selected `terminal_unit` is NOT complete-choice exclusion; S138 `universal_terminal_not_boundary` supplies only local low-degree implications. Need a typed extraction from arbitrary global defining systems to its hypotheses. No mathematical theorem in the draft is weakened to conceal these gaps.

## Reproducibility
The S138 source `C4/Jets.lean` was made a genuinely exported public module with closed parity certificates added, so C4/Periodic can cite the ring-like coefficient arithmetic across modules. No `sorry`, `admit` or new axiom. `C4.lean` imports both modules; both pinned C4 and archived OptionD are CI targets. See BUILD.md for actual scratch and outgoing run facts.
