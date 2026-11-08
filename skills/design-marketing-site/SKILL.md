---
name: design-marketing-site
description: Designs and builds a product's marketing site at the level of award-winning sites: one central image of the product, a story in chapters, big type and one brand colour, the real product inside the scenes, proof with sources, one primary action, and the conversion, SEO, speed and accessibility a site needs. Use it on «зроби сайт продукту», «лендінг», «головна сторінка», «сайт як на Awwwards», «маркетинговий сайт», «сторінка продукту», «hero», and for any public page that sells a product.
---

# A marketing site

Start with design-start (value, references, direction). This skill is how the page itself is built.

## The shape

- **One central image** that carries the value: an object or a scene the whole page returns to (a
  task card the team assembles, blocks that stack, a drawing that becomes a building). A wall of
  screenshot cards is not an image.
- **A story in chapters.** One idea per screen: a very large title, two or three lines, the image
  changing. A typical order: the promise; the problem; how it works (3-6 beats); who does what; proof;
  objections and questions; the call to action. Number the chapters when the story is long.
- **The real product inside the story**, pinned in one place (a window, a phone) and changing per
  chapter, or as panels lifted out of it. Real screens from a full demo instance (design-materials).
- **Type leads.** Display 72-150 px on desktop (clamp down to 40-56 on a phone), tight tracking; a
  small mono for labels and captions; body 17-20 px, 45-75 characters a line.
- **Palette:** one brand colour on a neutral ground (dark or paper). Semantic colours only for states.
- **Motion** from the studio (design-motion): scroll moves the scene, each chapter comes to rest,
  reduced motion has its own still version, loops have a pause.

## Conversion

- The first screen says the benefit, shows the product, has one primary action; the value is clear in 10 s.
- One primary action across the page (the same words every time); the rest are secondary.
- Proof right after the claim it supports; three strong numbers with a source beat a table.
- Objections answered before the final call to action (FAQ, privacy, price or availability).
- A waitlist or sign-up form: a visible label, the email type and autocomplete, an error next to the
  field, a live region for the result, honest consent with a link to the privacy page, no pre-ticked boxes.
- With xbrain-marketing: `cro`, `signup`, `copywriting`, `trust-check`, `seo-page`, `ai-seo`.

## Technical

- Title and description per language, canonical, Open Graph image 1200×630 drawn from the page's own
  look, `robots.txt`, `sitemap.xml`, JSON-LD (`SoftwareApplication` or `Product`).
- Fonts self-hosted with Cyrillic subsets and `font-display: swap`; preload the display font.
- LCP ≤ 2.5 s, CLS ≤ 0.1, INP ≤ 200 ms at the 75th percentile; videos lazy and muted, posters set,
  images 2x WebP or AVIF with width and height.
- No zoom lock (`user-scalable=no` is forbidden); `prefers-reduced-motion` honoured; focus never hidden
  under a sticky header (`scroll-padding-top` plus a focus handler).
- A CSP that allows only what the page uses (fonts and scripts from self, the API the form posts to).

## Before handing over

design-quality and design-accessibility, screenshots at 1440 and 390 (360 where asked) of the first
screen, each chapter at rest and the form, with and without reduced motion.
