---
name: design-craft
description: The craft of strong, varied and effective designs: the decisions that shape a page and the hooks that hold attention (an assembled object, a decisive moment, the product's chrome as decoration, a typed request, a live board, a film in HTML) with how to build each; how to choose a direction by the product's type (product groups, style families, landing structures, dials for variance, motion and density); and the UX rules in priority order with an app checklist before delivery. Use it on «зроби дизайн сильнішим», «який хук», «який стиль для такого продукту», «яка структура лендінгу», «підбери напрям», «зроби як ми зробили для XBrain», «перевір UX», «що не так з інтерфейсом», «правила для форм / навігації / дотику», and whenever design-direction, design-marketing-site or design-quality needs a reasoned choice instead of taste.
---

# Design craft: strong decisions, hooks, choice, rules

Four references, read the one the step needs:

| Read | When |
|---|---|
| `references/hooks.md` | shaping a page: the decisions that make it strong, the hooks with how to build them, what weakened designs before |
| `references/choosing.md` | no decision yet: the product's group, the style family, the landing structure (`landing=story`, `demo`, `pricing`…), the dials |
| `references/rules.md` | checking or reviewing: every UX rule by category, in priority order |
| `references/app-rules.md` | an app's UI (iOS, Android, React Native, Flutter, desktop): icons, touch feedback, contrast in both themes, safe areas, the checklist before delivery |

The person's decisions (`design-start/references/decisions.md`, or their brain note) and a named
style of design-styles always win over a default from here.

## Making a page strong

1. Write the value (design-copy). Mark the one line each section must prove.
2. Pick the central object and the decisive moment (`hooks.md`): what the product makes or moves, and the
   one action only the person does.
3. Pick the direction: a named style, or a family and a landing structure from `choosing.md`, set the
   dials, and offer two or three tiles (design-direction) when there is no decision.
4. Place one decisive hook, two or three secondary ones, calm sections between.
5. Build with the rules in `hooks.md` (scroll as a camera, late loading, a still for every scene).
6. Check against `rules.md` by priority, then design-quality and design-accessibility.

## Priorities of a check

| # | Category | Must have | Avoid |
|---|---|---|---|
| 1 | Accessibility | 4.5:1 text, text alternatives, keyboard, names for controls | removed focus rings, icon buttons without names |
| 2 | Touch and interaction | targets 44×44 px, 8 px between, feedback on press and load | hover-only actions, state that changes in 0 ms |
| 3 | Performance | modern images, lazy loading, reserved space (CLS under 0.1) | layout thrashing, shifting content |
| 4 | Style | fits the product's type, one style throughout, SVG icons | mixed styles, emoji as icons |
| 5 | Layout and responsive | mobile first, viewport meta, no horizontal scroll | fixed px containers, blocked zoom |
| 6 | Type and colour | 16 px body, line height 1.5, semantic colour tokens | text under 12 px, grey on grey, raw hex in components |
| 7 | Motion | timing by context, motion that means something, continuity | one duration for everything, animated width and height, no reduced motion |
| 8 | Forms and feedback | visible labels, errors by the field, helper text | placeholder as label, errors only at the top |
| 9 | Navigation | predictable back, at most 5 bottom tabs, deep links | overloaded menus, broken back |
| 10 | Charts and data | legends, tooltips, colour never the only signal | meaning in colour alone |

The rules in `rules.md` and `app-rules.md` come from UI/UX Pro Max (MIT, `LICENSE-ui-ux-pro-max`).
