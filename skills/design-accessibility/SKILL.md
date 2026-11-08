---
name: design-accessibility
description: Verifies the accessibility of a site, a page or a project's code by running the installed xanalyze CLI, then triages the result and re-verifies the fix. Use it on «перевір доступність», «аудит a11y», «WCAG», «запусти xanalyze», «що дивитися при доступності», and before delivering any change that adds images, links, buttons, forms or headings.
---

# Accessibility verification with xanalyze

xanalyze does the measuring. This skill is the procedure around it: what to run, in what order, what to trust, what only a person can check, and how to prove a fix. The tool itself (commands, options, output, login, the agent loop) is the `xanalyze` skill of the `xanalyze@xanalyze` plugin; load it when you need more than the commands below. Do not re-implement a check by hand when xanalyze has it; call it.

It is a read-only tool. Never pass `--fix` unless the person asked for it. It is also not a conformance claim: a clean run means "nothing the tool can see", not "accessible".

**The target is WCAG 2.2 AA.** EN 301 549 V4.1.1 (published 2 September 2026) moved the European Accessibility Act's technical standard from WCAG 2.1 to WCAG 2.2 A/AA. It becomes the harmonised standard once cited in the EU Official Journal; until then V3.2.1 (WCAG 2.1 AA) is the legal reference. Audit and fix against 2.2 AA anyway, and name in the report which version a "pass" refers to. WCAG 3 is still a Working Draft: not a target, and APCA contrast is not a requirement.

## 1. Get the tool

`xanalyze --version`. What this skill says about results holds from **0.72.0**; an older binary reports older behaviour (no target-size measurement, H30.2 on named links as serious, duplicate ids across JSX branches, and before 0.72.0 a `=>` inside a JSX attribute hid every attribute after it, so `onKeyDown`/`role`/`autoFocus` there were not seen). `make check-cli` in `~/repositories/XAnalyze` says whether the installed binary matches the source; without the binary, `./venv/bin/python cli.py ...` inside the repository runs the current code. Rebuilding and replacing the installed app are the person's decision.

## 2. Choose what to audit

| Target | Command | Notes |
|---|---|---|
| A project's code | `xanalyze audit <repo or theme folder> --language <uk|it|en> --json --styled-report <file.html>` | Static. Reads templates, so PHP/Twig/JSX fragments are judged as fragments. |
| One page | `xanalyze audit <url> --browser --json` | Adds axe-core, HTML_CodeSniffer, the focus/keyboard pass and target size. |
| A whole site | `xanalyze audit <url> --depth 10 --max-pages 700 --browser --site-controls --json --styled-report <file>` | The crawler follows links from the start page. About 40 minutes for ~380 pages uncached, much less cached. |
| One .html file | `xanalyze audit <file.html> --browser` | |
| Pages behind a sign-in | `xanalyze login <url>` once, then the audit | Test accounts only; see the `xanalyze` skill. |

The crawl is the only way to get the cross-page rules (translated-link targets, duplicate titles, hreflang). Per-page runs lose them.

A sitemap is not a list of pages. A WordPress sitemap under WPML listed 98 addresses on a site with ~370 published pages. Cross-check the crawled count against the database (`wp_posts` by `post_type` and `wp_icl_translations.language_code`) before saying "every page".

Put outputs outside the repository, in a dated folder (`~/Downloads/<project>-xanalyze-<date>/`), with `--json` and `--styled-report`. Use `--language` in the language the report is for.

A live site that is not the person's own or is production: ask before crawling it. A crawl is many requests.

## 3. Read the result in this order

1. **The headline and `counts`** are distinct problems. `occurrences` is how many places they were found; `distinct` and `problems` (with `pages` and `sources`) are the work list. Plan by causes, never by raw count.
2. **`coverage` and the `# [browser n/m]` lines.** How many pages were actually audited, and `the page did not load` lines.
3. **The notices.** `# N check(s) could not be decided ... (rules)` names what `--unsettled` adds; `# [environment]` on a local site counts what the server decides, left out of the list.
4. **`state:focus-not-measured`** (shown with `--unsettled`) means the focus checks did not run. The command line gives the hidden view focus; the desktop app cannot, by design. Absence of focus findings is only meaningful when this one is absent.
5. Then the findings, by severity and by cause.

## 4. Triage: what to trust

**Real, act on them** (the tool measured or read the markup):
`image-alt` (missing), `image-alt-filename` (`exact` = alt equals the file's name; `advisory` = it merely looks like a slug), `control-name`, `axe:link-name`, `axe:button-name`, `heading-order`, `html-lang`, `document-title`, `htmlcs:1_4_3` with a computed ratio (`G18.Fail`) on visible text, `htmlcs:1_1_1` with `H30.2` at `exact` (an image that is the only content of a link with no name at all), `axe:target-size` (2.5.8, with the measured `width`/`height`, `closest_offset` and the nearest target), `state:focus-not-visible`, `state:focus-indicator-low-contrast`, `state:focus-obscured`, `state:keyboard-trap`, `state:modal-focus-not-contained`, `state:form-*`.

**A person decides** (`advisory`, a candidate and not a verdict):
`embedded-video-alternatives`, `status-message-live-region`, `link-target-differs-across-translations` (matched by words and destination, so a different order is not a finding; look at both addresses), `H30.2` at `advisory` (the link is named by `aria-label`/`aria-labelledby`/`title`: check the name describes the destination, "Open image 1" does not), `jsx-untranslated-literal` (a literal `aria-label` or `placeholder` in a file that translates the rest), `htmlcs:1_4_3` marked `visually_hidden` (a skip link measured while clipped; check it focused) or `logo` (logotypes are exempt from 1.4.3), `sec-frame-sandbox` (moderate: hardening a YouTube or Maps embed, not an open hole), an `alt=""` on a logo.

**Noise or environment, do not act on them**:
- `htmlcs` prompts, already `advisory`/`minor`: `.F96`, `1_4_10.C32`, `.H67.2`, `.H48`, `.H85.2`.
- `4.1.1` / `htmlcs:4_1_1`: removed from WCAG 2.2. A duplicate id still matters where a `for`, `aria-*` or `url(#id)` points at it.
- `seo-hreflang-parameterised-skipped`: search and filter addresses left out of the reciprocity check, by design.
- `seo-untranslated-content` on proper nouns, brand names, place names.
- On a local or staging copy, the environment rows the run counts and leaves out.

**React and other component files**: a static pass cannot see what a component renders. `needs-browser` there is a question for a URL or `--devserver` run.

Every finding that will change the project is checked against the real HTML first: `curl` the page and read the element, and for a CMS read the value where it lives (WordPress: `_wp_attachment_image_alt` in `wp_postmeta`, theme meta, WPML translations per language). A tool finding is a lead, not a fact about the project.

## 4b. What xanalyze cannot check: do these by hand

Tell the person which of these were not covered, and do not write "conformant".

- Keyboard walk with a real keyboard: Tab and Shift+Tab through header, menus, modals; Esc closes a submenu (1.4.13); focus returns to the trigger after a modal closes (2.4.3); the focus ring is visible on every state.
- Captions are accurate, a transcript exists, audio description exists for visual-only content (1.2.x). The tool only notices the player.
- Images: is the `alt` correct and short; is a decorative image really decorative; a map or infographic that carries information has a text equivalent.
- Contrast over images, gradients and overlays (`--unsettled` lists what the engines could not decide). A site with a dark theme: run the audit again with `--color-scheme dark`, one scheme per run.
- Reflow at 320 px and zoom to 200%, orientation.
- Text spacing (1.4.12): line-height 1.5, paragraph spacing 2em, letter spacing 0.12em, word spacing 0.16em; look for clipped or overlapping text.
- Target size (2.5.8): measured by `axe:target-size` in the browser pass from 0.70.0, at the audited width only; check the phone width (`--breakpoints all`) and anything axe marked undecided.
- The other criteria new in 2.2 that no engine decides: focus not hidden under a sticky header or cookie banner (2.4.11; `state:focus-obscured` covers part of it), dragging has a single-pointer alternative (2.5.7), help appears in the same place on every page (3.2.6), the user is not asked again for what they already entered (3.3.7), sign-in needs no puzzle or memory test and allows paste and password managers (3.3.8).
- Reading order and meaning without CSS; link purpose in context; the language of a foreign phrase.
- Forms: errors announced, labels, instructions; autocomplete purposes.
- A screen reader pass (VoiceOver) on the two or three templates that matter, and voice control on controls whose visible label differs from their name.
- Each language version: the translation of `alt`, `aria-label` and link text, not only the main language.

## 5. Fixing

Follow the person's own rule: an element that needs a text alternative gets correct, meaningful text, where the value lives (configuration or CMS field if it comes from there, the code if it is literal), per language; a decorative element gets `alt=""` or `aria-hidden` and nothing invented; a link's accessible name contains its visible text. Never a filename, slug or "click here".

Visual and UX quality beyond accessibility is `design-quality`.

## 6. Prove the fix

1. Run the **same command** before and after, into two folders. Compare `distinct` and the specific rule ids, not the totals.
2. The fixed cause is gone and nothing new appeared. A newly found problem after a fix is usually a page that was not reached before: compare the crawled address lists.
3. The browser result is cached by the page's markup and the pass revision. After changing the **server** (a header, a stylesheet) add `XANALYZE_BROWSER_CACHE=<empty folder>` for a clean run. The first run after an upgrade that raised the pass revision is slow: the cache is rebuilt.
4. For project code, run the project's own tests and lint as well; xanalyze does not replace them.
5. Say what was **checked** (command, version, pages, date), what **was not** (section 4b), and the residual risk.

## 7. Report

In the person's language. Separate verified facts, hypotheses, risks and what was done. Lead with distinct problems and the few that matter, with pages. State that the tool is not a conformance claim. Never paste a secret or a session cookie from a crawl into a report.

## Known limits of the tool itself

- It reads the page in one viewport unless `--breakpoints` is asked, and in one colour scheme per run (`--color-scheme`).
- A crawl is capped by `--max-pages`; compare it with the source of truth.
- Warnings of the engines are not defects; the tool demotes the known ones, and from 0.72.0 a code an engine update brings is reported as a note (`details.unverified_engine_code`) until someone weighs it. When a rule fires hundreds of times on one component, suspect the rule first and read the element.
- If the tool itself looks wrong (a false positive that repeats), that is a task for the XAnalyze project, not a reason to suppress it silently in the report. A single finding a person has checked and judged false can be dismissed with its reason: `xanalyze ignore <fingerprint from audit --json> --reason "…"` in the project folder; every later run says how many were hidden and why, and those counts belong in the report.
- Rule precision on real audits is measured, not assumed: `python -m audit.precision <audit.json> --template labels.jsonl` in the XAnalyze repository, label, then `--labels labels.jsonl`. Quote a precision only with its n; below five labelled findings it is "not measured".

## 8. Accessibility while designing

Before any audit, a design already has:

- contrast computed for every text and control pair, in both themes and in hover, disabled and
  placeholder states;
- one `h1`, headings without skipped levels, a skip link and landmarks on pages;
- a text alternative planned for every image, link, button, icon, control, iframe and media: correct
  and meaningful, where the value lives (configuration, CMS, translations, code) and in every language;
  decorative ones `alt=""` or hidden; a link's name contains its visible text; never a file name or
  "click here";
- targets of 24×24 px at least (44 for primary touch actions), focus visible and never under a sticky
  header, no zoom lock;
- motion with a still version and a pause for loops; no flashes above three a second;
- forms with visible labels, the right input types and autocomplete, errors next to the field in text.
