# Progress Tracker

Update this file after every meaningful implementation change.

## Current Phase

- Spec-driven Context Setup (Clean Slate)

## Current Goal

- Complete the rewrite of the `context/` folder by generating all 20 reordered feature specifications under `context/feature_specs/` using the grill-me decisions.

## Completed

- [x] Initial architecture alignment and grill-me design session.
- [x] Database schema centralized in `context/schema-reference.md`.
- [x] Top-level context files updated (`project-overview.md`, `architecture.md`, `code-standards.md`, `ui-context.md`, `ai-workflow-rules.md`).
- [x] Feature specs 01 to 05 written and finalized (Scaffold, Theme/Tokens, Localization, Settings, Admin Auth/Audit).

## In Progress

- [/] Feature specifications generation in `context/feature_specs/` (Specs 06-20).

## Next Up

- [ ] Spec 06: Player Profiles and Search (Player identity, profiles, multiple phones, search, and snapshots).

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
