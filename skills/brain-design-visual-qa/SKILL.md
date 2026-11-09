---
name: brain-design-visual-qa
description: "Checks a brain design by looking at it: exports its pages, renders each to a picture with a headless browser, reviews layout defects, the logic of roles and modes, duplicates and gaps, then fixes many pages at once as one new version. Use it on «перевір дизайн», «що не так з екранами», «доопрацюй дизайн», «онови багато екранів», «покращ UI і UX», before reporting a design as done, and before planning tasks from a design."
---

# Visual check of a brain design

A design is judged by how its screens look and whether their logic holds, not by their markup.

## 1. Export once, work on files

- `brain designs export <design> --to <folder>` writes one board file per page and `canvas.json`
  (titles, order, positions). Never paste a page's HTML into your context.

## 2. Render

- `design_snapshot` draws a page, a frame or a layer (`node`) as the canvas does, at its own size,
  at another `width` or in a `state` (`screen:empty`; `hover` of an `element`), and answers a PNG
  `file` to open: start with it. A Mac draws it with its own WebKit, other machines with Chrome or
  Edge; when it says nothing can draw, render the exported files yourself:
- A headless browser at each page's real width (390, 768, 1280, or the editor's full width), for
  example `<chrome> --headless=new --hide-scrollbars --screenshot=<png> --window-size=<w>,<h>
  file://<page>`, then scale the picture down to read it.
- Look at every page you change and at a sample of the rest.

## 3. What to look for

| Area | Defect |
|---|---|
| Layout | overlapping labels, cut-off panels, content under fixed panels, cramped tables, previews in the wrong proportion |
| Roles | a persona that sees what its role cannot open |
| Modes | one object edited in unrelated places; a mode switch outside the shell; a fullscreen editor still showing the app's chrome |
| Logic | the screen's main action missing, duplicate breadcrumbs, one action twice in a header |
| Coverage | tasks with no screen and screens with no task (`design_link`) |
| Canon | screens that contradict the project's decisions (palette, language, names) |
| Lint | what `design_lint` finds on the native layers: unnamed frames and shapes, text under 4.5:1 (3:1 large), gaps a few units apart, colours off the design's tokens; fix each by its node with `design_patch` |

## 4. Many pages as one version

- Build changed pages from the shell of an existing one (its tokens, icons, navigation) and swap
  only the content; a global fix (navigation items, a persona, a removed duplicate) is a script over
  every page.
- Put the results into the exported folder, keeping each board file's wrapper; update titles and
  positions in `canvas.json`; run `brain designs import <folder> --dry-run`, then the import: one
  new version, with the history and the comments kept.
- Render again and look before reporting.

## 5. Report

- What changed on each page, what was added, which decisions are the person's. Link pages to their
  tasks; a page is marked built only after a live check of the product.
