# XBrain Design

One plugin for designing your own products, from the product's value to code. Built for Claude Code and
Claude Desktop; XBrain offers it in its library as a plugin for the whole system.

Start with the `design-start` skill: it sets the order of work and names the result to keep at each step.

## Skills

| Skill | What it does |
|---|---|
| `brain-design`, `brain-design-build`, `brain-design-comments`, `brain-design-html`, `brain-design-sync`, `brain-design-visual-qa` | Designs kept in the XBrain brain: the canvas, versions, building code from a design, comments, HTML screens, sync with Claude Design, visual QA. Moved here from XBrain's core, so design is a plugin a person installs when they want it |
| `design-start` | The order of work and the result of each step; the person's design decisions in `references/decisions.md` |
| `design-types` | Design types with their sizes, states and checks: site, product page, pricing, docs, app screen, onboarding, email, carousel, ad, cover, store screenshots, deck, video, brand kit, design system |
| `design-styles` | Named styles (canvas-light, the XBrain site's own, and nine more), about thirty named patterns, and a glossary of names and parameters so a design is asked for by name |
| `design-direction` | Reference sites studied live (scroll frames, contact sheets, shared traits), a concept, 2-4 style tiles with the same copy, the person's choice |
| `design-copy` | The product's value from its own data (idea, need, mechanism, proof, alternatives), then plain factual words for designs |
| `design-materials` | A full demo instance with placeholder data, real screenshots at 2x, crops, import into the studio |
| `design-marketing-site` | A marketing site: one central image, chapters, big type, one brand colour, conversion, SEO, speed, accessibility |
| `design-system` | Tokens for dark and light, type pairs with Cyrillic, charts validated for colour blindness, components with states |
| `design-motion` | Motion directed like a film and made with the studio (LocalAI Motion); loops and scroll scenes on a page; gaps become studio tasks |
| `design-quality` | The quality gate before delivery: hierarchy, spacing, type, colour, targets, focus, forms, motion, honesty, speed |
| `design-accessibility` | WCAG 2.2 AA: the audit with xanalyze, what only a person can check, and accessibility while designing |

## Agents

`design-critic` (reviews pictures of a design against the decisions and checklists, read-only) and
`reference-scout` (captures reference sites into contact sheets and names their shared traits).

## Starter designs

`templates/`: a style tile, a landing page in chapters, the canvas-light style (`canvas-light.html`), a product screen with callouts, an Open Graph
image, carousel slides, an email and deck slides. They read only the variables of `templates/_tokens.css`,
so one file recolours them for a product. With XBrain the same set is the design
`Designs/Стартовий набір дизайну`.

## Works with

- **XBrain**: designs live in the brain's `Designs/`; the brain-design skills that work with them are
  part of this plugin. XBrain lists the plugin in its library, where it is installed for all of a
  person's agents (globally) and is never required; the decisions note `Docs/Дизайн/Рішення з дизайну` is the living copy of
  `references/decisions.md`.
- **xbrain-marketing**: positioning, copy, conversion, SEO and platform playbooks.
- **LocalAI Studio** (studio.xformat): motion and video renders.
- **XAnalyze**: the accessibility audit.

## Install

- Claude Code: add this folder (or its GitHub repository) as a plugin marketplace, then install
  `xbrain-design`.
- Claude Desktop: `scripts/build-zip.sh`, then Customize → Plugins → Add → Upload plugin with
  `dist/xbrain-design-<version>.zip`.
