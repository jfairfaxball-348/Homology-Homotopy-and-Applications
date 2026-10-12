#!/usr/bin/env python3
"""Static governance checks. CI success is NOT mathematical/novelty certification."""
from pathlib import Path
import json, re, sys
R=Path(__file__).resolve().parents[1]
required=["README.md","AGENTS.md","authoritative/START_HERE.md","authoritative/STATE.json",
"authoritative/NEXT_SESSION_PROMPT.md","authoritative/DECISION_LOG.md",
"docs/PROJECT_CHARTER.md","docs/ROADMAP.md","docs/SESSION_PROTOCOL.md",
"docs/PHASE_GATE_LEDGER.md","docs/SESSION_LEDGER.md","docs/FAILURE_AND_LESSON_LEDGER.md",
"catalogue/SOURCES.md","catalogue/SOURCES.json","catalogue/CLAIMS.md",
"catalogue/CLAIMS.json","research/TARGET_SELECTION.md","research/ROUTES.md",
"audit/SEARCH_LOG.md","campaigns/REGISTRY.md","formal/README.md",
"paper/README.md","release/CHECKLIST.md","sessions/S001/CLOSEOUT.md"]
errors=[]
for p in required:
    if not (R/p).is_file(): errors.append("missing "+p)
def data(p):
    try: return json.loads((R/p).read_text())
    except Exception as e: errors.append("invalid "+p+": "+str(e)); return {}
state=data("authoritative/STATE.json")
sources=data("catalogue/SOURCES.json").get("sources",[])
claims=data("catalogue/CLAIMS.json").get("claims",[])
for prefix,items in (("SRC",sources),("CLM",claims)):
    ids=[x.get("id") for x in items]
    if len(ids)!=len(set(ids)): errors.append("duplicate "+prefix+" id")
    if any(not isinstance(i,str) or not re.fullmatch(prefix+r"-[0-9]{4}",i) for i in ids): errors.append("invalid "+prefix+" ID")
src_ids={s.get("id") for s in sources}
for x in sources:
    if x.get("access") not in {"METADATA_ONLY","ABSTRACT_INSPECTED","STATEMENT_INSPECTED","PROOF_INSPECTED","SECONDARY_ONLY"}: errors.append("source access "+str(x.get("id")))
    if not x.get("url"): errors.append("missing source URL "+str(x.get("id")))
for x in claims:
    if x.get("status") not in {"SOURCE_STATED","PROGRAMME_PROVED","COMPUTED_EXACT","HEURISTIC","FORMALLY_CERTIFIED","INHERITED_UNVERIFIED"}: errors.append("claim status "+str(x.get("id")))
    for src in x.get("sources",[]):
        if src not in src_ids: errors.append("dangling source "+str(src))
last=state.get("last_completed_session")
if not isinstance(last,str) or not re.fullmatch(r"S[0-9]{3}",last): errors.append("missing completed session ID")
else:
    if not (R/"sessions"/last/"CLOSEOUT.md").is_file(): errors.append("missing closeout "+last)
    expected=f"S{int(last[1:])+1:03d}"
    if state.get("recommended_next_session")!=expected: errors.append("next session state mismatch")
    text=(R/"authoritative/NEXT_SESSION_PROMPT.md").read_text()
    if expected not in text or "FUTURE, UNEXECUTED" not in text: errors.append("next future prompt mismatch")
if last and last!="S001":
    for p in ("sessions/S002/INPUT.md","sessions/S002/PLAN.md","sessions/S002/CANDIDATES.md",
              "sessions/S002/MATHEMATICS.md","sessions/S002/PRIOR_ART.md","sessions/S002/LEAN_FEASIBILITY.md"):
        if not (R/p).is_file(): errors.append("missing research dossier "+p)
    if len(sources)<12 or len(claims)<10: errors.append("missing S002 expanded catalogues")
if errors:
    for e in errors: print("FAIL:",e)
    sys.exit(1)
print("PASS: static integrity of authority/claim/source mirrors; NOT a proof, novelty audit or Lean build")
