---
name: design-styles
description: A catalogue of named visual styles and page patterns with their parameters, so a design is asked for and built by name («зроби лендінг у стилі canvas-light з патернами story-track і stat-tiles, акцент лавандовий»). Holds the XBrain landing's own style (canvas-light) and nine others, about thirty patterns, and the person's glossary of names and parameters. Use it on «у стилі …», «який стиль», «назви стиль», «стиль як на лендінгу XBrain», «зроби як XBrain», «глосарій», «які є стилі», «які патерни», «з яким параметром», and whenever a request names a style or pattern from references/glossary.md.
---

# Styles and patterns by name

A request names a **style** (the whole visual language), any number of **patterns** (page parts with
their behaviour) and **parameters** (the knobs each one has). Everything is in `references/`:

- `references/styles.md`: the styles, each with its traits, tokens, type, motion, when to use it and
  when not, and an example in code or a template.
- `references/patterns.md`: the patterns, each with what it is, its parameters and their defaults,
  accessibility and motion notes.
- `references/glossary.md`: the person's glossary in Ukrainian: names, parameters, values, example
  requests, and the words for designs kept in the XBrain brain (which phrase starts which brain-design
  skill). Keep it in step with the two files above: a new style or pattern is added to all three.

## How to use a request

1. Read the style named in the request from `styles.md`, then every pattern named, from `patterns.md`.
   A name not in the catalogue: say so and offer the nearest one; never invent a style silently.
2. Fill the parameters: the ones the request gives, the defaults for the rest. Say the full set back in
   one line before building (`canvas-light · accent=lavender · fields=lav,sky,mint,sand · motion=scroll`).
3. The person's decisions (`design-start/references/decisions.md`, or the brain's note) win over a
   style's defaults. A style never overrides accessibility (design-accessibility) or the quality gate.
4. A style is a starting language, not a copy: the product's own value, copy and materials still come
   from design-copy and design-materials, and a sibling product's look is never reused as is (canvas-light
   is XBrain's; for another product change at least the accent, the display face and the central object).
5. When the design is done, note in the task which style, patterns and parameters it uses, so the next
   change asks for the same names.

## Adding a style or a pattern

A style earns its name when it has been built and approved once. Record: its traits (six, as in
design-direction), tokens (light and dark where it has both), type pair with Cyrillic, motion, the
patterns it is made of, parameters with defaults, do and don't, and where its reference build lives.
Add its row to the glossary with an example request.
