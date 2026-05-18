# Progress Tracker

Update this file after every meaningful implementation change.

## Current Phase

- First-run setup feature started

## Current Goal

- Complete `02-first-run-setup-and-restore.md` in focused slices. The New
  Installation gate is implemented; full backup package restore remains next.

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
  tooling, JSON serialization, PDF generation, CSV support, and REST-oriented
  HTTP backup support.
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
- Added Drift schema version 2 for first-run setup state, admin credential
  storage, backup configuration status, backup run records, initial products,
  and initial inventory movements.
- Added a first-run setup repository and domain service for New Installation
  validation, setup persistence, admin password storage, initial product
  defaults, and first-backup warning recording.
- Added a Riverpod setup gate so cashier operations stay blocked until setup is
  complete.
- Added the New Installation UI for admin password, required GCP backup
  configuration status, socks defaults, and water bottle defaults.
- Added a visible Restore Backup path, but left actual backup package
  validation/replacement disabled until the backup package implementation is
  defined and built.
- Added tests for required setup validation, missing backup configuration,
  nonblocking first backup failure, admin password verification, setup gate UI,
  new-installation completion, schema version 2 creation, and empty v1-to-v2
  migration.
- Changed admin password persistence from salted PBKDF2 hashing to plaintext
  SQLite storage, removed the hashing helper, and added schema version 3.

## In Progress

- `02-first-run-setup-and-restore.md`: restore package validation, admin
  password verification against a selected backup, safety-copy creation, and
  active database replacement.

## Next Up

- Implement the restore half of `02-first-run-setup-and-restore.md`, likely
  alongside the backup package manifest/checksum pieces from
  `11-backup-restore-and-status.md`.
- Revisit `riverpod_generator`, `riverpod_lint`, and `custom_lint` before the
  first generated Riverpod provider is needed. They were not added during the
  foundation scaffold because the current Flutter/Dart package solver reports
  conflicts with the resolved Drift/Freezed/Riverpod dependency set.

## Open Questions

- Should the UI support Arabic, English, or a bilingual layout from the first
  release?
- Should the yellow brand color appear in the top navigation, or stay reserved
  for primary actions and selected states only?
- Should first-run restore select a local backup package, list/download a
  package from GCP, or support both paths in v1?
- Should GCP credential setup be stored as a local credential-file reference
  outside the SQLite database, or should setup only store the
  credentials-configured status while the backup feature owns local secrets?

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
- Setup schema version 3 stores setup completion, installation ID, business
  timezone, backup configuration status, first backup status, plaintext admin
  password, initial products, and initial inventory movements.
- Admin passwords are stored as plaintext in SQLite for v1 by current product
  decision. Backup packages include the SQLite database, so they include that
  plaintext admin password.
- The first backup attempt is recorded as a backup run and warning status, but
  upload failure remains nonblocking after required setup is complete.

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
- 2026-05-17: First-run New Installation slice completed. `dart format
  --set-exit-if-changed .`, `flutter analyze`, `flutter test`, and
  `flutter test test\core\database\app_database_test.dart` pass. Restore UI is
  present but disabled pending backup package validation and safety-copy
  implementation.
- 2026-05-18: Admin password storage changed from salted hash to plaintext in
  SQLite, with context docs updated to match. Schema version 3 replaces the old
  credential table; v2 databases with irreversible hashes are forced back to
  incomplete setup so a plaintext admin password can be entered.
