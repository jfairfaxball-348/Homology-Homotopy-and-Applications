#!/usr/bin/env python3
"""Verify and emit a copy-ready next-session prompt; no research is executed."""
from pathlib import Path
import argparse
import json
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description="Validate or print the NEXT future session prompt")
opts = parser.add_mutually_exclusive_group()
opts.add_argument("--check", action="store_true", help="validate only (CI)")
opts.add_argument("--print", action="store_true", help="print full copy-ready prompt")
args = parser.parse_args()

try:
    state = json.loads((ROOT / "authoritative/STATE.json").read_text())
    last = state["last_completed_session"]
    expected = state["recommended_next_session"]
    if not re.fullmatch(r"S\d{3}", last) or expected != f"S{int(last[1:])+1:03d}":
        raise ValueError("STATE session progression mismatch")
    prompt_file = ROOT / "authoritative/NEXT_SESSION_PROMPT.md"
    prompt = prompt_file.read_text()
    if not re.match(rf"\A# {re.escape(expected)}\s+[^\n]*\(FUTURE, UNEXECUTED\)", prompt):
        raise ValueError("prompt heading must identify the next session and FUTURE, UNEXECUTED")
    if len(prompt.strip()) < 900:
        raise ValueError("next-session prompt is too short for a complete executable handoff")
    if not re.search(r"separate.{0,90}owner|owner.{0,90}separate", prompt, re.IGNORECASE | re.DOTALL):
        raise ValueError("prompt must require a separate owner invocation")
    if not re.search(r"ordinary.{0,40}merge|two-parent.{0,40}merge", prompt, re.IGNORECASE | re.DOTALL):
        raise ValueError("prompt must specify the ordinary merge boundary")
    if not re.search(r"(?:no|without|separately|not).{0,100}(?:Lean|Palomar|publication|arXiv)", prompt, re.IGNORECASE | re.DOTALL):
        raise ValueError("prompt must explicitly preserve downstream gate boundaries")
    closeout_file = ROOT / "sessions" / last / "CLOSEOUT.md"
    closeout = closeout_file.read_text()
    # This explicit owner restoration happened after the S077 session. Do not
    # rewrite archived S077 output or retroactively fail an already merged PR.
    if int(last[1:]) >= 78:
        if "## NEXT_SESSION_HANDOFF" not in closeout:
            raise ValueError("missing mandatory NEXT_SESSION_HANDOFF block")
        handoff = closeout.rsplit("## NEXT_SESSION_HANDOFF", 1)[1]
        for required in (expected, "FUTURE, UNEXECUTED", "authoritative/NEXT_SESSION_PROMPT.md"):
            if required not in handoff:
                raise ValueError("next-session handoff missing " + required)
        if "owner" not in handoff.lower():
            raise ValueError("next-session handoff omits owner authorization boundary")
except (ValueError, KeyError, OSError, json.JSONDecodeError) as e:
    print("FAIL next-session handoff:", e, file=sys.stderr)
    sys.exit(1)

if args.check:
    print(f"PASS next-session prompt installed: {last} -> {expected} FUTURE ONLY; not mathematics")
else:
    print(f"## Next session prompt — {expected} (FUTURE, UNEXECUTED)")
    print("Canonical: authoritative/NEXT_SESSION_PROMPT.md")
    print("\n```markdown")
    print(prompt.rstrip())
    print("```")
    print("\nNo execution occurs until a fresh separate owner instruction.")
