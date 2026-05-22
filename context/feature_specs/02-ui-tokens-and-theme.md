# Feature Spec: UI Tokens and Theme

## Purpose
The goal of this specification is to define a unified, high-density light-mode theme called **Modern Cashier Calm**. It establishes the baseline color tokens (using a structured HSL-adapted palette), typography using the **Outfit** and **Inter** typefaces, strict vertical and horizontal spacing scales, corner radiuses, and explicit interactive visual states. It ensures all front-desk interface elements remain fast to scan, clean, and operational without custom feature-local overrides.

---

## Build Notes

### Core Technologies
- **UI Framework**: Flutter Material 3.
- **Theme Delivery**: A centralized custom `ThemeData` configuration in `lib/app/theme/app_theme.dart`.
- **Extended Tokens**: Standard Flutter theme models are augmented with a custom `ThemeExtension` class called `AppColorsExtension` to support specific cashier status colors (e.g. overdue timers, debt alerts, stock warnings).

### File Structure
All styling declarations are located within the global theme module:
- `lib/app/theme/color_tokens.dart` - Static color palettes and semantic mapping.
- `lib/app/theme/spacing_tokens.dart` - Layout spacing, padding, and corner radius tokens.
- `lib/app/theme/app_theme.dart` - `ThemeData` builders, typography mappings, and input/card style configurations.

---

## Data/Domain/Storage

### System Settings Integration
While the theme is statically set to Light Mode, specific UI state configurations are driven by local variables:
- **Light Mode Only Constraint**: The app explicitly overrides and ignores OS dark-mode requests.
- **Persistent Settings**: If specific user interface scaling options are later requested, they are saved as values in the `system_settings` table under keys like `'ui_scale_multiplier'`. Otherwise, this feature reads exclusively from compile-time styling tokens. Refer to [schema-reference.md](../schema-reference.md) for table schemas.

---

## UI and Workflow

### Palette Mapping (HSL Adapted Colors)
Colors are structured mathematically around HSL coordinates to ensure predictable shading, hover levels, and border quietness.

| Token Name | Color Hex | HSL Equivalent | Semantic Purpose |
| :--- | :--- | :--- | :--- |
| **Brand Primary (Yellow)** | `#FBF306` | `HSL(58, 97%, 50%)` | High-value actions, primary button, active selection with dark text |
| **Brand Primary Container**| `#FCF86C` | `HSL(58, 96%, 70%)` | Subtle selection backing, low-contrast highlighting |
| **Neutral Background** | `#F8FAFC` | `HSL(210, 40%, 98%)` | Deep app container background |
| **Neutral Surface** | `#FFFFFF` | `HSL(0, 0%, 100%)` | Screen card panels, data tables, cashier inputs |
| **Quiet Borders** | `#E2E8F0` | `HSL(214, 32%, 91%)` | Panel separators, input borders, structural grids |
| **Text Primary** | `#0F172A` | `HSL(222, 47%, 11%)` | High-contrast body, header labels, active titles |
| **Text Secondary** | `#475569` | `HSL(215, 16%, 47%)` | Subtitles, helper text, inactive descriptions |

### Cashier Status Colors (Theme Extension Mapping)
Cashier operational monitoring relies heavily on instant color scanning. The following status colors are mapped explicitly inside `AppColorsExtension`:

| Status Token | Color Hex | HSL Equivalent | UI Scenario |
| :--- | :--- | :--- | :--- |
| **Status Active (Green)** | `#10B981` | `HSL(159, 84%, 39%)` | Timer running, check-in active, normal product stock |
| **Status Near-End (Orange)** | `#F59E0B` | `HSL(38, 92%, 50%)` | Timer remaining < 10 mins (default), low inventory warning |
| **Status Overdue (Red)** | `#EF4444` | `HSL(0, 84%, 60%)` | Timer has expired, unpaid checkout debt |
| **Status Stale (Purple)** | `#8B5CF6` | `HSL(258, 90%, 66%)` | Active session exceeds configurable stale threshold |
| **Status Debt (Amber)** | `#D97706` | `HSL(32, 95%, 44%)` | Old outstanding debt warning on player profiles |
| **Status Stock Neg (Crimson)** | `#B91C1C` | `HSL(0, 74%, 41%)` | Inventory stock is negative, needs restock |
| **Status Cloud OK (Teal)** | `#0D9488` | `HSL(175, 84%, 32%)` | Cloud backup succeeded |
| **Status Cloud Err (Rose)** | `#E11D48` | `HSL(344, 83%, 50%)` | Cloud backup failed, backup alert warning |

### Typography Scale
To combine modern branding with high numeric legibility, we utilize a two-family typeface approach:
1. **Outfit**: Used for prominent titles, big time readouts, cashier session status summaries, and primary cards.
2. **Inter**: Used for dense grid cells, input fields, labels, phone listings, settings values, and financial calculations.

| Style Name | Font Family | Size (px) | Weight | Line Height | Case Usage |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Header Large** | Outfit | 24 | Bold (700) | 1.2 | Screen main titles (e.g. Active Board) |
| **Header Medium**| Outfit | 18 | Semi-Bold (600) | 1.3 | Panel subheaders, dialog titles |
| **Timer Counter** | Outfit | 36 | Bold (700) | 1.0 | Active countdown time digits |
| **Body Primary** | Inter | 14 | Regular (400) | 1.4 | Standard body paragraphs, descriptions |
| **Body Semibold**| Inter | 14 | Semi-Bold (600) | 1.4 | Important table data, text selections |
| **Table Number** | Inter | 13 | Medium (500) | 1.2 | Financial SYP listings, item quantity cells |
| **Input Label** | Inter | 12 | Semi-Bold (600) | 1.2 | Form input headers (e.g. Full Name) |
| **Status Chip** | Inter | 11 | Bold (700) | 1.1 | Text badges inside status containers |

### Spacing Grid & Border Radius Scales
The spacing scale relies on an `8dp` baseline to maximize density without creating clutter on standard 1080p monitors.

- **Spacing Increments**:
  - `Spacing.xxs` = 4dp (tight widget padding, text to icon gaps)
  - `Spacing.xs`  = 8dp (base card padding, input fields gap)
  - `Spacing.sm`  = 12dp (internal components gap)
  - `Spacing.md`  = 16dp (standard screen panel boundaries)
  - `Spacing.lg`  = 24dp (outer viewport layout grid)
  - `Spacing.xl`  = 32dp (major visual module breaks)
- **Border Radius**:
  - `Radius.sm` = 4px (checkboxes, status chips, tight inputs)
  - `Radius.md` = 8px (standard desktop screen panels, buttons, dialog containers)
  - **Rule**: Rounding must not exceed `8px` to preserve a clean, professional, desktop-first structure.

### Visual States & Interactions
Interactive elements must have distinct, quick visual transitions:
- **Hover State**: Surfaces lighten or darken by HSL Lightness +/- 5%. Cursor shifts to pointer.
- **Focus State**: Inputs render a high-contrast `2px` border colored in Brand Primary (or primary-tinted dark navy) with no outer glow.
- **Disabled State**: Opacity falls to 40% with absolute suppression of hit-test events. Cursor resets to basic system arrow.
- **Active Selection**: Cards or grid rows draw a quiet highlight utilizing Brand Primary Container (`#FCF86C`) and standard quiet border thickness.

---

## Edge Cases and Rules

1. **Brand Contrast Compliance**:
   - The brand primary yellow (`#FBF306`) has a high lightness value. It must **never** be used for body text, active text icons, or descriptions on light surfaces.
   - Text placed inside primary filled buttons (backed by `#FBF306`) must use Text Primary (`#0F172A`). This maintains a high contrast ratio exceeding `4.5:1` (WCAG AA standard).
2. **Light-Mode-Only Restriction**:
   - The desktop client enforces light mode. Theme calculations must not attempt to resolve dynamic system light/dark settings. `brightness: Brightness.light` is hardcoded.
3. **No Local Color Hardcoding**:
   - Feature modules and custom widgets are strictly prohibited from utilizing direct hexadecimal colors (`0xFF...`). All styling must access values through `Theme.of(context)` or custom ThemeExtensions.

---

## Tests and Verification

### Theme Enforcement and Contrast Tests
1. **Typography Configuration Test**:
   - Load `AppTheme` within a unit test framework.
   - Assert `themeData.textTheme.displayLarge?.fontFamily` matches `'Outfit'`.
   - Assert `themeData.textTheme.bodyMedium?.fontFamily` matches `'Inter'`.
2. **Contrast Ratio Safety Assertions**:
   - Set up an automated check verifying color contrasts for critical pairings:
     ```dart
     import 'dart:ui';
     import 'package:test/test.dart';
     
     double calculateContrastRatio(Color color1, Color color2) {
       // standard relative luminance calculations...
       final l1 = color1.computeLuminance();
       final l2 = color2.computeLuminance();
       return (l1 > l2) ? (l1 + 0.05) / (l2 + 0.05) : (l2 + 0.05) / (l1 + 0.05);
     }
     
     void main() {
       test('Brand Yellow Text Contrast Ratio Test', () {
         final yellow = Color(0xFFFBF306);
         final darkText = Color(0xFF0F172A);
         final ratio = calculateContrastRatio(yellow, darkText);
         expect(ratio, greaterThanOrEqualTo(4.5), reason: "Text must remain legible inside yellow containers");
       });
     }
     ```
3. **ThemeExtension Retrieval Test**:
   - Mount a widget wrapped in `MaterialApp` with `AppTheme`.
   - Retrieve `Theme.of(context).extension<AppColorsExtension>()` and assert that the returned instance contains expected non-null status colors.

---

## Acceptance Checklist

- [ ] `AppColorsExtension` created and registers all 8 operational status colors.
- [ ] Centralized color definitions in `color_tokens.dart` map to standard HSL values.
- [ ] Font assets for **Outfit** (regular, semibold, bold) and **Inter** (regular, medium, semibold, bold) added to `pubspec.yaml` and loaded correctly.
- [ ] Input borders, button themes, and card configurations explicitly default to `8px` corner radius or below.
- [ ] Light-mode constraint hardcoded in the app widget builder; system dark mode requests ignored.
- [ ] Text inside primary brand buttons utilizes primary dark navy text (`#0F172A`) for contrast.
- [ ] UI spacing tokens declared as multiples of `8dp` baseline grids.
- [ ] Interactive buttons and lists implement explicit visual transitions for hover, focus, and disabled states.

---

## What success looks like
The front-desk application loads in a beautiful, light-mode desktop layout. Standard panels have crisp, quiet borders, and timers reflect clear, high-visibility status colors (green for normal, orange for near-end, red for overdue). Clicking on primary cashier actions displays a vibrant yellow button with high-contrast readable dark text. The typography looks clean and readable, displaying outfit-branded numbers and inter-styled text in perfect balance.
