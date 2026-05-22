# HermesOrbitile Design Prototype

Location: `HermesOrbit/.superpowers/brainstorm/mobile-prototype/`

## What this is

A browser-based HTML prototype showing the visual direction for the HermesOrbit iOS app. It includes:

- App icon explorations (with real logo assets)
- Launch / loading screen direction
- Add Hermes Instance flow mockup
- Foundation design system options (literal, native operator, enterprise trust)
- Green-forward palette revision
- Editorial headline direction

## Files

| File | Description |
|------|-------------|
| `index.html` | Wrapper page that loads all fragments. Start here. |
| `consumer-usability-direction.html` | Main direction: icon, launch screen, add-instance flow |
| `foundation-approaches.html` | Three foundation direction options |
| `foundation-green-shift.html` | Green-dominant palette revision |
| `foundation-headline-a.html` | Editorial title/heading direction |
| `preview-ready.html` | Initial status and navigation options |
| `logo*.png` | Resized logo assets used in mockups |

## How to view

```bash
cd /Users/kousha/Sites/Local/Applications/HermesMob/.superpowers/brainstorm/mobile-prototype
python3 -m http.server 8900
```

Then open http://localhost:8900

## Responsive

The prototype is responsive down to 320px viewport width.
- Phone mockups scale with `max-height` limits so they do not become skyscrapers on mobile
- Fixed-width mockup cards use `max-width` instead of `width`
- Padding reduces on screens below 640px

## History

- Originally created as `ios-preview-1779366438`
- Renamed to `mobile-prototype` on 2026-05-22
- CSS updated for mobile responsiveness on 2026-05-22
