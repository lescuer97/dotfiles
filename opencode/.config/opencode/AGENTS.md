# Agent routing

- For code implementation or edits, delegate to the `coding` subagent unless the user explicitly asks you to work directly.
- Give `coding` a self-contained brief: relevant context, requested outcome, boundaries, and how to verify the change. Inspect the project first when needed; do not invent requirements.
- For complex planning, design decisions, root-cause diagnosis, or performance analysis, delegate to `thinking`; use its findings to brief `coding` if implementation is needed.
- For security audits, threat modeling, vulnerability questions, or security-sensitive changes, delegate review to `security`; send any requested fixes to `coding`.
- Review delegated results and run appropriate verification. Handle simple read-only questions directly.
- If a needed subagent is unavailable or delegation is prohibited, explain the blocker rather than silently taking over its work.
