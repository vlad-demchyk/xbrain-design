# Choosing by the product's type

A reasoned default when the person has no decision yet. Start from the group the product belongs to,
then the style family, then the landing structure. Every choice is a recommendation: the person's
decisions and a named style of design-styles win.

## Product groups

| Group | Examples | Style direction | Landing structure | Palette mood | Type mood | Watch out |
|---|---|---|---|---|---|---|
| Tools for work (B2B SaaS, productivity, knowledge, collaboration) | task boards, notes, wikis, CRMs, brains | the product's own window: calm, light, exact; one accent; the product shown at work | demo-led or a scroll story of the product working; proof by real screens | neutral page, one confident accent, state colours from the product | a clear grotesk, small mono for labels | a feature grid instead of the value; fake screenshots; too many colours |
| Developer tools, infrastructure, AI agents | IDEs, CLIs, APIs, status pages, agent platforms | precise and technical; a terminal or the real output as the hero; light or dark by the product | product demo, then «how it works» with real commands or traces, docs and pricing | dark or zinc neutrals, one signal colour | mono for code, a grotesk for text | decoration over evidence; unreadable code on images; claims without a command to try |
| Data and dashboards | analytics, finance, operations, monitoring | data-dense but ordered: a grid, quiet surfaces, colour only for meaning | live preview, key metrics, how it works | neutral, series colours checked for colour blindness, one alert colour | tabular figures, a compact grotesk | colour as the only signal; charts without tables; density with no hierarchy |
| Trust first (health, finance, legal, government, insurance) | clinics, banks, public services | accessible and quiet; authority by clarity, not ornament | mission and credibility, proof (certificates, numbers with sources), a clear path to act | deep blue or green, high contrast, warm neutrals | a readable serif or humanist sans, large body | playful styles, low contrast, hidden fees or terms, dark patterns |
| Consumer apps (habits, health, money, social) | trackers, journals, messaging | friendly, touch-first, micro-interactions, soft depth | app store style: device, screens, reviews, download | one warm primary, generous whites | rounded or friendly sans | hover-only actions, tiny targets, gestures without visible controls |
| Learning and children | courses, schools, kids apps | playful blocks, clay or hand-drawn accents, big targets | outcome first, how a lesson goes, testimonials | bright, but text pairs still 4.5:1 | rounded, very legible, generous size | noise that hides the next step; motion that cannot be stopped |
| Commerce | shops, marketplaces, luxury | the product photographed well; luxury goes minimal and editorial, mass goes clear and fast | search and categories (marketplace) or the product with reviews and buy | brand colour plus neutral; luxury goes monochrome | a serif for luxury, a clean sans for mass | slow 3D on mobile, carousels as the only content, hidden price |
| Creative, portfolio, agency | studios, artists, personal sites | the work is the hero; bold type, motion, brutal or editorial | the work grid, the philosophy, contact | the work's own colours; the frame stays neutral | a display face with character | motion over the work; navigation hidden for effect |
| Media and reading | magazines, newsletters, docs | editorial grid, paper, long reading comfort | the latest issues, subscribe inline, the author | warm paper, ink, one accent | a reading serif, 65-75 characters a line | ads and pop-ups over the text; light grey body |
| Events and launches | conferences, webinars, waitlists | one strong statement, a date or a countdown | date and place, speakers, agenda, register; or a teaser and an email | the event's colours | a bold display | a countdown that lies; a form far below |
| Games and entertainment | games, streaming, music | immersive, dark, motion, 3D where it earns it | video or a playable hero, then features and download | saturated over dark | expressive display | autoplay sound, flashing (WCAG 2.3.1), no pause |

## Style families

| Family | Fits | Avoid for |
|---|---|---|
| Minimal and Swiss | enterprise, docs, professional tools | playful brands, entertainment |
| The product's own window (canvas-light, studio-cut) | tools with a window, studios, dashboards | products with nothing to show |
| Editorial grid, paper | news, long reading, documentation | dashboards, short-form content |
| Soft UI, flat | web and mobile apps, MVPs, enterprise that should feel modern | luxury, immersive work |
| Glass, aurora, gradient mesh | lifestyle, premium SaaS heroes, music | data, long text, low-contrast backgrounds |
| Neubrutalism, brutalism, bold type | creative tools, Gen Z brands, portfolios, agencies | finance, health, conservative audiences |
| Playful blocks, clay, hand-drawn (ink-play) | learning, children, onboarding, friendly consumer | formal, data-critical, medical |
| Bento grid | feature summaries, product pages, personal sites | long reading, dense tables |
| Dark console, terminal, HUD | developer tools, security, crypto, games | consumer warmth, children, health |
| Motion-driven, parallax story, kinetic type, cinematic | launches, brand stories, portfolios | e-commerce, dashboards, accessibility-first, SEO-critical pages |
| 3D, product preview, configurator | furniture, cars, electronics, games | low bandwidth, content-heavy pages |
| Organic, nature distilled | wellness, food, sustainability | tech, nightlife, finance |
| Dashboard families (executive, real-time, drill-down, comparative) | each its own reader: a summary for deciders, live status for operators, exploration for analysts | mixing them on one screen |
| Platform systems (Material 3, Fluent 2, Apple native, Polaris, Spectrum) | products that live on that platform | products that must not look like the platform |
| Accessible and inclusive | every product: this is a floor, not a style | nothing |

## Landing structures

Section order and where the main action sits. Name one in a request (`landing=story`), then fill it with
the named patterns of design-styles.

| Name | Order | Main action |
|---|---|---|
| `hero-features` | hero, value, 3-5 features, action, footer | in the hero and at the bottom |
| `hero-proof` | hero, problem, solution, testimonials, action | in the hero and after the proof |
| `demo` | hero, the product working in the centre, a feature per section, comparison, action | beside and under the demo |
| `minimal` | headline, short description, 3 benefits at most, action | one large button in the centre |
| `funnel` | problem, solution, action, each with a small step forward | every step, the main one last |
| `story` | a hook, chapter of the problem, the journey, the solution, the climax | a small action per chapter, the main one at the climax |
| `compare` | problem, a table of you against the alternatives, details, action | under the table |
| `pricing` | value, 3 plan cards, a feature table, questions, action | on each card, in the header, at the bottom |
| `waitlist` | a teaser, the product's promise, an email form, the count waiting | the form above the fold, sticky on scroll |
| `app-store` | a device with the app, screens, features, reviews, download | store buttons throughout |
| `docs-hub` | a search, popular topics, questions, contact | the search, contact for what is not found |
| `before-after` | the problem state, the change (a slider), how it works, results | after the change |
| `bento` | hero, a bento of key features, details, specs, action | under the grid |
| `event` | date and place, speakers, agenda, sponsors, register | register sticky and after the speakers |
| `marketplace` | search, categories, featured listings, trust and safety, «become a seller» | the search and the header |
| `newsletter` | value and a form, past issues, subscribers, the author | the inline form, sticky header form |
| `enterprise` | mission, solutions by industry and role, client logos, contact sales | contact sales first, log in second |
| `portfolio` | name and role, the work grid, philosophy, contact | the work cards and the footer |
| `ai-input` | an input as the hero, a generated result, how it works, value | the input itself, «try it» |
| `operations` | the product with a live status, key metrics, how it works, start | in the header and after the metrics |

## Dials

| Dial | 1-3 | 4-7 | 8-10 |
|---|---|---|---|
| `variance` | centred, minimal | balanced | bold, asymmetric |
| `motion-level` | micro-interactions only | reveals and staggers on scroll | pinned scenes, choreography, a particle object |
| `density` | airy (spacing 24-96 px) | regular (16-64 px) | dense, a dashboard (8-32 px) |

A marketing page usually sits at variance 6-8, motion 6-8, density 2-4; a working app at variance 2-4,
motion 2-4, density 5-8. The XBrain site: variance 7, motion 9, density 3.

## Right to left

Arabic, Hebrew, Persian and Urdu mirror the layout. Styles whose meaning sits in direction (a timeline,
a horizontal journey, directional motion, icons with arrows) need a check per component; say so before
recommending them.
