# Backup, Restore, And Status

## Purpose

Protect the local SQLite source of truth with GCP Cloud Storage backup and
password-protected restore, without turning cloud storage into live sync or a
primary database.

## Build Notes

- V1 targets one front-desk Windows computer only.
- The app works completely offline after required setup.
- GCP Cloud Storage is backup/restore only.
- Automatic backup is attempted every 2 hours when internet is available.
- Backup is attempted on app close when possible.
- Backup is attempted immediately after End Day.
- The UI shows last successful backup time and recent backup failures.

## Data, Domain, And Storage

- SQLite remains the source of truth.
- A backup package contains the SQLite database plus manifest metadata: app/
  schema version, backup timestamp, installation ID, and checksum.
- Backup packages must exclude GCP credentials, generated exports, local logs,
  local secret/config files, and other sensitive local-only configuration.
- Store backup runs and backup manifest metadata in SQLite.
- The GCP bucket must be private, block public access, and use narrowly scoped
  credentials.
- Restore must validate manifest/checksum and create a local safety copy before
  replacing the active database.

## UI And Workflow

- Backup status screen shows current health, last successful backup, and recent
  failures.
- Backup failure should be specific and actionable, but must not block normal
  cashier work after setup.
- Restore from cloud backup is available inside the app and requires admin
  password.
- Restore must be an intentional admin action with clear confirmation.

## Edge Cases And Rules

- There is no live multi-device sync in v1.
- Backup upload success is not required before cashier operations.
- Backup failure records a warning and lets offline work continue.
- Restore failure stops the restore and leaves the current database intact.
- App-close backup must not prevent graceful close if internet is unavailable
  or backup fails.
- Backups are not encrypted in v1.

## Tests And Verification

- Test backup manifest creation.
- Test checksum validation.
- Test credential/log/export/secret exclusion.
- Test upload-failure nonblocking behavior.
- Test scheduled, app-close, end-day, and manual backup run records.
- Test restore safety-copy behavior.
- Test failed restore preserving the active database.

## What success looks like

- The local database can be backed up and restored safely through explicit
  workflows.
- Cashier work remains offline-first and does not depend on network success.
- Backup status is clear enough for employees to notice recent failures.
- Cloud storage is never treated as live sync or the primary database.

