module
public import C4.RealShoelaceBarIndices

@[expose] public section

/-!
# S174 continuation: genuine B-linear total graded terms

The unnormalised bar replacement for an arbitrary functor on the
ENTIRE two-lane real shoelace preorder has, in total homological
degree k, the direct sum of the actual underlying B-modules
D(q₀)_(k-n), for all n ≥ 0 and all weak chains q₀ ≤ ... ≤ qₙ ≤ p.

These are the proposed bar's actual coefficient modules, not an
unproved complex, differential, augmentation or quasi-isomorphism.
-/

namespace C4
open CategoryTheory

/-- The *actual* degree-k direct sum of B-linear source modules,
rather than a surrogate collection of generator labels. Both lanes
and every real endpoint appear in the dependent sum. -/
noncomputable def realShoelaceBarTerm
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    (p : RealShoelacePoint ε hε) (k : ℤ) : ModuleCat B :=
  ModuleCat.of B
    (DirectSum (RealShoelaceBarIndex p)
      (fun i => (D.obj i.2.first).X (k - (i.1 : ℤ))))

end C4
