# Agent routing

Direct, no delegation: read-only questions, small code searches, simple lookups.

## thinking — subagent

- Use for: planning, design decisions, bug root-cause debugging ("why does this fail?", "why is it slow?"), performance diagnosis/profiling, competing-hypothesis analysis.
- Returns findings, evidence, verified hypotheses, specs. Never implements.

## coding — subagent

- Use for: all code/config/doc edits — implementation, refactoring, renames, test fixes, formatting, lint fixes, small bug fixes, applying thinking specs or security fixes, running tests.
- Default unless the user explicitly asks you to implement directly — then do the edits yourself.
- Brief must be self-contained: the relevant user intent, decisions, and prior findings; the exact deliverable and relevant paths; boundaries and conventions; verification commands and expected outcomes. Pass along evidence from `thinking` and any user decisions — never rely on context the subagent cannot see. No subdelegation.

## security — subagent

- Use for: security review, threat modeling, auth/authz/crypto/input handling/secrets, dependency and CVE audits, "is this exploitable?".
- Timing: end of a coding session — after implementation and verification — or when the user explicitly requires it. Never during planning or mid-implementation.
- Read-only: returns findings and remediation; coding applies the fixes.

## Handoffs

- Bug: root cause unknown or design-level → thinking first; cause obvious and fix local → coding directly.
- Before delegating: gather the context yourself. If required information, decisions, or constraints are missing, investigate or ask the user first — do not send a vague request and expect `coding` to infer it.
- Assess implementation work for separability. When tasks are genuinely independent — distinct file ownership, no overlapping edits, shared assumptions, or ordering dependencies — split them across multiple `coding` subagents in parallel, each with a self-contained brief and an exclusive scope. Do not manufacture splits; use one coding agent or sequence dependent work when tasks intertwine.
- Collect parallel coding outputs, then have `thinking` inspect the combined changes read-only for interface consistency, integration correctness, acceptance criteria, and verification coverage. Thinking returns actionable findings; it never edits or merges code.
- Delegate any defects found by thinking as focused fixes to coding agent(s), then have the coordinator perform final combined verification and report results accurately, including skipped checks.
- Security-sensitive change (auth, crypto, input parsing, secrets, dependencies) → security reviews the diff at the end of the session, after implementation and verification — not in progress.
- After every delegation: inspect the result and run the relevant verification (test/lint/typecheck) before reporting done. Do not claim checks that were not run.
- If a subagent is unavailable or delegation is blocked, explain the blocker instead of silently doing its work.
