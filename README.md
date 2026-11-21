# XBrain Design

A general plugin for strong, varied and effective designs: styles, themes, decisions, the hooks that hold attention and how to build them, from the product's value to code. Built for Claude Code and
Claude Desktop; XBrain offers it in its library as a plugin for the whole system.

This plugin is general design craft a person adds to their agents. The XBrain brain's own design
skills (the canvas, versions, code from a design, comments, sync, visual QA) are part of XBrain's
core since 0.5.0 of this plugin.

Start with the `design-start` skill: it sets the order of work and names the result to keep at each step.

## Skills

| Skill | What it does |
|---|---|
| `design-start` | The order of work and the result of each step; design decisions: the person's own come first; `references/decisions.md` holds worked defaults |
| `design-types` | Design types with their sizes, states and checks: site, product page, pricing, docs, app screen, onboarding, email, carousel, ad, cover, store screenshots, deck, video, brand kit, design system |
| `design-styles` | Named styles (the ecosystem's own: canvas-light of XBrain, studio-cut of studio.xformat, ink-play of Coach, and nine more), about fifty named patterns, and a glossary of names and parameters so a design is asked for by name |
| `design-craft` | The craft: decisions that make a page strong and hooks with how to build them (from the XBrain, studio and Coach sites), choosing a direction by the product's group (style families, landing structures, dials), the UX rules in priority order and an app checklist (rules adapted from UI/UX Pro Max, MIT) |
| `design-direction` | Reference sites studied live (scroll frames, contact sheets, shared traits), a concept, 2-4 style tiles with the same copy, the person's choice |
| `design-copy` | The product's value from its own data (idea, need, mechanism, proof, alternatives), then plain factual words for designs |
| `design-materials` | A full demo instance with placeholder data, real screenshots at 2x, crops, import into the studio |
| `design-marketing-site` | A marketing site: one central image, chapters, big type, one brand colour, conversion, SEO, speed, accessibility |
| `design-system` | Tokens for dark and light, type pairs with Cyrillic, charts validated for colour blindness, components with states |
| `design-motion` | Motion directed like a film and made with the studio (LocalAI Motion); loops and scroll scenes on a page; gaps become studio tasks |
| `design-quality` | The quality gate before delivery: hierarchy, spacing, type, colour, targets, focus, forms, motion, honesty, speed |
| `design-accessibility` | WCAG 2.2 AA: the audit with xaudit, what only a person can check, and accessibility while designing |

## Agents

`design-critic` (reviews pictures of a design against the decisions and checklists, read-only) and
`reference-scout` (captures reference sites into contact sheets and names their shared traits).

## Starter designs

`templates/`: a style tile, a landing page in chapters, the canvas-light style (`canvas-light.html`), a product screen with callouts, an Open Graph
image, carousel slides, an email and deck slides. They read only the variables of `templates/_tokens.css`,
so one file recolours them for a product. With XBrain the same set is the design
`Designs/Стартовий набір дизайну`.

## Works with

- **XBrain**: designs live in the brain's `Designs/`; the skills that work with them (brain-design,
  brain-design-build, -comments, -html, -sync, -visual-qa) are the brain's own and come with XBrain's
  core plugin to every agent, so this plugin carries only general design. XBrain lists the plugin in its library, where it is installed for all of a
  person's agents (globally) and is never required; the decisions note `Docs/Дизайн/Рішення з дизайну` is the living copy of
  `references/decisions.md`.
- **xbrain-marketing**: positioning, copy, conversion, SEO and platform playbooks.
- **LocalAI Studio** (studio.xformat): motion and video renders.
- **XBrain Audit**: the accessibility audit.

## Install

- Claude Code: add this folder (or its GitHub repository) as a plugin marketplace, then install
  `xbrain-design`.
- Codex: `codex plugin marketplace add vlad-demchyk/xbrain-design`, then `codex plugin add
  xbrain-design@xbrain-design`; XBrain's library does both for Claude Code and Codex.
- Claude Desktop: `scripts/build-zip.sh`, then Customize → Plugins → Add → Upload plugin with
  `dist/xbrain-design-<version>.zip`.
