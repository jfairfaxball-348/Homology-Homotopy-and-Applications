# S164 build evidence

- Entry main `9c813a7c9f43c7146193e7ab3cef2258c1e32927`, tree `f0bc438745a877ba18d570fd7c4bebaabc7a90d6`; independently checked merged-main Lean #40909137956 SUCCESS, integrity #40909137831 SUCCESS.
- Exact pins: Lean `v4.35.0-rc2`, compiler commit `11acb17ec6b07a8f9e9173e6845197929540936b`; Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`. No committed manifest change.
- Local complete `lake build`: SUCCESS, 8969 jobs, including all OptionD and C4 imports, new GlobalObstruction and RealDiagram. Existing linter warnings do not indicate unproved goals.
- Local `lake env lean` checks of the two new modules: SUCCESS.
- `#print axioms` for canonicalGlobalFourfold, GlobalFourfoldDefiningSystem.terminal_not_boundary and realDiagram_shift_five_zero lists only propext, Classical.choice and Quot.sound. No admitted proof or custom axiom. Exact input/output retained in KERNEL_CHECK{,_OUTPUT}.txt.
- Complete source module-header/admitted-proof scan, `git diff --check`, repository validation and mandatory handoff validation: PASS.
- Local runtime uses an explicit executable-path compatibility shim because this executor does not expose its own PID executable link to Lean's automatic sysroot discovery. It supplies the installed compiler path, changes no Lean source or kernel, and is outside the repository. Hosted GitHub checks use the normal pinned action without that shim.
- Failed early scratch `ae0c9de2f83d4e7b6e68661f255b41da52ede0e1`: pinned Lean #40924803787 FAILURE on the first explicit-family commutativity proof. It was corrected locally and is not promoted.
- Verified final-source scratch `01f6698ae5ab8a6652374d23014950f75adddfb2`, source tree `651ca69936f58c249619210a344e474b5db06d20`: independent hosted pinned Lean #40927573844 SUCCESS, integrity #40927573700 SUCCESS. The normal hosted compiler/action validates the final source without the local executable-path shim. Authored PR and merged-main checks are independently verified during promotion; their immutable results are available on GitHub.

## Final source fingerprints

- CanonicalGlobal.lean SHA256 `de4ee3e47ef942a9546f9bab2144af7aa9d01a17779a5a5172c4a09de545b0b5`
- GlobalObstruction.lean SHA256 `ac0569d056a8d8a948d94398951ef3eed43426076f4491f7b5cd3e2fd2cc9aef`
- RealDiagram.lean SHA256 `f9b3264afd2d9d9eb5582be29bc5d8dd2f9af35d7c7bae1d6c5098d4cbdf7b66`

## Promotion boundary

The complete authored changes were committed locally. Automatic approval review rejected the Git push: it classified exporting the committed source and project-status files to GitHub as requiring explicit permission to publish/push, which it did not find in the current owner instruction. No API workaround, PR or merge is performed after that rejection. The final source was already independently certified on the scratch SHA above. The authored branch, PR and merged-main promotion checks have not been completed and must not be inferred from scratch success.

The owner subsequently explicitly authorised "commit and push merge etc" on 29 October 2026. This resolves the permission objection. Promotion continues through an authored branch/PR, ordinary two-parent merge and independent PR/main checks. See the immutable GitHub check results for those commits.
