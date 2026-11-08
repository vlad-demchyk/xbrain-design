---
name: design-types
description: The catalogue of design types with what each must deliver: marketing site, product page, pricing, docs, app screen, onboarding, empty and error states, email, social carousel, ad static, cover and Open Graph image, app store screenshots, pitch deck, promo video, brand kit, design system. Use it on «який дизайн потрібен», «що має бути в макеті», «які розміри», «зроби банер», «зроби карусель», «зроби обкладинку», «зроби лист», «зроби презентацію», «зроби скріни для App Store», and when planning a design task.
---

# Design types and their deliverables

Pick the type, then copy its row into the task's plan as steps: a design without its states, sizes or
languages is not finished. Starter files for most types are in this plugin's `templates/` (and, with XBrain, in the design `Designs/Стартовий набір дизайну`).

| Type | Sizes | Must include | Checks |
|---|---|---|---|
| Marketing site, home | 1440, 768, 390 (360 if asked) | value in the first screen, one primary action, the product shown, chapters, proof with source, objections, final call to action, footer with legal pages | design-marketing-site, design-quality §10, design-accessibility |
| Product or feature page | same | one feature's job, how it works on real screens, who it is for, link back to the value | same |
| Pricing | same | plans from one catalogue, the recommended plan, what is in each, honest renewal and cancel | design-quality §8 |
| Docs page | 1440, 390 | navigation, search, code blocks, last updated | readable 45-75 ch |
| App screen | the app's widths | default, loading, empty, error, success, long content, permissions, both themes | brain-design-html states |
| Onboarding | app widths | first value within a minute, skip, resume, progress | design-quality |
| Email | 600 wide, dark mode | one message, one action, plain-text version, unsubscribe | images with alt, 14 px min |
| Social carousel | 1080×1350 (LinkedIn, Instagram) | hook slide, one idea per slide, last slide action, safe margins 64 px | xbrain-marketing platform-pack |
| Ad static | 1080×1080, 1080×1350, 1200×628 | product, one claim with proof, logo, action | xbrain-marketing ad-creative |
| Cover and Open Graph | 1200×630; YouTube 1280×720 | title readable at 300 px wide, product mark | text contrast 4.5:1 |
| App store screenshots | 1290×2796, 1242×2688, 2048×2732 | caption per screen, real UI, first two carry the value | xbrain-marketing aso |
| Pitch or product deck | 1920×1080 | problem, product, how, proof, team, ask | one idea per slide |
| Promo video | 1920×1080 and 1080×1920 | shot list, real UI, captions, sound | design-motion, studio |
| Brand kit | board | logo and clear space, colours with contrast, type pair, voice, do and don't | design-system |
| Design system | board | tokens (colour, type, space, radius, shadow), components with states, dark and light | design-system |

## Every type

- Real content: the product's own data or a full demo instance, never lorem ipsum.
- Every language the product has; the person's language first.
- Accessible: contrast, text alternatives, focus, target sizes (design-accessibility).
- Kept where everyone sees it (with XBrain: the brain's `Designs/`), approved before code (design-start).
