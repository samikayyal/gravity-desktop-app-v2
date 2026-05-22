# Feature Spec 13b: Individual Checkout (UI)

## Purpose
Detail the user interface components, cashier interaction states, and screen layouts for processing an individual checkout. The checkout interface lives in the **Right Context Panel (~40% width)**, allowing the cashier to add products to the session, review ticket costs, input split payments, view change calculations, and handle print choices while the **Left Panel (~60% width)** Active Board remains fully visible and active.

---

## Build Notes
- **Language & Runtime**: Dart, Flutter Desktop for Windows (Material 3).
- **Theme Constraints**: Light mode only, Modern Cashier Calm direction. Uses brand yellow `#FBF306` for primary action buttons with dark text. Spacing and borders use a quiet, thin neutral line. Cards use `8px` corner radius.
- **State Management**: Riverpod (`CheckoutNotifier` manages checkout form state, cart items, payment entries, and validation).
- **Folder Structure**:
  - `lib/features/checkout/presentation/widgets/checkout_panel.dart` (Container inside Right Context Panel)
  - `lib/features/checkout/presentation/widgets/payment_split_form.dart` (Form handles cash/card entries)
  - `lib/features/checkout/presentation/widgets/product_cart_section.dart` (List of added products with plus/minus increments)
  - `lib/features/checkout/presentation/widgets/debt_warning_banner.dart` (Visual alert for outstanding old debt)

---

## UI and Workflow

### 1. Panel Layout & Entry Flow
1. **Activation**: The cashier clicks the yellow **"Checkout"** button (`btnCheckout`) on any player's session card on the Active Board.
2. **Context Shift**: The Right Context Panel instantly slides into **Checkout Mode**, displaying the checked-in player's name, primary phone, session start time, and dynamic play ticket calculations.
3. **Layout Composition**:
   - **Section A: Session Ticket Summary**: Displays elapsed time, checked-in duration, and session ticket subtotal in SYP.
   - **Section B: Product Additions (The Quick Cart)**: Cashier can tap quick-add buttons for standard items (e.g., "+ Socks", "+ Water") or scan a product barcode. Includes a dense itemized list with quantity adjustment buttons (`-` and `+`).
   - **Section C: Cashier Discount**: A simple numerical input field labeled "Discount (SYP)" with standard quick-select buttons (e.g., "5,000", "10,000").
   - **Section D: Payment Split Entry**: Input fields for cash paid, card paid, and tip.
   - **Section E: Footer Actions**: Print checkbox, and checkout execution button.

```text
+-------------------------------------------------------------+
|                       CHECKOUT PANEL                        |
| Player: Samer Kayyal               Session: 1h 45m (Fixed)  |
+-------------------------------------------------------------+
| SESSION TICKET                                              |
| Rate: 15,000 SYP/30m                                        |
| Calculated Session: 60,000 SYP                              |
| Discount: [ 5,000 ] SYP   (Reason: [ Employee Family  ])    |
| Final Ticket: 55,000 SYP                                    |
+-------------------------------------------------------------+
| ADD PRODUCTS                                                |
| [ + Socks ] [ + Water ] [ + Juice ]                         |
| - 1 x Jump Socks (Gold) ........................ 10,000 SYP |
| - 2 x Mineral Water (0.5L) ...................... 4,000 SYP |
+-------------------------------------------------------------+
| PAYMENT SUMMARY                                             |
| Subtotal: 69,000 SYP                                        |
| Cash Paid: [ 50,000 ] SYP    Card Paid: [ 19,000 ] SYP       |
| Tip Amount: [ 2,000 ] SYP    Change Due: 0 SYP              |
+-------------------------------------------------------------+
| [x] Print Receipt  [x] Close Session   [ CONFIRM CHECKOUT ] |
+-------------------------------------------------------------+
```

### 2. Live Validation & Calculations (Cashier Interactions)
- **Automatic Calculations**:
  - As the cashier types in `Cash Paid` or `Card Paid`, the `Change Due` or `Unpaid Balance` recalculates in real-time.
  - If payment totals exceed the subtotal, `Change Due` is displayed.
  - If payment totals are less than the subtotal, the confirm button turns into **"Check Out to Debt"** or displays an error.
- **Verification Warnings & Alerts**:
  - **Old Debt Alert**: If the player has outstanding debts recorded in SQLite (`debts` table where `status = 'active'`), a bright yellow alert banner `debt_warning_banner` is displayed at the top:
    > **Outstanding Debt Found**: Player owes **45,000 SYP** from a previous session.
    > *Button*: `btnCollectDebtNow` ("Collect Old Debt Now" - clicking this automatically adds the debt amount to the active cashier payment form).

### 3. Split Payment Input Mechanics
- Cash and Card input text boxes are standard Flutter `TextField` controllers configured to accept numbers only, automatically formatting input values with thousands separators (e.g. `50,000`).
- **Focus Shifts**: When typing Cash, if the amount paid satisfies the total exactly, the focus jumps to the confirmation button. If a card payment is chosen, a "Card Machine Terminal Ready" placeholder status is displayed.

### 4. Receipts & Exit
- Cashier ensures the **"Print Receipt"** checkbox is selected (default true).
- Cashier clicks **"Confirm Checkout"** (`btnConfirmCheckout`).
- **Processing State**: The button changes to a loading indicator. The system writes the checkout transaction to Drift.
- **Completion**: A success chime sounds, the Right Context Panel clears to an empty state, and the player is removed from the Left Active Board. The physical receipt is dispatched to the configured thermal printer.

---

## Edge Cases and Rules
1. **Preventing Double Discounts**:
   - The UI blocks keying in a discount that exceeds the session ticket subtotal. If the cashier types a value greater than `calculated_session_charge`, the UI automatically clamps the visual field to the session total and shows an info badge.
2. **Silent Inclusion of Debt Forbidden**:
   - The UI **must not** silently roll a player's previous outstanding debt into the current checkout session's total. Previous debt must be listed as a completely separate line item with its own check box to collect or ignore, ensuring full cashier and customer transparency.
3. **Card Payment Change Limitation**:
   - The UI forbids change calculations on card payments. If a cashier keys in an overpayment on a card, the system flags it as a validation error (`msgCardOverpaymentException`) or prompts them to categorize the excess as a Tip.

---

## Tests and Verification

### Widget Tests (`test/features/checkout/checkout_panel_widget_test.dart`)
- **Interactive Discount Clamping**: Render `CheckoutPanel`, type `20000` into the discount text field for a `15000` session. Assert that the field value clamps or the calculated ticket displays `0 SYP` instead of `-5000 SYP`.
- **Debt Warning Visibility**: Inject a mock player with an active debt record of `30000 SYP` into the riverpod provider. Verify that `DebtWarningBanner` renders prominently at the top of the Checkout Panel.
- **Split Payment Focus**: Simulate typing a cash amount that is less than the subtotal. Verify that the remaining balance is highlighted and the confirmation button displays "Record Remainder as Debt".

---

## Acceptance Checklist

| ID | Requirement Details | Check |
| --- | --- | --- |
| AC-13b.1 | Verify that the Right Panel transitions into Checkout Mode when checkout is triggered from the Active Board. | [ ] |
| AC-13b.2 | Verify that adding quick products immediately updates the checkout subtotal. | [ ] |
| AC-13b.3 | Verify that cash discount inputs clamp to the session total and do not decrease product costs. | [ ] |
| AC-13b.4 | Verify that old debt warnings appear automatically and allow one-click payment inclusion. | [ ] |
| AC-13b.5 | Verify that entering split cash/card amounts computes exact change due in real time. | [ ] |
| AC-13b.6 | Verify that submitting checkout successfully removes the player from the active list. | [ ] |

---

## What success looks like
Checkout is frictionless and visually comforting. When the cashier clicks "Checkout," the right panel shifts to a clean operational manifest. Products like jump socks are appended in a tap, and cash discounts are cleanly partitioned. As cash is keyed in, change due calculates instantly in high-contrast black digits. The cashier is alerted to old debts visually and can resolve them in a single tap without leaving their main workflow. The player is cleared from the floor, and the receipt prints immediately.
