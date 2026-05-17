# Subscriptions

## Purpose

Support monthly fixed-hour subscriptions for individual players while keeping
subscription entitlement separate from subscription financial debt.

## Build Notes

- A subscription belongs to one player.
- The employee enters subscription hours and discount percent at creation time.
- Default discount is normally 45%, but can be changed per subscription.
- Subscription time covers trampoline session time only.
- Products, old debt, tips, and non-session charges are not covered by
  subscription time.

## Data, Domain, And Storage

- Store subscription entitlement with player ID, start/end dates in UTC,
  local `Asia/Damascus` activation/expiry behavior, total 30-minute blocks,
  used blocks, discount, price, and status.
- Store subscription usage as 30-minute blocks.
- Store subscription financial debt separately from subscription access.
- Persist subscription usage and corrections in ledger/audit-visible records.
- A subscription can become active even if not fully paid.

## UI And Workflow

- Employee creates a subscription by choosing player, hours, and discount.
- UI shows remaining blocks/hours, expiry, status, and unpaid subscription
  debt separately.
- Subscription-covered sessions still show any extra time beyond remaining
  allowance as normal billable time.

## Edge Cases And Rules

- A subscription month expires one calendar month after activation at the same
  local `Asia/Damascus` time.
- Unused subscription hours do not roll over.
- Usage is deducted in 30-minute blocks, not exact minutes.
- Extra time beyond remaining allowance is charged like a normal player.
- If a subscription expires in the middle of a session, billing is split
  internally into subscribed time until expiration and normal open-time billing
  after expiration.
- Subscription price formula is
  `subscription_hours x hour_price x (100 - discount_percent)%`, rounded up to
  the nearest 10,000 SYP.
- Unpaid subscription price is player debt and can remain after the
  subscription month ends.

## Tests And Verification

- Test one-calendar-month local `Asia/Damascus` expiration.
- Test 30-minute block usage.
- Test overage billing.
- Test mid-session expiry.
- Test price formula and rounding up to the nearest 10,000 SYP.
- Test active subscription with unpaid subscription debt.
- Test entitlement/debt separation.

## What success looks like

- A player can have an active fixed-hour subscription with accurate remaining
  time, expiry, and separate financial status.
- Subscription time only covers trampoline session time.
- Overage, mid-session expiry, and unpaid subscription debt are handled without
  mixing entitlement with money owed.

