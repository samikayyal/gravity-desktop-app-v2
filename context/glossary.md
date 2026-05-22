# Glossary

Use these terms consistently in specs, code, tests, and user-facing workflow
names. If a requested behavior would change one of these meanings, stop and ask
before implementing.

## People And Identity

- **Player**: A trampoline park customer represented by an internal
  `player_id`. Names and phone numbers are not unique identifiers.
- **Player profile**: The durable record containing full name, age, phone
  numbers, session history, subscription history, and debt history.
- **Primary phone**: The main contact number shown first for a player. A player
  can have multiple phones, and phone numbers are not globally unique identity.

## Sessions And Time

- **Session**: One check-in visit for one player. It stores entry type,
  check-in time, optional checkout time, optional subscription link, charges,
  discounts, and status.
- **Open time**: A session mode where the player has no fixed duration and is
  billed from elapsed time using the pricing/leeway rules.
- **Fixed duration**: A session mode where the cashier selects 30-minute blocks
  at check-in.
- **Active session**: A checked-in session that has not been closed or voided.
- **Overdue session**: A fixed-duration session that passed its reserved time
  plus configured leeway.
- **Stale session**: A session that exceeds the configured stale threshold and
  requires admin correction before normal checkout.

## Money And Debt

- **SYP money value**: Any financial amount stored as an integer Syrian Pound
  value. `double` and floating point money are not allowed.
- **Payment group**: A shared identifier that groups split payments or all
  payments created by one group checkout.
- **Debt**: An unpaid balance assigned to exactly one player. Anonymous debt is
  not allowed.
- **Old debt**: Debt that existed before the current checkout. It is shown as a
  warning or separate payment action and is not silently included in group
  checkout totals.
- **Tip**: Intentional overpayment recorded separately from change. Tips cannot
  be used as implicit customer credit.
- **Change**: Overpayment returned to the customer instead of stored as credit.
- **Flat discount**: A fixed SYP reduction applied only to eligible session
  charges, never old debt, tips, subscription purchases, debt collection, or
  group checkout totals.

## Subscriptions

- **Subscription entitlement**: The remaining play-time balance on a monthly
  card. It is separate from any debt used to buy the subscription.
- **Subscription debt**: A normal debt record created when a subscription is
  purchased on credit.
- **Usage block**: Subscription consumption recorded in 30-minute blocks.

## Products And Inventory

- **Product sale**: A sale transaction for catalog items such as socks or water.
  It can be anonymous or attached to a player.
- **Product sale snapshot**: The copied product name and unit price stored on a
  sale item so old sales keep their original values after catalog changes.
- **Inventory movement**: A durable stock ledger row for restock, sale,
  correction, or void movement. Product stock changes through movements.
- **Negative stock**: A permitted inventory state that must be visible to the
  cashier as a warning.

## Corrections And Audit

- **Audit event**: A durable SQLite record for admin-authorized or high-risk
  actions.
- **Void**: A status change or reversing workflow that invalidates a business
  record without deleting it.
- **Correction**: An admin-authorized adjustment that preserves the original
  record and writes an auditable correction link.
- **Reversal**: A ledger-style entry that offsets the financial, session, or
  inventory effect of a prior record.

## End Day And Reports

- **End Day close**: The cashier workflow that blocks while players are checked
  in, accepts counted cash/card totals, calculates mismatches, stores a frozen
  snapshot, and attempts backup.
- **Frozen close snapshot**: The immutable saved report data captured at End
  Day time.
- **Live recalculated report**: A later report view recalculated from current
  records, which may differ from a frozen close after corrections.
- **Missed close**: A human-confirmed closeout for a prior business period
  suggested by inactivity-gap rules.

## Backup And Logs

- **Backup package**: A restore-ready package containing the SQLite database and
  manifest only. It excludes credentials, logs, generated exports, and local
  secrets.
- **Restore safety copy**: A local copy of the active database created before a
  restore replaces it.
- **Technical log**: Local diagnostic output for developers. It is separate
  from audit events and must strip sensitive customer data.
