---
name: brain-design-html
description: "Makes, imports and edits HTML screens and Claude Design boards inside a brain design: static layers that draw without scripts, .dc.html boards, a standalone HTML file imported by path, frame and screen sizing, and layer edits with design_elements and design_patch (styles, states, tokens, components). Use it on «зверстай екран у дизайні», «імпортуй HTML у дизайн», «зміни шар», «додай стан hover», «зроби компонент у дизайні», «екран порожній на полотні», «дошка Claude Design»."
---

# HTML screens and boards in a design

An HTML screen is a node of a design page (brain-design section 2). This skill is how it is made,
imported and edited without breaking what the canvas draws.

## 1. Making and importing a screen

- **A design is static layers, as in Claude Design.** Every screen draws itself from its markup and
  CSS alone: the canvas shows each page that is not running without its scripts, at every zoom.
  Scripts may add interaction to a screen that is already whole (Interact and Present run them in an
  opaque-origin sandbox without network or daemon access; Edit runs only the selection bridge); they
  never draw it. A screen made by code (a canvas, a 3D scene, an engine) is built into its finished
  markup before it goes in: run it once in a browser, keep the document it built, turn each canvas
  into a still picture (a `data:` image), drop the scripts. Shared libraries of a design are style
  sheets (fonts, CSS). What moves belongs to an **Artbook** (brain-artbook): static, or dynamic when
  the person asks for it. When a design and an Artbook show the same thing, build both from one
  source, the design as the master.
- **A Claude Design board is the one exception, and a whole screen.** A screen in the `.dc.html`
  format (its markup with `{{holes}}`, `<sc-for>`, `<sc-if>`, `<dc-import>`, and its logic in
  `<script type="text/x-dc" data-dc-script data-props='...'>class Component extends DCLogic {...}</script>`)
  is drawn by XBrain's own runtime, the brain's counterpart of Claude Design's `support.js`, in every
  mode, inside the same sandbox without network. Write such a screen as you would for Claude
  Design: its logic stays, a component it mounts goes beside it as
  `<template data-dc-module="Card">...</template>`. `brain designs import` of a canvas folder keeps
  each board's logic and its components this way. Never add a `<script src="./support.js">`: the
  brain brings the runtime itself.
- `design_put` and `design_patch` answer with `warnings` when a design screen only its scripts draw
  (it is empty on the canvas), or when an inline script declares globals (top-level `function`,
  `var`, `window.x =`): wrap it in an IIFE or load it as `type="module"`. Fix it before you
  report the design as done.
- A standalone artifact is imported whole, retaining its document structure and controls. Use
  `design_put` with `html_file="/absolute/file.html"` instead of passing its bytes through the model.
  It bundles declared classic scripts, stylesheets, fonts and pictures, and returns a compact `look`.
  With `path` and `expected_hash`, it replaces the active pages as a new version; `page` narrows the
  replacement to that page. Previous versions and comment events stay. External module graphs and
  CSS imports must be bundled with the artifact's own build tool first.
  CLI: `brain designs html <file> --path <design> --hash <read-hash>` or `--name <new-name>`.
- Size frames and screens as a design tool does. A page is a frame: `layout.width`/`height` are its
  size, `layout.hug_width`/`layout.hug_height` make a side hug its content, and `layout.clip: false` shows
  what reaches past its edge (clipped otherwise; nothing scrolls on the board). An HTML screen in it
  is sized like a layer: `style.fit` for its height is `fixed`, `content` (hug: the whole page) or
  `fill` (its frame's), `style.fit_x` for its width is `fixed` or `fill`. Its stored `height` stays
  the window it is made for (1440x900, 1280x800, 834x1194, 390x844 or its own): the present mode
  shows the page in that window with its scroll, and `vh` counts from it. Unsaid, a page that is
  one screen hugs it and the screen hugs its content. Choose by the design: a landing or an article
  hugs its content, an app screen with its own scroll or a dialog is fixed.

## 2. Editing HTML screens

Use `design_elements` with `path` and the HTML `node` id first. Its stable layer ids come from the
source parser; `element` includes only that layer's original markup. Never serialize the iframe DOM
back into a saved screen: it contains preview controls and transient states.

Send `design_patch` against the returned hash. Operations:

- `op:edit_html` with `id` (HTML node), `element` (layer), `styles` (CSS property map, null removes),
  `attributes` (string or null), or `text` on a leaf. The source's other bytes and children stay.
- `action:insert` with child `html`, `duplicate`, `remove`, or `group` with sibling `elements`.
- `state:hover|pressed|focus|disabled` saves an element variant; `state:screen:empty|screen:loading|screen:error|screen:success`
  saves screen-specific styles. Successive edits merge. Defaults remain in the original source.
- `op:set_resource` with `catalog:tokens|styles|components|bridges`, `name`, `value` (null removes).
- Tokens are the design system: colours, type, spacing and radii as `--name` tokens, and screens use
  `var(--name)`, never raw values. A token holds one value or one per mode, as a design tool's
  variable modes: `value` `{"light": "#fff", "dark": "#0b0b0f"}`, with the `@modes` token listing
  the modes in order, the first the default. Every screen gets each mode's values; the board's
  mode switch draws the whole design in a mode, and `style.mode` on a frame or a screen (or
  `data-xbrain-mode` on an element) draws that part in its own. `design_lint` names raw colours.
  Tokens are named CSS variables, saved styles are property maps.
- `op:create_component` with `id`, `element`, new `page`, `title` creates a master. `op:insert_component`
  with target `id`, parent `element`, `component` (master page id) makes an instance.
  `op:refresh_components` updates instances while keeping their property/text overrides.
- Build screens from components, not copied markup: a button, a card, a row each one master,
  placed by `op:insert_component`. Its states, sizes and kinds are variants of one set:
  `op:add_variant` with `component` (a master page), new `page`, `variant` `{name: value}` and, the
  first time, `base` for the master's own values; the copy keeps the master's layer ids, so edit it
  with `op:edit_html` by those ids. `op:set_component_props` with `component` and `props`
  `{name: {type: text|boolean|instance, layer}}` names what an instance may set. On an instance
  (`id` the HTML node, `element` its root layer): `op:set_variant` `{variant}`, `op:set_instance_props`
  `{props}` (text, `true`/`false` to show or hide, a component page for a nested instance),
  `op:swap_component` `{component}`, `op:reset_overrides`. Overrides survive a variant switch and a refresh.
- `op:restore_version` with `version` appends an earlier snapshot as a new version. It keeps the
  old history and comment events. Page add/set accepts `layout`.

The CLI equivalents are `brain designs elements <design> --node <id> [--element <id>]` and
`brain designs patch <design> --ops <json-file> [--hash <expected-hash>]`. Both use the same domain.
The window's View mode runs no scripts; Edit runs the trusted selection bridge only; Interact runs
screen scripts inside an opaque-origin sandbox without network or access to the daemon token. A
Claude Design board (`text/x-dc` logic) is the exception: XBrain's runtime draws it in every mode,
in the same sandbox, and in Edit its own handlers stay off while the bridge takes the clicks.
Prototype attributes `data-xbrain-page`, `data-xbrain-overlay`, `data-xbrain-action-state` link known
screens, overlays or screen states. Export carries local `xbrain.css` and `support.js` beside boards.
A Figma URL or configured MCP is not proof of a live connection: use the actual integration tools
for file/frame/style exchange, keep their ids in the bridge catalog, and report unverified exchange.


## What not to do

- Do not put a screen its scripts draw into a Design (a Claude Design board with its `text/x-dc`
  logic is not one: the brain's runtime draws it): it is empty on the canvas. Build it into its
  markup (canvases as still pictures), or make the moving thing an Artbook.
- Do not report a design as done from a browser run with scripts: check it as the canvas draws it,
  without them.
