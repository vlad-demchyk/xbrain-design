# How the ecosystem's sites are built

Three sites whose styles are in `styles.md`: how each is made, what matters in it, and the traps
already met. Read the section of the style you build, then its reference code; these notes say why the
code is the way it is. All three: Vite + React + TypeScript in the XFormat monorepo (`apps/<name>`),
each on its own port with `strictPort`, deployed only from `main`.

Common to all three:

- **Tokens are the only values.** Colours, sizes, radii and fonts live in `styles/tokens.css`; stylelint
  (`declaration-strict-value`, no px for radius or gap) refuses a raw value anywhere else. A new colour
  is a token first.
- **Texts are data, not markup.** Typed content files (`content/*.ts`) or i18n JSON; components read
  them. Tests check that every language has every key and that no code name leaks into the text.
- **Motion is transform and opacity only,** driven by one damped value per scene, never by raw scroll;
  the frame loop runs only while something moves. Reduced motion (and a motion switch where there is
  one) turns every scene into a still or a crossfade, never a broken layout.
- **A drawing of the product is a picture:** `aria-hidden`, with the same facts told in text (a hidden
  list of stages, a table under a chart). One h1 per page, headings in order.
- **The first bundle stays small:** heavy parts (three.js, a translation, a motion runtime) load with
  `import()` when they are near; the repository's `check:eager-graph` guards it.
- **Check at 1440, 390 and 360** with screenshots, before and after, and a test that keeps each fixed
  defect from coming back.

---

## canvas-light: the XBrain site (`apps/brain`)

**Map.** `pages/HomePage.tsx` (Hero, ProblemChapter, Ecosystem, NumbersChapter, AlternativesChapter,
Faq, AccessForm, FloatingCta, ScrollRail); `components/home/Ecosystem.tsx` the pinned scene;
`hooks/scene.ts` scroll as a camera; `components/home/handScene.ts` + `LiveHand.tsx` the particle hand;
`components/CanvasFrame.tsx` the selected-layer frame; `components/StoryPage.tsx` the inner pages in the
same design; `content/site.ts`, `content/stories.ts`, `content/translations/<lang>.json`,
`content/translate.ts`; `styles/tokens.css`, `site.css`, `story.css`.

**How the scene works.** The track is 7 screens tall (`height: 700svh`), its stage is `position:
sticky`. `useScene(track, { mode: "track", span: 7 })` writes one damped value `--p` (0..7) into the
track's style every frame while it is near; every piece reads `--p` in its own `transform` through
`clamp()` and `calc()` (a piece starts at `--s`, lasts `--d`). React re-renders only for the stage
number, rounded, never per frame. The card's carry to «Closed» is CSS (`--g` with smootherstep over
0.5 of a stage, so it is slow and soft); the hand follows the card's real rect each frame.

**The particle hand.** `scripts/hand-points.mjs <reference.png>` lays particles under the hand of the
chosen reference picture (density and brightness from the picture, the card and the column lines
painted out, holes inside the silhouette filled, soft fades instead of cuts) and writes
`public/models/hand-points.bin`; the picture never ships. `handScene.ts` loads the points with a version
in the URL (browsers cache the old file otherwise), gives the forearm a little depth, gathers the
particles as the hand arrives (`aScatter`), floats them, and at the grip turns the fingers and the thumb
around their pivots with a weight that fades in smoothly over the area (part boundaries would tear the
form). The canvas covers the whole stage, so no canvas edge cuts the arm. Without WebGL the card is
approved without the hand.

**Chrome.** The scroll rail and the footer's wordmark use the design canvas's attributes
(`CanvasFrame`: name, 8 handles, measured size badge, pink spacing measure, red guide). Tokens `--sel`,
`--space`, `--guide`, `--canvas-dot`.

**Languages.** uk and en are typed objects; it, de, fr, es, pl are flat JSON by key, loaded only when
chosen and laid over English (`translate.ts`); `npm run translations` keeps the files in step. Legal
pages stay English until a lawyer checks a translation.

**Traps met.**
- A white particle over a white card disappears; fingers that seem to go behind the card read as wrong.
  Keep the pinch at the card's edge; a faint halo (`filter: drop-shadow`) keeps them legible.
- `new Float32BufferAttribute(array)` copies the array: CPU-updated positions never reach the GPU; use
  `BufferAttribute`.
- A translucent particle form reads as its own mirror (a left hand as a right one). Fade the far side or
  take the form from a picture with the right angle.
- Strong perspective on a near forearm breaks the silhouette; keep depth small.
- An `sr-only` table still widens the page on a phone: wrap it in an `sr-only` div.

Checks: `npm test` (also with `--sequence.shuffle`), `npm run lint`, `npm run typecheck`,
`npm run build`, `check:eager-graph`.

---

## studio-cut: the studio site (`apps/studio`)

**Map.** Routes in `App.tsx` (`/`, `/guide`, `/templates`, `/faq`, `/download`); short UI words in
`i18n/uk.json`, `en.json`, long texts in `content/uk.ts`, `en.ts`; the catalogue
(`data/catalogue.json`, `motion-templates.json`) generated from the LocalAI Studio repository by
`npm run catalogue -- <path>`, which turns codes into words and fails on an unknown code; media in
`public/media/` with a registry of sizes and descriptions (`data/media.ts`); demo slots
(`data/demos.ts`) that show «demo soon» until a clip is added; links and endpoints in `config.ts` from
`VITE_*` variables, no secrets.

**How it moves.**
- `hooks/useScrollScenes.ts`: every `[data-scroll]` element gets two damped properties, `--p` (through
  the viewport) and `--exit` (scrolled out past the top). The loop runs only while something moves
  and stops when every scene has landed.
- **Measure the node's parent, not the node:** the node moves with `--p`, and measuring it feeds the
  output back into the input; the scene hunts and jumps.
- **Land exactly:** ease toward the target, and once close, set it; a value that stops a hair short
  leaves the scene tilted and soft.
- `motion/runtime.js` is the studio's own motion engine, carried over as a factory with its own scene;
  `MotionPlayer` plays real openers, finals, transitions and titles, started in view.
- Karaoke subtitles follow the studio's editing rules (`motion/karaoke.ts`).
- A header switch and the system's reduced motion stop everything (`html[data-motion="off"]`).

**What matters.** The site and the app read as one product: the same palette, radii (3-8 px, nothing is
a pill) and the serif display. Each film type's zone takes its template's look through `--zone-*`
variables. Competitors are never named (a test reads every text). When the studio's engine changes,
carry the change to the site's copy.

Checks: `npm test` (routes, accessible names, dictionaries, catalogue without codes, the releases
feed), `npm run lint`, `npm run typecheck`, `npm run build`.

---

## ink-play: the Coach site (`apps/coach`)

**Map.** `pages/LandingPage.tsx` (hero scene, roles, ease steps, features, live board, film, real
use, FAQ, CTA); `film/CoachFilm.tsx` + `film/scenes.tsx` + `film/film.css` the animated film;
`styles/tokens.css` (ink, lime, coral, violet, the quest worlds), `styles/app.css`.

**How it moves.**
- `CoachFilm` is a film drawn in HTML and CSS instead of a video: each scene is a caption, the words that
  carry its meaning, and a stage that is decoration only.
- A scene lasts as long as its progress bar's CSS animation; the bar's `animationend` turns to the next,
  so pausing the bar pauses the film and its clock at once.
- It plays by itself only while in view (IntersectionObserver, 0.4), in a visible tab, and never with
  reduced motion; then it waits on the first scene and the person steps through.
- Pause, back, next and the scene buttons are always there (WCAG 2.2.2).
- Short CSS keyframes (a ping, a ring, a page-out) each have a reduced-motion rule.

**What matters.** Contrast is designed, not assumed:
- The brand coral reads 2.9:1 on white, so text uses `--coral-text` (#d4451a, 4.5:1).
- The focus ring is indigo on the light page and lime on ink cards (WCAG 1.4.11).
- In the dark theme ink becomes the page, and an «ink card» becomes an ordinary card.

Hard shadows are offset, not blurred; borders are ink. The teacher's cursor is coral, the student's
violet, everywhere. Children's screens take a quest world's sky, ground and path. Coach's look is its
own: never borrow a sibling product's palette.

Checks: `npm test`, `npm run lint` (the same token rules as the landing), `npm run typecheck`,
`npm run build`.
