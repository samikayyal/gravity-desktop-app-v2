# End-Day Reporting And Missed Closes

## Purpose

Close business periods with counted totals, mismatch reporting, frozen
snapshots, live recalculated comparisons, backup status, and human-confirmed
missed-close suggestions.

## Build Notes

- The app includes an End Day button.
- End Day generates a close summary/report covering activity since the previous
  saved close.
- End Day is blocked if any players are still checked in.
- End Day triggers an immediate cloud backup attempt.
- End Day does not automatically lock the day from later changes.

## Data, Domain, And Storage

- Store frozen close snapshots in SQLite with counted cash/card totals,
  mismatch totals, close period start/end, close timestamp, report data, and
  backup result.
- Live recalculated reports are generated from current records and may differ
  from the frozen snapshot after later corrections.
- Suggested missed-close periods may be persisted, but suggestions are not
  accounting records until confirmed into `day_closes`.
- End Day and missed-close confirmation must be transactional.

## UI And Workflow

- Employee enters counted cash and card totals.
- End Day shows recorded totals, counted totals, mismatches, revenue
  breakdowns, product sales, subscription sales, debt collected, new debt, tips,
  outstanding debt, inventory status, graphs, corrections, and backup status.
- Reports include total cash payments, total card payments, session revenue,
  product sales revenue, subscription sales revenue, debt collected, new debt
  created, tips, current outstanding debt by player, active players still
  checked in, product inventory remaining, edited/corrected/voided records,
  backup status, age-group graphs, and other useful charts.
- If later corrections changed a closed day, show the difference between the
  frozen close snapshot and the current live recalculated report.
- If multiple likely business periods exist since the previous close, suggest
  split close periods using the missed-close rule.

## Edge Cases And Rules

- End Day must be blocked while any player is still checked in.
- The default missed-close suggestion rule is a 10-hour no-check-in inactivity
  gap.
- Suggested missed-close splits are never automatic accounting records.
- Cashier or admin must confirm each close period and enter counted cash/card
  totals before snapshots are saved.
- Business-day calculations use the configured local business timezone, not UTC
  date boundaries.

## Tests And Verification

- Test active-session blocking.
- Test counted cash/card totals.
- Test mismatch calculation.
- Test frozen snapshot creation.
- Test live recalculated comparison after corrections.
- Test backup result recording.
- Test 10-hour inactivity-gap suggestions.
- Test no automatic snapshot creation from suggestions.
- Test confirmation with counted totals.
- Test no suggestion when gap is below threshold.

## What success looks like

- End Day cannot close while players are active.
- Cash/card counts reconcile against recorded payment totals.
- The original close snapshot remains available even after later corrections.
- Missed-close suggestions help the cashier without creating automatic
  accounting records.
