# Strong decisions and hooks

What made the ecosystem's sites (XBrain, studio.xformat, Coach) work, written so it can be used for
any product. A **decision** is a choice that shapes the whole page. A **hook** is a moment that holds
attention and carries one fact. A hook without a fact is decoration; cut it.

## Decisions that shape the page

1. **The value before the look.** Before any pixel, write what the product does, why it is needed,
   how it works and why it beats the alternatives, from the product's own data. Every section later
   proves one line of it. A page of features without the value fails, however it looks.
2. **One central object.** Choose the one thing the product makes or moves (a task card, a film, a
   lesson) and let the page tell its life. People remember an object, not a list.
3. **The product's own language is the page's language.** Take the palette, radii, type and chrome
   from the product's window so site and app read as one (canvas-light, studio-cut). For a product
   with no window, invent a language and keep it apart from sibling products (ink-play).
4. **One thought per screen.** Chapters, each with its colour field, a giant statement and a short
   lead. A reader who scrolls fast still gets the story from the headings alone.
5. **Real material only.** Screens from the real product filled with a full demo data set, at 2x.
   Measured numbers with date, sample and method. No mockup words, no invented logos.
6. **Plain facts in the copy.** The person's metaphors explain the idea to you; the page says what the
   product does in plain words. The accent part of a headline is the fact that matters.
7. **Inner pages in the home page's design.** The same grid, sizes and chapter kinds; never a
   separate template that looks like another site.
8. **Ask by name, keep by name.** Style, patterns and parameters are named in the task, so the next
   change asks for the same.

## Hooks, and how to build each

| Hook | What it holds | How to build | Where it was used |
|---|---|---|---|
| **The assembled object** | the product's process, stage by stage | a pinned track several screens tall; one damped progress value; each part flies in at its stage and docks; a hidden ordered list tells the same | XBrain: the task card built from plan, steps, commits, report |
| **The decisive moment** | the one action only the person does | one striking effect at one stage only (a particle hand that grips and carries the card to «Closed»); slow, smooth, and the result stays | XBrain: approval |
| **The product's chrome as decoration** | «this is made with the product» | the product's own UI attributes as page chrome: a selected frame with handles and a measured size, spacing measures, guides, comment pins, a dot grid | XBrain: the scroll rail and the footer's wordmark |
| **Problems that close** | the before and after, in one view | a panel of weak spots beside the scene; each closes when its stage passes | XBrain |
| **Under the hood** | credibility for technical readers | a small mono line under each stage naming the real mechanism (skills, hooks, commands) | XBrain |
| **The typed request** | how little the person has to do | the app window as the hero: a request is typed, a button pressed, a monitor fills stage by stage | studio: the director window |
| **The real engine in the page** | the output is real | the product's own runtime plays its templates inside the page, started in view, paused out of it | studio: motion templates |
| **Zones in their own look** | range of what it makes | each output type's section takes the look of its own template | studio: film types |
| **The live board** | collaboration, roles | two named cursors in their colours writing at once | Coach |
| **The film in HTML** | the whole product in a minute | scenes drawn in HTML and CSS, a caption with the words that matter, controls always there, stills with reduced motion | Coach |
| **Three measured numbers** | proof | three tiles that count up, each with source and «how we measured» | XBrain |
| **The giant statement** | the chapter's one thought | very large uppercase heading whose words light up as it scrolls by | XBrain |

A page has one decisive moment, two or three secondary hooks, and calm sections between them.
Hooks in every section become noise.

## How to build them well

- **Scroll as a camera.** One damped value per scene drives every part through transform and opacity;
  never raw scroll, never layout properties. Measure the scene's parent, not the moving node. Land
  exactly on the target.
- **Heavy parts load late.** three.js, a motion runtime or a translation load with `import()` when they
  are near; the first bundle stays small.
- **A particle object from a picture.** Lay the particles under the object in an approved reference
  picture (the right angle, the right hand), then remove the picture. One form: no seams, no holes,
  no tearing at part boundaries; a halo keeps light particles legible over white.
- **Everything has a still.** Reduced motion turns each scene into a still or a crossfade; motion that
  runs longer than five seconds has a pause.
- **Pictures are aria-hidden, facts are text.** A drawing of the product tells the same facts in a hidden
  list or table; one h1, headings in order.
- **Check at 1440, 390 and 360** with before and after pictures, and a test that keeps each fixed
  defect from coming back.

## What weakened designs

- A collage of screenshot cards instead of an image and a story.
- Cards with a coloured stripe on the left and other generated-UI patterns.
- A dark page with one indigo colour and «text left, card right» on every section (the rejected type).
- Too many numbers and comparison tables on the home page.
- A 3D object whose angle or handedness is wrong: people notice at once. Take it from a picture.
- An effect that changes colour or hides parts behind other parts when the simple action (grip and
  carry) says it better.
