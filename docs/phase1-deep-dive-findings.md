# HermesMob Phase 1 Deep Dive Findings

## What failed

### 1) Onboarding layout was structurally brittle
- The first pass used an `.overlay(alignment: .top)` header on top of onboarding content.
- Stage content was pushed down with a hardcoded `Spacer(minLength: 140)`.
- Result: header/title overlap and fragile spacing that depended on one device size.

### 2) The shell drifted from real Hermes Web parity
- The earlier implementation delivered a good-looking native scaffold, but it still simplified too much.
- It underrepresented the actual Hermes Web navigation and system grouping.
- Missing or weakened parity signals included:
  - Docs visibility
  - System grouping around Logs / Cron / Analytics / Gateway status
  - Manage grouping around Models / Skills / Plugins / Profiles / Config / Keys
  - Runtime-first Chat identity

### 3) The codebase had no repo-level map for the current native pass
- The repo had specs and delivery docs, but no short operator-grade map explaining:
  - where the iOS entry points live
  - what the current shell implements
  - what still remains out of scope

## Root causes
- I optimized the first pass for momentum and visual foundation instead of validating against the web-parity map strongly enough.
- I used a one-off layout trick for the onboarding header instead of a safe-area-driven structure.
- I treated the initial shell as a prototype preview instead of a stricter Phase 1 parity foundation.

## Fixes applied

### Layout / structure
- Replaced overlay-based onboarding layout with `safeAreaInset` top and bottom regions.
- Moved stage content into a scrollable scaffold to avoid clipping on smaller screens.
- Removed the brittle hardcoded spacing dependency that caused the visible overlap bug.

### Shell parity improvements
- Added a visible `Docs` tab.
- Kept `Sessions` as the default landing tab.
- Reworked `Chat` to feel runtime-first rather than generic chat-bubble-first.
- Reworked `System` around web-like operational surfaces.
- Reworked `Manage` around web-like management surfaces.
- Added a compact top status strip in shell screens.

### Repo clarity
- Added `docs/project-operating-map.md`.
- Captured this deep-dive note in `docs/phase1-deep-dive-findings.md`.

## Files changed
- `ios/Sources/ContentView.swift`
- `docs/project-operating-map.md`
- `docs/phase1-deep-dive-findings.md`

## Verification
- `xcodebuild -project HermesMob.xcodeproj -scheme HermesMob -destination 'platform=iOS Simulator,name=iPhone 17,OS=26.4.1' build`
- Result: `BUILD SUCCEEDED`
- Relaunched in Simulator and captured a fresh screenshot.

## Remaining obvious issues
- The launch screen is visually clean, but still static and not yet connected to real restore state.
- The onboarding header is fixed, but the welcome screen still uses a fairly tall top progress block that could be compacted in a later polish pass.
- Current screens are still foundation screens; they are not yet wired to live Hermes data or production navigation depth.
