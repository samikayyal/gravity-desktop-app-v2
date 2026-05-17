# Exports

## Purpose

Export daily reports and business records in formats the park can review
outside the app while keeping SQLite as the authoritative source of truth.

## Build Notes

- Export daily report to PDF.
- Export payments, sales, and debt records to CSV.
- Export player list.
- Export product inventory.
- CSV exports should be Excel-compatible.
- True `.xlsx` export is out of scope unless later required.

## Data, Domain, And Storage

- Generated PDFs and CSVs are file outputs, not source-of-truth records.
- Daily report PDFs should be based on the frozen end-day snapshot, with
  optional post-close corrections when relevant.
- CSV exports read from SQLite-backed export/report models.
- Generated exports must not be included in cloud backup packages.

## UI And Workflow

- Reports and relevant lists expose explicit export actions.
- Export status should use clear success/failure messages.
- Export failures should not corrupt or alter source business records.
- Employees should not need to understand file internals to export standard
  reports.

## Edge Cases And Rules

- Export generation reads report/export models but does not calculate business
  totals itself.
- Export generation is a user action, not a background accounting mutation.
- Export files can be regenerated from SQLite and frozen snapshots.
- Do not store large generated export content in SQLite unless a later
  reporting/audit requirement explicitly needs it.

## Tests And Verification

- Test daily report PDF generation from frozen close snapshot data.
- Test optional post-close correction display when relevant.
- Test CSV exports for payments, sales, debt, player list, and inventory.
- Test Excel-compatible CSV formatting.
- Test generated exports are excluded from backup packages.

## What success looks like

- The park can export daily reports and operational CSVs on demand.
- Report PDFs reflect frozen close snapshots rather than drifting live totals.
- Exports are reproducible outputs and do not become the business source of
  truth.

