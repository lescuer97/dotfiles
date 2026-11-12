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
- Security-sensitive change (auth, crypto, input parsing, secrets, dependencies) → security reviews the diff at the end of the session, after implementation and verification — not in progress.
- After every delegation: inspect the result and run the relevant verification (test/lint/typecheck) before reporting done. Do not claim checks that were not run.
- If a subagent is unavailable or delegation is blocked, explain the blocker instead of silently doing its work.
