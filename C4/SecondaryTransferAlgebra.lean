module
public import C4.TerminalComponent

@[expose] public section

/-!
# S167: the algebra of secondary transfer corrections

This file kernel-proves the exact ordered (noncommutative) correction
identity underlying the degree-two secondary homotopy transfer in
characteristic two. It intentionally does NOT identify arbitrary
chain-complex degree-shifted families with elements of one ring.
The genuine all-integer typed realization is still a separate obligation.
-/

namespace C4

/-- In a differential algebra with the characteristic-two (unsigned)
Leibniz identity, the standard middle homotopy correction changes the
primary filler by precisely the new middle comparison. Products are
ORDERED, not commutative. -/
theorem transfer_primary_algebra
    {R : Type*} [Ring R]
    (D : R →+ R)
    (hLeib : ∀ a b : R, D (a * b) = D a * b + a * D b)
    (x y h k : R)
    (hx : D x = 0) (hy : D y = 0)
    (hh : D h = x * y) :
    D (h + x * k * y) = x * (1 + D k) * y := by
  simp only [map_add, hLeib, hx, hy, hh,
    zero_mul, mul_zero, zero_add, add_zero]
  noncomm_ring

/-- The TWO independent intermediate homotopy corrections in an actual
fourfold defining-system secondary equation. This is the ordered
differential-algebra identity, before representing the variables as true
componentwise degree-one/two chain maps. No strict inverse equations
or centrality of adjacent maps are assumed. -/
theorem transfer_secondary_algebra
    {R : Type*} [Ring R]
    (D : R →+ R)
    (hLeib : ∀ a b : R, D (a * b) = D a * b + a * D b)
    (x0 x1 x2 h0 h1 z k1 k2 : R)
    (hx0 : D x0 = 0) (hx1 : D x1 = 0) (hx2 : D x2 = 0)
    (hh0 : D h0 = x0 * x1) (hh1 : D h1 = x1 * x2)
    (hz : D z = h0 * x2 + x0 * h1) :
    D (z + h0 * k2 * x2 + x0 * k1 * h1 +
        x0 * k1 * x1 * k2 * x2) =
      (h0 + x0 * k1 * x1) * (1 + D k2) * x2 +
        x0 * (1 + D k1) * (h1 + x1 * k2 * x2) := by
  simp only [map_add, hLeib, hx0, hx1, hx2, hh0, hh1, hz,
    zero_mul, mul_zero, zero_add, add_zero]
  noncomm_ring

end C4
