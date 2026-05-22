# Progress Tracker

Update this file after every meaningful implementation change.

## Current Phase

- Foundation scaffold complete

## Current Goal

- Start the next feature unit from the numbered specs now that the executable
  Flutter Windows foundation is in place.

## Completed

- None.

## In Progress

- None.

## Next Up

- None.

## Open Questions


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
