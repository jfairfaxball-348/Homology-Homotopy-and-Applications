#!/usr/bin/env python3
"""Guard the Palomar statement package.

Comparator requires every constant used by the advertised statements to be identical in the
Challenge and Solution environments. The Solution therefore imports C4/Palomar/Statement.lean,
a verbatim copy of Challenge.lean up to the advertised theorem. This check enforces:

* Statement.lean equals the Challenge prefix before the advertised-theorem marker, followed by
  the two closing `end` commands;
* the Challenge imports only Mathlib;
* the only `sorry` in the Challenge is the proof of the advertised theorem;
* the Statement copy, the Bridge and the Solution contain no `sorry`, `admit` or `axiom`;
* comparator.json names exactly the expected declarations and permitted axioms.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MARKER = "/-! ## The advertised theorem -/"
CLOSING = "end\n\nend C4Separation\n"
THEOREMS = [
    "C4Separation.distance_separation",
    "C4Separation.stageD_comp_stageD",
    "C4Separation.xComp_comm",
]
AXIOMS = {"propext", "Quot.sound", "Classical.choice"}
FORBIDDEN = re.compile(r"\b(?:sorry|admit|sorryAx|axiom)\b")


def strip_comments(text: str) -> str:
    text = re.sub(r"/-.*?-/", "", text, flags=re.S)
    return re.sub(r"--[^\n]*", "", text)


def main() -> int:
    errors: list[str] = []
    challenge = (ROOT / "Challenge.lean").read_text(encoding="utf-8")
    statement = (ROOT / "C4/Palomar/Statement.lean").read_text(encoding="utf-8")

    if challenge.count(MARKER) != 1:
        errors.append("Challenge.lean must contain the advertised-theorem marker exactly once")
    else:
        prefix, suffix = challenge.split(MARKER)
        if statement != prefix + CLOSING:
            errors.append("C4/Palomar/Statement.lean is not a verbatim copy of the Challenge prefix")
        if FORBIDDEN.search(strip_comments(prefix)):
            errors.append("Challenge.lean contains sorry/admit/axiom before the advertised theorem")
        if len(re.findall(r"\bsorry\b", strip_comments(suffix))) != 1:
            errors.append("the advertised theorem must be the Challenge's only sorry")

    imports = re.findall(r"^(?:public\s+)?import\s+(\S+)", challenge, flags=re.M)
    if imports != ["Mathlib"]:
        errors.append(f"Challenge.lean must import only Mathlib, found {imports}")

    for name in ["C4/Palomar/Statement.lean", "C4/Palomar/Bridge.lean", "Solution.lean"]:
        if FORBIDDEN.search(strip_comments((ROOT / name).read_text(encoding="utf-8"))):
            errors.append(f"{name} contains sorry/admit/axiom")

    config = json.loads((ROOT / "comparator.json").read_text(encoding="utf-8"))
    if config.get("challenge_module") != "Challenge" or config.get("solution_module") != "Solution":
        errors.append("comparator.json must compare Challenge with Solution")
    if config.get("theorem_names") != THEOREMS:
        errors.append(f"comparator.json theorem_names must be {THEOREMS}")
    if config.get("definition_names", []) != []:
        errors.append("comparator.json must not declare definition holes")
    if set(config.get("permitted_axioms", [])) != AXIOMS:
        errors.append(f"comparator.json permitted_axioms must be {sorted(AXIOMS)}")

    for error in errors:
        print(f"FAIL: {error}")
    if errors:
        return 1
    print("PASS: Palomar statement copy, sorry isolation and comparator configuration")
    return 0


if __name__ == "__main__":
    sys.exit(main())
