# Time Pricing

## Purpose

Calculate trampoline session charges deterministically for 30-minute, 1-hour,
open-time, and subscription-overage sessions. Pricing must be testable outside
Flutter widgets.

## Build Notes

- Pricing rules live in a domain service.
- Store money as integer SYP amounts, never `double`.
- Default prices in SYP:
  - `hour`: 95,000
  - `half_hour`: 75,000
  - `additional_hour`: 70,000
  - `additional_half_hour`: 45,000
- Default leeway is 10 minutes and configurable.
- Leeway is free billing grace time, not only an alert threshold.

## Data, Domain, And Storage

- Store price settings and leeway in SQLite-backed settings or price tables.
- Persist calculated charges as ledger-style charge records during checkout.
- Store durations as integer minutes or 30-minute blocks where appropriate.
- Public pricing services should have short doc comments explaining the
  business rule they implement.

## UI And Workflow

- Checkout uses the pricing service result; widgets must not calculate prices.
- The employee sees final charges before payment.
- Fixed-duration sessions also use pricing rules to support overdue billing.

## Edge Cases And Rules

- Selected entry mode affects billing.
- For a 30-minute entry, up to 40 minutes is `half_hour`; more than 40 minutes
  is `half_hour` plus additional blocks.
- A 30-minute entry with a 45-minute stay charges
  `half_hour + additional_half_hour`.
- For a 1-hour entry, up to 70 minutes is `hour` unless actual use is short
  enough to downgrade.
- A 1-hour entry downgrades to `half_hour` when elapsed time is within the
  half-hour duration plus leeway.
- A 1-hour entry with a 20-minute stay charges `half_hour`.
- A 1-hour entry with a 45-minute stay charges `hour`.
- Overtime after the grace cutoff rounds up into additional full-hour and
  half-hour blocks.
- Open time is calculated at checkout from elapsed time.
- An open-time entry with a 45-minute stay charges `hour`.

## Tests And Verification

- Test known pricing examples:
  - 30-minute entry, 45-minute stay:
    `half_hour + additional_half_hour`
  - 1-hour entry, 45-minute stay: `hour`
  - open-time entry, 45-minute stay: `hour`
  - 1-hour entry, 20-minute stay: `half_hour`
- Test grace-boundary, downgrade-boundary, fixed-entry overtime, and open-time
  rounding cases.
- Test pricing service without Flutter widget setup.

## What success looks like

- Pricing outputs match all documented examples and edge cases.
- Leeway is applied as free billing grace time.
- Widgets render pricing results but do not own pricing decisions.
- Money is represented as integer SYP throughout the pricing path.

