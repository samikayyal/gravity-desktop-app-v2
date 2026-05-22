# Player Profiles and Search Specification

## Purpose
The Player Profiles and Search system serves as the baseline entry registry for customers. Cashiers must be able to search existing profiles quickly or register new ones with minimum friction during peak hours. This module ensures accurate tracking of customer contact numbers (specifically supporting multiple phone numbers per player), prevents dual check-ins, and manages search caching.

---

## Build Notes
- **Language & Runtime**: Dart & Flutter (Windows desktop layout).
- **State Management**: Riverpod (`StateNotifierProvider` or `NotifierProvider`).
- **Database & Persistence**: Drift with SQLite.
- **Folder Structure**:
  - `lib/features/players/presentation/` (Widgets: `player_search_bar.dart`, `player_list_table.dart`, `player_profile_form.dart`, ViewModels: `player_search_notifier.dart`, `player_profile_notifier.dart`)
  - `lib/data/repositories/player_repository.dart`
  - `lib/domain/services/player_service.dart`

---

## Data/Domain/Storage
This feature relies on the `players` and `player_phones` tables defined in the global schema database. 

Refer directly to:
- [`context/schema-reference.md#1-players`](../schema-reference.md#1-players) for the `players` table.
- [`context/schema-reference.md#2-player_phones`](../schema-reference.md#2-player_phones) for the `player_phones` table.

### Snapshot Mechanics & Cached Flags
1. **No Session Duplication (`has_active_session`)**:
   - The field `has_active_session` is a cached Boolean (`0` or `1` in SQLite) on the player row.
   - When a session check-in transaction starts, the system validates that `has_active_session` is `false`.
   - Upon successful check-in transaction, `has_active_session` is updated to `true`.
   - Upon successful check-out transaction, `has_active_session` is updated to `false`.
2. **Profile Durability**:
   - To preserve clean audit trails, updates to a player's profile (name or phone) do not retroactively alter the snapshot data in past completed financial checkout records.
   - Outstanding debt records are linked using the unique UUID `player_id`.

---

## UI and Workflow

### Layout Context
This interface operates within the **Persistent Split-Panel Layout** (Left Panel ~60% Active Board, Right Panel ~40% Context & Action Panel). Clicking the thin Side Navigation rail for **Players** loads the Player Search panel.

```mermaid
graph TD
    A[Side Navigation: Players] --> B[Left Panel: Player Search List]
    B -->|Click Player Row| C[Right Panel: Profile & Session History]
    B -->|Click "New Player"| D[Right Panel: Create Profile Form]
```

### 1. Player Search List (Left Panel)
- **Search Bar Input**: Compact text input with a magnifying glass icon. Captures real-time text input.
- **Results Table**: A high-density data table displaying:
  - Full Name
  - Primary Phone Number
  - Age
  - Active Status Chip (Green `"Active"` if `has_active_session` is true; otherwise neutral/hidden)
  - Debt Status Chip (Red `"SYP X,XXX Debt"` if outstanding debt exists)
  - Actions (Button to select for Check-in / Sale, Button to Edit)

### 2. Player Profile Form (Right Panel)
Used for both **New Player Registration** and **Editing Existing Profiles**.
- **Full Name Field (`labelFullName`)**: Non-empty text field. Matches characters exactly.
- **Age Field (`labelAge`)**: Numeric input. Must be an integer between 1 and 120.
- **Phone Numbers Section**:
  - Dynamically rendered list of phone inputs.
  - Button `btnAddPhone` ("+ Add Phone") appends a new input row.
  - Trash icon button next to each phone row to delete that number (disabled if only 1 phone number remains).
  - Radio button next to each phone row to select exactly one contact as `is_primary`.
- **Form Actions**:
  - Button `btnSave` ("Save Profile") with Modern Cashier Calm brand yellow `#FBF306` background. Validates inputs before database execution.
  - Button `btnCancel` ("Cancel") to discard changes.

---

## Edge Cases and Rules

| Rule ID | Operational Scenario | Business Constraint | Action / Enforcement |
| :--- | :--- | :--- | :--- |
| **PC-01** | Phone registration | Minimum of 1 phone number is required. | Validation blocks saving if phone count is `< 1`. |
| **PC-02** | Primary contact | Exactly one phone number must be marked `is_primary`. | The UI defaults the first phone row to primary. Radio behavior enforces a single selection. DB level checks constraint. |
| **PC-03** | Player Identity | Phone numbers are NOT unique keys (e.g. siblings sharing parent number). | Uniqueness is NOT enforced on phones or names. Core player identity uses UUID `player_id`. |
| **PC-04** | Search formatting | Searches must work regardless of formatting (dashes, spaces, country codes). | Search queries normalize input (strip non-numeric characters for phone queries) and match substring. |
| **PC-05** | Double Check-In | Player has an active session. | If `has_active_session` is `true`, check-in is blocked in the checkout/session service. UI displays warning chip. |
| **PC-06** | Profile Deletion | Employee attempts to delete a profile. | **Forbidden**. Deleting players is prohibited to maintain audit trails. Deactivated players are flagged or soft-deleted (out of scope for v1). |

---

## Tests and Verification

### Unit & Domain Service Tests
- **Input Validation Service**:
  - Validate that an empty name, non-integer age, or zero phone rows throw a typed validation error.
  - Ensure that creating a profile without setting any primary phone raises a validation error.
- **Normalized Phone Parser**:
  - Test normalization helper `PlayerService.normalizePhone(String raw)`:
    - Input: `"+963 933-111 222"` -> Output: `"963933111222"`.
    - Input: `"0944 555 666"` -> Output: `"0944555666"`.

### Repository & Integration Tests
- **Player Database Operations**:
  - Insert player with 3 phone numbers, verifying that `player_phones` correctly populates with corresponding foreign keys and exactly one `is_primary` set to true.
  - Update player to change the primary phone number, asserting that only the new selected phone has `is_primary = 1` and other rows are set to `0`.
- **Dual Check-In Assertions**:
  - Simulate a check-in action. Confirm that `has_active_session` flips to `true`. Attempting another check-in on the same `player_id` must throw an `ActiveSessionExistsException`.

### Presentation / Widget Tests
- **Dynamic Form Rows**:
  - Verify that clicking "+ Add Phone" inserts a new input text field on screen.
  - Verify that clicking the delete icon removes the corresponding row.
  - Assert that when only one phone row remains, its delete button is disabled (`WidgetTester.ensureWidgetIsDisabled`).

---

## Acceptance Checklist

- [ ] SQLite tables `players` and `player_phones` are configured according to `schema-reference.md`.
- [ ] User-facing text matches localization naming standards (`labelFullName`, `labelAge`, `btnAddPhone`, `btnSave`).
- [ ] Profile registration requires a minimum of one phone number and exactly one primary phone.
- [ ] Phone searches strip spaces, dashes, and special characters to allow bulletproof lookup.
- [ ] Clicking a player in the list loads the profile editor in the Right Panel (~40% width) while keeping the search visible in the Left Panel (~60%).
- [ ] The `has_active_session` cached flag is managed in transactions to block dual check-ins.
- [ ] All database mutations utilize repository classes, avoiding direct Drift leaking to screen widgets.
- [ ] All business unit tests pass, and the analyzer runs clean (`flutter analyze`).

---

## What success looks like
A cashier types a partial phone number like `933 111` or full name `Sami` into the search bar. The results table updates instantly, displaying Sami's profile with a red debt indicator chip because he has outstanding balances. The cashier clicks "Edit", which opens the profile form in the Right Panel, updates one of his phone numbers, checks a box to mark it primary, and saves—all without losing visual track of active trampoline sessions in the Left Panel.
