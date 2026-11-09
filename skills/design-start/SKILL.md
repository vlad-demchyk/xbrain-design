---
name: design-start
description: The entry to design work in any project, the order from the product's value to references, directions, materials, the design, motion, accessibility and code, and which result to keep at each step. Use it on «зроби дизайн», «зроби сайт», «зроби лендінг», «редизайн», «зроби макет», «зроби банер», «зроби презентацію продукту», «дизайн не подобається», «зроби як на цих сайтах», and before any design for a product, page, campaign or brand.
---

# Design work: the order and the results

The person's design decisions are in `references/decisions.md` beside this skill. When the XBrain brain is
connected, its note `Docs/Дизайн/Рішення з дизайну` is the living copy and wins; a new decision of the
person goes there with its date and source. Decisions win over taste.

This skill is the order. Each step names the skill that does it and the result that must exist before
the next step starts.

| Step | Do | Skill | Result to keep |
|---|---|---|---|
| 1. Value | What the product does, its idea, why it is needed, why it beats the alternatives, from the product's own data; agreed with the person | design-copy | a value note |
| 2. Type | The artifact type and its deliverables: sizes, states, languages | design-types | the type's checklist in the task |
| 3. References | The person's references studied live: scroll frames, contact sheets, shared traits | design-direction | a references note |
| 4. Directions | A concept, then 2-4 style tiles with the same factual copy; the person picks. A request that names a style or patterns (`canvas-light`, `story-track`…) takes them from the catalogue | design-direction, design-styles | the tiles and the person's choice, or the named style with its parameters |
| 5. Materials | Real product shots from a full demo instance; motion pieces from the studio | design-materials, design-motion | a materials folder, renders |
| 6. Design | The pages in the chosen direction, approved by the person | design-system, design-marketing-site | an approved design |
| 7. Build | Code from the approved design | (XBrain: brain-design-build) | commits linked to the pages |
| 8. Check | Quality gate, accessibility audit, screenshots at 1440 and 390 (360 where asked), reduced motion | design-quality, design-accessibility | a report with checks and pictures |

Where the brain is connected, designs live in its `Designs/` (XBrain skills brain-design and
brain-design-html put them there); a design that lives only in an agent's own canvas is closed to
everyone else.

## Rules on every step

- Never skip step 1 for a product page. A page that lists features without the value fails, however it looks.
- Never jump to code because the person is waiting: a design the person has not seen is a guess.
- When a direction is rejected, do not guess again with a whole page. Go back to step 3 with their
  references, or to step 4 with new tiles. Ask for references once, in one question, if there are none.
- The person's figurative words describe the essence. The page says the facts in plain words.
- Each product has its own visual language; never reuse a sibling product's look.
- Motion the studio cannot make becomes a task in the studio's project, with what is needed.
- Report each step in the task: what was made, where it lies, what the person must decide.
