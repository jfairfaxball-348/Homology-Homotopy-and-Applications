# S152 PROOF — certified transport coherence and unresolved global x square

Entry main `de490c270c56820f067a79e6605392bbbb72a0a2`, tree `1681d616d24140d5d8261280c153a08d909527b4`, S151 ordinary two-parent PR #183 merge independently verified, post-merge main Lean #40683178115 and integrity #40683178221 both SUCCESS. S152 separately owner-invoked. Frozen C4 first-paper claim unchanged.

The new `integerObject_cast_commutes i j h hi hj` proves equality of genuine `ModuleCat B` morphisms:
`eqToHom (congrArg integerObject h) ≫ eqToHom (integerObject_nonnegative j hj) = eqToHom (integerObject_nonnegative i hi)`.
Its inverse counterpart supplies the reverse cast square. Both proofs substitute the integer index equality and discharge via categorical identity simplification; these are statements about actual objects, not numerical surrogates.

The separate `regularCastSquare` theorem says that any equation `a ≫ b = c ≫ d` of endomorphisms of the genuine regular B-module remains a categorical commuting square after independent object-equality transports at its four vertices. The proof eliminates all four object equalities and reuses the supplied core square. Together these are reusable, kernel-certified transport lemmas for exactly the positive-degree cast issue.

**Certificate:** scratch source `95713fae7dfed8a9d940c22f8485d34db5fb641f`; pinned `lake build` action #40692032018 SUCCESS, integrity action #40692032025 SUCCESS. No sorry/admit/axioms and unchanged Lean/mathlib pin.

**Unresolved:** S151's positivity branch `n ≥ s+1` of `globalXComponent_naturality` remains blocked by compositional dependent `eqToHom` sandwiches when translating the actual `integerShiftResolution` differential. Core `regularDx_commute` is already certified. Two S152 direct attempts (#40691333015, #40691710480) failed at this same typed equality despite `ModuleCat.hom_ext` and linear-map extensionality; isolated separate scratch integration #40692341564 was NOT used as a certificate here. Therefore the global chain-map and all real metric theorems are not claimed.

No novelty/fit/prior-art/outside review, other candidate or OptionD, registry, arXiv, HHA submission, public release or third-party contact.
