# AI Workflow Rules

## Approach

- Build this project incrementally using a spec-driven workflow.
- Treat the context files as the project contract.
- Use `AGENTS.md` as the required entrypoint for project instructions.
- Before implementation or architectural decisions, read the six top-level
  context files in the order listed by `AGENTS.md`.
- After the top-level read, read only the relevant numbered file under
  `context/feature_specs/` for the feature unit being implemented.
- Implement against the specs. Do not invent behavior from scratch.
- The first implementation unit is project scaffold/foundation because the repo
  currently has no Flutter scaffold, `pubspec.yaml`, `lib/`, or `test/`
  folders.
- Do not begin product feature implementation before the Flutter Windows
  scaffold, baseline dependencies, planned folder structure, and verification
  workflow exist.
- Prefer small, complete, verifiable vertical slices over broad partial
  rewrites.
- Keep the app offline-first. Do not introduce live cloud sync, cloud-primary
  storage, or multi-device coordination unless the user explicitly changes
  scope.
- Preserve the dependency flow from `context/architecture.md`.
- Keep business rules out of Flutter widgets.
- Keep persistence details out of widgets and domain services.
- Keep generated code generated. Do not hand-edit it.

## Scoping Rules

- Work on one feature unit at a time.
- Define the current unit before editing files.
- Until the scaffold exists, the current unit must be foundation/scaffold work,
  not product feature work.
- Use the matching `context/feature_specs/NN-feature.md` file as the detailed
  feature contract for the current unit.
- Prefer vertical slices that include the needed domain logic, repository/
  database support, provider/view model, UI, tests, and documentation updates.
- Do not combine unrelated business areas in one implementation step.
- Do not make speculative changes.
- Do not refactor unrelated code while implementing a feature.
- Do not change architecture, storage model, access rules, or business behavior
  as a side effect of a local task.
- Keep changes inside the folder boundaries defined in `context/architecture.md`.
- Touch only the files required for the current unit and its tests/docs.
- Do not mark a unit complete until it works end to end within its defined
  scope.

## When To Split Work

Split work when a request combines major business areas, mixes schema
migration with major UI work, spans unrelated features, cannot be verified
quickly and clearly, introduces a major dependency or architecture decision, or
depends on requirements not fully defined in the context files.

Finish the current unit before starting the next unit.

## Handling Missing Or Ambiguous Requirements

- Always stop and ask when a requirement is missing or ambiguous.
- Do not make assumptions for money, debt, subscriptions, inventory, restore,
  reporting, audit, access control, database schema, checkout behavior, backup
  behavior, or unclear UI business consequences.
- Add unresolved implementation questions to `context/progress-tracker.md`.
- Do not implement around unresolved first-run setup, backup/restore, money,
  discount, correction, subscription expiry, or missed-close behavior.
- If the user request conflicts with the context docs, warn the user before
  implementing.
- If the user confirms a conflicting change, update the relevant context docs
  in the same unit as the implementation.

## Protected Files

Do not modify these without explicit instruction or proper generation:

- Generated Dart files: `*.g.dart`, `*.freezed.dart`, generated Drift files,
  generated Riverpod files.
- Flutter generated/platform glue such as generated plugin registrants and
  build configuration files.
- Build and tool output such as `build/`, `.dart_tool/`, coverage, and
  generated temporary test output.
- Third-party, vendored, or copied library internals.
- Real local app data, production SQLite database files, real backup files,
  sensitive logs, GCP credentials, service account keys, bucket secrets, local
  secrets/config, and real GCP bucket objects.

Use temporary test databases, fixtures, mocks, or local test folders for
verification. Never modify real app data directly.

## Dependency Rules

- Add Flutter packages only when they provide clear value and are trusted.
- Prefer mature, maintained packages with Windows desktop support.
- Check license, maintenance/activity, Windows support, transitive dependency
  risk, and packaging impact.
- Do not add duplicate packages for the same responsibility without reason.
- Ask before adding dependencies that introduce major architecture, cloud,
  payment, native Windows, unusual license, or sensitive credential risk.
- Use `build_runner` for Drift, Freezed, Riverpod, and serialization generated
  code.
- The scaffold/foundation unit should add the approved baseline dependencies
  before feature code is added.

## Documentation Sync

- Keep context documentation synchronized with implementation.
- Update `context/project-overview.md` when user-facing behavior, feature
  scope, product rules, or success criteria change.
- Update `context/architecture.md` when stack, folder boundaries, storage
  model, access model, background task model, or invariants change.
- Update `context/code-standards.md` when conventions, testing expectations,
  dependency rules, logging rules, or verification standards change.
- Update `context/ui-context.md` and
  [`15-shared-ui-theme-and-primitives.md`](feature_specs/15-shared-ui-theme-and-primitives.md)
  when UI patterns, layout rules, status colors, interaction behavior, or design
  standards change.
- Update the relevant `context/feature_specs/*.md` file when feature-level
  behavior, edge cases, tests, or acceptance criteria change.
- Update `context/progress-tracker.md` after every meaningful implementation
  change.
- Do not update docs with speculative plans that were not accepted or
  implemented.
- For documentation-only units before scaffold exists, verify by targeted file
  reads/searches and record that Flutter/Dart verification is not applicable.

## Database And Migration Rules

- Treat SQLite as the local source of truth.
- Use Drift for SQLite access.
- Add an explicit migration for every schema change.
- Test every migration.
- Preserve existing data unless the user explicitly instructs otherwise.
- Do not write destructive migrations without explicit user instruction.
- Use temporary test databases for migration and repository tests.
- Do not bypass repositories to mutate business tables from UI code.
- Do not let raw Drift row objects cross repository boundaries into UI.
- Use transactions for operations that change money, payments, debt, session
  state, subscription entitlement/usage, product sales, inventory, End Day,
  missed-close confirmation, corrections, voids, or restore state.

## Testing Rules

- Treat testing as required.
- Do not mark business logic complete without tests.
- Add unit tests for code that changes pricing, checkout totals, debt,
  subscriptions, inventory, sessions, restore behavior, access control, audit,
  backup state, or end-day reporting.
- Add repository tests for repository behavior and migration tests for schema
  changes.
- Add functional widget tests for workflow screens that change business state.
- Test UI behavior, not pixel-perfect layout.
- Use the relevant feature spec for required edge-case tests.

## Verification Checklist

Before moving to the next unit:

1. Confirm the unit matches the top-level context and relevant feature spec.
2. Confirm no invariant in `context/architecture.md` was violated.
3. Confirm the work follows `context/code-standards.md`.
4. Confirm the work stayed inside intended scope.
5. Confirm no protected file was hand-edited.
6. Confirm no real app data, backup, log, or GCP bucket object was modified.
7. Run `dart format --set-exit-if-changed .` when a Flutter/Dart scaffold
   exists.
8. Run `flutter analyze` when a Flutter/Dart scaffold exists.
9. Run `flutter test` when a Flutter/Dart scaffold exists.
10. Run targeted tests for the changed area.
11. Run repository or migration tests when the database changes.
12. Run functional widget tests when a workflow screen changes.
13. Run `flutter build windows` before major milestones or release checkpoints.
14. Update relevant context docs and feature specs.
15. Update `context/progress-tracker.md`.
16. Record any skipped verification and reason.

Do not claim Flutter/Dart verification was run before the scaffold exists.

## Git And Commits

- Do not make git commits automatically.
- Commit only when the user explicitly asks for a commit.
- Do not rewrite history unless explicitly asked.
- Do not revert user changes unless explicitly asked.
- Preserve unrelated local changes.
- Report changed files clearly in the final response.

## Final Response Rules

After completing a unit, report what changed, files changed, tests added or
updated, verification commands run, documentation updated, skipped verification
with reasons, remaining open questions, and the recommended next unit when
useful.

Do not claim a unit is complete if verification failed, was skipped without
explanation, or required tests were not added.

