---
id: "04"
title: Shared UI Primitives
status: ready
implementation_order: 4
depends_on: ["01", "02", "03"]
blocks_ui_specs: ["07", "08", "09", "10", "12", "13", "15", "17", "21", "22"]
must_read:
  - context/ui-context.md
  - context/glossary.md
owns_tables: []
owns_paths:
  - lib/app/widgets/
  - lib/app/layout/
  - test/features/shared_ui/
verification:
  - dart format --set-exit-if-changed .
  - flutter analyze
  - flutter test test/features/shared_ui
stop_and_ask:
  - changing shared split-panel layout
  - changing component radius or color token rules
  - adding feature-local replacements for shared primitives
---

# Feature Spec 04: Shared UI Primitives

## Purpose
Establish a centralized catalog of reusable presentation widgets and design tokens that enforce the **"Modern Cashier Calm"** theme. This specification guarantees absolute visual consistency, high operational scanning speed, and strict accessibility standards across all front-desk operations on the target 1080p Windows desktop interface.

---

## Build Notes

### Key Technologies
- **Flutter Material 3 (Light Mode Only)**.
- **Google Fonts (Inter or Roboto)**: Configured as the core typography family for clean legibility and uniform numeric digit widths (monospaced figures).
- **Core Widgets Boundary**: Custom shared primitives wrap standard Material widgets, enforcing limits on paddings, border radius, and colors to prevent developers from hardcoding custom layouts.

### Folder Structure
- `lib/app/theme/`
  - `app_colors.dart`: Muted base colors, brand yellow, and status color tokens.
  - `app_typography.dart`: Scale definitions for titles, tables, form text, and numbers.
- `lib/app/widgets/`
  - `gravity_button.dart`: Primary, secondary, icon, and quick-add actions.
  - `gravity_status_chip.dart`: Contextual status indicators for timers, inventory, and sync.
  - `gravity_text_field.dart`: Standard text and monetary blind inputs.
  - `gravity_data_table.dart`: Compact data-dense grids.
  - `gravity_dialog.dart`: Centered administrative verification overlays.
  - `gravity_split_scaffold.dart`: Layout container for left Active Board and right Action panel.

---

## Data/Domain/Storage

### Color Token Palette Definitions

| Token Name | Hex Value | Application / Meaning | Accessibility Rule |
| --- | --- | --- | --- |
| `Brand Yellow` | `#FBF306` | Primary action buttons, high-priority highlights. | **MUST** use dark charcoal text. White text is forbidden. |
| `Dark Charcoal` | `#1E1E1E` | Primary body text, headings, and high-contrast button labels. | Used on yellow or light grey backgrounds. |
| `Neutral Surface` | `#F8F9FA` | Dashboard background, alternating table row shading. | Low contrast, calming background. |
| `Quiet Border` | `#E9ECEF` | Component frames, text field borders, table grid lines. | Subtle definition, keeps screen visually quiet. |
| `Status Green` | `#2D6A4F` | Balanced states, active check-in timers, restocks, cloud sync active. | Clear white text. |
| `Status Amber` | `#D97706` | Near overtime alerts, active unpaid debt warning. | Dark charcoal text. |
| `Status Red` | `#DC2626` | Overdue timer alerts, low/negative stock warnings, sync failures. | Clear white text. |
| `Status Grey` | `#6C757D` | Voided records, closed cashier shifts, offline indicators. | Clear white text. |

### Visual Geometry Constraints
- **Corner Radius Scale**:
  - Small Elements (Chips, Inputs, Buttons): `8px` or below.
  - Medium Elements (Cards, Panels, Alert Boxes): `8px`.
  - Large Elements (Dialogs, Core Overlays): `12px` maximum.
- **Spacing Scale (Paddings / Margins)**:
  - Dense compact standard: `4px` (xs), `8px` (sm), `12px` (md), `16px` (lg).
  - No decorative white-space layouts exceeding `24px`.

---

## UI and Workflow

### 1. Primary & Secondary Buttons
- **`GravityButton.primary`**:
  - Background: Solid `#FBF306`.
  - Text: Bold `#1E1E1E`.
  - Height: `48px` (Cashier quick tap size).
- **`GravityButton.secondary`**:
  - Background: Transparent with `#1E1E1E` 1px border.
  - Text: `#1E1E1E`.
- **`GravityButton.danger`**:
  - Background: Solid `#DC2626`.
  - Text: Solid White `#FFFFFF`.

```text
+------------------------+  +------------------------+  +------------------------+
|  Primary Button (Yel)  |  | Secondary Button (Brd) |  |   Danger Button (Red)  |
+------------------------+  +------------------------+  +------------------------+
```

### 2. Standardized Status Chips
Chips dynamically render based on operational status:

```text
 [● Active (Grn)]    [▲ Near End (Amb)]    [✖ Overdue (Red)]    [◌ Closed (Grey)]
```

- **Overdue Chip**: Red background, flashing animation, bold white text. Indicates players that exceeded their check-in blocks.
- **Debt Chip**: Amber border, amber text, light neutral backing. Warns of outstanding debt during check-in search.
- **Sync Chip**: Small status dot inside shell header mapping cloud sync health.

### 3. Text Inputs with Floating Labels
- Outlined style with `8px` border radius.
- Highlight border changes to `#FBF306` only when focused.
- **Blind Count Input Variant**:
  - Monospace font for number rendering.
  - Hides input value behind standard obfuscation dot characters until cashier clicks the adjacent "Reveal Eye" icon.

### 4. Dense Data Table
Tables are engineered to present maximum database information without scrolling:
- Header background: `#E9ECEF`. Header labels are bold and uppercase.
- Alternating rows: White `#FFFFFF` and light grey `#F8F9FA` to prevent line-scanning confusion.
- **Column Alignments**:
  - Text columns: Left-aligned.
  - Number & Currency columns: Right-aligned with monospaced digits.
  - Action columns: Centered.

```text
+-------------------------------------------------------------+
| PLAYER NAME        | PHONE           | TOTALS     | ACTIONS |
+-------------------------------------------------------------+
| Samer Kayyal       | +963 944 111 222|  15,000 SYP| [Check] |
|--------------------|-----------------|------------|---------|
| Maya S.            | +963 933 444 555|   8,000 SYP| [Check] |
+-------------------------------------------------------------+
```

### 5. Split-Scaffold Layout Component
Enforces the structural layout across all principal modules:
- Main screen divides strictly at a `60% / 40%` ratio.
- Center divider has a solid `1px` quiet grey border.
- The Right Context Panel (~40%) dynamically updates its card contents using smooth fade transitions, maintaining the Left Active Board in full view.

---

## Edge Cases and Rules

### 1. The High-Contrast Accessibility Rule
- **Rule**: White text is strictly forbidden on yellow `#FBF306` buttons or chips.
- White text on yellow primary actions violates basic readability standards.
- All primary actions **must** use `#1E1E1E` (Dark Charcoal) text to guarantee WCAG AA visibility compliance.

### 2. Monospaced Figure Rules for Money
- Standard variable-width fonts cause digit alignments to shift dynamically, making lists of financial values hard to read.
- **Rule**: All currency outputs, reports, and table totals **must** use a monospace typeface variant (e.g. `Roboto Mono` or the monospace setting of system font libraries) to ensure columns of integers align perfectly.

### 3. Density Auto-Scaling and Non-Clipping
- Since the target environment is a 1080p display, components **must not** wrap text onto multiple lines or clip content.
- Column widgets inside data tables must define strict `flex` or `fixed-width` sizes, utilizing `TextOverflow.ellipsis` to handle exceptionally long player names.

---

## Tests and Verification

### Widget Tests (`test/features/shared_ui/`)
1. **Primary Button Rendering**:
   - Render `GravityButton.primary`.
   - Assert background color token is `#FBF306`.
   - Assert label text color token is `#1E1E1E`.
2. **Monospace Number Verification**:
   - Render a monetary field inside `GravityDataTable`.
   - Verify the font style uses monospaced digit formatting (`fontFeatures` contains `FontFeature.tabularFigures()`).
3. **Data Density Constraints**:
   - Render a table inside a restricted 1080p test view envelope.
   - Seed exceptionally long names (e.g., a name containing 80 characters).
   - Assert that no overflow warning is output to the logs, and that text truncation (`...`) is triggered successfully.
4. **Accessibility Contrast Check**:
   - Verify programmatically that the contrast ratio of the primary button background vs text meets or exceeds `4.5:1`.

---

## Acceptance Checklist

| ID | Requirement Details | Status |
|---|---|---|
| **PRI-01** | Themes are light-mode only, centralizing primary color to `#FBF306`. | [ ] |
| **PRI-02** | All primary yellow buttons utilize `#1E1E1E` dark text. | [ ] |
| **PRI-03** | Text fields and buttons are restricted to an `8px` or lower corner radius. | [ ] |
| **PRI-04** | Status chips render red for overdue, green for balanced, and grey for voided entries. | [ ] |
| **PRI-05** | Numeric monetary rows are right-aligned using tabular monospace digit fonts. | [ ] |
| **PRI-06** | Alternating shading is configured inside all compact custom data tables. | [ ] |
| **PRI-07** | Layout uses a `60%` Left Active Board and `40%` Right Action panel divide scaffold. | [ ] |
| **PRI-08** | Table widths use ellipsis truncation instead of throwing visual overflow failures. | [ ] |

---

## What Success Looks Like
A developer builds the Checkout Screen. Instead of designing buttons and text fields from scratch, they compose the interface entirely from shared primitives. They pull in `GravitySplitScaffold`, drop `GravityDataTable` on the left, and stack standard `GravityTextField` inputs inside the right action card. Running the app on a standard laptop display shows a dense, visually quiet, beautifully balanced screen where green, amber, and red chips highlight active states, primary buttons capture attention in bold yellow, and not a single pixel overflows or clips under any input size.
