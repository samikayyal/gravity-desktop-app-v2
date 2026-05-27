---
id: "05"
title: Settings and Configuration
status: ready
implementation_order: 5
depends_on: ["01", "02", "03"]
must_read:
  - context/schema-reference.md
  - context/glossary.md
owns_tables:
  - system_settings
owns_paths:
  - lib/core/config/
  - lib/features/settings/
  - lib/data/repositories/settings_repository.dart
verification:
  - dart format --set-exit-if-changed .
  - flutter analyze
  - flutter test
stop_and_ask:
  - changing pricing defaults
  - changing stale-session thresholds
  - changing admin protection requirements for settings
---

# Feature Spec 05: Settings and Configuration

## Purpose
The Settings and Configuration system provides persistent control over the trampoline park's core financial and operational rules. It manages session pricing models (SYP), checkout grace leeway periods (default 10 minutes), stale session alert thresholds, and default product prices. The specification partitions configurations into public cashier settings and admin-protected options, establishing safe input boundaries, validation limits, and transactional storage constraints.

---

## Build Notes

### Architecture & Components
- **Configuration Layer**: `lib/core/config/system_settings_provider.dart` represents the global state manager holding cached settings in-memory.
- **UI Module**: `lib/features/settings/presentation/settings_screen.dart` implements a high-density, clean-looking settings dashboard.
- **Settings Partitioning**:
  - **Employee Mode Settings**: Locally editable without credentials (e.g. language selection, audio alarm mute, window scaling, debug logs viewer).
  - **Protected Admin Settings**: Locked behind short-lived password verification (e.g. price matrices, overtime leeway, stale session thresholds).

---

## Data/Domain/Storage

### Database Keys Schema Reference
Settings are stored inside the `system_settings` table defined in [schema-reference.md](../schema-reference.md). The schema uses simple text keys and text values, mapped and parsed into typed models in Dart:

| SQLite Key (`system_settings.key`) | Target Data Type | App Default Value | Operational Purpose |
| :--- | :--- | :--- | :--- |
| `'admin_password'` | Plaintext String | `'admin123'` | Plaintext password for administrative actions |
| `'leeway_minutes'` | Integer | `10` | Overtime grace period in minutes before extra blocks are charged |
| `'stale_threshold_minutes'` | Integer | `240` | Session age in minutes after which check-in is flagged stale |
| `'default_socks_price_syp'` | Integer SYP | `5000` | Fallback price for pre-filled jump socks |
| `'default_water_price_syp'` | Integer SYP | `2000` | Fallback price for pre-filled mineral water |
| `'pricing_matrix_json'` | JSON String | *(See below)* | Comprehensive timed entry price table |

### Pricing Matrix JSON Schema (`'pricing_matrix_json'`)
The core pricing system is stored as a robust, single-string JSON object containing the values of fixed duration blocks and open-time rates:

```json
{
  "currency": "SYP",
  "open_time_rates": {
    "first_hour_rate": 20000,
    "additional_30_min_rate": 8000
  },
  "fixed_duration_rates": {
    "block_30_min": 10000,
    "block_60_min": 18000,
    "block_90_min": 25000,
    "block_120_min": 32000,
    "additional_block_rate": 7000
  }
}
```
*Note: Timed session pricing utilizes integer SYP only; floats or decimals are strictly prohibited.*

---

## UI and Workflow

### Settings Dashboard Interface
The settings UI implements a split dashboard split into side-by-side or partitioned tabs:

1. **Cashier Options (Public)**:
   - Language selector dropdown (`English` or `Arabic`).
   - Notification volume slider with a "Mute Overdue Audios" toggle checkbox.
   - Screen scaling multiplier (1.0x, 1.1x, 1.2x).
2. **Admin Operations (Protected)**:
   - Displays a locked overlay containing a "Tap to Edit Admin Settings" action.
   - Clicking prompts the standard short-lived Admin Password dialog (detailed in [06-admin-auth-and-audit-infrastructure.md](06-admin-auth-and-audit-infrastructure.md)).
   - Unlocked state renders dense, inline-validated form fields:

```text
+-----------------------------------------------------------------+
|                      ADMIN SETTINGS (UNLOCKED)                 |
+-----------------------------------------------------------------+
| LEEWAY & STALE TIMERS                                           |
| Leeway Grace Period: [  10 ] mins  Stale Threshold: [ 240 ] mins|
|                                                                 |
| JUMP SESSIONS PRICING MATRIX (SYP)                              |
| [Fixed Blocks]                             [Open Time]          |
| 30 Mins: [ 10,000 ]    60 Mins: [ 18,000 ]  First Hr: [ 20,000 ]|
| 90 Mins: [ 25,000 ]   120 Mins: [ 32,000 ]  Extra 30: [  8,000 ]|
| Addl 30: [  7,000 ]                                             |
|                                                                 |
| DEFAULT INVENTORY PRICES                                        |
| Water Bottle: [ 2,000 ] SYP          Jump Socks: [ 5,000 ] SYP  |
+-----------------------------------------------------------------+
| [CANCEL]                                           [SAVE CHANGES] |
+-----------------------------------------------------------------+
```

### Form Input Validation Rules
Admin forms enforce structural limits to prevent operational or accounting errors:
- **Price values (SYP)**: Must be non-negative integers (`value >= 0`). Input fields strip out non-digit keystrokes immediately.
- **Leeway Period**: Must be between `0` and `60` minutes. Defaults to `10`.
- **Stale Threshold**: Must be greater than or equal to `60` minutes and at least **triple** the default leeway period to prevent active board alerts from colliding with stale flags prematurely.
- **Admin Password**: Minimum length of `4` characters; cannot be blank.

---

## Edge Cases and Rules

1. **Transactional Cache-Safety**:
   - Because check-in active board timers recompute charges in real time, settings are cached in memory on app startup using a Riverpod `StateNotifierProvider`.
   - **Rule**: Mutating settings via the UI must update SQLite using an atomic Drift database transaction. The in-memory Riverpod cache must only be updated **after** a successful SQLite database write confirms completion.
   - **Rule**: Protected admin settings must also require an active short-lived admin authorization session at the mutation boundary, not only through widget visibility.
2. **First-Run Price Injection**:
   - If the `system_settings` table contains empty configurations on startup (new installation), default fallback prices and matrices are injected during initialization before cashier login is allowed.
3. **Change Verification audit**:
   - Modifying protected admin settings generates mandatory audit ledger entries using the standard `audit_events` catalog from Feature 06.
   - Pricing matrix and default product price changes are recorded as `price_change`; leeway, stale threshold, and password changes are recorded as `settings_update`.
   - Audit metadata uses a field-oriented `changed_fields` object with `old` and `new` values plus `target_records.setting_keys`.

---

## Tests and Verification

### Config Validation and Persistence Tests
1. **Validation Domain Unit Tests**:
   - Verify that invalid input ranges fail validation constraints:
     - Inputting a negative leeway (e.g. `-5`) throws a validation error.
     - Setting a stale threshold smaller than leeway (e.g. `5` mins when leeway is `10` mins) fails assertion checks.
2. **Drift SQLite CRUD Integration Test**:
   - Write settings to local database inside an in-memory Drift instance.
   - Verify reading the keys retrieves the exact string formats written.
3. **Settings Caching & Update Consistency Test**:
   - Setup a Riverpod test container containing the settings notifier.
   - Trigger a price setting change update.
   - Assert that the in-memory value updates to match the new setting.
   - Verify that the Drift database shows the exact modified row.

---

## Acceptance Checklist

- [ ] SQLite `system_settings` table loaded, mapped, and queried through a dedicated Drift repository boundary.
- [ ] Admin password edit form blocks blank, null, or empty string values.
- [ ] Leeway duration limited to integer ranges between `0` and `60` minutes.
- [ ] Stale thresholds constrained to values greater than or equal to `60` minutes.
- [ ] App settings cached in memory at startup to support hot timer calculations.
- [ ] Modifying settings triggers atomic SQLite database transactions with zero risk of dirty in-memory reads.
- [ ] Unlocking admin configuration panels requires short-lived authentication session authorization.
- [ ] All successfully committed admin setting changes generate structured entries in the `audit_events` ledger table.

---

## What success looks like
The cashier app starts up and loads pricing rules instantly from memory. An operator can toggle English or Arabic interfaces and adjust audio warning volume settings freely. If an administrator needs to change jump ticket prices, they tap the edit panel, enter the administrative password, and modify the 60-minute session rate. The system performs immediate inline validations, commits the changes to the SQLite database, writes an audit log entry, refreshes the cached pricing system, and updates active checkout billing rates.
