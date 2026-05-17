# Settings And Configuration

## Purpose

Expose protected and operational configuration for prices, leeway, stale-session
thresholds, backup configuration, product prices, low-stock defaults, and admin
password management.

## Build Notes

- Settings UI belongs under `lib/features/settings/`.
- Configuration defaults belong under `lib/core/config/`.
- Admin-protected settings require admin password.
- Use explicit models rather than loose maps for settings.

## Data, Domain, And Storage

- Store settings in SQLite when they affect business records, reports, restore,
  audit, or future lookup.
- Relevant settings include hour price, half-hour price, additional-hour price,
  additional-half-hour price, leeway, backup interval, stale-session threshold,
  business timezone, product prices, low-stock thresholds, setup completion, and
  backup configuration status.
- Store money as integer SYP.
- Store timestamps as UTC and apply the configured local business timezone for
  reports, exports, subscription expiry, and cashier display.
- Protected setting changes must write audit events.

## UI And Workflow

- Employee-accessible settings may show status and non-sensitive operational
  values.
- Admin password is required for changing trampoline prices, product prices,
  backup configuration, stale-session threshold, admin password, and protected
  settings.
- Price-change UI must make the business impact clear before saving.
- Settings errors must identify missing required configuration or invalid input.

## Edge Cases And Rules

- Defaults must not override saved settings silently.
- Successful backup upload is not required to complete setup, but required
  backup configuration is.
- Business timezone defaults to `Asia/Damascus`.
- Product price changes are global for future sales only; historical sale lines
  keep snapshots.
- Price changes do not rewrite historical charges.

## Tests And Verification

- Test settings persistence.
- Test admin password requirements for protected settings.
- Test audit events for protected setting changes.
- Test business defaults when settings are absent.
- Test saved settings are not silently overwritten.
- Test price changes do not rewrite historical sale or charge records.

## What success looks like

- Operators can configure the app without breaking historical records.
- Protected settings require short-lived admin authorization and audit events.
- Business defaults are clear, persisted settings win, and future calculations
  use current settings intentionally.

