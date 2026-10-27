# S140 — pinned hosted build record

Verified S139 entry main 6460ba80c258d17a480dc660df868edc7b53c628, main Lean #40511288989 and integrity #40511288980 SUCCESS. Scratch PR #168 was a validation-only vehicle, never the S140 integration PR: early instances and naive module extensionality failed pinned Lean; this was fixed by exporting concrete coefficient definitions, proving ring operations explicitly before class packaging and using `ModuleCat.hom_ext` then `LinearMap.ext`.

**Winning scratch commit:** a0d1770a1eaca63f24958bc7c9840b026ab60755. Pinned Lean push #40515282269 and PR #40515289838 SUCCESS, including `lake build C4`, `lake build OptionD`, admission scan and unchanged manifest. Integrity push #40515282275 and PR #40515289832 SUCCESS. Original pin Lean v4.35.0-rc2, mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55; no dependency change.

This authored file is PRE-PR and cannot predict hosted S140 authored-PR/main verdicts. Observe those independently after commit. No Palomar, journal/arXiv, release or external communications.
