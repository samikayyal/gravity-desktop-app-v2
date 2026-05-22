# Progress Tracker

Update this file after every meaningful implementation change.

## Current Phase

- Foundation scaffold complete

## Current Goal

- Start the next feature unit from the numbered specs now that the executable
  Flutter Windows foundation is in place.

## Completed

- Defined the v1 product scope for a Windows-only trampoline park front-desk
  desktop app.
- Documented offline-first SQLite source-of-truth behavior with GCP Cloud
  Storage used only for backup and restore.
- Locked Drift as the required SQLite access layer.
- Locked Riverpod as the required state-management and dependency-wiring layer.
- Selected the light-mode **Modern Cashier Calm** direction for the UI.
- Added a complete semantic color token system to `context/ui-context.md`.
- Added typography recommendations for dense cashier/front-desk workflows.
- Added a border radius scale and future AI accent tokens.
- Preserved the original generic AI development guide under
  `docs/reference/ai-driven-developer-playbook.md`.
- Replaced the root README with a project-specific overview and workflow guide.
- Clarified first-run setup, backup package contents, restore safety, business
  timezone, missed-close suggestions, pricing grace behavior, employee checkout
  discounts, correction/reversal handling, subscription expiry, and sale-line
  snapshots in the non-UI context docs.
- Split detailed feature requirements into numbered files under
  `context/feature_specs/`, with each spec including build notes, edge cases,
  tests, and a `What success looks like` section.
- Slimmed the top-level context files so they act as the initial project
  contract and feature-spec index rather than carrying every feature detail.
- Generated the Flutter Windows-only scaffold with `pubspec.yaml`,
  `pubspec.lock`, `lib/`, `test/`, and `windows/`.
- Added baseline dependencies for Riverpod, Drift/SQLite, Freezed/build
  tooling, JSON serialization, PDF generation, CSV support, hashing, and
  REST-oriented HTTP backup support.
- Created the planned architecture folders under `lib/` and `test/`, with
  `.gitkeep` placeholders for empty boundaries.
- Added a minimal Material 3 app shell with centralized theme entrypoints and
  Riverpod `ProviderScope` wiring.
- Added a no-business-table Drift database boundary and generated Drift output.
- Added baseline widget and database smoke tests.
- Established a passing verification baseline:
  - `dart format --set-exit-if-changed .`
  - `flutter analyze`
  - `flutter test`
  - `flutter test test\core\database\app_database_test.dart`

## In Progress

- None.

## Next Up

- Implement the next selected feature unit. The likely next unit is
  `02-first-run-setup-and-restore.md`, unless shared UI primitives from
  `15-shared-ui-theme-and-primitives.md` should be completed first.
- Revisit `riverpod_generator`, `riverpod_lint`, and `custom_lint` before the
  first generated Riverpod provider is needed. They were not added during the
  foundation scaffold because the current Flutter/Dart package solver reports
  conflicts with the resolved Drift/Freezed/Riverpod dependency set.

## Open Questions

- Should the UI support Arabic, English, or a bilingual layout from the first
  release?
- Should the yellow brand color appear in the top navigation, or stay reserved
  for primary actions and selected states only?

## Architecture Decisions

- V1 targets one Windows front-desk computer only.
- Local SQLite is the source of truth.
- GCP Cloud Storage is backup/restore only, not live sync.
- Drift is the required SQLite access layer.
- Riverpod is the required state-management and dependency-wiring layer.
- First-run setup must support New Installation and Restore Existing Backup.
- New installation requires admin password creation, required GCP backup
  configuration, and initial socks/water product setup before cashier
  operations.
- Backup upload success is not required before cashier operations; failures are
  recorded and shown as warnings.
- Backup packages contain the SQLite database plus manifest metadata and must
  exclude credentials, logs, generated exports, and local secrets/config.
- Default business timezone is `Asia/Damascus`.
- End Day covers activity since the previous saved close.
- Missed-close suggestions use a default 10-hour no-check-in inactivity gap and
  require cashier/admin confirmation before snapshots are saved.
- The 10-minute pricing leeway is free billing grace time.
- Employee discounts are flat SYP values for individual checkout eligible
  subtotals only; reason is optional.
- Mistakes are handled through admin-authorized void/correction/reversal ledger
  records that preserve the original records.
- Subscription months expire one calendar month after activation at the same
  local `Asia/Damascus` time.
- Product sale line items snapshot product name and unit price at sale time.
- UI uses a light-mode-only **Modern Cashier Calm** design direction.
- Brand yellow `#FBF306` is the primary action and brand highlight color, but
  status colors remain visually distinct for operational clarity.
- Theme values must be centralized and consumed through shared Flutter theme
  tokens rather than hardcoded in feature widgets.

## Session Notes

- 2026-05-17: UI color token system documented in `context/ui-context.md`.
- 2026-05-17: Non-UI context cleanup completed. Repo remains documentation-only;
  no Flutter scaffold, `pubspec.yaml`, `lib/`, or `test/` exists yet.
- 2026-05-17: Context feature-spec split completed. Flutter/Dart verification
  was not applicable because the repo still has no Flutter scaffold,
  `pubspec.yaml`, `lib/`, or `test/`.
- 2026-05-17: Foundation scaffold completed. `dart format
  --set-exit-if-changed .`, `flutter analyze`, `flutter test`, and the targeted
  Drift database smoke test pass.
