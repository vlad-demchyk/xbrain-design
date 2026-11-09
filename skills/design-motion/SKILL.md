---
name: design-motion
description: Directs motion design for interfaces, product presentations and websites so animated UI reads like a film: a shot list first, a camera, the interface as layers in 3D space, parallax and perspective, 3D transitions between screens, a cursor that acts, timing like video, scroll as a camera, stable layout and reduced motion. Use it on «зроби моушн», «анімуй інтерфейс», «промо застосунку», «презентація продукту», «анімований лендінг», «3D-переходи», «паралакс», «скрол-сцена», «зроби як відео», «моушн-дизайн сайту», and whenever a page, hero or product video gets animation.
---

# Motion design for interfaces and websites

An interface animated well reads as a short film: a scene, a camera, actors (panels, a cursor, a number that counts), a beat that lands. Animated badly it is boxes sliding in. The difference is direction, not effects.

## 1. Write the shot list before any keyframe
The film in 4-8 beats, each with: what the viewer must understand, what the camera does, which element acts, how long it holds. One idea per beat. Show the shot list to the person before building anything longer than 10 s.

Example, a feature reveal: wide shot of the app floating in space tilted ~12° (1.5 s) -> push in to the panel that matters while the rest drifts back and blurs (1.2 s) -> the cursor moves in an arc and clicks, the button presses and answers (1 s) -> the result unfolds, panels separate in depth (1.5 s) -> hold to read the one line that sells it (2 s) -> pull out and turn to the next screen (1 s).

## 2. The camera
- Scroll or time is a camera, not a conveyor: each section or beat is a scene; progress drives the camera and the reveals; a scene comes to rest before the next starts.
- Moves: push in (attention), pull out (context), truck (travel between screens), slow orbit 8-15° (depth), a dive into an element that opens into the next screen.
- 0.8-2 s per move with a strong ease in and out; never linear; never two camera moves at once; the camera settles before text appears.
- Depth of field: the subject sharp, the rest 2-6 px blur and 10-20 % darker.

## 3. The interface as a 3D scene
- Build the screen from layers (background, window, panels, cards, buttons, text, cursor), each at its own depth; panels separating on Z and coming back explain structure better than arrows.
- Perspective 1200-2400 px; tilt 8-20° for establishing shots, face the camera when it must be read.
- Parallax: background ~0.6-0.85 of the camera travel, foreground 1.1-1.3; a lifted panel's shadow grows softer and larger.
- 3D transitions: swing (rotateY 60-90° around an edge), cube turn, card flip into the next screen, dive (scale through an element), panels stacking back in Z. One kind per film.
- Real content only: real screens at 2x, never placeholder boxes; text readable when the camera rests.
- The cursor is an actor: arcs with ease, a pause before a click, the target reacts (press 0.96, highlight, ripple), typing at 8-14 characters a second.

## 4. Timing like video
Beats 1-2.5 s; social pieces 10-30 s, product films 30-60 s. Overlap: the next element starts while the previous settles (80-200 ms). Stagger lists 60-120 ms. One hero movement per beat. Hold to read: ~0.3 s per word, 1.5 s minimum. Cut on movement (a 3D transition hides the cut) or on the music's beat. Sound sells it: a soft whoosh on a camera move, a tick on a click, a riser into the reveal.

## 5. On a website
- Stack: CSS 3D (perspective, transform-style: preserve-3d, translateZ, rotateX/Y) for panels in space and parallax; WebGL (three.js) when the scene needs lights, a model or many objects, with readable copy kept as HTML panels in the scene so it stays text and accessible.
- Scroll as camera: pin the section, map its progress to the camera and the beat (scroll-driven timelines or one damped progress value lerped every frame); snap each scene at its resting point.
- Damping: ease scroll progress and cursor parallax toward their targets each frame; never bind transforms straight to raw scroll.
- Stable layout: the stage keeps one size through every beat (no height that grows while it animates); animate only transform and opacity; reserve space for every state.
- Performance: layers promoted only while moving; images 2x WebP/AVIF; video lazy near the viewport; 60 fps on a mid laptop and a phone; test both.
- Reduced motion: with prefers-reduced-motion the same page without movement (each scene's resting state, crossfades instead of camera moves); a pause button for anything that loops. Design that version too.

## 6. As a video
Capture the real screens, compose them as layers with depth and a camera move per beat, add the transition and sound, render 1920x1080 and 1080x1920, look at frames at rest (blur, unreadable text) and at every transition (a jump, a flash). The same scenes can ship to a site as short transparent WebM loops.

## 7. Mistakes to avoid
Everything moving at once; linear easing; spinning the camera for no reason; tilting text that must be read; placeholder boxes; low-resolution screenshots; layout shift during the animation; effects without a beat; loops with no pause; parallax strong enough to make people sick; 3D where a fade is enough.

## 8. Check before handing over
Watch the whole piece twice (once with sound), at desktop and phone width, with reduced motion on; measure the stage's box at every beat (no size change); confirm 60 fps; read every line at rest.

## 8a. Scroll scenes and particle objects in code

What the ecosystem's sites learned, in brief (the whole of it: design-styles, `references/builds.md`):

- One damped progress value per scene (`--p`) written into a CSS property each frame; every piece reads
  it in its own transform through `clamp()` and `calc()`. React does not re-render per frame.
- The loop runs only while something moves and stops when every scene has landed; ease toward the
  target and set it exactly once close, or the scene rests a hair off, tilted and soft.
- Measure a moving node's parent, never the node: measuring the node feeds the output back into the
  input and the scene hunts.
- A pinned scene is a tall track with a sticky stage; a scene's length is its track's height.
- A film drawn in HTML and CSS can be timed by its progress bar's animation (`animationend` turns the
  scene), so pausing the bar pauses everything; it plays only in view, in a visible tab, without
  reduced motion, with pause, back and next always there.
- A particle object (three.js, loaded lazily) taken from a reference picture keeps the picture's
  angle exactly; give it depth sparingly, move its parts with weights that fade in over an area (hard
  part boundaries tear the form), and never let a canvas edge cut it.

## 9. Make it with the studio

Motion for a product page or video is made with the studio (studio.xformat, LocalAI Motion), not
hand-written CSS keyframes:

- Import the real screenshots (design-materials) with `localai_import_media`.
- Start from a template (`ui-showcase`, `ui-feature-demo`, `ui-before-after`, `app-reel`) or write a
  composition: a scene with `camera3d` (perspective, keyframed x, y, z, rx, ry, `focus` and `dof`),
  layers with depth, panels cut from the screenshot with `crop` and `at_crop`, the cursor as an actor.
- Leave captions out of a clip that goes on a multilingual page: the words stay HTML on the page.
- Render a draft, look at frames at rest and mid-move (`ffmpeg -ss <t> -frames:v 1`), then the final.
  The background of a clip matches the page it sits on.
- Brand colours and fonts of the product, never the template's defaults.

## 10. On the page

- A short muted loop with a poster, `playsinline`, lazy near the viewport, a pause button, and the
  still poster for reduced motion.
- A scroll scene: the pinned section's progress drives the scene's time (scrub) with a resting point per
  beat; a still version for reduced motion.

## 11. What the studio cannot do yet

Write it as a task in the studio's project (with XBrain: a task or a step of the studio's open
motion task) with what is needed, why, and the page or film that waits for it. Examples already asked:
objects with thickness, motion along a curve with many actors assembling one object, a big hand as an
actor that clicks, scroll-driven playback on a site, ready avatars of people and agents.
