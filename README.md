# Gravity Desktop App v2

Windows desktop front-desk app for a trampoline park. The app is designed for
one cashier computer, offline-first operation, local SQLite business storage,
and GCP Cloud Storage backup/restore.

## Current Status

This repository is currently in the product and architecture foundation stage.
It contains the project context contract, but it does not yet contain a Flutter
project scaffold, `pubspec.yaml`, `lib/`, or `test/` folders.

The next implementation unit is to scaffold the Flutter Windows desktop app,
add the baseline dependencies, create the planned folder structure, and get
format/analyze/test passing before feature work begins.

## V1 Scope

- Target platform: one Windows front-desk computer.
- UI framework: Flutter desktop for Windows.
- Language: Dart.
- Local database: SQLite via Drift.
- State management: Riverpod.
- Source of truth: local SQLite database.
- Cloud usage: GCP Cloud Storage backup and password-protected restore only.
- Normal operation must work without internet.

V1 intentionally excludes live multi-device sync, cloud-primary storage,
payment-terminal integration, receipt printers, barcode scanners, individual
employee accounts, family accounts, and customer credit balances.

## Product Summary

The app supports front-desk workflows for:

- Player profile creation and lookup.
- Check-in, active-session tracking, individual checkout, and group checkout.
- Timed pricing for 30-minute, 1-hour, open-time, and subscription-covered
  sessions.
- Cash/card payments, split payments, partial payments, debt, old debt
  collection, tips, and audited flat-value individual checkout discounts.
- Monthly fixed-hour subscriptions.
- Product sales and inventory movements for socks, water bottles, and future
  products.
- End Day close reporting with counted totals, mismatches, frozen snapshots,
  live recalculated reports, exports, and backup attempt status.
- GCP backup/restore using a database plus manifest backup package.

## First-Run Expectations

First-run setup offers either a new installation or restoring an existing
backup.

For a new installation, setup must collect:

- Admin password, stored only as a salted hash.
- Required GCP backup configuration.
- Initial socks and water bottle product prices, starting stock, and low-stock
  thresholds.

Backup configuration is required before cashier operations, but a successful
upload is not required. If upload fails, the app must continue to work offline
and show backup warnings.

For restore, the app must verify the admin password stored in the selected
backup, validate the backup manifest/checksum, and make a local safety copy
before replacing the active database.

## Context Contract

Read these files before implementation or architectural decisions:

1. `context/project-overview.md`
2. `context/architecture.md`
3. `context/ui-context.md`
4. `context/code-standards.md`
5. `context/ai-workflow-rules.md`
6. `context/progress-tracker.md`

After the top-level context pass, read the relevant numbered file under
`context/feature_specs/` for the feature or vertical slice being implemented.
Those files contain feature-level build notes, edge cases, tests, and "What
success looks like" acceptance criteria. The top-level context files stay short
on purpose so each implementation unit can load only the feature detail it
needs.

`context/ui-context.md` is the visual design contract. It is intentionally not
expanded with full token tables; detailed theme and primitive rules live in
`context/feature_specs/15-shared-ui-theme-and-primitives.md`.

## Development Workflow

- Keep implementation aligned with the context files.
- Update `context/progress-tracker.md` after every meaningful implementation
  change.
- Update context docs in the same unit when implementation changes product
  behavior, architecture, scope, standards, or workflow.
- Do not start feature work until the Flutter scaffold, baseline dependencies,
  folder structure, and verification workflow exist.

## Verification Baseline

After the scaffold exists, normal verification for implementation work is:

```text
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

Run focused domain, repository, migration, or widget tests for the changed area
when a unit touches business rules, persistence, or workflows.
