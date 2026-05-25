# Progress Tracker

Update this file after every meaningful implementation change.

## Current Phase

- Phase 1: Core Foundation Scaffold & UI Theme

## Current Goal

- Complete the foundation scaffold verification and begin styling/theme configuration.

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

## In Progress

- [/] Transitioning to Feature 02: UI Tokens and Theme.

## Next Up

- [ ] Start `02-ui-tokens-and-theme.md`.

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
- **Simplified Setup Wizard**: Setup collects admin password and runs a skip-able GCP connection test. Configurable products are pre-filled with default socks/water.
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


