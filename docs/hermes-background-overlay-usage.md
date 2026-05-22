# HermesMob Background Overlay Usage

## Asset files
- PNG: `ios/Sources/Resources/hermes-atmosphere-overlay.png`
- SVG: `ios/Sources/Resources/hermes-atmosphere-overlay.svg`

## Intent
This is a transparent decorative atmosphere layer, not the page background itself.

It is designed to sit over the app's real background color so the color system remains visible in both light and dark mode.

## Recommended usage
### Dark mode
- Base: `background.primary` / the dark HermesMob background gradient
- Overlay opacity: `10%–16%`
- Current implementation target: `14%`

### Light mode
- Base: `background.primary.light` / the light blue HermesMob background gradient
- Overlay opacity: `4%–8%`
- Current implementation target: `6%`

## Cropping guidance
- Launch / onboarding: use the **top** crop so the upper-right emblem and top arcs carry the brand mood.
- Home / Sessions / Chat: use the **middle** crop so the overlay feels quieter and less hero-like.
- Settings / Manage / System / Docs: use the **lower** crop so the lower arcs subtly differentiate deeper screens.

## Safety notes
- The overlay has **no solid fill**.
- Decorative marks are intentionally pushed toward edges and corners.
- The central content area stays mostly open for cards and text.
- If readability drops on any screen, lower the overlay opacity before changing the base theme colors.
