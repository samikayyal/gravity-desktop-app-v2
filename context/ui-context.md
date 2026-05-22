# UI Context

## Theme

Light mode only. The visual direction is **Modern Cashier Calm**: a clean,
operational Windows desktop front-desk interface for a trampoline park.

The park yellow `#FBF306` is the brand and primary action color, but it should
be used with restraint. It works best as a filled button, active selection,
brand highlight, or high-value call-to-action with dark text. Do not use yellow
as body text on light backgrounds.

The UI should feel fast, clear, and work-focused. Status colors for timers,
debt, checkout, inventory, and backup health must stay easier to scan than
decorative brand color. Surfaces should be neutral, borders visible but quiet,
and dense cashier workflows should avoid marketing-style hero layouts.

## Design Contract

- Use Flutter Material 3 as the base UI system.
- Centralize colors, text styles, spacing, radius, and status colors in a
  shared theme/tokens layer.
- Feature widgets must not hardcode hex values or create feature-local color
  systems.
- Target a 1080p Windows laptop display.
- Build operational cashier screens, not marketing pages.
- Keep cards and panels at `8px` radius or below unless a dialog or rare empty
  state needs more.
- Use shared primitives for buttons, inputs, status chips, timers, payment
  summaries, data tables, dialogs, navigation, and export/status feedback.
- Use clear empty and error states; do not show blank panels after query or
  workflow failures.

## Detailed UI Spec

Detailed color token tables, typography, radius scale, component expectations,
layout patterns, icon guidance, and visual hierarchy rules are split into:
- [`context/feature_specs/02-ui-tokens-and-theme.md`](feature_specs/02-ui-tokens-and-theme.md): Baseline design tokens, HSL palette mapping, and Modern Cashier Calm themes.
- [`context/feature_specs/03-localization-infrastructure.md`](feature_specs/03-localization-infrastructure.md): RTL layout guidelines, Arabic typography, l10n keys, and ARB structure.
- [`context/feature_specs/19-shared-ui-primitives.md`](feature_specs/19-shared-ui-primitives.md): Standardized components (buttons, chips, inputs, tables, dialogs) derived from design tokens.

Read these specs before implementing theme code, localization logic, shared UI primitives, screen layouts, or custom visual components.


