---
id: "14"
title: Individual Checkout - Domain and Data
status: ready
implementation_order: 14
depends_on: ["01", "05", "06", "08", "09", "10", "11", "12", "13"]
must_read:
  - context/schema-reference.md
  - context/glossary.md
owns_tables:
  - sessions
  - payments
  - debts
  - debt_payments
  - product_sales
  - sale_items
owns_paths:
  - lib/domain/services/checkout_service.dart
  - lib/data/repositories/checkout_repository.dart
  - test/domain/checkout_calculator_test.dart
  - test/data/checkout_repository_test.dart
verification:
  - dart format --set-exit-if-changed .
  - flutter analyze
  - flutter test test/domain
  - flutter test test/data
stop_and_ask:
  - changing discount eligibility
  - changing debt allocation behavior
  - changing payment split or tip/change behavior
---

# Feature Spec 14: Individual Checkout - Domain and Data

## Purpose
Define the business rules, data models, and database transaction structures required to calculate play ticket charges, compile checkout subtotals (session time + product additions), manage split payment processing (cash & card), process cash tips, and enforce restricted employee discounts for a single player checking out.

---

## Build Notes
- **Language & Runtime**: Pure Dart 3 (domain/services layer).
- **Libraries**: Freezed (for immutable checkout models), Drift (for database transactions).
- **Folder Structure**:
  - `lib/domain/entities/checkout_summary.dart` (Freezed representation of subtotal, discounts, and payments)
  - `lib/domain/services/checkout_service.dart` (Core business logic for calculating checkout costs)
  - `lib/data/repositories/checkout_repository.dart` (Persisting the checkout state in a SQLite transaction)

---

## Data/Domain/Storage
Checkout operations interact with several tables in the SQLite database.
Refer to [schema-reference.md](../schema-reference.md) for the exact schema details of the following tables:
- **`sessions`**: Modified on checkout to set `check_out_at`, `status = 'closed'`, `calculated_charge`, `final_charge`, `discount_amount`, and `discount_reason`.
- **`product_sales` & `sale_items`**: Written if products (e.g. water, socks) are sold as part of the checkout process.
- **`payments`**: Created for each payment method split (e.g. one row for `'cash'`, one row for `'card'`).
- **`debts`**: Written if underpayment occurs and the cashier assigns the remaining balance as player debt.
- **`inventory_movements`**: Deducted dynamically when products are added to checkout.

### Core Domain Models (Freezed)
```dart
@freezed
class CheckoutDetails with _$CheckoutDetails {
  const factory CheckoutDetails({
    required String sessionId,
    required String playerId,
    required DateTime checkInAt,
    required DateTime checkOutAt,
    required String entryType,
    required int calculatedSessionCharge, // SYP
    required int discountAmount,         // SYP
    required String? discountReason,
    required List<ProductSaleLineItem> productItems,
    required int tipAmount,              // SYP
    required List<PaymentSplit> payments,
  }) = _CheckoutDetails;
}

@freezed
class PaymentSplit with _$PaymentSplit {
  const factory PaymentSplit({
    required String method, // 'cash' or 'card'
    required int amountPaid, // SYP (excludes tips)
    required int tipAmount,  // SYP
  }) = _PaymentSplit;
}
```

---

## Business Rules and Domain Calculations

### 1. Session Duration & Ticket Pricing
- **Fixed Duration**:
  - Reserved blocks determine the price.
  - If a player checks out *before* their reserved time expires, they are charged the full cost of the reserved blocks.
  - If a player checks out *after* their reserved time expires (exceeding the configured grace leeway, e.g., `'leeway_minutes' = 5`), they are charged an additional overtime fee.
  - **Overtime pricing**: Calculated in 30-minute block increments based on the standard half-hour ticket rate.
- **Open Time**:
  - Charged dynamically based on total elapsed minutes (`check_out_at` - `check_in_at`).
  - Total minutes are grouped into 30-minute blocks (rounded up to the next block after crossing the leeway threshold).
  - Price = `blocks * half_hour_rate`.

### 2. Employee Discounts
- Cashiers are authorized to apply a flat **employee cash discount** (e.g., 5,000 SYP discount) to incentivize guests or handle exceptions.
- **Strict Discount Constraints**:
  - Discounts can **only** reduce the play ticket session total (`calculated_session_charge`).
  - Discounts **cannot** reduce product sale prices, outstanding old debt, subscription purchases, debt collections, or tip amounts.
  - The final ticket charge (`final_charge`) cannot be less than `0` (credit balances or negative pricing are strictly prohibited).
  - Formally: `final_charge = max(0, calculated_session_charge - discount_amount)`.

### 3. Subtotal Aggregation
The overall Checkout Total is computed as:
$$\text{Grand Total} = \text{Final Session Charge} + \text{Product Sales Subtotal} + \text{Tips}$$
Where:
- $\text{Final Session Charge} = \max(0, \text{Calculated Session Charge} - \text{Discount Amount})$
- $\text{Product Sales Subtotal} = \sum (\text{Quantity} \times \text{Product Unit Price})$

### 4. Payment Splits & Validation Invariants
- Cashiers can split payment across cash and card.
- **Payment Split Rules**:
  - The sum of payments must equal the overall Grand Total:
    $$\sum \text{amount\_paid} = \text{Final Session Charge} + \text{Product Sales Subtotal}$$
  - Tips are captured separately in each payment method split and stored in `payments.tip_amount`.
  - Underpayments are forbidden unless explicit **Debt Allocation** is processed. If the guest cannot pay the full subtotal, the cashier must designate the unpaid balance as `debts` mapped to `player_id`.

---

## Edge Cases and Rules
1. **Zero Overtime for Subscription Sessions**:
   - For subscription check-ins, time is deducted from the card.
   - If the player goes overdue and their subscription has expired or has insufficient remaining balance, the overtime minutes are charged at the standard *cash* rate, creating a combined subscription + cash checkout ticket.
2. **DST & Timezone Boundaries**:
   - Duration calculations must parse the raw UTC timestamps into Damascus local time to ensure accurate elapsed time across daylight saving transitions.
3. **Product Inventory Sync on Checkout Commit**:
   - Adding product items during checkout must commit inventory movements immediately in the checkout transaction. If checkout is cancelled or voided, the inventory movements are reversed (see corrections).

---

## Tests and Verification

### Unit Tests (`test/domain/checkout_calculator_test.dart`)
- **Open Time Pricing Calculation**: Verify that a player checked in for 64 minutes on Open Time is billed for 2 blocks if leeway is 5 minutes (60 mins + 4 mins elapsed), but is billed for 3 blocks if leeway is 2 minutes (60 mins + 4 mins elapsed > leeway).
- **Discount Limit Validation**: Verify that attempting to apply a 15,000 SYP discount on a 10,000 SYP session ticket outputs `final_charge = 0` and does *not* reduce a linked 3,000 SYP product item (socks) or result in a negative total.
- **Split Payment Allocation**: Verify that a split payment of 12,000 SYP cash and 8,000 SYP card on a 20,000 SYP total compiles valid, balanced Drift insert calls.

### Repository Transaction Tests (`test/data/checkout_repository_test.dart`)
- **Atomic Checkout Commit**: Simulate a full checkout commit. Assert that if the inventory movement insert fails (e.g. stock limit issue or DB lock), the entire checkout transaction (session close, payment logging, product sale write) is successfully rolled back, leaving SQLite pristine.

---

## Acceptance Checklist

| ID | Requirement Details | Check |
| --- | --- | --- |
| AC-14.1 | Verify that the pricing service rounds play duration up to 30-min blocks after leeway. | [ ] |
| AC-14.2 | Verify that the discount logic only reduces the session price and stops at zero. | [ ] |
| AC-14.3 | Verify that product sale line items compile their own snapshot prices. | [ ] |
| AC-14.4 | Verify that a checkout transaction fails atomically if any single step fails. | [ ] |
| AC-14.5 | Verify that timezone translations correctly use Damascus local time for offset calculations. | [ ] |

---

## What success looks like
The math of the desk is absolute. When checkout calculations occur, they are executed by standard pure-Dart service models that run perfectly in milliseconds. The code aggregates session duration, detects overtime blocks accurately, applies flat cashier discounts solely to ticket elements, and handles split cash/card balances with zero floating-point error. Cashiers can count on accurate bills, and managers are assured that discounts never silently decrease product sales or tips.
