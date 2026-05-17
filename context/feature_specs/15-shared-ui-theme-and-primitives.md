# Shared UI Theme And Primitives

## Purpose

Define the shared visual system for the Windows cashier app so feature screens
stay consistent, dense, readable, and operational.

## Build Notes

- Light mode only.
- Visual direction is **Modern Cashier Calm**: a clean Windows desktop
  front-desk interface for a trampoline park.
- Use Flutter Material 3 as the base.
- Target a 1080p Windows laptop display.
- Centralize colors, text styles, spacing, radius, and status colors in a
  shared theme/tokens layer.
- Feature widgets must not hardcode hex values or create feature-local color
  systems.

## Data, Domain, And Storage

- This spec does not add business storage.
- Theme values belong in code after the scaffold exists, likely in `lib/app/`
  or a shared theme module.
- UI state remains rebuildable from providers and SQLite-backed data; theme
  code must not own business rules.

## UI And Workflow

- Park yellow `#FBF306` is the brand and primary action color.
- Use yellow with restraint for filled buttons, active selection, brand
  highlights, and high-value calls to action with dark text.
- Do not use yellow as body text on light backgrounds.
- Status colors for timers, debt, checkout, inventory, and backup health must
  be easier to scan than decorative brand color.
- Surfaces should be neutral, borders visible but quiet, and dense cashier
  workflows should avoid marketing-style hero layouts.
- Build shared primitives for buttons, inputs, status chips, timer displays,
  payment summary panels, data tables, dialogs, navigation, and export/status
  feedback.
- Use icon-only buttons in dense toolbars with tooltips and icon plus text for
  primary actions.

## Color Tokens

Use these tokens from a central Flutter theme or `AppColors` class.

### Core Tokens

| Token | Hex | Use |
| --- | --- | --- |
| `color.brand.primary` | `#FBF306` | Park yellow, primary filled actions, selected state highlights |
| `color.brand.primaryHover` | `#E7E000` | Hover state for yellow primary controls |
| `color.brand.primaryPressed` | `#CFC800` | Pressed state for yellow primary controls |
| `color.brand.primaryContainer` | `#FFFCC2` | Soft yellow containers, selected rows, subtle brand emphasis |
| `color.brand.onPrimary` | `#181A12` | Text and icons on `color.brand.primary` |
| `color.brand.onPrimaryContainer` | `#3A3500` | Text and icons on soft yellow containers |
| `color.background.base` | `#FBFCF7` | App background |
| `color.background.subtle` | `#F4F6F0` | Secondary app background, side rails, inactive bands |
| `color.surface.default` | `#FFFFFF` | Panels, tables, drawers, cards |
| `color.surface.raised` | `#FFFFFF` | Dialogs, menus, popovers with elevation |
| `color.surface.sunken` | `#EEF1E8` | Inputs, search fields, recessed areas |
| `color.surface.selected` | `#FFFDE6` | Selected table rows, active navigation, selected filters |
| `color.surface.disabled` | `#E6E8DF` | Disabled controls and disabled table rows |
| `color.border.default` | `#D8DCD0` | Standard dividers, input borders, table lines |
| `color.border.strong` | `#AEB5A3` | Focused table boundaries, strong separators |
| `color.border.subtle` | `#E7EADF` | Low-emphasis dividers |
| `color.text.primary` | `#181A12` | Main readable text |
| `color.text.secondary` | `#4D5146` | Supporting labels and secondary values |
| `color.text.tertiary` | `#73796A` | Metadata, helper text, timestamps |
| `color.text.disabled` | `#A4AA9A` | Disabled text |
| `color.text.inverse` | `#FFFFFF` | Text on dark fills |
| `color.focus.ring` | `#0F8F86` | Keyboard focus ring and active input outline |
| `color.scrim` | `#181A1266` | Modal scrim and blocking overlays |

### Action Tokens

| Token | Hex | Use |
| --- | --- | --- |
| `color.action.primary.bg` | `#FBF306` | Main action buttons such as Check In, Pay, Start Timer |
| `color.action.primary.fg` | `#181A12` | Text and icons on primary action buttons |
| `color.action.primary.hover` | `#E7E000` | Primary button hover |
| `color.action.primary.pressed` | `#CFC800` | Primary button pressed |
| `color.action.primary.disabledBg` | `#E6E8DF` | Disabled primary button background |
| `color.action.primary.disabledFg` | `#8E9487` | Disabled primary button content |
| `color.action.secondary.bg` | `#EFF2EA` | Secondary buttons and quiet toolbar controls |
| `color.action.secondary.fg` | `#24271F` | Text and icons on secondary controls |
| `color.action.secondary.hover` | `#E4E8DE` | Secondary button hover |
| `color.action.secondary.border` | `#D8DCD0` | Secondary button border |
| `color.action.ghost.bg` | `#00000000` | Icon buttons and low-emphasis toolbar actions |
| `color.action.ghost.hover` | `#EEF1E8` | Ghost button hover |
| `color.action.destructive.bg` | `#D92D20` | Delete, void payment, force checkout, destructive confirmation |
| `color.action.destructive.fg` | `#FFFFFF` | Text and icons on destructive buttons |
| `color.action.destructive.hover` | `#B42318` | Destructive button hover |

### Accent Tokens

| Token | Hex | Use |
| --- | --- | --- |
| `color.accent.teal` | `#0F8F86` | Open-time, focus, neutral active indicators, calm accent |
| `color.accent.tealContainer` | `#D8F6F2` | Soft teal badges and panels |
| `color.accent.onTeal` | `#FFFFFF` | Text and icons on teal |
| `color.accent.onTealContainer` | `#063B37` | Text and icons on soft teal |
| `color.accent.sky` | `#1B84D8` | Links, info actions, receipt/export actions |
| `color.accent.skyContainer` | `#DCEEFF` | Soft info panels and selected link rows |
| `color.accent.onSky` | `#FFFFFF` | Text and icons on sky blue |
| `color.accent.onSkyContainer` | `#0B528F` | Text and icons on soft sky blue |

### Status Tokens

| Token | Hex | Use |
| --- | --- | --- |
| `color.status.active.bg` | `#EAF7E9` | Active player, paid session, running timer |
| `color.status.active.fg` | `#1F6B34` | Text/icons for active player state |
| `color.status.active.border` | `#9BD29F` | Border for active player state |
| `color.status.nearEnd.bg` | `#FFF3C4` | Timer near end, soon-due warnings |
| `color.status.nearEnd.fg` | `#6B4E00` | Text/icons for near-end state |
| `color.status.nearEnd.border` | `#E8B931` | Border for near-end state |
| `color.status.overdue.bg` | `#FFE1DE` | Overdue timer, missed checkout, urgent time warning |
| `color.status.overdue.fg` | `#9F1F17` | Text/icons for overdue state |
| `color.status.overdue.border` | `#EF8178` | Border for overdue state |
| `color.status.openTime.bg` | `#D8F6F2` | Open-time session |
| `color.status.openTime.fg` | `#075D57` | Text/icons for open-time session |
| `color.status.openTime.border` | `#72D8CE` | Border for open-time session |
| `color.status.debt.bg` | `#FFE8D9` | Unpaid balance, customer debt, partial payment |
| `color.status.debt.fg` | `#9A3D00` | Text/icons for debt state |
| `color.status.debt.border` | `#F0A05B` | Border for debt state |
| `color.status.lowStock.bg` | `#FFF4CC` | Low stock warning |
| `color.status.lowStock.fg` | `#745000` | Text/icons for low stock |
| `color.status.lowStock.border` | `#E7BC3E` | Border for low stock |
| `color.status.negativeStock.bg` | `#FDE2E7` | Negative stock or inventory correction required |
| `color.status.negativeStock.fg` | `#A31536` | Text/icons for negative stock |
| `color.status.negativeStock.border` | `#EC7D96` | Border for negative stock |
| `color.status.backupSuccess.bg` | `#E7F7ED` | Successful backup or sync-safe state |
| `color.status.backupSuccess.fg` | `#166534` | Text/icons for backup success |
| `color.status.backupSuccess.border` | `#8CD6A3` | Border for backup success |
| `color.status.backupFailure.bg` | `#FFE1DE` | Backup failure or restore error |
| `color.status.backupFailure.fg` | `#9F1F17` | Text/icons for backup failure |
| `color.status.backupFailure.border` | `#EF8178` | Border for backup failure |
| `color.status.info.bg` | `#DCEEFF` | Informational note, export status, receipt note |
| `color.status.info.fg` | `#0B528F` | Text/icons for info state |
| `color.status.info.border` | `#86BFF0` | Border for info state |
| `color.status.stale.bg` | `#EEE7FF` | Stale data or requires refresh |
| `color.status.stale.fg` | `#5630A8` | Text/icons for stale data |
| `color.status.stale.border` | `#B79AF2` | Border for stale data |

### Payment And Reporting Tokens

| Token | Hex | Use |
| --- | --- | --- |
| `color.payment.cash` | `#16803A` | Cash payment marker |
| `color.payment.card` | `#1B84D8` | Card payment marker |
| `color.payment.subscription` | `#0F8F86` | Subscription payment marker |
| `color.payment.debt` | `#9A3D00` | Debt or unpaid balance marker |
| `color.report.chart1` | `#FBF306` | First chart color, brand yellow |
| `color.report.chart2` | `#0F8F86` | Second chart color, teal |
| `color.report.chart3` | `#1B84D8` | Third chart color, sky blue |
| `color.report.chart4` | `#22A06B` | Fourth chart color, green |
| `color.report.chart5` | `#F97316` | Fifth chart color, orange |
| `color.report.chart6` | `#7C5CFF` | Sixth chart color, limited-use violet |
| `color.report.chartDanger` | `#D92D20` | Losses, voids, errors, negative values |

### Future AI Accent Tokens

The app has no AI feature in v1. If an AI assistant or suggestion panel is
added later, keep it visually separate from timer, debt, backup, and inventory
states.

| Token | Hex | Use |
| --- | --- | --- |
| `color.ai.assist.bg` | `#EEF0FF` | Future AI suggestion panel background |
| `color.ai.assist.fg` | `#3F3A8F` | Future AI suggestion text/icons |
| `color.ai.assist.border` | `#B9B7FF` | Future AI panel border |
| `color.ai.assist.icon` | `#635BFF` | Future AI icon or sparkle accent only |

## Typography

Use Material 3 text roles as the base, with app-specific aliases for cashier
workflows. Prefer `Inter` for English-only UI. If Arabic or bilingual UI is
needed, use `Noto Sans Arabic` for Arabic text and `Noto Sans` or `Inter` for
Latin text.

Timers, prices, quantities, and report totals should use tabular figures where
the selected font supports them.

| Token | Font | Size | Line Height | Weight | Use |
| --- | --- | ---: | ---: | ---: | --- |
| `type.display` | `Inter` or `Noto Sans` | `32` | `40` | `700` | Major dashboard totals, end-day summary headline |
| `type.pageTitle` | `Inter` or `Noto Sans` | `28` | `36` | `700` | Main screen title |
| `type.sectionTitle` | `Inter` or `Noto Sans` | `24` | `32` | `700` | Large panel headings |
| `type.panelTitle` | `Inter` or `Noto Sans` | `20` | `28` | `600` | Panel titles, checkout card title |
| `type.title` | `Inter` or `Noto Sans` | `18` | `26` | `600` | Dialog titles, table group titles |
| `type.body` | `Inter` or `Noto Sans` | `16` | `24` | `400` | Default UI text |
| `type.bodyStrong` | `Inter` or `Noto Sans` | `16` | `24` | `600` | Important values and row names |
| `type.bodySmall` | `Inter` or `Noto Sans` | `14` | `20` | `400` | Dense tables, helper text, secondary details |
| `type.label` | `Inter` or `Noto Sans` | `13` | `18` | `600` | Form labels, compact toolbar labels |
| `type.chip` | `Inter` or `Noto Sans` | `12` | `16` | `600` | Status chips and badges |
| `type.timerLarge` | `Inter` or `Noto Sans` | `28` | `34` | `700` | Active player timer, use tabular figures |
| `type.money` | `Inter` or `Noto Sans` | `20` | `28` | `700` | Checkout totals, balances, use tabular figures |
| `type.tableCell` | `Inter` or `Noto Sans` | `14` | `20` | `400` | Data tables and inventory rows |

## Border Radius

| Token | Value | Use |
| --- | ---: | --- |
| `radius.none` | `0px` | Table grids, full-bleed dividers, square layout joins |
| `radius.xs` | `2px` | Tiny indicators, progress segments, color swatches |
| `radius.sm` | `4px` | Inputs, table row focus outlines, compact controls |
| `radius.md` | `6px` | Buttons, chips, dropdowns |
| `radius.lg` | `8px` | Cards, panels, drawers, repeated list items |
| `radius.xl` | `12px` | Dialogs, menus, command palettes |
| `radius.2xl` | `16px` | Rare empty states or onboarding panels only |
| `radius.full` | `999px` | Pills, avatars, circular icon buttons |

## Layout Patterns

- Main screen: dense desktop workspace with top navigation, active player list,
  checkout/payment panel, and operational status area.
- Active players: table or list with stable row height, timer column, status
  chip, payment state, and quick actions.
- Checkout: fixed-width right panel or modal with clear totals, payment method,
  debt state, and receipt/complete actions.
- Inventory: table-first layout with low-stock and negative-stock states using
  the status tokens above.
- End-day reporting: neutral surfaces with chart tokens and clear cash/card/debt
  separation.
- Dialogs: centered overlays for confirmation and checkout flows; avoid nesting
  cards inside dialogs.

## Edge Cases And Rules

- Cards and panels should stay at 8px radius or below; larger radii are reserved
  for dialogs and rare empty states.
- Text inside buttons, status chips, rows, and forms must fit at 1080p without
  clipping.
- Avoid decorative UI that competes with operational status, payment amounts,
  debt warnings, timers, or report totals.
- Dialogs are centered overlays; avoid nesting cards inside dialogs.
- If Arabic or bilingual UI is needed, use `Noto Sans Arabic` for Arabic text
  and `Noto Sans` or `Inter` for Latin text.
- The app has no AI feature in v1; any future AI visual treatment must remain
  separate from timer, debt, backup, and inventory states.

## Tests And Verification

- Run `dart format`, `flutter analyze`, and `flutter test` after theme code
  exists.
- Add functional UI tests for behavior, not pixel-perfect layout.
- Golden tests are not required in v1 unless a component later needs visual
  regression coverage.
- Verify no feature widgets hardcode theme hex values.
- Verify cashier-critical text and controls fit at the 1080p target.

## What success looks like

- The UI feels fast, clear, work-focused, and consistent across feature areas.
- Shared tokens and primitives carry the visual system instead of per-feature
  styling.
- Brand yellow is recognizable without overpowering operational status colors.
- Screens support dense cashier workflows without looking like a marketing
  page.
