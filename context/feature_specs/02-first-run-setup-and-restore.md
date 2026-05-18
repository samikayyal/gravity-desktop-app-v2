# First-Run Setup And Restore

## Purpose

Block cashier operations until a new installation is configured or an existing
backup is safely restored. First-run setup decides whether the local SQLite
database starts fresh or is replaced from a verified backup.

## Build Notes

- First-run setup offers exactly two paths: New Installation and Restore
  Existing Backup.
- New Installation collects the admin password, required GCP backup
  configuration, initial socks and water bottle prices, starting stock
  quantities, and low-stock thresholds.
- Backup configuration is required before cashier operations can start, but a
  successful upload is not required.
- Restore Existing Backup validates the selected backup before replacing the
  active local database.

## Data, Domain, And Storage

- Store setup completion, installation ID, business timezone, backup
  configuration status, backup interval, stale-session threshold, and initial
  defaults in SQLite.
- Store the admin password as plaintext in SQLite. Do not hash or salt it
  unless this product decision changes.
- Do not store or copy GCP credentials into cloud backup packages.
- Because backup packages include the SQLite database, they also include the
  plaintext admin password stored in that database.
- Restore must verify the admin password stored in the selected backup,
  validate manifest/checksum, and create a local safety copy before replacing
  the active database.
- Restore failure must leave the current local database intact.

## UI And Workflow

- New Installation flow must clearly collect all required setup fields before
  enabling cashier operations.
- If the first backup upload fails after required setup is complete, show a
  backup warning and allow offline cashier work.
- Restore flow must require admin-password verification and an explicit
  confirmation before replacing local data.
- User-facing errors must explain whether setup is missing, backup validation
  failed, password verification failed, or restore could not complete safely.

## Edge Cases And Rules

- Cashier operations are blocked when admin password setup, required GCP backup
  configuration, or initial product setup is incomplete.
- Upload failure is nonblocking after required setup is complete.
- Restore is intentional; the app must never automatically overwrite the local
  database from cloud backup.
- Backup packages must exclude credentials, generated exports, local logs,
  local secret/config files, and other sensitive local-only configuration.

## Tests And Verification

- Test New Installation required fields.
- Test missing backup configuration blocking cashier operations.
- Test upload failure allowing offline operation after required setup.
- Test Restore Existing Backup password verification.
- Test manifest/checksum validation.
- Test safety-copy creation before database replacement.
- Test failed restore preserving the existing database.

## What success looks like

- A fresh installation cannot enter cashier mode until required setup is
  complete.
- A failed first upload records and shows a warning without blocking offline
  work.
- A restore validates password and backup integrity, creates a safety copy, and
  only then replaces the active database.
- Setup and restore never include GCP credentials or local secrets in backup
  packages.
