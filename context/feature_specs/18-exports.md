# Feature Specification: File Exports (PDF and CSV)

## Purpose
Provide the trampoline park owner, accountant, and administrators with clear, structured, and professional digital records. This feature handles generating daily closing shift summaries in highly readable PDF formats (optimized for A4 printing) and Excel-compatible CSV logs for bulk accounting analysis.

---

## Build Notes

### Key Technologies
- **pdf (Dart Package)**: `pdf/pdf.dart` and `pdf/widgets.dart` for custom programmatic drawing of vector layouts, tables, and typography.
- **csv (Dart Package)**: For converting structured matrices of data into RFC 4180 standard comma-separated text.
- **path_provider**: Resolves standard Windows system folder locations (e.g., standard Downloads or Documents folders).
- **file_picker**: Desktop-native save dialogs allowing employees to select export file names and paths.

### Folder Structure
- `lib/core/export/`
  - `export_service.dart`: Interacts with operating system pathing and file operations.
  - `pdf_builder.dart`: Assembles vectors, styles, and headers into complete printable documents.
  - `csv_generator.dart`: Converts dataset arrays into CSV lines.
- `lib/features/reports/presentation/`
  - `widgets/export_actions_card.dart`: Small widget showing quick export options.

---

## Data/Domain/Storage

### Input Data Mappings
The export engine processes raw models and queries directly, converting them into formatted rows. Key data inputs:
- **`EndDayReport`**: Reconciles the cashier totals and mismatches for PDFs.
- **`payments` / `sessions`**: Structured into tabular history CSVs.
- **`inventory_movements`**: Structured into stock audit logs.

### Standard Data Formatting Rules
- **Monetary Values**: All integers are formatted with standard thousands separators and appended with `" SYP"` (e.g., `45000` -> `45,000 SYP`).
- **Dates & Timestamps**: UTC stored strings are converted to `Asia/Damascus` local timezone and formatted:
  - Long Date: `yyyy-MM-dd HH:mm:ss` (e.g., `2026-05-22 17:31:13`).
  - Short Date: `yyyy-MM-dd` (e.g., `2026-05-22`).

---

## UI and Workflow

### 1. The Reports Hub Export Panel
- Cashiers access the Reports screen using the side rail navigation.
- Cashiers select a **Date Range** (e.g., Single Day, Last 7 Days, Custom Range).
- A grid displays the available files. Clicking on a record reveals the **Export Console Card** on the right Context Panel (~40%).
- **Export Console Card Options**:
  - Button 1: **"Generate Closing PDF"** (A4 print layout).
  - Button 2: **"Export Payments CSV"** (Detailed accounting sheet).
  - Button 3: **"Export Sessions CSV"** (Detailed player attendance sheet).

```text
+------------------------------------------------------------+
|                       REPORTS CENTER                       |
+------------------------------------------------------------+
| Select Date Range: [ 2026-05-20 ] to [ 2026-05-22 ]        |
|                                                            |
| +--------------------------------------------------------+ |
| | Date       | Expected Cash | Counted Cash | Status     | |
| |------------|---------------|--------------|------------| |
| | 2026-05-22 | 150,000 SYP   | 148,000 SYP  | Mismatch   | |
| | 2026-05-21 | 185,000 SYP   | 185,000 SYP  | Balanced   | |
| +--------------------------------------------------------+ |
+------------------------------------------------------------+
```

### 2. PDF Document Style and Vector Layout
The PDF generator is configured with a strict, brand-aligned corporate template:
- **Page Size**: standard A4 Portrait, `2.0 cm` margins.
- **Color Theme**: Neutral greyscale body text, thick dark borders, and a minimal brand highlight (a solid yellow header strip `#FBF306`).
- **Structure**:
  1. **Document Header**:
     - Gravity Trampoline Park banner.
     - Report Sub-title: *Daily Cashier Closing & Shift Report*.
     - Generated At: Local time timestamp.
     - Business Shift Date: `YYYY-MM-DD`.
  2. **Reconciliation Summary Block**:
     - Expected vs Counted Cash/Card table with mismatch details.
  3. **Operational Statistics Block**:
     - Count of check-ins, product sales, average duration, and active inventory warnings.
  4. **Audit Ledger Footer**:
     - Prints any admin overrides or price changes performed during that specific business day.
     - Sign-off lines for both the cashier and the reviewing manager.

```text
+------------------------------------------------------------+
|  [====================== GRAVITY =======================]  |
|  DAILY SHIFT CLOSE REPORT                                  |
|  Date: 2026-05-22                      Time: 17:31:13      |
|  +------------------------------------------------------+  |
|  | Financial Item   | Expected     | Counted      | Diff|  |
|  |------------------|--------------|--------------|-----|  |
|  | Cash Registry    | 150,000 SYP  | 148,000 SYP  | -2k |  |
|  | Card Processing  |  80,000 SYP  |  80,000 SYP  |  0  |  |
|  +------------------------------------------------------+  |
|  Cashier Sign: _______________   Manager Sign: ____________|
+------------------------------------------------------------+
```

### 3. CSV File Layout
CSV logs are generated as structured grids. Column definitions are strictly defined:

#### Payments Export (`payments_export.csv`)
```csv
Payment ID,Timestamp,Player Name,Payment Method,Amount Paid,Tip Amount,Associated Type,Originating Session ID
pay_98765,2026-05-22 14:10:00,Samer Kayyal,cash,15000,0,session,sess_12345
pay_98766,2026-05-22 14:30:15,Anonymous,card,3000,0,product,sale_44556
pay_98767,2026-05-22 15:45:00,Maya S.,cash,12000,2000,debt,debt_77889
```

---

## Edge Cases and Rules

### 1. Microsoft Excel Encoding Fix (UTF-8 BOM)
- **Problem**: Microsoft Excel on Windows parses CSV files in ANSI by default, which corrupts any non-ASCII text, such as bilingual Arabic names or Syrian Pound notation.
- **Rule**: Every exported CSV file **must** be prefixed with the UTF-8 Byte Order Mark (BOM) sequence. The byte array stream written to disk must strictly begin with:
  `[0xEF, 0xBB, 0xBF]`
  This forces Windows Excel to read the file correctly as a UTF-8 CSV, preserving all characters.

### 2. Windows File-Lock System Prevention
- **Problem**: If an administrator tries to export a file (e.g., `closing_report.pdf` or `payments.csv`) while that same file is currently open in Adobe Acrobat or Microsoft Excel, Windows locks the file, causing a crash.
- **Rule**: The system wraps all file write operations in a try-catch block. If an `IOException` (File Locked) is thrown, the UI intercepts this error and presents a clean warning dialog:
  *"Target File is Open. The target file is currently locked by another application (e.g. Excel or Acrobat). Please close the file and click 'Try Again' or select a different save path."*

### 3. Number Cell Formatting for Accounting
- Columns displaying financial numbers inside CSVs must write pure integers without commas or currency suffix symbols (e.g. write `150000`, not `150,000 SYP`).
- This allows accountants to immediately use mathematical formulas (`SUM`, `AVERAGE`) inside Excel without manual data-cleanup.

---

## Tests and Verification

### Unit Tests (`test/domain/export/`)
1. **UTF-8 BOM Check**:
   - Assert that the bytes generated by the CSV generator start with the hexadecimal array `[0xEF, 0xBB, 0xBF]`.
2. **CSV Matrix Alignment**:
   - Input mock list containing standard entries with commas and quotes.
   - Assert that the output correctly wraps strings containing commas in quotes (`"Samer, Kayyal"`), preserving correct column positioning.
3. **Number Standardization**:
   - Input monetary domain values to the CSV generator. Assert output displays purely numeric digits, with no formatting text (e.g. `12000` is written exactly as `"12000"`).

### Integration & System Tests (`test/features/export/`)
1. **Locked File Exception Guard**:
   - Simulate a Windows locked file scenario by mocking a directory reference that throws an access denied exception.
   - Verify that the app displays the warning dialog and prevents a system crash.
2. **PDF Structural Integrity**:
   - Trigger programmatic PDF builds. Verify that no page-overflow crashes occur under maximum character lengths.

---

## Acceptance Checklist

| ID | Requirement Details | Status |
|---|---|---|
| **EXP-01** | PDF closing reports are generated in standardized printable A4 dimensions. | [ ] |
| **EXP-02** | All numbers inside PDFs format with thousands separators and append " SYP". | [ ] |
| **EXP-03** | Date timestamps inside PDF & CSV reports map to `Asia/Damascus` local time. | [ ] |
| **EXP-04** | Every CSV exports write a UTF-8 BOM `[0xEF, 0xBB, 0xBF]` header to ensure Excel compatibility. | [ ] |
| **EXP-05** | CSV numeric fields contain plain integers, avoiding formatting strings to allow Excel formulas. | [ ] |
| **EXP-06** | The export workflow intercepts Windows file locks and shows a readable instructions warning. | [ ] |
| **EXP-07** | Custom file-save dialog prompts standard name suggestions matching the shift date. | [ ] |

---

## What Success Looks Like
A cashier clicks "Export Payments CSV" inside the Reports center. A standard Windows desktop save-dialog opens, proposing `payments_export_2026-05-22.csv`. They click save. The system writes the records, wrapping strings with commas and placing the UTF-8 BOM bytes at the start. The cashier opens the file in Microsoft Excel. Every single row aligns perfectly, the player name column displays special characters flawlessly, and the accountant instantly runs a `=SUM(E2:E50)` formula on the payments column, calculating the exact shift totals with zero errors.
