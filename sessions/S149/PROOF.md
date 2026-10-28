# S149 PROOF — categorical dg identities, arbitrary local choices and actual shifts

Entry live remote main `cf91f71934762dc87bcd9bf5d4205a5576b252f2`, tree `64fb1ed8a9ac95133ac0e6e6b15e320c15c8d22d`; predecessor S148 ordinary two-parent merge PR #179 `c4d6d52ab1e1667478b21044f740175bb7784315`. The separate S149 instruction was supplied by the owner. Frozen B=F₂[C₄], integer resolution and five-stage real diagram only; no novelty/fit/prior-art/review/publication or OptionD development.

**Certified, exact pinned Lean sources (no sorry/admit/axioms):**

1. Scratch `70f3aedeaac912a769e422ed8fb61b8e2497bbee`, Lean #40666132514 SUCCESS: `regularCoefficientHom`, `regularHom_determined_by_one`, coefficient morphism composition/addition, all-natural-index `regularDx_zero`, `regularDh_xx`, `regularDz_xh_hx`, `regularTerminal_identity`. These are actual morphisms in `ModuleCat B`, not raw coefficient-only equalities, though still componentwise.
2. Scratch `0d671fef9523822d0fb6b2b9457ce2cdd5571b2d`, Lean #40666531530 SUCCESS: `regularEval` and `regularAllChoice_terminal_not_boundary` range over arbitrary genuine B-linear endomorphisms `a1 a2 b1 c1 h1 h2 j1 j2 k1 k2 l1 f1 f2` satisfying low-degree adjacent, primary and secondary equations. The proof uses categorical evaluation at 1 and the existing arbitrary coefficient-jet terminal residue theorem. No selected-filler limitation remains at this **local categorical** level.
3. Scratch `4237a350ac703ecc1c136a8bfda2e0b0f9705666`, Lean #40667762021 SUCCESS: `integerShiftResolution (s : ℤ) : ChainComplex (ModuleCat B) ℤ` is built directly by reindexing the full actual `integerResolution` terms and differentials, with uniform shape and d∘d=0, including all negative/boundary degrees. `integerShiftResolution_X` and `_d` witness exact term/differential correspondence.

**Not proved:** actual chain maps x on every shifted complex, global homotopy equations for h/z, universal fourfold invariance for ALL global dg defining systems and homotopy-equivalence conjugations, or any whole-real derived/homotopy-interleaving distance equality. Specifically no assertion of d_IHC=1 or 5/4≤d_HI in Lean. S148's all-degree H₀ and true augmentation QuasiIso remain unchanged.

The source-specific success above is distinct from the final combined S149 PR/main CI and must not be used to infer it without observing that run.
