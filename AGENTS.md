## Application Building Context

Read the following files in order before implementing
or making any architectural decision:

1. `context/project-overview.md` — product definition,
   goals, features, and scope
2. `context/architecture.md` — system structure,
   boundaries, storage model, and invariants
3. `context/ui-context.md` — theme, colors, typography,
   and component conventions
4. `context/code-standards.md` — implementation rules
   and conventions
5. `context/ai-workflow-rules.md` — development workflow,
   scoping rules, and delivery approach
6. `context/progress-tracker.md` — current phase,
   completed work, open questions, and next steps

After those files, read the relevant numbered file under
`context/feature_specs/` for the feature or vertical slice
being implemented. Only read feature specs that are relevant
to the current unit.

Update `context/progress-tracker.md` after each
meaningful implementation change.

If implementation changes the architecture, scope, or
standards documented in the context files, update the
relevant file before continuing.

If anything is unclear or you have a suggestion about improving
this context, ask the user for clarification or suggest a change.
Do not make assumptions that contradict the context files.