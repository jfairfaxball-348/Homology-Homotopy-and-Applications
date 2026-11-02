#!/usr/bin/env python3
"""Verify and emit a future or in-progress session handoff; execute no research."""
from pathlib import Path
import argparse
import json
import re
import sys

ROOT = Path(__file__).resolve().parents[1]


def validate_session_handoff(root):
    """Validate numbering, status, authority and preserved historical evidence."""
    state = json.loads((root / "authoritative/STATE.json").read_text())
    last = state["last_completed_session"]
    expected = state["recommended_next_session"]
    if not isinstance(last, str) or not re.fullmatch(r"S\d{3}", last):
        raise ValueError("STATE completed session ID is invalid")
    if expected != f"S{int(last[1:]) + 1:03d}":
        raise ValueError("STATE session progression mismatch")

    active = state.get("active_session")
    label = "FUTURE, UNEXECUTED"
    if active is not None:
        if not isinstance(active, dict) or active.get("id") != expected:
            raise ValueError("active_session must identify the next incomplete session")
        if active.get("status") != "IN_PROGRESS":
            raise ValueError("active_session status must be IN_PROGRESS")
        record = f"sessions/{expected}/PARTIAL.md"
        if active.get("record") != record:
            raise ValueError("active_session must name its own PARTIAL.md record")
        if not (root / record).read_text().strip():
            raise ValueError("active session partial record is empty")
        label = "IN PROGRESS, PARTIAL"

    prompt = (root / "authoritative/NEXT_SESSION_PROMPT.md").read_text()
    heading = rf"\A# {re.escape(expected)}\s+[^\n]*\({re.escape(label)}\)\s*(?:\n|$)"
    if not re.match(heading, prompt):
        raise ValueError(f"prompt heading must identify {expected} and {label}")
    if len(prompt.strip()) < 900:
        raise ValueError("next-session prompt is too short for a complete executable handoff")
    if not re.search(r"separate.{0,90}owner|owner.{0,90}separate",
                     prompt, re.IGNORECASE | re.DOTALL):
        raise ValueError("prompt must state the separate owner invocation boundary")
    if not re.search(r"ordinary.{0,40}merge|two-parent.{0,40}merge",
                     prompt, re.IGNORECASE | re.DOTALL):
        raise ValueError("prompt must specify the ordinary merge boundary")
    if not re.search(r"(?:no|without|separately|not).{0,100}(?:Lean|Palomar|publication|arXiv)",
                     prompt, re.IGNORECASE | re.DOTALL):
        raise ValueError("prompt must explicitly preserve downstream gate boundaries")

    closeout = (root / "sessions" / last / "CLOSEOUT.md").read_text()
    # This is the previous session's historical handoff, not today's status.
    # A later partial continuation must not rewrite the original future record.
    if int(last[1:]) >= 78:
        if "## NEXT_SESSION_HANDOFF" not in closeout:
            raise ValueError("missing mandatory NEXT_SESSION_HANDOFF block")
        handoff = closeout.rsplit("## NEXT_SESSION_HANDOFF", 1)[1]
        for required in (expected, "FUTURE, UNEXECUTED",
                         "authoritative/NEXT_SESSION_PROMPT.md"):
            if required not in handoff:
                raise ValueError("historical next-session handoff missing " + required)
        if "owner" not in handoff.lower():
            raise ValueError("historical handoff omits owner authorization boundary")
    return last, expected, label, prompt


def main():
    parser = argparse.ArgumentParser(description="Validate or print the current session handoff")
    opts = parser.add_mutually_exclusive_group()
    opts.add_argument("--check", action="store_true", help="validate only (CI)")
    opts.add_argument("--print", action="store_true", help="print full copy-ready prompt")
    args = parser.parse_args()
    try:
        last, expected, label, prompt = validate_session_handoff(ROOT)
    except (ValueError, KeyError, OSError, json.JSONDecodeError) as exc:
        print("FAIL next-session handoff:", exc, file=sys.stderr)
        return 1
    if args.check:
        print(f"PASS session handoff: {last} -> {expected} {label}; not mathematics")
    else:
        print(f"## Session handoff — {expected} ({label})")
        print("Canonical: authoritative/NEXT_SESSION_PROMPT.md")
        print("\n```markdown")
        print(prompt.rstrip())
        print("```")
        print("\nPrinting this handoff does not execute proof work; follow its owner-authorization boundary.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
