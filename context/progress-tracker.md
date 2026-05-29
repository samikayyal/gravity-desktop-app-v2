# Progress Tracker

Update this file after every meaningful implementation change.

## Current Phase

- Phase 1: Core Foundation Scaffold & UI Theme

## Current Goal

- Start the next implementation unit after Feature 07.

## Completed

- [x] Initial architecture alignment and grill-me design session.
- [x] Database schema centralized in `context/schema-reference.md`.
- [x] Top-level context files updated (`project-overview.md`, `architecture.md`, `code-standards.md`, `ui-context.md`, `ai-workflow-rules.md`).
- [x] Feature specs generated under `context/feature_specs/`, including split domain/UI specs for checkout, group checkout, and end-day reporting.
- [x] Context docs reviewed for agentic implementation readiness.
- [x] Shared business terminology centralized in `context/glossary.md`.
- [x] Feature specs annotated with agent-facing metadata blocks.
- [x] Schema readiness fixes applied for payment void status and no-hard-delete foreign key wording.
- [x] Feature specs renumbered by intended implementation order from `01-foundation-scaffold.md` through `23-technical-logging.md`.
- [x] Removed the separate implementation plan file; implementation order now lives in the numbered feature spec filenames.
- [x] **Feature 01: Foundation Scaffold & Architectural Corrections**: Initialized Flutter app, strict analysis configs, full 17-table Drift database schema, resolved environment security (adaptive local loader supporting app support directories), database path isolation, Riverpod providers, dynamic routing startup flow, first-run wizard layout, repository boundaries with Freezed domain mapping, cashier-calm SplitPanelLayout visual placeholders, and robust database recovery console routing. Fully verified with zero compile warnings, stale codegen checks in CI/CD, and 9 passing unit/widget tests.
- [x] **Foundation database hardening**: Enabled SQLite foreign key enforcement, aligned startup gating to `setup_complete`, standardized the runtime database filename as `gravity.db`, added DB-level enum/money checks, and added a partial unique index preventing duplicate non-closed sessions per player. Phone cardinality constraints remain deferred by request.
- [x] **Database diagram documentation**: Added a Mermaid ERD covering the current 17-table Drift SQLite schema, relationship notes, nullable references, and key runtime guards.
- [x] **Feature 02: UI Tokens and Theme**: Added centralized Modern Cashier Calm color tokens, spacing/radius tokens, `AppTheme.light`, `AppColorsExtension`, Outfit/Inter font assets, light-mode-only app wiring, themed button/input/card/navigation defaults, and contrast/theme-extension regression tests.
- [x] **Feature 03: Localization Infrastructure**: Added Flutter gen-l10n configuration, English/Arabic ARB dictionaries, generated `AppLocalizations`, Arabic Cairo/Tajawal font assets, locale-aware theme switching, app-locale persistence through `system_settings`, RTL split-panel mirroring, Western-digit timer/SYP formatters, and localization regression tests.
- [x] **Feature 04: Shared UI Primitives**: Added centralized shared widgets for cashier buttons, status chips, dense data tables, blind money/text inputs, dialogs, and the 60/40 split scaffold; refactored the current shell to use the shared split scaffold and active status chip; added shared UI regression tests for token colors, contrast, tabular monetary cells, long-text table density, blind count reveal behavior, and split-panel sizing.
- [x] **Feature 04 review fixes**: Keyed right-panel mode swaps so the shared split scaffold fade transition runs, constrained shared button labels to single-line ellipsis behavior, and added regression tests for both cases.
- [x] **Feature 05: Settings and Configuration**: Added typed cached app settings, default `system_settings` injection, protected admin settings persistence with validation and audit ledger entries, public cashier settings persistence, settings screen tabs for cashier/admin controls, admin unlock dialog, localized settings copy, and validation/repository/widget regression tests.
- [x] **Feature 06: Admin Auth and Audit Infrastructure**: Added reusable plaintext admin password verification through a repository boundary, five-minute sliding admin authorization sessions with injectable clock/timer tests, shared masked admin password dialog with Enter-submit support, audit event catalog/draft/service infrastructure, audit repository page reads, transactional protected settings audit writes with rollback-on-audit-failure coverage, active admin countdown badge with Lock System action, and a recent audit events grid in the admin settings panel.
- [x] **Feature 07: First-Run Setup and Restore**: Replaced the setup placeholder with a full-screen first-run wizard for admin password setup, optional safe SQLite restore, optional `.env`-based cloud configuration check, and editable socks/water product seeding. Added transactional setup persistence, initial product stock ledger writes, safe restore validation/rollback helper, localized setup copy, and focused setup/restore/widget tests.
- [x] **Cashier Options Mute Button UX Upgrade**: Replaced the simple ambiguous "Mute overdue audios" toggle switch with a premium, color-coded responsive dual-card selection interface. Stacks vertically on narrow viewports/tests and scales side-by-side on cashier screens, eliminating state ambiguity. Fully localized in English and Arabic, and verified with zero compiler warnings and 67 passing tests.
- [x] **Text Field Visual Design Upgrade**: Redesigned standard text inputs to use a separate Top-Label layout and clean bold typography instead of crammed floating labels. Upgraded global `InputDecorationTheme` with comfortable `16px/12px` paddings, relaxed `isDense` constraints, and a quiet recessed background (`#F8FAFC`) to provide clear visual depth on white card surfaces. Fully verified with clean static analysis and all tests passing.

## In Progress

- None.

## Next Up

- [ ] Review Feature 07 results and start `08-player-profiles-and-search.md` follow-up work only after current verification is clean.

## Open Questions

- None.

## Architecture Decisions

- **Single Cashier Setup**: V1 targets one Windows front-desk computer only.
- **Offline-First Truth**: Local SQLite database is the source of truth; GCP Cloud Storage is backup/restore only.
- **Drift & Riverpod**: Drift is the required SQLite access layer, and Riverpod is the required state-management and dependency-wiring layer.
- **UI Persistent Split-Panel**: Split-panel layout (Left ~60% persistent Active Board, Right ~40% Context & Action panel) for high cashier efficiency.
- **Hybrid Side Navigation**: Persistent thin side rail for switching modules (Players, Products, Inventory, Reports, Settings).
- **Check-In Entry Redesign**: Entry type selection is either Open Time or Fixed Duration (30-minute block increments via +/- buttons).
- **Auto-Detected Subscriptions**: Active subscriptions are automatically detected at check-in. Subscription holders must enter using their subscription.
- **Simplified Setup Wizard**: Setup collects admin password, supports optional safe restore, and runs a skip-able local GCP `.env` config check that does not enable cloud backup without later backup-service verification. Configurable products are pre-filled with default socks/water.
- **GCP Credential Storage**: GCP credentials (key, bucket) are loaded from a local gitignored `.env` file, never stored in SQLite or exposed in setup forms.
- **Sound + Visual Notifications**: Overdue players trigger a visual state change and an auditory system alert. A global mute option is provided.
- **Durable Audit Ledger**: Audit events capture admin password entry and high-risk actions.
- **No Hard Deletions**: Deleting rows is forbidden. System uses void/reversal ledger records to correct financial and session mistakes.
- **Business Timezone**: Default business timezone is `Asia/Damascus` (timestamps stored as UTC ISO-8601 strings).
- **End Day Reporting**: Shifts are closed by entering counted cash/card amounts and checking for mismatches. Closed shift data is frozen in time.
- **Flat Cash Discounts**: Employee discounts are flat SYP cash values on eligible subtotals, never reducing old debt, tips, or group totals.
- **Local Rotating Logs**: Technical log files are rotated locally, keeping sensitive names/phones private.

## Session Notes

- 2026-05-22: Reset progress tracker to clean state. Rewrote top-level context files to match 20 design decisions from grill-me session. Centralized Drift SQLite tables in `context/schema-reference.md`.
- 2026-05-22: Generated first 5 feature specifications (01-Foundation Scaffold, 02-UI Tokens and Theme, 03-Localization Infrastructure, 04-Settings and Configuration, 05-Admin Auth and Audit Infrastructure).
- 2026-05-22: Applied requested agentic-implementation context cleanup: refreshed progress state, fixed broken spec links, updated `AGENTS.md`, added `glossary.md`, added feature-spec metadata, clarified schema readiness, moved shared UI primitives earlier in the spec order, and sliced foundation work.
- 2026-05-22: Removed the separate plan file per user direction and renumbered feature specs so filenames carry the implementation order directly.
- 2026-05-23: Resolved and verified all 7 architectural correction items. Fixed ambiguous repository imports and test package imports, achieved 100% clean formatting and zero static warnings, successfully executed all 9 widget/unit tests, and updated progress and walkthrough logs.
- 2026-05-25: Resolved all 3 Round 2 Quality Gaps. Built startup_state domain entity, StartupRepository to isolate Drift queries, fully styled Database Rescue Screen for unmasked corruption errors, added git diff checks in CI and local verify scripts to prevent stale codegen, and integrated adaptive production .env path loading. Verified 100% test and analysis completion.
- 2026-05-25: Applied database review fixes except phone cardinality enforcement. Added Drift foreign key PRAGMA, schema check constraints for status and non-negative financial fields, duplicate active-session partial unique index, corrected startup detection to require `setup_complete = '1'`, standardized the runtime DB file to `gravity.db`, and added regression coverage for these database invariants.
- 2026-05-25: Added `context/database-diagram.md` with a Mermaid ERD for the current 17-table Drift schema and linked it from `context/schema-reference.md`. Verification was documentation-only by targeted file review.
- 2026-05-25: Implemented Feature 02 UI tokens and theme. Centralized the light-mode Material 3 theme in `lib/app/theme/`, registered all eight cashier status colors through `AppColorsExtension`, added Outfit and Inter variable font assets, replaced local placeholder color styling with theme-derived values, and verified with `dart format --set-exit-if-changed .`, `flutter analyze`, and `flutter test`.
- 2026-05-25: Applied Feature 02 review fixes. Mapped `ColorScheme.onSurfaceVariant` to the secondary text token and added a central table-number typography token used by dense data tables. Verified with targeted theme tests plus full format, analyze, and test checks.
- 2026-05-25: Implemented Feature 03 localization infrastructure. Added `l10n.yaml`, bilingual ARB files, generated localizations, Flutter localization delegates, persistent `app_locale` storage, Cairo/Tajawal font assets, Arabic theme font switching, localized placeholder/setup/rescue strings, a settings-panel language dropdown, RTL split-panel mirroring, and Western-digit cashier formatters. Verified with `flutter gen-l10n`, `dart format --set-exit-if-changed .`, `flutter analyze`, and `flutter test` (26 passing tests).
- 2026-05-25: Implemented Feature 04 shared UI primitives. Added `GravityButton`, `GravityStatusChip`, `GravityTextField`, `GravityDataTable`, `GravityDialog`, and `GravitySplitScaffold`; wired the main split layout to the shared scaffold/status chip; added shared UI widget tests for primary button colors/contrast, chip status colors, tabular monetary cells, no-overflow dense tables, blind money reveal toggling, and 60/40 split sizing. Verified with `dart format --set-exit-if-changed .`, `flutter analyze`, `flutter test test/features/shared_ui`, and `flutter test` (32 passing tests).
- 2026-05-27: Applied Feature 04 review fixes. Keyed the split layout right-panel modes so `AnimatedSwitcher` keeps old/new panels during transitions, constrained `GravityButton` labels with single-line ellipsis, and added regression coverage for right-panel transitions and narrow long-label buttons.
- 2026-05-27: Implemented Feature 05 settings and configuration. Added `AppSettings` typed defaults/validation, `SettingsRepository` transactional `system_settings` persistence, default setting seeding, redacted `settings_update` audit metadata for protected changes, `SystemSettingsController` Riverpod cache, public cashier options, admin settings tabs/unlock flow, admin password editing, pricing/leeway/stale/default-product fields, localized English/Arabic settings strings, and focused validation/repository/widget tests. Verified with `flutter gen-l10n`, `dart format .`, `flutter analyze`, targeted settings tests, and full `flutter test` (44 passing tests).
- 2026-05-27: Applied Feature 05 review fixes. Runtime now applies persisted screen scaling to the cashier shell, protected settings saves require an active shared admin authorization session at the provider/repository mutation boundary, pricing/product-base edits emit `price_change` audit rows with field-oriented metadata, non-price protected edits emit `settings_update`, the settings unlock flow uses the Feature 06 five-minute session duration, and the stale-threshold spec now consistently allows values greater than or equal to 60 minutes.
- 2026-05-27: Implemented Feature 06 admin auth and audit infrastructure. Moved authorization tokens into `core/security`, routed plaintext password checks through `AdminAuthRepository`, added injectable session clock/timer behavior for exact five-minute sliding expiry tests, added shared `AdminPasswordDialog`, added `AuditService`/`AuditRepository`/audit providers, rendered active admin countdown plus Lock System and paged recent audit events in settings, and verified transactional rollback when an audit insert fails. Verified with `flutter gen-l10n`, `dart format --set-exit-if-changed .`, `flutter analyze`, targeted settings repository/screen tests, and full `flutter test` (51 passing tests).
- 2026-05-28: Applied Feature 06 review fixes. Admin auth now requires an explicit `system_settings.admin_password` row instead of falling back to the hard-coded default, and the audit event display summary now recursively expands nested pricing matrix diffs so changed prices such as `block_60_min: 18000 -> 19000` are visible in the admin audit grid. Added regression coverage for missing password rows and visible nested price diffs.
- 2026-05-28: Implemented Feature 07 first-run setup and restore. Added the setup wizard state machine and full-screen UI, plaintext admin password setup, safe restore helper with raw `PRAGMA integrity_check`, required-table validation without running Drift migrations, safety-copy rollback, skippable `.env` cloud readiness check, editable Grippy Socks/Bottled Water catalog seeding, setup completion gating, and targeted setup tests. Verified with `flutter gen-l10n`, `dart format --set-exit-if-changed .`, `flutter analyze`, `flutter test test/features/setup` (8 passing tests), and full `flutter test` (60 passing tests).
- 2026-05-28: Applied Feature 07 review fixes. Restore validation now rejects databases missing critical setup rows (`setup_complete == 1` and explicit non-empty `admin_password`), startup gating also requires the explicit admin password row, duplicate enabled setup SKUs are blocked in UI state and defensively rejected by the setup repository transaction, and the cloud setup step was downgraded to a local `.env` configuration check that never sets `gcp_enabled = 1` until a later backup service performs real bucket verification.
- 2026-05-28: Raised the global cashier typography scale for better readability: timers now use 40px, major headers 26px, panel/dialog headers 20px, body/button text 16px, helper/input labels 14px, status chips 13px, and table numbers 15px. Updated the Feature 02 typography contract and theme regression coverage.
- 2026-05-28: Applied minor Feature 07 adjustments. Removed the 6-character admin password requirement (requiring only non-empty password matching confirmation) and updated the progress bar header to render completed steps with a green highlighted status chip and a checkmark instead of a dot.
- 2026-05-28: Applied further Feature 07 user tweaks: removed the grayish progress bar from above the pills; updated `GravityTextField` to support a `suffixText` parameter and added the `'SYP'` suffix to the product catalog price field; removed enabling checkboxes so all listed products are seeded; renamed default products from `'Grippy Socks'` / `'Bottled Water'` to just `'Socks'` / `'Water'`; and removed the SKU field from employee editing (it is now derived automatically as the uppercase of the trimmed name). Verified with 60 passing tests and clean static analysis.
- 2026-05-28: Moved the sidebar navigation rail in the main dashboard SplitPanelLayout to the right side of the screen using the renamed `navigationRail` parameter in `GravitySplitScaffold`, and updated the RTL mirroring test expectations so that the sidebar mirrors to the left in Arabic locale. Fully verified with clean formatting, zero static analysis issues, and 65 passing tests.
- 2026-05-29: Removed the 4-character minimum password length validation rule for the admin password. The validation now only ensures the password is non-empty and non-blank across core settings validation, settings editing text fields, and the admin settings unlock dialog. Verified with 65 passing tests and clean static analysis.
- 2026-05-29: Updated `GravityTextField` text alignment to adapt dynamically to the active language (left-aligned in English, right-aligned in Arabic), overriding hardcoded defaults. Added widget regression test ensuring correct LTR and RTL alignments under localized contexts. All 66 tests passing and static analysis is 100% clean.
- 2026-05-29: Removed the screen scaling option from the cashier settings UI, completely removing it from the employee's control. Forced layout scaling in the app launch flow to remain at a fixed 1.0 multiplier to protect the sidebar location and layout elements. Updated gravity_app_test.dart to verify that legacy screen scale configurations in the database are safely ignored by the runtime app. Fully verified with clean formatting, zero static analysis issues, and 66 passing tests.
- 2026-05-29: Redesigned the standard `GravityTextField` widget to use a spacious Top-Label layout, and upgraded global theme input decoration settings (recessed background, larger padding, relaxed density). Fully verified with clean static analysis and all tests passing.
- 2026-05-29: Removed Recent Audit Events Grid: Removed the paginated `_AuditEventsPanel` grid and its unused helpers/imports from the admin operations settings tab, while preserving transaction-level security and SQLite audit logs. Updated settings screen tests to reflect the UI change. Fully verified with clean formatting, zero analyzer warnings, and all 67 tests passing.
