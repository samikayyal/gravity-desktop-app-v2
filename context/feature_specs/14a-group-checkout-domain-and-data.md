# Feature Spec 14a: Group Checkout (Domain and Data)

## Purpose
Define the business rules, data models, and database transaction structures required to execute a multi-player **Group Checkout**. The system must aggregate separate player sessions and product sales, validate split payment methods against the aggregate total, allocate debt to specific group members in case of underpayment, and maintain complete transactional integrity across SQLite tables.

---

## Build Notes
- **Language & Runtime**: Pure Dart 3 (domain/services layer).
- **Libraries**: Drift (for relational database transactions), Freezed (for group data structures).
- **Folder Structure**:
  - `lib/domain/entities/group_checkout_manifest.dart` (Freezed model capturing group participants, costs, and payment splits)
  - `lib/domain/services/group_checkout_service.dart` (Domain service containing group calculators and balance handlers)
  - `lib/data/repositories/group_checkout_repository.dart` (Drift transaction layer for group processing)

---

## Data/Domain/Storage
Group checkout modifies multiple player sessions and processes combined payment records.
Refer to [schema-reference.md](../schema-reference.md) for the exact schema details of the following tables:
- **`sessions`**: Multiple sessions are updated to `'closed'` state and linked through payments sharing a common `payment_group_id`.
- **`product_sales` & `sale_items`**: Written if products are sold to the group or individual participants during checkout.
- **`payments`**: Created for each payment method. All payment rows written for a group checkout share the exact same `payment_group_id` (UUID).
- **`debts`**: Written if the group checkout finishes underpaid. The unpaid debt is assigned to designated player IDs.

### Domain Models (Freezed)
```dart
@freezed
class GroupCheckoutManifest with _$GroupCheckoutManifest {
  const factory GroupCheckoutManifest({
    required String paymentGroupId,
    required List<String> sessionIds,
    required List<GroupParticipant> participants,
    required int totalProductCharge,     // SYP
    required int totalSessionCharge,     // SYP
    required int totalTipAmount,         // SYP
    required List<PaymentSplit> payments,// Cash/Card payments split
    required List<DebtAllocation> debtAllocations, // Assigned debt
  }) = _GroupCheckoutManifest;
}

@freezed
class GroupParticipant with _$GroupParticipant {
  const factory GroupParticipant({
    required String playerId,
    required String sessionId,
    required int individualSessionCharge, // SYP after individual discount
    required int individualProductCharge, // SYP
  }) = _GroupParticipant;
}

@freezed
class DebtAllocation with _$DebtAllocation {
  const factory DebtAllocation({
    required String playerId,
    required int amountAssigned, // SYP
  }) = _DebtAllocation;
}
```

---

## Business Rules and Domain Calculations

### 1. Subtotal Aggregation & Grand Total
- The system pulls active sessions for all selected group players.
- For each player, the session time charge is calculated individually (incorporating any individual leeway rules or subscription block consumptions).
- **Grand Total Calculation**:
  $$\text{Group Grand Total} = \sum \text{Individual Session Charges} + \sum \text{Product Charges} + \text{Tips}$$

### 2. Group Checkout Discount Restrictions
- **Invariant #27**: Flat employee discounts **cannot** reduce group checkout totals as a single flat block.
- **Discount Rule**:
  - Employee discounts must be applied strictly to *individual* play session cards *before* group aggregation.
  - The group checkout domain service does not accept a global group-level discount parameter. This prevents auditing leaks and ensures all discounts map to specific, audited play session records.

### 3. Payment Split and Allocation
- Payments (cash & card) are made against the aggregate Group Grand Total.
- The total paid amount must equal the Group Grand Total minus any newly allocated debt:
  $$\sum \text{payments.amount\_paid} = \text{Group Grand Total} - \sum \text{debtAllocations.amount\_assigned}$$

### 4. Underpayment & Debt Distribution Invariants
- If the total amount paid by the group is less than the Group Grand Total, the remaining unpaid balance **must** be allocated as debt.
- **Debt Distribution Rules**:
  - Debt must attach to a real player; anonymous or unassigned group debt is strictly prohibited.
  - The cashier must designate which player(s) in the group will inherit the debt.
  - **Distribution Options**:
    1. **Assign to a Single Leader**: The entire remaining balance is assigned as a single `debts` record for one chosen player (typically the parent or group organizer).
    2. **Split Evenly**: The remaining balance is divided evenly among all selected players, generating a separate `debts` record for each participant. (Any round-off division fractions are added to the first player's debt to maintain perfect balance).

---

## Edge Cases and Rules
1. **Old Debt Warnings & Prevention Invariant**:
   - **Invariant #9**: Old debt is shown as a warning in group checkout and is **not silently included** in the new group total.
   - If any participant in the group has outstanding old debt from a prior session, the domain layer throws a validation warning (`msgGroupOldDebtWarning`).
   - The cashier must explicitly resolve this debt (either by collecting it separately or choosing to ignore it for this transaction). Old debt cannot be merged into the group payment block without separate ledger records.
2. **Subscription + Paid Mix**:
   - In a group checkout, some players may have sessions covered by their individual subscriptions, while others pay cash.
   - The group calculator correctly aggregates subscription usage logs for subscription players (deducting minutes from cards) and only aggregates cash ticket charges for the remaining players.

---

## Tests and Verification

### Unit Tests (`test/domain/group_checkout_service_test.dart`)
- **Group Aggregation Verification**: Verify that a group of 3 players (1 subscription player with 0 cash play fee, 2 regular players with 15,000 SYP fees, plus 10,000 SYP in shared product sales) compiles a correct Group Grand Total of 40,000 SYP.
- **Debt Allocation Even Split**: Simulate a group checkout total of 45,000 SYP with a payment of 30,000 SYP (leaving 15,000 SYP in debt). Verify that splitting the debt evenly across 3 players generates exactly three `debts` database insert entities of 5,000 SYP each.
- **Old Debt Prevention Guard**: Verify that attempting to commit a group checkout where one player has an outstanding old debt in the database throws an explicit exception if the cashier hasn't explicitly confirmed receipt or separation of that balance.

### Repository Transaction Tests (`test/data/group_checkout_repository_test.dart`)
- **Transactional Rollback on Failure**: Assert that if writing a debt record for Player C fails during a group checkout database transaction, all updates (sessions closed for Players A, B, and C, and all logged payments) are completely rolled back in SQLite.

---

## Acceptance Checklist

| ID | Requirement Details | Check |
| --- | --- | --- |
| AC-14a.1 | Verify that the service aggregates multiple session calculations into a single group subtotal. | [ ] |
| AC-14a.2 | Verify that the global group-level discount field is rejected by the domain layer. | [ ] |
| AC-14a.3 | Verify that underpaid totals trigger mandatory debt assignment to a designated player or split. | [ ] |
| AC-14a.4 | Verify that old debt cannot be silently rolled into the group checkout payment. | [ ] |
| AC-14a.5 | Verify that all payments in a group checkout share the same `payment_group_id`. | [ ] |

---

## What success looks like
Multi-player groups (like birthday parties or families) checkout in a single unified financial step. The database accurately ties all separate sessions and product transactions under a shared payment group ID, while cleanly distributing play charges and product additions. If a parent is paying for five kids, the system collects a single split cash/card payment and, if short, assigns the debt exactly to the parent's file—never letting older debts slip into the receipt unnoticed.
