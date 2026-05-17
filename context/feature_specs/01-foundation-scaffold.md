# Foundation Scaffold

## Purpose

Create the Flutter Windows desktop foundation before product feature work
starts. The app is currently documentation-only, so this unit establishes the
executable project, dependency baseline, folder structure, and verification
workflow that every later feature depends on.

## Build Notes

- Target Flutter desktop for Windows only.
- Use Dart, Flutter Material 3, Riverpod, Drift, Freezed, and generated code
  through the approved build tools.
- Add baseline dependencies before feature implementation:
  `flutter_riverpod`, Drift packages, Freezed/build tooling,
  `flutter_lints`, test support, a PDF generation package, CSV support, and a
  GCP Cloud Storage package or deliberate REST implementation.
- Commit `pubspec.lock` once the Flutter scaffold exists.
- Create the planned folders from `context/architecture.md` under `lib/` and
  `test/`.
- Do not implement cashier features in the same unit as the scaffold.

## Data, Domain, And Storage

- Create the `lib/core/database/`, `lib/domain/`, and
  `lib/data/repositories/` boundaries, but do not add business schema before a
  feature needs it.
- Prepare for SQLite as the local source of truth through Drift.
- Generated files must be produced by tooling, not hand-edited.
- No real app data, backup files, logs, credentials, or GCP bucket objects may
  be used for verification.

## UI And Workflow

- Add the root app shell only as needed for the scaffold.
- Use Material 3 and central theme entrypoints.
- Do not build a marketing landing page.
- Keep UI behavior minimal until the relevant feature spec is being
  implemented.

## Edge Cases And Rules

- The project must stay Windows-only for v1.
- Offline-first operation is the default assumption.
- Do not add live sync, employee accounts, payment hardware, printing, family
  accounts, or customer credit behavior.
- If dependency choice introduces licensing, native Windows, credential, cloud,
  or packaging risk, stop and ask before adding it.

## Tests And Verification

- Establish a clean baseline:
  - `dart format --set-exit-if-changed .`
  - `flutter analyze`
  - `flutter test`
- Analyzer warnings are failures.
- Do not claim the scaffold is complete until format, analyze, and tests pass.

## What success looks like

- The repository has a Flutter Windows scaffold with `pubspec.yaml`, `lib/`,
  `test/`, and the planned top-level folder structure.
- Baseline dependencies are added intentionally and recorded in lockfiles.
- `dart format --set-exit-if-changed .`, `flutter analyze`, and
  `flutter test` all pass.
- No business feature implementation has started before the foundation is
  stable.
