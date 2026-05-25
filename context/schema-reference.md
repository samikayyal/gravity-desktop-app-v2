# SQLite Database Schema Reference

This document serves as the single source of truth for the local SQLite database schema managed via **Drift**. All feature specifications refer to this schema rather than defining their own tables.

---

## Conventions & Rules
1. **Source of Truth**: The local SQLite database is the offline-first source of truth.
   The active production database file is `gravity.db`, and the current Drift
   baseline schema version is `1`.
2. **Data Types**:
   - `id` values are typically auto-incrementing integers (`Int`) or UUID strings (`Text`).
   - Timestamps are stored as ISO-8601 UTC strings (`Text`).
   - Monetary amounts (prices, payments, debt, change, tips) are stored as integer **SYP** (Syrian Pounds) (`Int`). Double/float types for currency are strictly forbidden.
   - Durations are stored as integer minutes (`Int`).
   - Booleans are stored as integers (`0` for false, `1` for true) or handled natively by Drift's `Bool` type which maps to SQLite integers.
3. **No Deletions**: Deletion is prohibited for operational business entities. Instead, use soft-delete fields, void flags, or correction ledgers to adjust balances.
4. **Foreign Keys**: Runtime connections must enable SQLite foreign key
   enforcement with `PRAGMA foreign_keys = ON`.
5. **Active Session Guard**: The schema maintains a partial unique index that
   allows only one non-closed, non-voided session per player.

---

## Schema Readiness Notes

- Payment rows include a `status` field so corrections and End Day reports can
  filter voided payments without deleting original payment records.
- Foreign key relationships must not be implemented as routine destructive
  cascades for operational workflows. Child rows remain durable history unless a
  future migration explicitly documents a safe, non-business-data cleanup path.

---

## Table Definitions

### 1. `players`
Stores individual player profile information.
- `id` (Text, Primary Key): Unique UUID.
- `full_name` (Text): The player's full name.
- `age` (Int): The player's age.
- `created_at` (Text): Timestamp of creation.
- `updated_at` (Text): Timestamp of last profile update.
- `has_active_session` (Bool): Cached flag to prevent dual check-ins.

### 2. `player_phones`
Stores phone numbers for players. Players can have multiple phone numbers (at least one is required).
- `id` (Int, Primary Key, AutoIncrement)
- `player_id` (Text, Foreign Key -> `players.id`)
- `phone_number` (Text): Phone number string.
- `is_primary` (Bool): Flag indicating the primary contact number.

### 3. `sessions`
Represents check-in sessions. Timers derive dynamically from `check_in_at` and current time.
- `id` (Text, Primary Key): Unique session UUID.
- `player_id` (Text, Foreign Key -> `players.id`)
- `entry_type` (Text): `'fixed'` or `'open'`.
- `reserved_blocks` (Int): Count of 30-min blocks if entry is `'fixed'`; NULL if `'open'`.
- `check_in_at` (Text): UTC ISO-8601 timestamp.
- `check_out_at` (Text, Nullable): UTC ISO-8601 timestamp.
- `status` (Text): `'active'`, `'overdue'`, `'stale'`, `'closed'`, `'voided'`.
- `subscription_id` (Text, Nullable, Foreign Key -> `subscriptions.id`): Present if session is covered by subscription.
- `calculated_charge` (Int): Total price in SYP before discounts.
- `final_charge` (Int): Total price in SYP after discounts.
- `discount_amount` (Int): Cash value discount in SYP.
- `discount_reason` (Text, Nullable)

### 4. `subscriptions`
Represents customer multi-hour time subscription cards.
- `id` (Text, Primary Key): Unique subscription UUID.
- `player_id` (Text, Foreign Key -> `players.id`)
- `total_minutes` (Int): Total hours * 60 (e.g., 600 minutes for 10 hours).
- `remaining_minutes` (Int): Remaining active minutes (decremented in 30-minute chunks).
- `purchased_at` (Text): UTC ISO-8601 purchase timestamp.
- `expires_at` (Text): UTC ISO-8601 expiration timestamp (exactly one calendar month from purchase).
- `status` (Text): `'active'`, `'expired'`, `'exhausted'`, `'voided'`.
- `unpaid_debt_id` (Text, Nullable): Logical debt id if subscription was
  purchased on credit. The enforced relationship is stored from
  `debts.originating_subscription_id` back to `subscriptions.id` to avoid a
  circular Drift table graph.

### 5. `subscription_usage_logs`
Durable audit logs tracking when subscription minutes were consumed.
- `id` (Int, Primary Key, AutoIncrement)
- `subscription_id` (Text, Foreign Key -> `subscriptions.id`)
- `session_id` (Text, Foreign Key -> `sessions.id`)
- `minutes_consumed` (Int): Minutes deducted (always 30-minute blocks, e.g., 30, 60, 90).
- `created_at` (Text): UTC ISO-8601 consumption timestamp.

### 6. `products`
The product catalog (e.g., Socks, Water Bottles).
- `id` (Text, Primary Key): Unique product UUID.
- `name` (Text): Name of the product (bilingual ARB key).
- `sku` (Text, Unique): Product identifier.
- `unit_price` (Int): Current price in SYP.
- `current_stock` (Int): Current inventory count (can be negative).
- `is_active` (Bool): Soft delete indicator; deactivated products aren't sold but remain in records.

### 7. `product_sales`
Represents a sale event. Can contain multiple products.
- `id` (Text, Primary Key): Unique sale UUID.
- `player_id` (Text, Nullable, Foreign Key -> `players.id`): Linked player if not anonymous.
- `sold_at` (Text): UTC ISO-8601 sale timestamp.
- `total_charge` (Int): Total sale amount in SYP.
- `status` (Text): `'completed'`, `'voided'`.

### 8. `sale_items`
Detailed line items for product sales. Unit price is snapshot at checkout time.
- `id` (Int, Primary Key, AutoIncrement)
- `sale_id` (Text, Foreign Key -> `product_sales.id`)
- `product_id` (Text, Foreign Key -> `products.id`)
- `product_name_snapshot` (Text): Snapshot of product name at sale time.
- `quantity` (Int): Units sold.
- `unit_price_snapshot` (Int): Snapshot price per unit in SYP.

### 9. `payments`
Tracks cashier payment transactions. Associated with individual or group checkout events.
- `id` (Text, Primary Key): Unique transaction UUID.
- `payment_group_id` (Text): UUID grouping multiple payments (e.g., split payment) or multiple players (group checkout).
- `player_id` (Text, Nullable, Foreign Key -> `players.id`): Player paying, or NULL if anonymous product sale.
- `payment_method` (Text): `'cash'` or `'card'`.
- `amount_paid` (Int): Amount received in SYP.
- `tip_amount` (Int): Tip amount included in payment in SYP.
- `status` (Text): `'completed'`, `'voided'`.
- `created_at` (Text): UTC ISO-8601 timestamp.
- `session_id` (Text, Nullable, Foreign Key -> `sessions.id`): Associated checkout session if applicable.
- `sale_id` (Text, Nullable, Foreign Key -> `product_sales.id`): Associated product sale if applicable.

### 10. `debts`
Unpaid balances assigned to a player. Old debt cannot be silently rolled into new checkout group totals.
- `id` (Text, Primary Key): Unique debt UUID.
- `player_id` (Text, Foreign Key -> `players.id`)
- `original_amount` (Int): Original debt value in SYP.
- `remaining_amount` (Int): Remaining unpaid debt value in SYP.
- `created_at` (Text): UTC ISO-8601 timestamp.
- `status` (Text): `'active'`, `'settled'`, `'voided'`.
- `originating_session_id` (Text, Nullable, Foreign Key -> `sessions.id`)
- `originating_sale_id` (Text, Nullable, Foreign Key -> `product_sales.id`)
- `originating_subscription_id` (Text, Nullable, Foreign Key -> `subscriptions.id`)

### 11. `debt_payments`
Tracks payments made toward outstanding debt.
- `id` (Int, Primary Key, AutoIncrement)
- `debt_id` (Text, Foreign Key -> `debts.id`)
- `payment_id` (Text, Foreign Key -> `payments.id`)
- `amount_applied` (Int): Amount paid toward this debt in SYP.
- `created_at` (Text): UTC ISO-8601 timestamp.

### 12. `inventory_movements`
Durable stock ledger for catalog items.
- `id` (Int, Primary Key, AutoIncrement)
- `product_id` (Text, Foreign Key -> `products.id`)
- `movement_type` (Text): `'restock'`, `'sale'`, `'correction'`, `'void'`.
- `quantity_change` (Int): Positive for restock, negative for sales/decrements.
- `stock_before` (Int): Stock level prior to change.
- `stock_after` (Int): Stock level after change.
- `notes` (Text, Nullable)
- `created_at` (Text): UTC ISO-8601 timestamp.
- `associated_sale_id` (Text, Nullable, Foreign Key -> `product_sales.id`): Set if triggered by a product sale.

### 13. `end_day_closes`
Cashier close reports containing counted totals, calculations, and mismatch states.
- `id` (Text, Primary Key): Unique close UUID.
- `closed_at` (Text): UTC ISO-8601 closure timestamp.
- `business_date` (Text): Local date string (`YYYY-MM-DD`) matching the business shift.
- `expected_cash` (Int): Calculated expected cash total in SYP.
- `expected_card` (Int): Calculated expected card total in SYP.
- `counted_cash` (Int): Cashier counted cash in SYP.
- `counted_card` (Int): Cashier counted card in SYP.
- `cash_mismatch` (Int): counted_cash - expected_cash in SYP.
- `card_mismatch` (Int): counted_card - expected_card in SYP.
- `total_debt_issued` (Int): Debt issued during the shift in SYP.
- `total_debt_collected` (Int): Debt payments received during the shift in SYP.
- `total_tips` (Int): Tips collected during the shift in SYP.
- `is_missed_close` (Bool): True if this was generated dynamically for a prior day due to cashier inactivity.
- `backup_status` (Text): `'pending'`, `'success'`, `'failed'`.

### 14. `audit_events`
Ledger of admin-authorized or high-risk actions.
- `id` (Int, Primary Key, AutoIncrement)
- `event_type` (Text): e.g., `'price_change'`, `'stale_correction'`, `'manual_void'`, `'backup_restore'`, `'settings_update'`.
- `description` (Text): Human readable description of action and targets.
- `triggered_at` (Text): UTC ISO-8601 timestamp.
- `metadata` (Text, Nullable): JSON string of details (old price, new price, target IDs, etc.).

### 15. `backup_runs`
Log of cloud backup attempts.
- `id` (Int, Primary Key, AutoIncrement)
- `triggered_at` (Text): UTC ISO-8601.
- `trigger_type` (Text): `'scheduled'`, `'manual'`, `'app_close'`, `'end_day'`.
- `status` (Text): `'running'`, `'success'`, `'failed'`.
- `backup_filename` (Text): Name of file uploaded to GCP bucket.
- `error_message` (Text, Nullable): Failure details if status is `'failed'`.

### 16. `system_settings`
Admin-editable operational settings.
- `key` (Text, Primary Key): Configuration key (e.g., `'admin_password'`, `'leeway_minutes'`, `'stale_threshold_minutes'`).
- `value` (Text): Configuration value stored as string (parsed in app code).
- `updated_at` (Text): UTC ISO-8601.

### 17. `corrections`
Links original transaction or event rows to their reversing/correction entries.
- `id` (Int, Primary Key, AutoIncrement)
- `original_id` (Text): Primary key of the corrected record.
- `original_table` (Text): Table name of the corrected record.
- `correction_type` (Text): `'void'`, `'adjustment'`, `'reversal'`.
- `audit_event_id` (Int, Foreign Key -> `audit_events.id`): Associated admin authorization audit log.
- `created_at` (Text): UTC ISO-8601 timestamp.
