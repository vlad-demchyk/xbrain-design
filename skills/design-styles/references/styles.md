# Styles

Each style: what it is, the six traits (central object, story, type, palette, motion, how the product is
shown), tokens, parameters with defaults, use and avoid. Names are lowercase keys used in requests.

---

## canvas-light (Робоче полотно)

The style of the XBrain site (brain.xformat.net, `apps/brain` in the XFormat repository), approved by
the person on 2026-11-09. A light product page that looks like the product's own window and its design
canvas: wide, told in large colour fields, very large type, and one object in the middle that the story
assembles.

- **Central object:** one product object (a task card) in the middle of a pinned scene, assembled piece by
  piece while the reader scrolls; around it the app's screens, panels and a feed.
- **Story:** chapters on colour fields, each with labels in its corners (`Розділ 02` right,
  the chapter's name left); one pinned scroll scene of 6-7 stages in the middle of the page.
- **Type:** a grotesk display in uppercase, very large and tight (Inter Tight 650, -0.035em,
  clamp(2.5rem, 1rem + 5.4vw, 7.5rem)); the text in the same family; small mono labels (IBM Plex Mono 500,
  0.75rem, uppercase, letter-spacing 0.06em); inside drawn UI, the product's own face (Geist).
- **Palette:** the product window's light theme: page #fbfbfe, cards white, primary button black, one
  lavender accent (#5f57b3 text, #655cbd fill); chapter fields are light tints of the palette (lavender
  #e9e7fb, sky #e1eff8, mint #dcf3e8, sand #fbeedb, rose #fbe6e7), one field in the accent fill for the
  key stage, one in ink #141416 for contrast.
- **Motion:** scroll as a camera: one damped progress value per scene (`--p`), every part reads it in
  transform and opacity; pieces fly in and dock; a particle object (a hand of light) for the decisive
  moment; reduced motion turns everything into crossfades.
- **Product shown as:** the product's real screens behind the scene, a drawing of the window in the hero,
  and the attributes of its design canvas as the page's own chrome: a selected frame with eight square
  handles and a size badge, a pink spacing measure, a red smart guide, comment pins, the dot grid.

Tokens (light only): `--page #fbfbfe; --card #fff; --muted #f0f1fa; --text #141416; --text-2 #5c5d72;
--border #e5e6f0; --acc #5f57b3; --acc-fill #655cbd; --btn #000; --sel #5f57b3; --space #c0307a;
--guide #e5401a; --canvas-dot #cfd1e2`. Radii 0.625 / 0.875 / 1.25rem. Wide container 100rem.

Parameters:

| Parameter | Values | Default |
|---|---|---|
| `accent` | any hue with 4.5:1 text on white | lavender #5f57b3 |
| `fields` | a list of tints for the chapters, in order | lav, sky, mint, sand, rose |
| `key-field` | the field of the decisive stage | accent fill |
| `display` | a grotesk with Cyrillic, uppercase | Inter Tight 650 |
| `mono` | a mono with Cyrillic for labels | IBM Plex Mono |
| `object` | what the central scene assembles | a task card |
| `stages` | number of stages in the pinned scene | 7 |
| `canvas-chrome` | on / off: frames, handles, measures, pins as page chrome | on |
| `particle-object` | none / hand / custom: the light object of the decisive stage | hand |
| `motion` | scroll / calm / none | scroll |

Use for: a product that is itself a tool with a window (apps, studios, dashboards), a page that must
explain a process in stages. Avoid for: editorial content, very small products with one feature, brands
that must feel dark or luxurious.

Reference build: `apps/brain/src` (HomePage, Ecosystem, Chapters, ScrollRail, CanvasFrame, StoryPage,
styles/site.css, story.css, tokens.css). Template: `templates/canvas-light.html`.

---

## paper-editorial (Папір)

Long reading on warm paper. Central object: a headline and a pull quote, no device. Story: an essay in
sections with numbered side notes. Type: a serif display with Cyrillic (Playfair Display or Lora 600),
a calm grotesk for UI, old-style numbers. Palette: paper #f7f3ea, ink #1d1b16, one deep accent (oxblood
#7a2430). Motion: almost none, a reading progress line. Product shown as: annotated screenshots in
frames with captions. Parameters: `paper` (warm, cool, white), `accent`, `columns` (1, 2 with notes),
`dropcap` (on/off). Use for: thought leadership, documentation landings, a founder's letter.

## dark-console (Консоль)

A developer tool at night. Central object: a terminal or code block that types itself. Story: one command
per section, output as proof. Type: mono display (JetBrains Mono 700) with a grotesk for text. Palette:
#0d0f12 background, #e6e6e6 text, one signal colour (green #3ddc84 or amber #ffb020), glow at 8%.
Motion: typing, cursor blink (reduced motion: shown complete). Product shown as: real CLI sessions.
Parameters: `signal`, `scanlines` (on/off), `typing-speed`. Use for: CLIs, APIs, agents. Avoid for a
non-technical audience.

## swiss-grid (Сітка)

Strict modernist grid. Central object: a big number or a single word set on the grid. Story: modules on
a 12-column grid, rules between them. Type: one neo-grotesk (Inter, Manrope) in two weights, flush left,
big size contrast. Palette: white, black, one red (#e4002b) or blue. Motion: modules slide in on the grid
lines. Product shown as: flat UI crops aligned to the grid. Parameters: `columns` (12/8/6), `accent`,
`rules` (on/off). Use for: B2B, finance, architecture, anything that must look exact.

## soft-gradient (М'який градієнт)

Friendly SaaS. Central object: a floating product card on a soft mesh gradient. Story: hero, logos,
feature trio, testimonial, pricing. Type: Manrope or Onest, sentence case, rounded. Palette: white with a
pastel mesh (two or three hues), accent from the mesh. Motion: gentle float and parallax of cards. Product
shown as: cards and glassy panels. Parameters: `mesh` (hues), `glass` (on/off), `radius` (lg/xl).
Use for: consumer apps, early SaaS. Avoid when the product needs gravity or density.

## brutal-mono (Брутал)

Raw and loud. Central object: oversized type that breaks the grid. Story: blocks with thick borders,
no shadows, visible structure. Type: Unbounded or Space Grotesk in caps, mono labels. Palette: black,
white and one acid colour (#d4ff00). Motion: hard cuts, marquee lines. Product shown as: screenshots with
thick frames and offsets. Parameters: `acid`, `border` (2/4px), `marquee` (on/off). Use for: creative
tools, launches that must stand out. Avoid for regulated or enterprise products.

## product-pedestal (П'єдестал)

The product as an object in a dark room. Central object: one device or window on a soft-lit pedestal,
turning with scroll. Story: one feature per screen while the object changes. Type: a light grotesk, large
sentence case, generous spacing. Palette: near-black gradient, white text, highlights from the product
itself. Motion: cinematic scroll, the object rotates and zooms (reduced motion: a still per chapter).
Parameters: `room` (dark/light), `object` (device/window/box), `turn` (degrees per chapter).
Use for: hardware, premium apps, launches.

## playful-blocks (Кубики)

Bright and warm. Central object: an illustration or mascot built from simple shapes. Story: colourful
blocks per benefit, rounded, with stickers. Type: Unbounded or Onest bold, rounded corners everywhere.
Palette: 4-5 saturated hues on cream, black text. Motion: bouncy springs on hover and entry. Product
shown as: phone frames tilted on blocks. Parameters: `palette` (list of hues), `shapes` (circle, blob,
star), `bounce` (0-1). Use for: education, kids, communities, consumer apps.

## data-dense (Щільні дані)

For analysts and operators. Central object: a live dashboard with real numbers. Story: metric by metric,
each with its chart and a sentence on what it means. Type: Inter or IBM Plex Sans with tabular figures,
Plex Mono for numbers. Palette: light grey #f5f6f8 with chart series validated for colour blindness
(dataviz). Motion: numbers count up once, charts draw in. Product shown as: real charts with tables for
screen readers. Parameters: `series` (palette), `density` (compact/regular), `theme` (light/dark).
Use for: analytics, monitoring, finance.

## cinematic-scroll (Кіно)

A film driven by scroll. Central object: a 3D scene or a pinned stage the camera travels through.
Story: 4-8 shots, each one idea, captions in the corners. Type: very large display, minimal text.
Palette: chosen per film, usually dark with one light source. Motion: camera moves, parallax, particles,
shot transitions without crossfade (design-motion). Product shown as: the interface as layers in 3D.
Parameters: `shots`, `camera` (dolly/orbit/crane), `particles` (on/off), `palette`. Use for: launches,
showcases. Avoid as the only page of a product people must understand quickly.
