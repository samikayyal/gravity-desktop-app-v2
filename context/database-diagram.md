# Database Diagram

This diagram documents the current local SQLite schema managed by Drift.
It is derived from `context/schema-reference.md` and
`lib/core/database/local_database.dart`.

## Current Schema Summary

- Database file: `gravity.db`
- Drift schema version: `1`
- Local SQLite is the offline-first source of truth.
- Runtime connections enable `PRAGMA foreign_keys = ON`.
- Money is stored as integer SYP values.
- Timestamps are stored as UTC ISO-8601 text.
- Normal business workflows do not hard-delete operational records.
- A partial unique index prevents duplicate non-closed sessions for the same
  player:
  `idx_sessions_one_open_per_player ON sessions(player_id) WHERE status IN ('active', 'overdue', 'stale')`.

## Entity Relationship Diagram

```mermaid
erDiagram
    players {
        TEXT id PK
        TEXT full_name
        INT age "CHECK 1..120"
        TEXT created_at
        TEXT updated_at
        BOOL has_active_session
    }

    player_phones {
        INT id PK
        TEXT player_id FK
        TEXT phone_number
        BOOL is_primary
    }

    sessions {
        TEXT id PK
        TEXT player_id FK
        TEXT entry_type "fixed|open"
        INT reserved_blocks "nullable"
        TEXT check_in_at
        TEXT check_out_at "nullable"
        TEXT status "active|overdue|stale|closed|voided"
        TEXT subscription_id "nullable FK"
        INT calculated_charge "SYP >= 0"
        INT final_charge "SYP >= 0"
        INT discount_amount "SYP >= 0"
        TEXT discount_reason "nullable"
    }

    subscriptions {
        TEXT id PK
        TEXT player_id FK
        INT total_minutes "greater than 0"
        INT remaining_minutes "0..total_minutes"
        TEXT purchased_at
        TEXT expires_at
        TEXT status "active|expired|exhausted|voided"
        TEXT unpaid_debt_id "nullable logical debt id"
    }

    subscription_usage_logs {
        INT id PK
        TEXT subscription_id FK
        TEXT session_id FK
        INT minutes_consumed "30 minute blocks"
        TEXT created_at
    }

    products {
        TEXT id PK
        TEXT name
        TEXT sku "UNIQUE"
        INT unit_price "SYP >= 0"
        INT current_stock "may be negative"
        BOOL is_active
    }

    product_sales {
        TEXT id PK
        TEXT player_id "nullable FK"
        TEXT sold_at
        INT total_charge "SYP >= 0"
        TEXT status "completed|voided"
    }

    sale_items {
        INT id PK
        TEXT sale_id FK
        TEXT product_id FK
        TEXT product_name_snapshot
        INT quantity "greater than 0"
        INT unit_price_snapshot "SYP >= 0"
    }

    payments {
        TEXT id PK
        TEXT payment_group_id
        TEXT player_id "nullable FK"
        TEXT payment_method "cash|card"
        INT amount_paid "SYP >= 0"
        INT tip_amount "SYP >= 0"
        TEXT status "completed|voided"
        TEXT created_at
        TEXT session_id "nullable FK"
        TEXT sale_id "nullable FK"
    }

    debts {
        TEXT id PK
        TEXT player_id FK
        INT original_amount "SYP > 0"
        INT remaining_amount "0..original_amount"
        TEXT created_at
        TEXT status "active|settled|voided"
        TEXT originating_session_id "nullable FK"
        TEXT originating_sale_id "nullable FK"
        TEXT originating_subscription_id "nullable FK"
    }

    debt_payments {
        INT id PK
        TEXT debt_id FK
        TEXT payment_id FK
        INT amount_applied "SYP > 0"
        TEXT created_at
    }

    inventory_movements {
        INT id PK
        TEXT product_id FK
        TEXT movement_type "restock|sale|correction|void"
        INT quantity_change
        INT stock_before
        INT stock_after
        TEXT notes "nullable"
        TEXT created_at
        TEXT associated_sale_id "nullable FK"
    }

    end_day_closes {
        TEXT id PK
        TEXT closed_at
        TEXT business_date "YYYY-MM-DD"
        INT expected_cash "SYP >= 0"
        INT expected_card "SYP >= 0"
        INT counted_cash "SYP >= 0"
        INT counted_card "SYP >= 0"
        INT cash_mismatch
        INT card_mismatch
        INT total_debt_issued "SYP >= 0"
        INT total_debt_collected "SYP >= 0"
        INT total_tips "SYP >= 0"
        BOOL is_missed_close
        TEXT backup_status "pending|success|failed"
    }

    audit_events {
        INT id PK
        TEXT event_type "admin or high-risk action"
        TEXT description
        TEXT triggered_at
        TEXT metadata "nullable JSON"
    }

    backup_runs {
        INT id PK
        TEXT triggered_at
        TEXT trigger_type "scheduled|manual|app_close|end_day"
        TEXT status "running|success|failed"
        TEXT backup_filename
        TEXT error_message "nullable"
    }

    system_settings {
        TEXT key PK
        TEXT value
        TEXT updated_at
    }

    corrections {
        INT id PK
        TEXT original_id
        TEXT original_table "polymorphic target"
        TEXT correction_type "void|adjustment|reversal"
        INT audit_event_id FK
        TEXT created_at
    }

    players ||--o{ player_phones : has
    players ||--o{ sessions : starts
    players ||--o{ subscriptions : owns
    players |o--o{ product_sales : buys
    players |o--o{ payments : pays
    players ||--o{ debts : owes

    subscriptions |o--o{ sessions : covers
    subscriptions ||--o{ subscription_usage_logs : records
    sessions ||--o{ subscription_usage_logs : consumes

    products ||--o{ sale_items : sold_as
    product_sales ||--o{ sale_items : contains
    product_sales |o--o{ payments : paid_by
    product_sales |o--o{ debts : creates
    product_sales |o--o{ inventory_movements : moves_stock

    sessions |o--o{ payments : paid_by
    sessions |o--o{ debts : creates

    subscriptions |o--o{ debts : creates

    debts ||--o{ debt_payments : receives
    payments ||--o{ debt_payments : applies

    products ||--o{ inventory_movements : tracks

    audit_events ||--o{ corrections : authorizes
```

## Relationship Notes

- `corrections.original_id` and `corrections.original_table` are polymorphic.
  They point to the corrected business record by table name and primary key,
  while `corrections.audit_event_id` is the enforced foreign key to the admin
  authorization event.
- `subscriptions.unpaid_debt_id` is a logical debt reference. The enforced
  relationship is stored from `debts.originating_subscription_id` back to
  `subscriptions.id` to avoid a circular Drift table graph.
- `product_sales.player_id`, `payments.player_id`, `payments.session_id`,
  `payments.sale_id`, `debts.originating_*`, and
  `inventory_movements.associated_sale_id` are nullable because some workflows
  are anonymous, optional, or created by later correction/payment flows.
- `end_day_closes`, `backup_runs`, and `system_settings` are intentionally
  mostly standalone operational tables. End Day stores a frozen close snapshot,
  backup runs log attempts, and settings store typed values as strings parsed by
  application code.
