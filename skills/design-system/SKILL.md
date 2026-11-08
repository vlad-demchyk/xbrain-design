---
name: design-system
description: Sets a product's visual system: colour tokens for dark and light with checked contrast, a type pair with Cyrillic, spacing, radius, shadows and motion tokens, chart palettes validated for colour blindness, and components with their states. Use it on «дизайн-система», «токени», «кольори», «шрифти», «типографіка», «палітра», «темна тема», «бренд-кіт», «які шрифти з кирилицею», and when a design or a product needs consistent tokens.
---

# The visual system

## Tokens

- Colours as tokens, never hex in components: surfaces (page, raised, card, muted), text (primary,
  secondary, tertiary, on accent), lines, one brand accent with a soft tint, semantic states (success,
  warning, error, info) with their soft tints.
- Dark theme: dark grey surfaces (not pure black for app UI), higher surfaces lighter. Light theme:
  off-white page, white cards.
- Every text pair checked: 4.5:1 for text, 3:1 for large text, component borders, icons and focus.
- Spacing on a 4 or 8 step scale; radius 3-4 steps; shadows 2-3 levels; motion tokens (durations 120,
  200, 320, 600 ms; one ease-out and one ease-in-out curve).

## Type with Cyrillic

Self-hosted (fontsource packages give Cyrillic and Latin subsets as woff2).

| Role | Options |
|---|---|
| Grotesk for product and UI | Geist, Inter Tight, Onest, Manrope |
| Display, wide or characterful | Unbounded, Onest at 700-800, Manrope at 800 |
| Serif for an editorial voice | Playfair Display, Lora |
| Mono for labels and data | Geist Mono, IBM Plex Mono, JetBrains Mono |

A pair is one display and one text family, plus a mono at most. Declare each subset with its
`unicode-range`. Check the Ukrainian letters ґ є і ї and the apostrophe ʼ in every weight used.

## Charts

Categorical series in a fixed order, validated for the surface they sit on (lightness band, chroma,
colour-blind separation, contrast) with the dataviz validator; every chart with a table view and
direct labels, never colour alone.

## Components

Every component with all its states (default, hover, focus, pressed, disabled, loading, error), both
themes and long content. No coloured left stripes on cards; group with space, hairlines and labels.
Hide actions that conflict with a running operation rather than disabling them.

## Where it lives

The product's tokens file in its code, and (with XBrain) the design system's page in the brain's
`Designs/`. A brand kit board: logo and clear space, colours with their contrast, type pair, voice, do
and don't.
