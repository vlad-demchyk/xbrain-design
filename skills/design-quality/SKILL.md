---
name: design-quality
description: Checks a front-end change for visual and UX quality before it is delivered: hierarchy, one primary action, spacing and grouping, typography, colour and contrast, target sizes, focus, forms, motion, honest consent and pricing, speed. Use it while building or reviewing a screen, page, component or landing («зверстай», «зроби екран», «лендінг», «перевір UI», «UX-рев’ю», «чи нормально виглядає»), together with XBrain brain-design-build when a design exists and design-accessibility for the accessibility audit.
---

# UI quality check for front-end work

A short gate between "it renders" and "it is done". Each item has a number or a test, so it is checked, not felt. It does not replace the design (XBrain brain-design-build is the source of truth when a design exists) or the accessibility audit (design-accessibility runs xanalyze). Where the project has a design system or tokens, its values win over the defaults below: check against them.

Run it on the screens the change touches, at a phone width (375-390 px) and a desktop width, in the real app or page, not the source. Report which items were checked and which were not.

## 1. Hierarchy and the primary action

- **Squint test:** blur a screenshot (4-6 px). What stays visible first must be the screen's main content and its main action. If something else wins, the hierarchy is wrong.
- **One primary action per screen or section:** one filled button; the rest secondary (outlined) or tertiary (text). Several equally loud buttons mean no primary.
- **About three levels:** primary, secondary, background (meta, legal). A difference of 1-2 px is not a level: two levels differ in at least two of size, weight, colour.
- **Isolation is scarce:** a highlighted plan, a badge, a red dot work only when few. Highlight with more than colour (size, border, a text badge).

## 2. Grouping and spacing

- Spacing comes from the scale (4/8 steps or the project's tokens), never arbitrary values.
- **Inside a group smaller than between groups,** roughly 1:2-1:3 (a label 4-8 px from its field, 24 px between field groups). Remove borders and dividers in your head: if the groups still read, spacing does the work.
- Things that look alike behave alike: every link one style, every clickable card one treatment. Nothing non-interactive looks clickable.
- Everything aligns to something (a column, a text edge). Stray offsets of a few pixels are defects.

## 3. Typography

- Body text 16 px or more on the web; a modular scale (ratio 1.2-1.333) for headings, from tokens.
- **Line length 45-75 characters** for running text (`max-width: 60-70ch`).
- Line height 1.4-1.6 for body text, and the layout survives the user overriding it (1.4.12: line-height 1.5, paragraph spacing 2em, letter 0.12em, word 0.16em) with nothing clipped: no fixed heights on text boxes.
- Sizes in `rem`, text zooms to 200% without loss (1.4.4).
- **One `h1`,** headings in order without skipped levels: screen-reader users navigate by headings first (71.6% in WebAIM's 2024 survey), and skipped levels are on 41.8% of top home pages (WebAIM Million 2026).
- Lists and items start with the distinguishing word ("Profile, Notifications, Payment", not "Settings for profile, Settings for ..."): people scan the first words.

## 4. Colour and contrast

- Text contrast at least **4.5:1**, large text (24 px, or 18.66 px bold) **3:1**, UI component borders, icons and focus indicators **3:1** (WCAG 2.2 AA). Low-contrast text is the most common defect on the web (83.9% of top home pages, WebAIM Million 2026). Compute it; do not judge by eye. Check hover, disabled and placeholder states and the dark theme too.
- **Never colour alone** (1.4.1): an error is a colour plus an icon plus text; a required field has a text or symbol marker; links inside text are underlined or otherwise distinct.
- Semantic colours keep their meaning (red error or destructive, green success, amber warning). Accent colour is rare (about 10% of the surface), or it stops being an accent.
- Dark theme: dark grey surfaces rather than pure black; higher surfaces lighter.

## 5. Targets, focus and keyboard

- **Pointer targets at least 24×24 CSS px** or spaced so a 24 px circle on each touches no other (2.5.8, AA). Prefer 44×44 pt (Apple) / 48×48 dp (Material) for primary touch actions. Measure CSS-sized icon buttons in devtools: axe's `target-size` is off by default.
- Primary mobile actions sit in thumb reach (bottom of the screen); destructive actions are smaller, farther and confirmed.
- **Focus is visible** on every interactive element and **not hidden** under a sticky header, cookie banner or chat bubble (2.4.11): use `scroll-padding-top` equal to the sticky header.
- Tab order follows the visual order; modals trap focus and return it to the trigger; Esc closes popovers.
- Dragging has a click or tap alternative (2.5.7).

## 6. Forms and controls

- Every field has a visible label (not placeholder only) and the right `type`, `inputmode` and `autocomplete` token (`email`, `tel`, `given-name`, `street-address`, `cc-number`, `one-time-code` for SMS codes).
- Errors: next to the field, in text that says how to fix it, announced (`aria-describedby`, a live region for summaries), never colour alone.
- Do not ask again for what the user entered earlier in the same flow (3.3.7); sign-in allows paste and password managers and has no puzzles (3.3.8).
- **A toggle switch acts immediately.** If the change applies only after "Save", use a checkbox or radio buttons instead (NN/g).
- Do not make people remember things across screens: show the code next to the field, carry values forward, chunk long numbers (card in groups of 4).
- Long option lists are ordered (alphabet, groups) or searchable; rare options go behind "Advanced"; a sensible default is preselected when it serves the user.

## 7. Motion

- Every non-essential animation respects `prefers-reduced-motion: reduce`.
- Nothing flashes more than three times a second (2.3.1).
- Motion explains a change (where something came from or went); it does not decorate the wait.

## 8. Honest by design: no dark patterns

The EU Digital Services Act (art. 25) forbids online platforms interfaces that deceive or manipulate users; consent falls under GDPR and pricing under consumer law. An ICPEN/GPEN sweep (2024) found possible dark patterns on about 76% of 642 subscription sites and apps. So:

- **Cookie and consent banners:** "Reject" is on the first layer and as prominent as "Accept" (same size, weight and contrast); no consent box is pre-ticked; closing the banner is not consent.
- **No confirmshaming** ("No, I don't want to save money") and no fake urgency (countdowns that reset, "only 2 left" without data).
- **Cancelling is as easy as signing up;** auto-renewal is stated before payment and can be switched off.
- **Discounts are honest:** in the EU the crossed-out "before" price must be the lowest price of at least the 30 days before the reduction (Directive 98/6/EC art. 6a, added by Omnibus 2019/2161).
- Defaults are what is good for the user, not for the metric.

## 9. Conventions and the user's mental model

- Follow the platform and the web's conventions unless the gain is large: logo top-left links home, cart and account top-right, search with a magnifier, bottom tab bar on mobile, underlined links.
- Inside the product the same thing looks and sits the same everywhere.
- A change that breaks a habit ships with an explanation and a way back, not overnight.

## 10. Landing pages

- The hero says the benefit, has one primary action and shows the product; about 57% of viewing time is on the first screen and 74% on the first two (NN/g 2018), so the value is up top, and people do scroll.
- Usual order: hero, social proof, problem and benefits, how it works, testimonials, pricing (recommended plan highlighted), FAQ and objections, final call to action.
- State the value within about 10 seconds: many visitors leave within 10-20 s (NN/g).

## 11. Speed

- Core Web Vitals "good" at the 75th percentile: **LCP ≤ 2.5 s, INP ≤ 200 ms, CLS ≤ 0.1**. Reserve space for images and embeds (`width`/`height` or `aspect-ratio`), so nothing jumps.

## Reporting

In the person's language: what was checked, at which widths, with what tool (devtools, xanalyze, a contrast calculation), what was found and fixed, and what was not checked. A passed gate is not an accessibility conformance claim; run design-accessibility for that.
