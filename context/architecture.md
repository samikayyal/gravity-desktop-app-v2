# Architecture Context

## Stack

| Layer | Technology | Role |
| --- | --- | --- |
| Desktop runtime | Flutter desktop for Windows | Windows-only app shell, screens, dialogs, reporting UI, settings UI |
| Language | Dart | UI, domain logic, data access, background jobs, exports |
| Local database | SQLite | Offline-first source of truth |
| SQLite access | Drift | Typed queries, transactions, schema migrations, repository boundaries |
| State management | Riverpod | UI state, view models, async state, dependency wiring |
| Business logic | Dart domain/services layer | Pricing, checkout, payments, debt, subscriptions, inventory, reports |
| File exports | Dart PDF and CSV libraries | Daily report PDFs and Excel-compatible CSV exports |
| Cloud backup | GCP Cloud Storage | Timestamped backup packages for disaster recovery only |
| Background work | In-app Dart timers/jobs | Active board refresh, backup attempts, stale-session checks, exports |
| Access control | Employee mode plus admin password | Normal cashier work plus protected admin actions |
| Target platform | Windows desktop | One front-desk computer in v1 |

## Dependency Direction

Preserve this dependency flow:

```text
Screen Widget
  -> Riverpod Notifier/ViewModel
    -> Domain Service
      -> Repository
        -> Drift Database
```

- Widgets collect input, render state, show validation, and invoke view-model
  actions.
- Riverpod view models coordinate workflow state and dependency calls.
- Domain services own business decisions and are testable without Flutter.
- Repositories map domain models to Drift rows and queries.
- Drift classes own schema, migrations, transactions, and query details.
- Raw Drift rows must not cross repository boundaries into UI.

## System Boundaries

| Folder | Responsibility |
| --- | --- |
| `lib/main.dart` | App entry point only |
| `lib/app/` | App shell, routing, theming, layout scaffolds, global provider wiring |
| `lib/core/database/` | SQLite connection, Drift database, migrations, transactions |
| `lib/core/config/` | Settings models and defaults |
| `lib/core/security/` | Admin password hashing, authorization prompts, protected-action guards |
| `lib/core/backup/` | Backup package creation, GCP upload/download, restore orchestration, backup status |
| `lib/core/export/` | PDF and CSV generation from report/export models |
| `lib/core/audit/` | Audit event helpers for sensitive actions |
| `lib/core/logging/` | Technical logging, local log retention, queued log upload |
| `lib/domain/` | Pure business models, value objects, validation results, services |
| `lib/data/repositories/` | Persistence mapping between SQLite and domain models |
| `lib/features/players/` | Player search, profile forms, phone editing, debt warnings, history |
| `lib/features/sessions/` | Check-in, active board, timers, stale sessions, checkout UI |
| `lib/features/payments/` | Payment entry, split payments, tips, payment history, debt collection |
| `lib/features/subscriptions/` | Subscription creation, renewal, remaining blocks, usage history |
| `lib/features/products/` | Product catalog, product sales, product selection |
| `lib/features/inventory/` | Stock movements, restock/correction flows, stock warnings |
| `lib/features/reports/` | End Day, frozen/live reports, graphs, export triggers |
| `lib/features/settings/` | Admin-protected prices, leeway, stale threshold, backup config, admin password |
| `lib/features/setup/` | First-run new installation and restore-existing-backup flows |
| `test/domain/` | Unit tests for business rules |
| `test/data/` | Repository, transaction, and migration tests |
| `test/features/` | Functional widget/view-model tests |

## Storage Ownership

SQLite is authoritative for player profiles, phones, settings, sessions,
snapshots, prices, charges, payments, debt, discounts, tips, subscriptions,
subscription usage, products, sales, inventory movements, end-day snapshots,
missed-close confirmations, audit events, backup runs, backup manifests,
corrections, voids, and reversals.

Local app data files hold the SQLite database file, temporary backup packages,
restore safety copies, generated PDFs/CSVs, local app logs, and local GCP
credential/config files. Generated exports and logs are outputs, not source of
truth.

GCP Cloud Storage holds timestamped backup packages only. Each package contains
the SQLite database plus validation manifest metadata. It must not contain GCP
credentials, generated exports, local logs, or local secrets/config files.

In-memory UI state is cache only: selected rows, search text, form drafts,
checkout draft state, active board view models, alert flags, loading states, and
report graph data must be rebuildable from SQLite.

All business data belongs to the single local park installation. V1 has no cloud
tenant model. GCP backups should use an installation-specific bucket prefix.

Feature-specific storage details live in the relevant
`context/feature_specs/*.md` file.

## Auth And Access Model

V1 has no individual employee accounts. The app runs in local employee mode on
one front-desk computer.

| Actor | Access |
| --- | --- |
| Employee mode | Check players in/out, create and edit players, record payments, allow debt, collect debt, create subscriptions, sell products, add inventory stock, run End Day, view reports, export reports |
| Admin password holder | Employee actions plus price changes, cloud restore, voiding/deleting records, stale-session corrections, old financial/session corrections, protected settings |

The admin password is created during setup and stored as a salted hash, never
plaintext. Admin authorization is short-lived and scoped to the protected action
or dialog. Admin-authorized actions create audit events.

## Background Tasks

| Task | Trigger | Behavior |
| --- | --- | --- |
| Active board refresh | In-app timer | Recompute timer and session states from SQLite and current time |
| Scheduled backup | Every 2 hours while running | Create and upload backup package when internet is available |
| App-close backup | App close request | Attempt final backup without blocking graceful close |
| End-day backup | After successful End Day | Attempt immediate backup and store result on close snapshot |
| Stale-session detection | Startup and active board refresh | Flag sessions beyond the configurable threshold |
| Missed-close suggestion | End Day flow | Detect likely split periods using the inactivity-gap rule |
| Export generation | User action | Generate PDF or CSV files from report/export models |
| Log upload | Background retry | Upload technical logs when available without blocking cashier work |

Background work must call services/repositories rather than directly mutating
database tables. Durable mutations must use transactions where relevant.

## AI

There is no AI model, AI service, or AI-generated decision-making in v1.
Pricing, debt, subscriptions, inventory, reporting, and access control are
deterministic business logic.

## Invariants

1. SQLite is the local source of truth. GCP Cloud Storage is backup/restore
   only and never live sync.
2. Business rules must not live in Flutter widgets.
3. Player identity uses internal `player_id`; names and phone numbers are not
   unique identifiers.
4. Active-session timers derive from persisted `check_in_at` timestamps.
5. Stale sessions require admin correction before normal checkout.
6. Debt must attach to a player; anonymous or unassigned debt is not allowed.
7. Credit balances are not allowed. Overpayment is returned as change or
   explicitly recorded as a tip.
8. Group checkout underpayment must assign debt to one selected player or split
   it evenly across selected players.
9. Old debt is shown as a warning in group checkout and is not silently included
   in the group total.
10. Subscription entitlement and subscription financial debt are separate.
11. Subscription usage is deducted in 30-minute blocks.
12. Product inventory changes through movement records.
13. Product stock can go negative, but negative stock must be visible.
14. Normal workflows must not permanently delete business records; use
   void/correction/reversal records.
15. End Day is blocked while any player is checked in.
16. End Day saves a frozen close snapshot; live recalculated reports may differ
   later.
17. Admin password is required for protected actions.
18. Restore from backup is intentional and never automatic overwrite.
19. Cash/card payment records preserve method and amount for reconciliation.
20. Money, debt, subscription usage, inventory, and closed-day changes are
   transactional.
21. New installations require admin password setup, GCP backup configuration,
   and initial product setup before cashier operations.
22. Backup upload failure is recorded and shown but does not block offline work
   after setup.
23. Backup packages include only the database and validation manifest.
24. Restore validates manifest/checksum and creates a local safety copy before
   replacing the active database.
25. Business timezone defaults to `Asia/Damascus`; timestamps are stored as UTC.
26. Missed-close suggestions require human confirmation and counted totals.
27. Flat employee discounts cannot reduce old debt, tips, subscription
   purchases, debt collection, or group checkout totals.
28. Admin reversals and corrections preserve original records and post audited
   ledger adjustments.
29. Product sale line items snapshot product name and unit price at sale time.
