# Inventory

## Purpose

Track stock for products through durable inventory movements so sales, restocks,
losses, corrections, low stock, and negative stock are visible and auditable.

## Build Notes

- Inventory is tracked through stock movements, not only a current stock
  number.
- Employee mode can add stock.
- Stock is allowed to go negative so employees can complete real sales even if
  inventory was not updated.
- Negative stock and low stock must be clearly color-coded.

## Data, Domain, And Storage

- Store inventory movements with product ID, quantity delta, reason, timestamp,
  and related sale/correction when applicable.
- Movement reasons include supplier restock, damaged, lost, count correction,
  sale, and voided sale/correction.
- Current stock is derived from movement history or maintained as a
  transactionally consistent projection.
- Inventory changes must be transactional with related product sales, voids, or
  corrections.

## UI And Workflow

- Inventory UI is table-first with current stock, low-stock threshold, active
  status, and warning state.
- Employee can add stock through a restock flow.
- Corrections for damaged, lost, or count mismatch require explicit movement
  reason.
- Low stock and negative stock use the shared status colors from the UI spec.

## Edge Cases And Rules

- The app must not silently overwrite stock counts without a reason and audit
  trail.
- Negative stock is allowed but must remain visible as a warning.
- Voided sales or corrections should create reversing movements rather than
  deleting the original movement.
- Inventory records needed for reports or audit belong in SQLite.

## Tests And Verification

- Test sale movements.
- Test supplier restock.
- Test damaged and lost movements.
- Test count correction.
- Test low-stock warnings.
- Test negative stock warnings and allowed negative stock.
- Test voided sale/correction movements.
- Test transaction failure preserving prior stock state.

## What success looks like

- Inventory history explains why stock changed.
- Low and negative stock are visible to the cashier.
- Product sales and corrections update inventory through auditable movements,
  not silent count overwrites.

