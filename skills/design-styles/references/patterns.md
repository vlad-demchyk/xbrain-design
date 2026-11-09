# Patterns

Page parts by name, each with its parameters (defaults in brackets). Every pattern keeps the rules of
design-accessibility: one h1 per page, headings in order, text alternatives where meaning lives, focus
visible, 4.5:1 text, motion that stops (WCAG 2.2.2) and a reduced-motion version.

## Heroes

- **window-drawing**: the product's window drawn as a blueprint (lines that draw themselves, a scan line,
  a crosshair) with the promise beside it. Params: `scan` (on), `crosshair` (on), `image` (the window).
  One labelled picture (role img + name).
- **object-hero**: one product object large in the centre, the promise above, two actions below.
  Params: `object`, `tilt` (6deg), `actions` (2).
- **statement-hero**: one giant sentence, no image, an accent word. Params: `accent-word`, `case` (upper).
- **split-hero**: text left, product right; the plain default. Params: `ratio` (5/7).

## Story and scenes

- **story-track**: a tall track with a pinned stage; one damped progress value `--p` runs 0..stages while
  the track scrolls; pieces read `--p` in their transforms. Params: `stages` (7), `damp` (0.11),
  `height` (100svh per stage). Told also as a hidden ordered list for screen readers; the stage is
  aria-hidden.
- **assembly-card**: inside a story-track, an object (a card) whose parts fly in from around the screen
  and dock, one stage at a time. Params: `parts` (with start stage and offset each), `object`.
- **weak-spots**: a panel beside the scene where problems close one by one as stages pass. Params:
  `items`, `close-at` (stage per item).
- **action-feed**: a feed of who did what, growing with the stages. Params: `max` (5).
- **particle-object**: an object of light particles (three.js, lazily loaded) for the decisive moment,
  taken from a reference picture (particles laid under it) or a model; it gathers, floats, acts, scatters.
  Params: `source` (picture/model), `count` (180000), `size`, `act` (grip-and-carry). Without WebGL the
  scene works without it.
- **colour-fields**: each chapter on its own colour field, the field of the pinned scene changing per
  stage. Params: `fields` (list), `transition` (0.9s).
- **corner-labels**: the chapter's name in the top-left corner, its number in the top-right, mono.
  Params: `left`, `right`. aria-hidden; the heading carries the meaning.

## Content blocks

- **giant-statement**: a very large uppercase heading whose words light up as the chapter scrolls by.
  Params: `light-up` (on), `align` (left/centre).
- **receding-list** (recede): rows that come to the centre one after another from alternating sides,
  each with a key, a title, a cross-link and a text. Params: `ladder` (on), `step` (0.055).
- **stat-tiles**: three measured numbers on coloured tiles that count up, with a note and a method under
  them. Params: `tiles` (3), `count-up` (on), `method` (details). Numbers only from real measurements.
- **layer-stack**: alternatives as separate layers that fold into one block (the product). Params:
  `layers` (5), `fold` (on scroll).
- **compare-table**: three ways of working side by side, the product's column highlighted. Params:
  `columns` (3), `highlight` (last).
- **feature-grid**: titled features in a grid of 2-4 columns. Params: `columns` (4), `icons` (off).
- **board-drawing**: a kanban board drawn with the product's own components (columns by state, cards
  with id, title and assignee avatar, people round, agents square), inside a canvas-frame. Params:
  `columns`, `cards`. aria-hidden, told in the text under it.
- **bars-drawing**: stacked bars per person or agent (closed, testing, returned), with a hidden table.
  Params: `rows`, `legend`, `note` (say when the data is an example).
- **faq**: questions as details/summary, one open at a time. Params: `items`.
- **access-form**: one email field, consent line, inline errors with what to fix. Params: `endpoint`,
  `subject`.
- **logo-strip**, **testimonial-wall**, **pricing-table**, **timeline**, **bento-grid**,
  **before-after**: the common patterns, named so they can be asked for; each follows design-types for
  its sizes and states.

## Chrome and navigation

- **floating-header**: a header bar that floats with a gap from the edges, translucent. Params:
  `width` (62rem).
- **floating-cta**: one call to action that floats at the bottom after the hero. Params: `after`
  (hero), `label`.
- **canvas-frame**: an element shown as a selected layer on a design canvas: the layer's name above,
  a 1.5px frame with eight square handles, its real measured size in a badge below, a pink spacing measure
  to its container's edge, a red smart guide on hover. Params: `name`, `measure` (off), `guide` (hover).
  Decorative: aria-hidden.
- **scroll-rail**: the page's own wide scroll rail (3rem) on wide screens: the track is the canvas with its
  dot grid, the visible part is a selected frame with handles and a percent badge, chapters are numbered
  comment pins, stages are square handles in their state colour, names show in the canvas badge near the
  reader and on hover/focus. Params: `marks` (chapters + stages), `badge` (percent), `logo` (on).
  Buttons with names; wheel, keys and touch scroll as always.
- **outline-wordmark**: the brand name in very large outlined letters that fill in under the pointer,
  inside a canvas-frame. Params: `fill-on-hover` (on).
- **under-the-hood**: a mono line under each stage naming the skills, hooks and tools that do it.
  Params: `prefix` («Під капотом:»), `wide-only` (on).
