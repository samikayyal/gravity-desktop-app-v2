# Product Sales

## Purpose

Sell socks, water bottles, and future products to checked-in players, saved
players, or anonymous customers while preserving sale-time product details and
valid debt rules.

## Build Notes

- Initial products are socks and water bottles.
- The product system must allow more products later.
- Product prices are editable globally, not per sale.
- Product price changes require admin password.
- Products can be paid together with session charges, subscription charges, and
  debt payments.

## Data, Domain, And Storage

- Store products with configurable name, price, active/inactive status, and
  low-stock threshold.
- Store sale headers and line items in SQLite.
- Product sale line items must snapshot product name and unit price at sale
  time.
- Product debt is allowed only when the sale is attached to a saved player.
- Product sales that affect stock must create inventory movement records.

## UI And Workflow

- Employee can sell products during checkout or as a separate product sale.
- Sales can attach to checked-in players, saved players, or anonymous
  customers.
- Product picker shows current product names, prices, and relevant stock
  warnings.
- Anonymous product sales must require immediate payment because anonymous debt
  is not allowed.

## Edge Cases And Rules

- Historical reports must not change when the product catalog is edited later.
- Per-sale product price editing is out of scope for v1.
- Inactive products should remain visible in historical sales but should not be
  offered as normal new-sale choices.
- Product sale debt must attach to a saved player or be blocked.

## Tests And Verification

- Test socks and water bottle defaults through setup/foundation data.
- Test sale line snapshots for product name and unit price.
- Test anonymous sale payment requirement.
- Test player-attached product debt.
- Test product price changes requiring admin password.
- Test product sales creating inventory movements.

## What success looks like

- Cashiers can sell products in daily workflows without corrupting historical
  prices or names.
- Anonymous sales are supported, but anonymous debt is impossible.
- Product sales integrate with checkout, payments, debt, and inventory through
  durable records.

