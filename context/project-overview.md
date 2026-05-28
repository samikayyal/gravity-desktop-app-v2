# Trampoline Park Desktop App

## Overview

This application is a Windows desktop front-desk system for a trampoline park.
It handles player check-ins and check-outs, player profiles, timed session
pricing, subscriptions, product sales, debt tracking, daily cashier reporting,
exports, and cloud backup.

The app is offline-first. The single local Windows computer and its SQLite
database are the source of truth. GCP Cloud Storage is used for periodic backup
and password-protected restore only, not live multi-device syncing.

## Goals

1. Let employees check players in quickly using full name, at least one phone
   number, age, and either Open Time or Fixed Duration (30-min block increments).
2. Track active players with remaining-time, overdue, near-end, open-time,
   subscription, debt-warning, and stale-session states.
3. Calculate session charges correctly for Open Time and Fixed Duration blocks based on the flexible pricing matrix.
4. Support cash/card payments, split payments, partial payment, debt, old debt
   collection, tips, and individual checkout discounts without payment hardware.
5. Store durable player, session, payment, debt, subscription, product,
   inventory, correction, audit, backup, and end-day records for lookup and
   reports.
6. Work offline after required setup, with GCP backup attempts every 2 hours,
   on app close when possible, and after End Day.
7. Provide End Day close reporting with counted totals, mismatches, frozen
   snapshots, live recalculated reports, exports, and backup attempt status.
8. Keep v1 technically focused: Flutter desktop UI, SQLite local database,
   Drift, Riverpod, deterministic domain services, and no live cloud sync.

## Core User Flow

1. Customer or group arrives at the front desk.
2. Employee searches for existing players or creates new profiles.
3. Employee starts each session with Open Time or Fixed Duration (30-min increments). If a subscription is active, the system automatically detects it.
4. Active board shows running sessions with timer, state, debt warning,
   subscription status, and checkout actions.
5. Employee can sell products during the visit.
6. Employee checks out one player or a selected group.
7. Checkout calculates session charges, products, payments, tips/change,
   discounts, and debt using domain services.
8. Completed sessions, payments, debt, tips, sales, inventory movements, audit
   events, and corrections are saved to SQLite.
9. End Day is blocked while players are checked in, then records counted
   totals, mismatches, report data, and backup result.
10. Reports can be reviewed later as frozen snapshots or live recalculations
    after corrections.

## Feature Specs

Feature-level behavior, implementation notes, edge cases, tests, and acceptance
criteria live in `context/feature_specs/`. Before implementing a feature unit,
read the top-level context files first, then the relevant feature spec. Feature
spec filenames are numbered in the intended implementation order.

| Spec | Feature |
| --- | --- |
| [`01-foundation-scaffold.md`](feature_specs/01-foundation-scaffold.md) | Flutter scaffold, baseline dependencies, folder layout, verification baseline |
| [`02-ui-tokens-and-theme.md`](feature_specs/02-ui-tokens-and-theme.md) | UI colors, typography, border radius, and Modern Cashier Calm tokens |
| [`03-localization-infrastructure.md`](feature_specs/03-localization-infrastructure.md) | ARB files, l10n keys, RTL layout rules, and Arabic font support |
| [`04-shared-ui-primitives.md`](feature_specs/04-shared-ui-primitives.md) | Shared widgets (buttons, tables, chips, dialogs) derived from UI tokens |
| [`05-settings-and-configuration.md`](feature_specs/05-settings-and-configuration.md) | Price defaults, leeway, stale thresholds, and protected settings |
| [`06-admin-auth-and-audit-infrastructure.md`](feature_specs/06-admin-auth-and-audit-infrastructure.md) | Admin password and short-lived authorization, audit events ledger |
| [`07-first-run-setup-and-restore.md`](feature_specs/07-first-run-setup-and-restore.md) | First-run setup (admin pwd, safe restore, skip-able local GCP config check, configurable products) |
| [`08-player-profiles-and-search.md`](feature_specs/08-player-profiles-and-search.md) | Player identity, profiles, multiple phones, search, and snapshots |
| [`09-product-sales.md`](feature_specs/09-product-sales.md) | Product catalog and sales snapshots (anonymous or player-attached) |
| [`10-inventory.md`](feature_specs/10-inventory.md) | Inventory stock ledger, stock movements, and low stock warnings |
| [`11-time-pricing.md`](feature_specs/11-time-pricing.md) | Unified pricing matrix for all entry types, leeway, and rounding |
| [`12-subscriptions.md`](feature_specs/12-subscriptions.md) | Hour subscription cards, 30-min block usage log, expiration, and credit purchases |
| [`13-check-in-and-active-sessions.md`](feature_specs/13-check-in-and-active-sessions.md) | Check-in, persistent active board timers, auto-detected subscriptions, overdue sound+visual alerts |
| [`14-individual-checkout-domain-and-data.md`](feature_specs/14-individual-checkout-domain-and-data.md) | Pricing, payments, debt, tips, and discount calculations domain logic |
| [`15-individual-checkout-ui.md`](feature_specs/15-individual-checkout-ui.md) | Dense checkout widget flow, card/cash splits, and validation |
| [`16-group-checkout-domain-and-data.md`](feature_specs/16-group-checkout-domain-and-data.md) | Group checkout calculations, combined payments, and debt allocation |
| [`17-group-checkout-ui.md`](feature_specs/17-group-checkout-ui.md) | Combined checkout screen widgets and confirmation flows |
| [`18-corrections-voids-and-reversals.md`](feature_specs/18-corrections-voids-and-reversals.md) | Admin-authorized corrections and reversed ledger entries (preserving original history) |
| [`19-backup-restore-and-status.md`](feature_specs/19-backup-restore-and-status.md) | Local SQLite backup packaging (excluding secrets), GCP uploads, and safe restore verification |
| [`20-end-day-reporting-domain-and-data.md`](feature_specs/20-end-day-reporting-domain-and-data.md) | Frozen shift snapshot calculation, mismatch detection, and missed-close triggers |
| [`21-end-day-reporting-ui.md`](feature_specs/21-end-day-reporting-ui.md) | Dense cashier close dialog, daily report widgets, and cash/card reconciliation |
| [`22-exports.md`](feature_specs/22-exports.md) | Daily reports PDF and Excel-compatible CSV exports |
| [`23-technical-logging.md`](feature_specs/23-technical-logging.md) | Local technical log rotating, background uploads, and sensitive-data stripping |

## V1 Scope

In scope:

- Windows-only Flutter desktop app for one front-desk computer.
- SQLite local database accessed through Drift.
- Riverpod state management and dependency wiring.
- First-run setup for new installation or backup restore.
- Player profiles, active sessions, checkout, payments, debt, subscriptions,
  product sales, inventory, admin controls, audit, End Day reporting, exports,
  backup, and restore as defined in the feature specs.

Out of scope:

- Multi-device live sync or cloud database as source of truth.
- Family accounts, unique phone-number identity, cards, QR/barcode scanning,
  payment-terminal integration, online payments, receipt printers, wristbands,
  labels, cash drawers, individual employee accounts, staff permissions, staff
  time tracking, or customer credit balances.
- Backup encryption in v1.
- Manual custom group debt allocation amounts.
- Group checkout discounts.
- Discounts on old debt, tips, subscription purchases, or debt collection.
- Permanent deletion through normal workflows.
- Per-sale product price editing.
- macOS, Linux, mobile, tablet, or web versions.
- True `.xlsx` export unless later required.
- Automatic missed-close accounting splits.

## Global Success Criteria

- Required first-run setup or verified restore is complete before cashier
  operations begin.
- Employees can check players in, track active sessions, sell products, and
  complete individual or group checkout while offline.
- Pricing, discounts, subscriptions, debt, inventory, backup validation,
  restore safety, missed-close suggestions, and end-day calculations are covered
  by domain/service tests when implemented.
- SQLite remains the local source of truth and GCP remains backup/restore only (configured via local `.env`).
- Financial, session, debt, subscription, product, inventory, correction, and
  report records are durable, transactional, and auditable.
- The UI supports dense cashier workflows with the shared visual system from
  `context/ui-context.md` and
  [`02-ui-tokens-and-theme.md`](feature_specs/02-ui-tokens-and-theme.md) and
  [`04-shared-ui-primitives.md`](feature_specs/04-shared-ui-primitives.md).
