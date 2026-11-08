---
name: design-materials
description: Makes the real materials a design shows: a full demo instance of the product filled with placeholder data, screenshots of the real interface at 2x in both themes, crops of the panels a story needs, and their import into the studio for motion. Use it on «знімки продукту», «скріни інтерфейсу», «заповни демо-даними», «матеріали для сайту», «продукт порожній на скрінах», «потрібні справжні екрани», and before designing anything that shows the product.
---

# Real materials

## A full demo instance

- Run a **separate** instance of the product with its own data folder, port and settings. Never point it
  at the person's live data, and never stop or reset the person's own running instance.
- Fill it through the product's own API or tools, as a real team would: several projects, people and
  agents (or users), items in every state, history spread over two or three weeks, comments,
  reports, attachments. Placeholder names of a believable small team; no client names, no real people.
- Where the API cannot set something (dates in the past, who did what), adjust the demo database
  directly, in the demo instance only, with the daemon stopped.
- Keep the seeding script with the materials so the instance can be rebuilt after the product changes.

## Screenshots

- The real interface at device scale 2, at 1440×900 and the phone width, in the theme the design uses
  (both when the design has both). A list that is cut off needs a taller viewport, not a crop that
  hides it.
- Before a screenshot: the language of the page, demo names visible, no personal data, no debug badges.
- Crop the panels a story needs (a team list, a task, a question, a report) at their own bounds, from
  the 2x picture, JPEG or WebP about 80 quality; keep the full frames too.
- Old screenshots and anything showing another person's or a client's data never go on a page.

## For motion

- Copy the pictures into a folder inside the home folder and import it into the studio
  (`localai_import_media`); crops become panels that lift off the window (design-motion).
- Render drafts first and look at frames at rest and in the middle of moves before a final render.

## Name and keep

Materials live in one folder per product (for example `~/Downloads/<product>-site-materials/`) with the
demo seeding script, a list of what each file shows, and the date. Tell the person where it is.
