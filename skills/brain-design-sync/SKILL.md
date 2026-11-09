---
name: brain-design-sync
description: "Keeps brain designs in step with Claude Design canvases at the least cost (a version probe, only changed boards read, import by path), exports a design to a canvas folder for a round trip through another account, and carries a design or a board to another brain as one .xcanvas file. Use it on «синхронізуй дизайни», «оновити з Claude Design», «експортуй дизайн у Claude Design», «перенеси дизайн в інший брейн», «імпортуй xcanvas», «перевіряй полотно щодня»."
---

# Designs and their canvases

## 1. Claude Design canvases: keep in step, export, round trip

A Claude Design canvas (`https://claude.ai/artifact/<id>`, a folder of `project/canvas.json` and one
`project/<Board>.dc.html` for each board) opens only through **your own Artifact tool**: the daemon
cannot read it, so keeping a design in step with its canvas is your work, done with the `brain`
command. Everything the Artifact tool prints passes through you and costs the person's tokens, so
read the least. A design that came from a canvas carries a `source` (address, artifact version,
board sizes and time of the last sync); the window's Synchronise button starts you on this procedure.

**Sync, in this order (`brain designs sync <url> --help` prints it too):**

1. Probe the version with one small read: Artifact `read` of the canvas with `path`
   `artifact-type/thumbnail/thumbnail.json` (a few hundred bytes). Its answer names the version:
   "... from version 1790781681-8ea4". No such file: Artifact `list` with scope `files`; its header
   names the version.
2. `brain designs sync <url> --rev <id>`. Unchanged since the last sync: it says so and marks the
   designs as checked. **Stop: nothing else is read.** This is the whole cost when nothing changed.
3. Changed: Artifact `list` with scope `files`, and pipe its result (or a `name size` line for
   `canvas.json` and each `.dc.html` board) into `brain designs sync <url> --rev <id> --files -`. It
   prints the files to read: `canvas.json` when its size changed (else it puts the copy kept from the
   last sync in the folder) and only the boards whose size differs from the last sync (all of them
   the first time), and the folder to save into.
4. Artifact `read` with exactly those paths and that output folder. Small files come back inline; big
   ones are only saved. Never `Read` the saved files and never paste a board's HTML into your context.
5. `brain designs sync <url> --from <that folder>`. It goes through the fingerprinted import: a page
   whose fingerprint is the same adds nothing, a changed one becomes a new version of its design, and
   the version, the sizes and the time are recorded. Tell the person which designs changed, with the
   `look` links of the designs that gained a version.

A board is read again only when its size changed, so an edit that keeps the size is missed until
`--all` (step 3). `brain designs sync` with no address lists the canvases the brain follows.

**On a schedule.** The brain cannot look at a canvas itself: a routine runs this procedure
(`/loop 1d` in an open session, or `/schedule`). Each run costs one small read when nothing changed.

**Export and the round trip through another account.** To refine a design in Claude Design,
possibly under another account:

1. `brain designs export <design> --to <folder>` writes the canvas folder (`project/canvas.json` and
   a `.dc.html` for each page with HTML or drawn nodes), by plain file operations, no model.
2. Publish that folder **by path**: the Artifact tool's publish with `files` mapping each published
   path to its file in the folder, or with `root`. **Never read the HTML into your context to paste
   it into a page**; it must not pass through you, only the paths do.
3. The person refines the canvas in Claude Design. To bring the changes back, sync it (above) or
   `brain designs import <folder>` a copy of it: pages are replaced as a **new version**, never
   destructively, so the earlier versions stay to be compared and restored.


## 2. Carrying a design or a board to another brain

- `canvas_share` with `export` (`Designs/<name>` or `Canvas/<name>`) writes one `.xcanvas` file: the
  note, its pictures and its comment threads. `to` is an absolute file or folder; by default it goes
  to the person's Downloads. Give the person the file's path.
- `canvas_share` with `import` (an absolute path to an `.xcanvas` file) brings one in under a free
  name (`name` suggests it); nothing there is overwritten. Tell the person the new path.
- `design_export` writes a design as a Claude Design canvas folder (section 1), the same as
  `brain designs export`.
- `design_render` gives one page as one HTML document (`page`, `version`): read a whole screen at
  once, or save it for a browser. It is the markup the window draws, never a screenshot.


## What not to do

- Do not read a whole canvas to find what changed, and do not paste board HTML into your context:
  probe the version, compare sizes, read only what differs, publish and import by path.
