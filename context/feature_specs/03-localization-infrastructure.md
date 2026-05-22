---
id: "03"
title: Localization Infrastructure
status: ready
implementation_order: 3
depends_on: ["01", "02"]
must_read:
  - context/glossary.md
owns_tables:
  - system_settings
owns_paths:
  - l10n.yaml
  - lib/l10n/
  - lib/app/
verification:
  - flutter gen-l10n
  - dart format --set-exit-if-changed .
  - flutter analyze
  - flutter test
stop_and_ask:
  - changing supported locales
  - changing Arabic numeral or RTL behavior
  - adding hardcoded user-facing UI strings
---

# Feature Spec 03: Localization Infrastructure

## Purpose
The localization infrastructure provides native support for bilingual operations (English LTR and Arabic RTL). It establishes standard configurations for Flutter's localization toolchain (`flutter_localizations`), defines strict `app_en.arb` and `app_ar.arb` formatting rules, configures RTL-aware layouts, loads specialized Arabic typefaces (**Cairo** or **Tajawal**), and sets naming conventions for localization keys. While full Arabic translations are deferred in early phases, the technical plumbing is established from day one.

---

## Build Notes

### Toolchain and Packages
- **Standard Library**: `flutter_localizations` (from Flutter SDK) providing support for Material, Cupertino, and Widgets translation hooks.
- **Generation Engine**: `flutter gen-l10n` driven by `l10n.yaml` in the project root.
- **Dynamic Helper**: `intl` library for gender-specific, plural-aware, and locale-specific formatters.
- **Font Assets**: Custom fonts added to `pubspec.yaml`:
  - English: **Inter** (sans-serif text), **Outfit** (headings, bold metrics).
  - Arabic: **Cairo** (primary readability typeface), **Tajawal** (high-contrast headings).

### File Structure and Generation Configs
Localization files are stored inside a dedicated directory:
- `lib/l10n/`
  - `app_en.arb` - Reference translation dictionary (English).
  - `app_ar.arb` - Target translation dictionary (Arabic).
- `l10n.yaml` - Localization generator config:
  ```yaml
  arb-dir: lib/l10n
  template-arb-file: app_en.arb
  output-class: AppLocalizations
  output-localization-file: app_localizations.dart
  nullable-getter: false
  ```

---

## Data/Domain/Storage

### Localized Product Names Mapping
Certain catalog objects in the database require localization. We support this without violating offline local database principles:
- **Reference Table**: As defined in `products` within [schema-reference.md](../schema-reference.md), the database stores static product values (`products.name` as text).
- **Localized Fields Rule**: For products that need dynamic localization (such as standard items like "Socks" or "Water"), the database stores their base l10n resource key (e.g., `'prodSocks'`). The repository maps this value to `AppLocalizations.of(context).prodSocks` at the UI boundary. 
- **Custom Products**: Products manually created by the cashier during operations use standard text inputs stored directly in the `name` column, functioning as literal text values across all locales.

---

## UI and Workflow

### Localization Key Naming Conventions
All hand-coded UI string keys must utilize standard lowerCamelCase syntax and adhere to strict functional prefixes:

| Prefix | Intended Purpose | Example Key Name | English Reference |
| :--- | :--- | :--- | :--- |
| `label...` | Input field descriptions, labels, hints | `labelFullName` | "Full Name" |
| `btn...` | Clickable buttons, primary actions | `btnCheckIn` | "Check In" |
| `msg...` | Alerts, feedback messages, snackbars | `msgCheckInSuccess` | "Player checked in successfully." |
| `title...` | Headers, screen titles, dialog sections | `titleActiveBoard` | "Active Player Board" |
| `chip...` | Tight status badges, tags | `chipOverdue` | "Overdue" |
| `prod...` | Pre-filled catalog product translation keys | `prodWaterBottle` | "Water Bottle (0.5L)" |

### Locale Swapping Workflow
The cashier changes settings inside the global settings panel:
- **Default Locale**: English (`en`).
- **Selector UI**: A dense dropdown field in the Settings panel allows selecting between "English (US)" and "العربية (Syria)".
- **Dynamic Font Loading**: On choosing Arabic (`ar`), the global theme manager re-evaluates the font family configurations:
  - Primary text moves from Inter to **Cairo**.
  - Headers and timer numbers shift from Outfit to **Tajawal**.
- **Layout Mirroring (RTL)**: Layout structures must dynamically mirror along horizontal vectors:

```text
LTR (English Layout)                    RTL (Arabic Layout)
+-----------------------+---------+     +---------+-----------------------+
| Active Board (60%)    | Ctx(40%)| --> | Ctx(40%)| Active Board (60%)    |
+-----------------------+---------+     +---------+-----------------------+
| Navigation Rail (Left)|               |               |Navigation Rail (Right)|
+-----------------------+---------+     +-----------------------+---------+
```

### Cashier Number Formatting Rules
- **Decimal Standards**: Timers, currency calculations, invoice codes, and phone numbers must always utilize **Western Arabic numerals (0-9)**.
- **Rule**: Standard Eastern Arabic numerals (٠-٩) are **strictly forbidden** inside cashier layouts to prevent scanning delays and processing mismatches during rapid entry. Timers must output standard clean digits (e.g. `00:45:12`) in both English and Arabic views.
- **Currency Format**: Money is formatted in Syrian Pounds (SYP) using the local business standard:
  - English: `5,000 SYP`
  - Arabic: `٥,٠٠٠ ل.س` (Or utilizing Western digits for clarity: `5,000 ل.س`). Cashier workflows must display `5,000 ل.س`.

---

## Edge Cases and Rules

1. **Deferred Arabic Strategy**:
   - In phase 1, all Arabic keys inside `app_ar.arb` are populated with English text if translation is incomplete. The infrastructure must load these gracefully without crashing or falling back to raw key text strings.
2. **Dynamic UI Text Wrapping**:
   - Arabic text strings typically consume 20-30% more horizontal screen space than English equivalents. Input titles, data cells, and chip labels must use auto-scaling font techniques or fit within designated high-density boxes without causing clip lines or layout overflows.
3. **Strict Mirroring Rules**:
   - Custom custom widgets (e.g., split payment sliders, timer progress wheels) must respect local reading directions. Use generic layout containers (`Padding`, `Row`, `Directionality.of(context)`) rather than hardcoded left/right alignments (`EdgeInsets.only(left: 8.0)` -> `EdgeInsetsDirectional.only(start: 8.0)`).

---

## Tests and Verification

### Layout Direction and Numeral Checks
1. **Locale Mirroring Direction Test**:
   - Render the main split-panel widget in a mock screen context.
   - Inject Locale as `Locale('ar')`.
   - Verify that `Directionality.of(context)` returns `TextDirection.rtl`.
   - Assert that the Side Navigation Rail is aligned to the right side of the screen boundary.
2. **Western Numeral Output Assertion**:
   - Test custom currency and timing formatters:
     ```dart
     import 'package:test/test.dart';
     
     String formatTimerDigits(Duration duration) {
       final hrs = duration.inHours.toString().padLeft(2, '0');
       final mins = (duration.inMinutes % 60).toString().padLeft(2, '0');
       final secs = (duration.inSeconds % 60).toString().padLeft(2, '0');
       return "$hrs:$mins:$secs";
     }
     
     void main() {
       test('Timer Output Western Numerals in Arabic Locale', () {
         final timeStr = formatTimerDigits(Duration(minutes: 45, seconds: 12));
         // Assert that no Eastern digits slip in
         expect(timeStr, equals("00:45:12"));
         expect(timeStr.contains('٤'), isFalse);
       });
     }
     ```
3. **Fallback Resolution Test**:
   - Query a translation key in the Arabic dictionary that remains untranslated.
   - Assert it defaults gracefully to the English key value rather than outputting the raw program token label.

---

## Acceptance Checklist

- [ ] `l10n.yaml` exists in the workspace root and compiles cleanly when running `flutter gen-l10n`.
- [ ] Language selection setting toggles app locale correctly between `en` and `ar`.
- [ ] Font files for **Cairo** and **Tajawal** successfully registered inside `pubspec.yaml`.
- [ ] Material components (DatePickers, Dialog structures) dynamically render Arabic instructions on locale switch.
- [ ] Position paddings inside forms migrated from hardcoded left/right alignments to RTL-aware directional layouts (`EdgeInsetsDirectional`).
- [ ] Time countdown digits are forced to Western Arabic formatting (0-9) inside Arabic contexts.
- [ ] App ARB keys follow lowerCamelCase conventions with mandatory functional prefixes (`label`, `btn`, `msg`, `title`, `chip`).
- [ ] App compiles without errors with Arabic ARB files containing partial English copy keys.

---

## What success looks like
Toggling the app language to Arabic in the settings menu instantly redraws the interface. The side navigation rail shifts smoothly to the right, all form fields mirror, and Cairo/Tajawal fonts load dynamically to render readable, professional Arabic headings. Text layouts expand gracefully without clipping, and timers continue to count down in crisp, readable Western digits (e.g. `00:15:00` instead of ٠٠:١٥:٠٠) at the cashier's desk.
