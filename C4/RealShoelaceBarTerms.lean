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


/-- Degreewise inclusion of the *actual* direct-sum bar coefficients
when an arbitrary shoelace endpoint p increases to q.  Each source
coefficient is mapped identically into the summand with the very
same weak chain and its relaxed endpoint bound.  This is not yet
a chain map: the bar differential has not been defined. -/
noncomputable def realShoelaceBarTermInclusion
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    {p q : RealShoelacePoint ε hε} (hpq : p ≤ q)
    (k : ℤ) :
    realShoelaceBarTerm D p k ⟶ realShoelaceBarTerm D q k := by
  classical
  refine ModuleCat.ofHom
    (DirectSum.toModule B (RealShoelaceBarIndex p)
      (DirectSum (RealShoelaceBarIndex q)
        (fun j => (D.obj j.2.first).X (k - (j.1 : ℤ))))
      (fun i => ?_))
  rcases i with ⟨n, σ⟩
  exact DirectSum.lof B (RealShoelaceBarIndex q)
    (fun j => (D.obj j.2.first).X (k - (j.1 : ℤ)))
    ⟨n, realShoelaceBarInclusion hpq σ⟩


/-- The coefficient-level projection along a bar endpoint inclusion:
discard exactly those summands whose final vertex fails to lie below
p.  This is a B-linear *graded* retraction candidate, not a chain map. -/
noncomputable def realShoelaceBarTermProjection
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    {p q : RealShoelacePoint ε hε} (_hpq : p ≤ q)
    (k : ℤ) :
    realShoelaceBarTerm D q k ⟶ realShoelaceBarTerm D p k := by
  classical
  refine ModuleCat.ofHom
    (DirectSum.toModule B (RealShoelaceBarIndex q)
      (DirectSum (RealShoelaceBarIndex p)
        (fun j => (D.obj j.2.first).X (k - (j.1 : ℤ))))
      (fun j => ?_))
  rcases j with ⟨n, σ⟩
  by_cases h : σ.vertex (Fin.last n) ≤ p
  · exact DirectSum.lof B (RealShoelaceBarIndex p)
      (fun j => (D.obj j.2.first).X (k - (j.1 : ℤ)))
      ⟨n, ⟨σ.vertex, σ.ordered, h⟩⟩
  · exact 0


/-- At every integer degree and for every entire-real shoelace arrow,
the projection of summands back to the smaller endpoint retracts the
canonical coefficient-level inclusion.  This certifies a split
monomorphism of underlying graded B-modules (not yet of complexes). -/
theorem realShoelaceBarTermInclusion_retraction
    {ε : ℝ} {hε : 0 ≤ ε}
    (D : RealShoelacePoint ε hε ⥤ C4Complex)
    {p q : RealShoelacePoint ε hε} (hpq : p ≤ q)
    (k : ℤ) :
    realShoelaceBarTermInclusion D hpq k ≫
      realShoelaceBarTermProjection D hpq k = 𝟙 _ := by
  classical
  apply ModuleCat.hom_ext
  apply DirectSum.linearMap_ext B
  intro i
  apply LinearMap.ext
  intro x
  rcases i with ⟨n, σ⟩
  simp [realShoelaceBarTermInclusion, realShoelaceBarTermProjection,
    realShoelaceBarInclusion, DirectSum.toModule_lof, σ.last_le]

end C4
