---
name: brain-design-build
description: "Builds product code from a design kept in the XBrain brain, and checks code against it: finds the design of the project or task in Designs/, reads the page, its states, tokens and widths, links the task to the pages it builds and marks each page done with its commit. Use it on «зроби за дизайном», «зроби як у дизайні», «як у макеті», «по макету», «звір з дизайном», «перевір з макетом», «порівняй з дизайном», «зверстай екран», «реалізуй екран з дизайну», «онови сторінку під дизайн», and whenever a task or its plan names a design, a mock-up or a screen to match."
---

# Building from a design

The design the person means is in the brain, in `Designs/`, not in a guess and not in the code as it
stands. A step "compare with the design" is done when you have read the design's page and compared,
never before. No design found is said to the person in those words; it is not a licence to invent one.

The design tools load progressively: `search_tools` with `design` names them, `read_tool` calls the
read ones (`design_list`, `design_get`, `design_render`, `design_elements`), `write_tool` the link.

## 1. Find it

1. `design_list` with the `project` and, when there is one, the `task` (`T-NNN`). A task linked to
   layers answers with them; `design_link` with only the `task` lists its addresses.
2. Nothing by task: `design_list` with the `project` alone, and `search` the screen's words (the
   page's title is the person's own: "Course card", "Teacher dashboard"). Several candidates: take
   the one whose pages name the screen; still unclear, ask.
3. The person gave a link or words ("design X, page Y"): take the `path` and the page from the words
   (brain-design says how a link reads).

## 2. Read the page, not the whole design

A whole design can be hundreds of kilobytes. Read in this order and stop when you have enough:

1. `design_get` with `mode: "summary"`: the pages, their status, the versions.
2. `design_render` with the `page`: the page as one HTML document, the markup the window draws.
   Save it to a file and open it in a browser when you need to see it; do not paste it whole into
   your reply. `design_snapshot` gives the page, or one `node`, as a picture to put beside a
   screenshot of what you built.
3. `design_elements` with the HTML `node`: its layer tree; with an `element`, that layer's own markup
   and the states saved on it (`hover`, `pressed`, `focus`, `disabled`) and the screen's states
   (`screen:empty`, `screen:loading`, `screen:error`, `screen:success`).
4. `design_get` with the `page`: the nodes, and the version's `resources` (the design's `tokens`,
   saved `styles` and `components`). Without `page`, a large design answers as its summary with
   `truncated: true`; HTML past the budget shows as `html_chars`, read through steps 2 and 3.

## 3. What to carry over and compare

| Area | Compare |
|---|---|
| Layout | order of blocks, grid, spacing, alignment, what is fixed and what scrolls |
| Tokens | colours, radii, shadows, type sizes: map each design token to the code's token, never a raw value beside an existing token |
| Type | font, size, weight, line height, truncation |
| States | hover, pressed, focus, disabled on every interactive element; empty, loading, error and success of the screen |
| Motion | transitions and what opens over what, when the design shows them |
| Widths | the widths the design has (1440, 1280, 834, 390 or its own); a width it lacks follows the nearest one without overflow |
| Text | labels and accessible names in every language the product has |

Differences you keep on purpose (the product's existing component, an accessibility fix) are named
in the report with why. A difference you did not look at is not "matches".

## 4. Link the task and mark what is built

A page's status comes from its tasks. At intake, or as soon as you know which pages the task builds,
`design_link` with the `task`, the design's `path`, the `page` (or `node`, or an `element` from
`design_elements`) and a `note` saying what the task does there.

When a page is built and committed, in the same step: `design_link` with the `task`, `path`, `page`,
`done: true` and `evidence` (the commit, and what of the page is left). Mark only what you built and
saw working at the design's widths; `done: false` takes the mark back. brain-design section 5a says
how statuses are counted.

## 4a. Link the code and check it against the design

When a node or an element is built by a component, link it, as Code Connect does: `design_code` with
the design's `path`, the `page`, `node` (and `element`), the `file` in the repository, its `export`
(empty when the file is the component, as a Blade view), the `selector` that finds it on the live
page and that page's `url`. Any stack links the same way. The person sees the file and its lines in
the inspector's «Development» and opens the file from there; a file's details show the layers it
builds (`design_code` with only the `file` lists them).

With the app running, `design_code` with `check: true` and the `node` (and `element`) measures the
component on the live page and the layer the same way and lists what differs: size, colour, type,
corners, spacing, with the design's token on each side. Fix the build, not the design; a difference
kept on purpose goes into the report with why.

## 5. Before the report

- Look at the result next to the rendered page at each width the design has (brain-live-check for a
  running app, brain-design-visual-qa for a design's own pages).
- `To verify` in the report names the pages and states to look at.
- A design that is wrong or stale is the person's to change: say what differs, comment on the place
  (`design_comment`), and build what the person decides.

## What not to do

- Do not tick a step about the design without `design_get` or `design_render` of its page.
- Do not take colours or sizes from a screenshot when the design has tokens.
- Do not edit the design to match the code you wrote.
