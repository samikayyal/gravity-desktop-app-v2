# Code Standards

## General

- Build for the actual v1 target: one Windows front-desk computer,
  offline-first, Flutter desktop, SQLite, and GCP bucket backup.
- Keep modules small, focused, and aligned with `context/architecture.md`.
- Fix root causes instead of layering UI workarounds over broken domain or
  persistence logic.
- Keep business-critical rules deterministic.
- Prefer explicit names over clever abstractions.
- Do not mix unrelated concerns in one class or file.
- Optimize for correctness before convenience when money, debt, subscriptions,
  inventory, reports, restore, or access control are involved.
- Treat offline operation as the default.
- Before feature implementation starts, complete the foundation scaffold from
  [`01-foundation-scaffold.md`](feature_specs/01-foundation-scaffold.md).

## Dart And Flutter

- Run `dart format` before considering code complete.
- Run `flutter analyze` before considering code complete.
- Use `flutter_lints`; analyzer warnings in hand-written source files are
  failures.
- Exclude generated Dart files such as `*.g.dart` and `*.freezed.dart` from
  analyzer checks. Fix generator inputs or dependency versions instead of
  hand-editing generated outputs.
- Prefer non-nullable types and explicit models over nullable maps or
  `dynamic`.
- Convert decoded external data into typed models immediately.
- Use `enum` or sealed/freezed unions for finite states.
- Use Freezed for domain models, value objects, and UI state where immutability,
  equality, copy behavior, or sealed states matter.
- Do not manually edit generated files.
- `// ignore:` comments must be rare, local, and include a short reason.
- Use Flutter desktop for Windows and Material 3.
- Build an operational cashier/front-desk UI, not a marketing interface.
- Follow the dependency direction documented in `context/architecture.md`.
- Screens and widgets must not call Drift directly or calculate business rules.
- Use screen-specific UI state models instead of loose maps or many unrelated
  booleans.
- Forms validate inline and prevent incomplete required submissions.
- Financial, destructive, restore, void, correction, and admin-protected actions
  must be clearly labeled and confirmed where appropriate.

## Styling

- Centralize colors, text styles, spacing, radius, and status colors.
- Do not scatter hardcoded colors, spacing values, or text styles.
- Use consistent status colors for active, near-end, overdue, open-time, stale,
  debt, low-stock, negative-stock, and backup states.
- Prioritize scanning speed, clear next actions, and dense cashier workflows.
- Avoid decorative UI that competes with operational status, money, debt,
  timers, or report totals.
- Text inside buttons, status chips, rows, and forms must fit at the 1080p
  target without clipping.
- Detailed UI token and primitive rules live in
  [`15-shared-ui-theme-and-primitives.md`](feature_specs/15-shared-ui-theme-and-primitives.md).

## Services, Repositories, And Background Jobs

- Domain services must be usable from tests without Flutter widget setup.
- Expected business failures use typed validation/result objects, not generic
  exceptions.
- Unexpected failures may throw internally, but workflow boundaries must catch
  them and show specific user-facing errors.
- Do not swallow errors silently.
- Log technical details locally, but do not expose raw stack traces or sensitive
  internals in employee-facing UI.
- Background tasks must call services/repositories rather than directly
  mutating database tables.
- Durable background mutations must use SQLite transactions where relevant.
- Backup and log upload failures must not block normal cashier work.
- Restore failures must leave the active local database intact.

## Domain Logic

- Store money as integer SYP amounts. Never use `double` for money.
- Format SYP consistently in UI and reports with thousands separators.
- Store timestamps as UTC ISO-8601 strings.
- Convert timestamps to local time only at UI, report, export, and subscription
  expiry boundaries.
- Business-day calculations use the configured local business timezone, not UTC
  date boundaries.
- Default business timezone is `Asia/Damascus`.
- Store durations as integer minutes or integer 30-minute blocks depending on
  the field.
- Pricing, checkout totals, discounts, subscription usage, debt allocation,
  payment allocation, inventory movement, stale-session detection,
  missed-close suggestions, and end-day calculations must live in
  domain/services code.
- Domain services must not import Flutter widgets or depend on UI context.
- Add short comments or doc comments for non-obvious business rules and public
  domain services.
- Non-obvious rule comments are required for pricing grace/downgrade/overtime,
  old debt being excluded from group checkout totals, subscription entitlement
  being separate from subscription debt, backup failure not blocking cashier
  work, stale sessions requiring admin correction, individual discounts not
  reducing old debt or group totals, and missed-close suggestions requiring
  human confirmation.
- Feature-specific domain rules live in the relevant file under
  `context/feature_specs/`.

## Data And Storage

- Use Drift for SQLite access.
- SQLite is the local source of truth.
- GCP Cloud Storage is backup/restore storage only, not live sync and not the
  primary database.
- Generated PDFs and CSVs are file outputs, not source-of-truth records.
- In-memory state is cache only and must be rebuildable from SQLite.
- Backup packages contain the SQLite database plus validation manifest and must
  exclude credentials, generated exports, local logs, local secrets, and local
  config files.
- Restore validates manifest/checksum and creates a local safety copy before
  replacing the active database.
- Database migrations must be explicit, reviewed, and tested.
- Repository code maps between Drift rows and domain/freezed models.
- Do not leak Drift row classes across repository boundaries.
- Use transactions for money, payments, debt, sessions, subscription
  entitlement/usage, product sales, checkout discounts, inventory, End Day,
  missed-close confirmation, corrections/voids, and backup restore state.
- Normal workflows must not permanently delete business records; use
  void/correction/reversal records.

## Auth, Logging, And Audit

- V1 uses employee mode plus admin password, not individual employee accounts.
- Store the admin password as plaintext in SQLite for v1. Do not add hashing or
  salting unless the product decision changes.
- Admin authorization is short-lived and scoped to the protected action/dialog.
- Admin-authorized actions create audit events.
- Separate technical logs from business audit events.
- Audit events belong in SQLite.
- Technical logs are local-first and must not be included in backup packages.
- Avoid logging sensitive data. Prefer IDs over names and never log full phone
  numbers unless there is a specific operational need.
- Detailed admin/audit and logging rules live in
  [`12-admin-audit-corrections.md`](feature_specs/12-admin-audit-corrections.md)
  and [`17-technical-logging.md`](feature_specs/17-technical-logging.md).

## Dependencies

- Add Flutter packages only when they provide clear value and are trusted.
- Prefer mature, maintained packages with Windows desktop support.
- Check license, maintenance/activity, Windows support, transitive dependency
  risk, and packaging impact before adding a dependency.
- Do not add duplicate packages for the same responsibility without a reason.
- Do not hand-roll complex behavior when a reliable package exists.
- Ask before adding a dependency that introduces major architecture, cloud,
  payment, native Windows, unusual license, or sensitive credential risk.
- Commit dependency metadata such as `pubspec.yaml` and `pubspec.lock` when
  dependencies change.
- Use `build_runner` for Drift, Freezed, Riverpod, and serialization generated
  code.

## Testing

- Testing is required. A feature is not done until relevant tests pass and
  `flutter analyze` is clean.
- Business/domain logic changes require unit tests.
- Repository/database changes require temporary SQLite tests.
- Migration changes require migration tests.
- Workflow screens that change business state require functional widget tests.
- UI functional tests verify behavior, not pixel layout.
- Golden tests are not required in v1 unless a component later needs visual
  regression coverage.
- Bug fixes add regression tests when the bug is testable.
- Feature-specific required test cases live in the relevant
  `context/feature_specs/*.md` file.

## File Organization

Use the folder ownership defined in `context/architecture.md`. Do not introduce
new top-level ownership boundaries without updating architecture context in the
same unit.

## Naming Conventions

### File & Class Naming
We enforce consistent naming to make the code highly readable and navigable for both humans and agents:
- **Repositories**: `lib/data/repositories/{feature}_repository.dart` containing class `{Feature}Repository`. Example: `PlayerRepository`, `ProductRepository`.
- **Domain Services**: `lib/domain/services/{feature}_service.dart` containing class `{Feature}Service`. Example: `PricingService`, `CheckoutService`.
- **Riverpod State Notifiers/ViewModels**: `lib/features/{feature}/presentation/{feature}_notifier.dart` containing class `{Feature}Notifier`. Example: `ActiveBoardNotifier`, `CheckoutNotifier`.
- **UI Screens/Widgets**: `lib/features/{feature}/presentation/{feature}_screen.dart` containing class `{Feature}Screen`. Example: `CheckoutScreen`, `ReportsScreen`.

### Localization (l10n) Key Naming
All user-facing text must be localized using flutter_localizations ARB files. Key names follow:
- **Format**: lowerCamelCase.
- **Prefixes**:
  - `label...` for form labels (e.g., `labelFullName`, `labelPhoneNumber`).
  - `btn...` for actionable buttons (e.g., `btnCheckIn`, `btnCheckout`).
  - `msg...` for alerts, feedback, errors (e.g., `msgCheckInSuccess`, `msgStaleSessionWarning`).
  - `title...` for headers, screen titles (e.g., `titleActiveBoard`, `titleDailyClose`).
  - `chip...` for status badges/chips (e.g., `chipOverdue`, `chipSubscription`).

