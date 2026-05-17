# Individual Checkout, Payments, Debt, Tips, And Discounts

## Purpose

Complete a single player's checkout with correct session charges, optional
products, cash/card payments, debt handling, old debt collection, tips/change,
and audited flat discounts.

## Build Notes

- Payment can happen at check-in, checkout, or both.
- Payment methods in v1 are cash and card only.
- No payment terminal, cash drawer, card reader, online payment, or payment
  provider integration is included in v1.
- Split payments are supported, such as part cash and part card.
- Financial actions should be ledger-style records, not simple paid/unpaid
  flags.

## Data, Domain, And Storage

- Persist charges, payments, payment allocation, debt entries, discounts, tips,
  corrections, and void/reversal records in SQLite.
- Debt is attached to the individual player record. Any person can pay on that
  player's behalf.
- Tips should be recorded by payment method when possible.
- Store discounts with amount, timestamp, actor value, eligible scope, and
  optional reason.
- Checkout must run in a SQLite transaction so partial writes cannot corrupt
  money, debt, session state, products, tips, or audit records.

## UI And Workflow

- Employee reviews the total, optionally adds products, records cash/card
  payment, and chooses whether underpaid amounts become debt.
- Old debt can be collected separately from today's session.
- Old debt should warn the employee but must not be silently mixed into current
  session charges unless the workflow is explicitly debt collection.
- If payment exceeds the amount owed, the employee must choose whether change
  was returned or the excess was recorded as a tip.
- Employees can apply a flat SYP discount to an individual checkout.
- Discount reason is optional.

## Edge Cases And Rules

- Credit balances are not allowed.
- A player can pay part of today's charge and leave the rest as debt.
- A player can check in again while already having old debt, but the app must
  warn the employee.
- Individual checkout discounts apply only to current session charges and
  products added during that individual checkout.
- Discounts do not apply to old debt, tips, separate subscription purchases,
  debt collection, or group checkout totals.
- A discount must never make the eligible subtotal negative.
- Buttons that perform financial or destructive actions must be clearly
  labeled and require confirmation where appropriate.

## Tests And Verification

- Test full payment, partial payment, split cash/card payment, old debt
  collection, discounts, and tips.
- Test overpayment requiring explicit change-or-tip choice.
- Test credit balances are impossible.
- Test discount eligible scope, optional reason, negative-total prevention,
  old-debt exclusion, subscription/debt-collection exclusion, and group-checkout
  exclusion.
- Test transactional failure leaves no partial financial writes.

## What success looks like

- A cashier can complete individual checkout accurately with cash/card splits,
  debt, tips, and discounts.
- Old debt stays visible and collectible without being silently included in
  today's charge.
- Overpayment never creates credit and only becomes a tip after explicit
  employee choice.
- All financial effects are durable, auditable, and transactional.

