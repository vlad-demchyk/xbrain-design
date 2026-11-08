---
name: design-direction
description: Finds the visual direction with the person instead of guessing: studies their reference sites live (scroll frames, contact sheets, shared traits), proposes a concept and 2-4 style tiles with the same copy, and records the choice. Use it on «ось референси», «зроби як на цих сайтах», «дизайн не подобається», «не той вигляд», «запропонуй варіанти», «який стиль», «зроби кілька напрямів», and whenever a design was rejected.
---

# Finding the direction

## 1. Study the references live

- Open each reference in a real browser at 1440×900, wait for it to settle, and capture 12-16 frames
  while scrolling (6 wheel steps of about 130 px, 0.7 s pause each). A full-page screenshot misses
  WebGL and pinned scenes; frames do not. Put the frames of one site on one contact sheet.
- A site that refuses automated browsers (403, a bot check) is not worked around: ask the person to
  open it in their browser, or for screenshots.
- Name the traits the references share, each with an example from them:
  1. the central object or image (a card, a block, a drawing, a product on a pedestal);
  2. how the story is told (chapters, one idea per screen, a pinned product that changes);
  3. type (display size and case, the small mono beside it);
  4. palette (one brand colour, monochrome, paper);
  5. motion (scroll-driven scenes, what transforms into what);
  6. how the product itself is shown (device, window, isometric drawing, none).
- Write them into a references note and say them to the person in a few lines. Ask what they like in a
  reference only when the traits disagree.

## 2. A concept before pixels

One sentence that turns the product's value (design-copy) into an image and a story, for
example: «a task card that people, managers and agents assemble while you scroll; it arrives done with
its reports, reaches the check, and a big hand clicks it closed». The person's figurative words feed
the image, never the copy.

## 3. Style tiles

- 2-4 directions, each one HTML screen: the header, the hero and one content block with real
  material. **The same factual copy in all of them**, so only layout, type, colour and the way
  material is presented differ.
- Directions must differ for real (dark and light, grotesk and serif, diagram and product shot), and
  none may look like a sibling product of the ecosystem.
- Fonts with Cyrillic: Geist, Onest, Manrope, Unbounded, Inter Tight, Playfair Display, Lora, IBM Plex
  Mono, JetBrains Mono (fontsource packages, embedded in the file).
- Put them side by side (with XBrain: one design, a page per direction, `design_put` with `page`
  and `page_title`), look at each picture, then ask the person to pick, with «none» as an option.
- Record the choice and why in the task and, when it is a lasting decision, in
  the decisions (`design-start/references/decisions.md`, or the brain note `Docs/Дизайн/Рішення з дизайну`).

## When the person says «none»

Stop and wait for their references or words. Do not produce a fourth guess on your own.
