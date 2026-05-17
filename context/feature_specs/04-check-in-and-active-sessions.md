# Check-In And Active Sessions

## Purpose

Track players from check-in through checkout with persisted session state,
restart-safe timers, active-board status, overdue alerts, and stale-session
protection.

## Build Notes

- Entry modes are 30 minutes, 1 hour, and open time.
- Session time starts when the employee checks the player in.
- Session time ends when the employee checks the player out.
- Timers must be calculated from persisted `check_in_at` timestamps, not
  in-memory timers.
- The active board should refresh from database-backed state and current time.

## Data, Domain, And Storage

- Persist sessions with check-in/check-out lifecycle, entry mode, active/stale/
  closed/voided status, check-in time, checkout time, and calculated totals.
- Persist session snapshots of player display name, age, and primary phone.
- Active sessions must survive app crash, laptop shutdown, and restart.
- Store timestamps as UTC ISO-8601 strings and convert to local time at UI and
  report boundaries.

## UI And Workflow

- Active board shows checked-in players with name, age or identifier, entry
  type, check-in time, expected end time when applicable, remaining or overdue
  time, debt warning, subscription status, and quick checkout action.
- Fixed-duration players visibly change state near the end and when overdue.
- The app plays a sound when a fixed-duration player becomes overdue.
- Open-time sessions use the open-time status, not near-end or fixed overdue
  expectations.
- The active board includes per-player checkout buttons and multi-select
  checkboxes for group checkout.

## Edge Cases And Rules

- Default stale-session threshold is 8 hours, configurable.
- Sessions active longer than the threshold are flagged as needing correction.
- Stale sessions cannot be checked out through the normal flow.
- Correcting stale session times or charges requires the admin password and
  creates an audit event.
- Active board display state is cache only and must be rebuildable from SQLite.

## Tests And Verification

- Test active sessions persist and timers resume after restart.
- Test near-end, overdue, open-time, and stale states.
- Test stale sessions blocking normal checkout.
- Test admin requirement and audit event for stale-session correction.
- Test active board view-model behavior without putting business rules inside
  widgets.

## What success looks like

- Checked-in players remain active after app restart with correct elapsed time.
- Employees can scan active, near-end, overdue, open-time, subscription, debt,
  and stale states quickly.
- Stale sessions are protected from normal checkout until admin correction is
  recorded.

