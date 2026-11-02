"""Regression checks for truthful future and partial-session handoffs."""
from pathlib import Path
import json
import tempfile
import unittest

from session_handoff import validate_session_handoff


class HandoffTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        (self.root / "authoritative").mkdir()
        (self.root / "sessions/S173").mkdir(parents=True)
        (self.root / "sessions/S174").mkdir()
        self.state = {
            "last_completed_session": "S173",
            "recommended_next_session": "S174",
        }
        self.closeout = self.root / "sessions/S173/CLOSEOUT.md"
        self.closeout.write_text(
            "# S173 closeout\n\n## NEXT_SESSION_HANDOFF\n"
            "S174 (FUTURE, UNEXECUTED). authoritative/NEXT_SESSION_PROMPT.md\n"
            "A separate owner instruction is required.\n"
        )
        self.prompt_path = self.root / "authoritative/NEXT_SESSION_PROMPT.md"
        self.write_state()
        self.write_prompt("FUTURE, UNEXECUTED")

    def write_state(self):
        (self.root / "authoritative/STATE.json").write_text(json.dumps(self.state))

    def write_prompt(self, label):
        self.prompt_path.write_text(
            f"# S174 — substantial proof handoff ({label})\n\n"
            "A separate owner invocation is required in a new conversation. "
            "Use ordinary two-parent merge and independent CI. "
            "No Palomar or publication without new authority.\n"
            + ("Prove the exact contract and retain actual evidence.\n" * 20)
        )

    def make_partial(self):
        self.state["active_session"] = {
            "id": "S174", "status": "IN_PROGRESS",
            "record": "sessions/S174/PARTIAL.md",
        }
        (self.root / "sessions/S174/PARTIAL.md").write_text(
            "# S174 partial\nActual verified work exists; proof remains open.\n"
        )
        self.write_state()
        self.write_prompt("IN PROGRESS, PARTIAL")

    def test_future_handoff_remains_supported(self):
        self.assertEqual(validate_session_handoff(self.root)[2], "FUTURE, UNEXECUTED")

    def test_partial_handoff_preserves_historical_closeout(self):
        historical = self.closeout.read_text()
        self.make_partial()
        self.assertEqual(validate_session_handoff(self.root)[2], "IN PROGRESS, PARTIAL")
        self.assertEqual(self.closeout.read_text(), historical)

    def test_partial_cannot_be_labelled_unexecuted(self):
        self.make_partial()
        self.write_prompt("FUTURE, UNEXECUTED")
        with self.assertRaisesRegex(ValueError, "prompt heading"):
            validate_session_handoff(self.root)

    def test_partial_heading_needs_active_state(self):
        self.write_prompt("IN PROGRESS, PARTIAL")
        with self.assertRaisesRegex(ValueError, "prompt heading"):
            validate_session_handoff(self.root)

    def test_missing_and_empty_partial_evidence_are_rejected(self):
        self.make_partial()
        record = self.root / "sessions/S174/PARTIAL.md"
        record.unlink()
        with self.assertRaises(OSError):
            validate_session_handoff(self.root)
        record.write_text(" \n")
        with self.assertRaisesRegex(ValueError, "partial record is empty"):
            validate_session_handoff(self.root)

    def test_invalid_active_identity_status_and_record_are_rejected(self):
        for field, value in [
            ("id", "S175"), ("status", "COMPLETED"),
            ("record", "sessions/S173/CLOSEOUT.md"),
        ]:
            with self.subTest(field=field):
                self.make_partial()
                self.state["active_session"][field] = value
                self.write_state()
                with self.assertRaises(ValueError):
                    validate_session_handoff(self.root)

    def test_session_progression_cannot_skip(self):
        self.state["recommended_next_session"] = "S175"
        self.write_state()
        with self.assertRaisesRegex(ValueError, "progression"):
            validate_session_handoff(self.root)

    def test_owner_boundary_is_required(self):
        text = self.prompt_path.read_text().replace(
            "A separate owner invocation is required in a new conversation.", "")
        self.prompt_path.write_text(text)
        with self.assertRaisesRegex(ValueError, "owner invocation"):
            validate_session_handoff(self.root)

    def test_merge_and_external_boundaries_are_required(self):
        for phrase, error in [
            ("Use ordinary two-parent merge and independent CI.", "merge boundary"),
            ("No Palomar or publication without new authority.", "downstream gate"),
        ]:
            with self.subTest(boundary=error):
                self.write_prompt("FUTURE, UNEXECUTED")
                self.prompt_path.write_text(self.prompt_path.read_text().replace(phrase, ""))
                with self.assertRaisesRegex(ValueError, error):
                    validate_session_handoff(self.root)

    def test_historical_handoff_still_required(self):
        self.make_partial()
        self.closeout.write_text("# S173 closeout without handoff\n")
        with self.assertRaisesRegex(ValueError, "NEXT_SESSION_HANDOFF"):
            validate_session_handoff(self.root)


if __name__ == "__main__":
    unittest.main()
