module
public import C4.SecondaryTransferAlgebra

@[expose] public section

/-!
# Genuine homogeneous all-integer chain-complex component families

A degree-k family has genuinely typed components P.X n ⟶ Q.X(n+k)
for EVERY integer n. Composition is ordered and its integer target
transport is part of the definition. Its homological differential has
degree k-1 and uses the actual source and target differentials.

This is infrastructure for implementing the S167 secondary correction
in true ChainComplex (ModuleCat B) ℤ morphisms, rather than in a
scalar coefficient ring. No dg-Leibniz theorem is asserted here.
-/

namespace C4

open CategoryTheory

/-- A homogeneous degree-k family of actual B-linear maps on every
integer degree. In contrast with an unrestricted two-index collection,
there are no off-degree components to supply or silently assume. -/
structure HomogeneousFamily (P Q : C4Complex) (k : ℤ) where
  hom : ∀ n : ℤ, P.X n ⟶ Q.X (n + k)

/-- Embed a genuine chain map as a degree-zero family. -/
def HomogeneousFamily.ofChainMap {P Q : C4Complex} (f : P ⟶ Q) :
    HomogeneousFamily P Q 0 where
  hom n := f.f n ≫ eqToHom (congrArg Q.X (by omega : n = n + 0))

/-- Retain the real degree-one component of an actual Mathlib homotopy. -/
def HomogeneousFamily.ofHomotopy {P Q : C4Complex}
    {f g : P ⟶ Q} (h : Homotopy f g) :
    HomogeneousFamily P Q 1 where
  hom n := h.hom n (n + 1)

/-- Genuine ordered composition of homogeneous families, including the
non-definitional integer target equality n+p+q = n+(p+q). -/
def HomogeneousFamily.comp {P Q R : C4Complex}
    {p q : ℤ} (f : HomogeneousFamily P Q p)
    (g : HomogeneousFamily Q R q) :
    HomogeneousFamily P R (p + q) where
  hom n := (f.hom n ≫ g.hom (n + p)) ≫
    eqToHom (congrArg R.X (by omega : (n + p) + q = n + (p + q)))

/-- The homological Hom differential on a degree-k family; it is a
degree-(k-1) family made from the two actual complex differentials.
Characteristic two means the graded sign is positive. -/
def HomogeneousFamily.d {P Q : C4Complex} {k : ℤ}
    (f : HomogeneousFamily P Q k) :
    HomogeneousFamily P Q (k - 1) where
  hom n :=
    ((P.d n (n - 1) ≫ f.hom (n - 1)) ≫
      eqToHom (congrArg Q.X
        (by omega : (n - 1) + k = n + (k - 1)))) +
    ((f.hom n ≫ Q.d (n + k) (n + k - 1)) ≫
      eqToHom (congrArg Q.X
        (by omega : n + k - 1 = n + (k - 1))))

/-- The actual degree-two family from any general five-object defining
system; no coefficients, finite degree cutoffs or sample indices. -/
def FiveStageSecondaryData.firstSecondaryFamily
    (q : FiveStageSecondaryData) :
    HomogeneousFamily q.primary.P0 q.primary.P3 2 where
  hom n := q.z03 n (n + 2)

/-- Likewise the independent second secondary coherence. -/
def FiveStageSecondaryData.secondSecondaryFamily
    (q : FiveStageSecondaryData) :
    HomogeneousFamily q.primary.P1 q.primary.P4 2 where
  hom n := q.z14 n (n + 2)

end C4
