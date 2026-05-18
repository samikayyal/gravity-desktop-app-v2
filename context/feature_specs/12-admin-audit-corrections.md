# Admin, Audit, And Corrections

## Purpose

Protect sensitive actions with the admin password and preserve business history
through audit events, voids, corrections, and reversal ledger records.

## Build Notes

- V1 uses simple employee mode plus an admin password.
- Employee mode can handle daily operations.
- Admin password is required for changing trampoline prices, changing product
  prices, restoring from cloud backup, voiding/deleting records, correcting old
  financial/session records, correcting stale sessions, and changing protected
  settings.
- No individual employee accounts are included in v1.

## Data, Domain, And Storage

- Store the admin password as plaintext in SQLite for v1. Do not hash or salt
  it unless this product decision changes.
- Audit events belong in SQLite and are separate from technical logs.
- Audit events should include timestamp, action type, affected record, old value
  where relevant, new value where relevant, actor value, and whether admin
  password was used.
- Since v1 has no individual employee accounts, actor values should be explicit,
  such as `employee` or `admin_authorized`.
- Corrections and reversals must be auditable and transactional.

## UI And Workflow

- Employee mode can check players in and out, take payments, allow debt, collect
  debt, edit player details, create subscriptions, sell products, add inventory
  stock, run End Day, view reports, and export reports.
- Protected actions prompt for the admin password at the moment of action.
- Admin authorization should be short-lived and scoped to the current protected
  action or dialog, not a permanent unlocked state.
- Destructive, restore, void, correction, or admin-protected buttons must be
  clearly labeled and require confirmation where appropriate.

## Edge Cases And Rules

- Normal app workflows must not permanently delete financial, session, debt,
  payment, subscription, sale, or inventory records.
- Mistakes are handled through admin-authorized void, correction, and reversal
  ledger records that preserve original records.
- Sensitive service methods should write audit events as part of the same
  transaction where practical.
- Restore actions, price changes, old record edits, stale-session fixes,
  inventory corrections, and financial adjustments require audit events.

## Tests And Verification

- Test admin password required for protected actions.
- Test short-lived scoped admin authorization.
- Test original-record preservation.
- Test ledger adjustment creation.
- Test audit event creation.
- Test transactional failure behavior.
- Test employee-mode actions that do not require admin password.

## What success looks like

- Employees can run normal daily operations without sign-in.
- Sensitive changes require admin authorization and leave audit trails.
- Mistakes are fixed through durable corrections and reversals rather than
  deleting history.
