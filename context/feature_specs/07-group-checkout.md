# Group Checkout

## Purpose

Let an employee checkout multiple active players together while preserving
per-player charge calculation and explicit debt assignment.

## Build Notes

- The active board includes checkboxes for selecting multiple players.
- Bulk checkout calculates each selected player's session charge separately.
- The group checkout screen shows one combined total.
- One payment can cover all selected players.
- Products can be added to a group checkout.

## Data, Domain, And Storage

- Persist each selected player's session charges separately.
- Persist one or more payment records and allocations for the group payment.
- Any new debt from underpayment must attach to selected player records.
- Group checkout must run in a SQLite transaction covering sessions, charges,
  payments, product sales, inventory movements, debt entries, and audit records.

## UI And Workflow

- Employee selects multiple active players from the active board.
- Group checkout shows each player's calculated charge and a combined total.
- Old debts for selected players are shown as warnings only and are not
  included automatically.
- If the group checkout is underpaid, the cashier must assign the new unpaid
  debt before checkout can finish.
- New group debt can be assigned to one selected player or split evenly across
  multiple selected players.

## Edge Cases And Rules

- Old debt must not be silently included in group checkout totals.
- Flat employee discounts are not applied to group checkout totals in v1.
- Manual custom debt allocation per player is out of scope for v1.
- Unassigned group debt is not allowed.
- Debt cannot be assigned to an anonymous customer.

## Tests And Verification

- Test combined payment across selected players.
- Test per-player charge calculation inside group totals.
- Test old-debt warning/disclaimer behavior.
- Test underpayment blocking checkout until debt assignment is chosen.
- Test one-player debt assignment.
- Test even debt splitting across selected players.
- Test group discount exclusion.

## What success looks like

- A cashier can select multiple players, see separate charges and one combined
  total, and complete one payment for the group.
- Old debt is visible but excluded from the group total.
- Underpaid group checkout cannot complete until new debt is assigned to a
  selected player or evenly split.

