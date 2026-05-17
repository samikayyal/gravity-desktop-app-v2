# Technical Logging

## Purpose

Capture troubleshooting information for crashes, backup failures, migration
failures, restore failures, export errors, and unexpected exceptions while
keeping business audit records separate.

## Build Notes

- Technical logs are local-first.
- Log upload to GCP can be queued or retried when internet is available.
- Log upload failure must not block cashier work.
- Logging should be implemented through a shared core logging boundary, not
  feature-local ad hoc files.

## Data, Domain, And Storage

- Technical logs are file-owned records unless a specific operational reason
  requires a SQLite summary.
- Audit events are business records in SQLite and are not technical logs.
- Local logs must not be included in backup packages.
- Avoid logging sensitive data unless necessary.
- Prefer IDs over names and never log full phone numbers unless there is a
  specific operational need.

## UI And Workflow

- Employee-facing errors must be actionable and should not expose raw stack
  traces or sensitive internals.
- Technical details can be logged locally for troubleshooting.
- Backup/log upload status can be shown where useful, but failures remain
  nonblocking.

## Edge Cases And Rules

- Do not swallow errors silently.
- Unexpected failures may throw internally, but workflow boundaries must catch
  them and show specific user-facing errors.
- Restore failures must stop restore and leave the active database intact.
- Backup and log upload failures must be recorded but must not block normal
  cashier work.
- Logs containing sensitive data are protected files and must not be edited
  directly or committed.

## Tests And Verification

- Test expected business failures produce typed validation/result objects rather
  than generic exceptions where applicable.
- Test workflow boundaries convert unexpected failures into actionable
  user-facing errors.
- Test log upload failure is nonblocking.
- Test backup packages exclude local logs.
- Test sensitive fields are redacted or avoided in technical logs where log
  content is structured.

## What success looks like

- Developers can diagnose operational failures from local logs.
- Employees see specific, actionable errors without raw internals.
- Technical logging never replaces audit records and never blocks cashier work.
- Logs stay out of backup packages and avoid sensitive data.

