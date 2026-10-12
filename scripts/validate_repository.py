#!/usr/bin/env python3
"""Static repository governance and catalogue checks; not a mathematical proof."""
from pathlib import Path
import json, sys
ROOT=Path(__file__).resolve().parents[1]
required=[
"README.md","AGENTS.md","authoritative/START_HERE.md","authoritative/STATE.json",
"authoritative/NEXT_SESSION_PROMPT.md","authoritative/DECISION_LOG.md",
"docs/PROJECT_CHARTER.md","docs/ROADMAP.md","docs/SESSION_PROTOCOL.md",
"docs/PHASE_GATE_LEDGER.md","docs/SESSION_LEDGER.md","docs/FAILURE_AND_LESSON_LEDGER.md",
"catalogue/SOURCES.md","catalogue/SOURCES.json","catalogue/CLAIMS.md",
"catalogue/CLAIMS.json","research/TARGET_SELECTION.md","research/ROUTES.md",
"audit/SEARCH_LOG.md","campaigns/REGISTRY.md","formal/README.md",
"paper/README.md","release/CHECKLIST.md","sessions/S001/CLOSEOUT.md",
"authoritative/NEXT_SESSION_PROMPT.md"]
errors=[]
for p in required:
    if not (ROOT/p).is_file(): errors.append("missing "+p)
def data(p):
    try: return json.loads((ROOT/p).read_text())
    except Exception as e: errors.append(f"invalid {p}: {e}"); return {}
state=data("authoritative/STATE.json")
s=data("catalogue/SOURCES.json").get("sources",[])
c=data("catalogue/CLAIMS.json").get("claims",[])
for name,items in (("SRC",s),("CLM",c)):
    ids=[r.get("id") for r in items]
    if len(ids)!=len(set(ids)): errors.append("duplicate "+name+" ids")
    if any(not isinstance(i,str) or not i.startswith(name+"-") for i in ids): errors.append("malformed "+name+" ids")
allowed={"METADATA_ONLY","ABSTRACT_INSPECTED","STATEMENT_INSPECTED","PROOF_INSPECTED","SECONDARY_ONLY"}
statuses={"SOURCE_STATED","PROGRAMME_PROVED","COMPUTED_EXACT","HEURISTIC","FORMALLY_CERTIFIED","INHERITED_UNVERIFIED"}
for x in s:
    if x.get("access") not in allowed: errors.append("bad source access "+str(x.get("id")))
    if not x.get("url"): errors.append("source missing URL "+str(x.get("id")))
for x in c:
    if x.get("status") not in statuses: errors.append("bad claim status "+str(x.get("id")))
    for y in x.get("sources",[]):
        if y not in {z.get("id") for z in s}: errors.append("unknown source "+str(y))
if state.get("selected_mathematical_problem") is not None: errors.append("S001 must not preselect theorem")
if state.get("last_completed_session")!="S001": errors.append("bootstrap state drift")
p=(ROOT/"authoritative/NEXT_SESSION_PROMPT.md").read_text() if (ROOT/"authoritative/NEXT_SESSION_PROMPT.md").exists() else ""
if "FUTURE, UNEXECUTED" not in p or "S002" not in p: errors.append("next prompt missing future marker")
if errors:
    for e in errors: print("FAIL:",e)
    sys.exit(1)
print("PASS: static scaffold/catalogue invariants (not Lean, mathematical proof or external CI)")

