module

public import OptionD.Kernel

public section

/-!
# S122: exact double-centering recovery

For symmetric hollow squared-distance data, double centering recovers
every squared distance entry. This identity will be applied to actual
Euclidean point coordinates only after Gram factorisation is proved.
-/

namespace OptionD

/-- The centered Gram retains the precise squared distance matrix,
not merely the sign pattern of its off-diagonal entries. -/
theorem d1_centered_distance_recovery (N : ℕ)
    (edge : Fin N → Fin N → Prop)
    (hsym : ∀ i j, edge i j ↔ edge j i) (i j : Fin N) :
    d1CenteredGram N edge i i + d1CenteredGram N edge j j -
        2 * d1CenteredGram N edge i j =
      d1SquaredDistance N edge i j := by
  have hcolrow (k : Fin N) :
      (∑ t : Fin N, d1SquaredDistance N edge t k) =
      (∑ t : Fin N, d1SquaredDistance N edge k t) := by
    apply Finset.sum_congr rfl
    intro t ht
    exact d1_squared_distance_symmetric N edge hsym t k
  rw [d1_centered_gram_formula N edge i i,
      d1_centered_gram_formula N edge j j,
      d1_centered_gram_formula N edge i j]
  rw [d1_distance_diag N edge i, d1_distance_diag N edge j]
  rw [hcolrow i, hcolrow j]
  ring

end OptionD
