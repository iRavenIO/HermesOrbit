# HermesMob Project Operating Map

## Purpose

HermesMob is a native iOS control surface for Hermes Agent. The repo is currently split between:

- product/spec docs in `docs/`
- an iOS SwiftUI app scaffold in `ios/`
- design/prototype artifacts in `.superpowers/` and top-level design docs

## Current control tower

The current executable app is the SwiftUI target in:

- `ios/Sources/HermesMobApp.swift`
- `ios/Sources/ContentView.swift`

The app is presently mock-data driven. There is no live network or persistence layer yet. That means the runtime contract is currently **view state + embedded mock models**, not a mobile API client.

## Repo layers

### 1. Product direction
Files under `docs/` define scope, parity, roadmap, and launch boundaries.

Most important:
- `docs/WEB_HERMES_MOBILE_PARITY_PLAN.md`
- `docs/V1_SCOPE_DECISIONS.md`
- `docs/DELIVERY_ROADMAP.md`
- `ios/Sources/FEATURE_MAP.md`

### 2. Native app scaffold
The iOS app lives in:
- `ios/project.yml`
- `ios/HermesMob.xcodeproj/`
- `ios/Sources/`

### 3. Review / design artifacts
HTML and design iteration artifacts live under:
- `.superpowers/`
- `DESIGN.md`

## Real source of truth for V1 structure
HermesMob V1 should mirror the actual Hermes web dashboard structure. The web source of truth is:

- `~/.hermes/hermes-agent/web/src/App.tsx`

Critical parity rules derived from web:
- root redirects to `Sessions`
- `Chat` is a runtime surface, not bubble chat
- `Logs` and `Cron` are first-class system surfaces
- `Models`, `Skills`, `Plugins`, `Profiles`, `Config`, and `Keys` must remain visible
- a `Docs` surface remains visible
- gateway status / active sessions should remain easy to reach

## Highest-risk file right now

### `ios/Sources/ContentView.swift`
This file currently contains:
- app state
- onboarding flow
- shell navigation
- all shared components
- all mock models
- all palette/theme constants

Why this is risky:
- one large file couples product IA, layout, and mock data
- onboarding bugs and shell-parity bugs come from the same file
- changes are hard to localize
- regressions are easy because layout logic is mixed with product copy and data

## Recent failure root causes found

### 1. Onboarding overlap bug
Symptom:
- stage header overlapped the screen body in simulator

Root cause:
- onboarding used an `.overlay(alignment: .top)` header plus manual spacer compensation in the body
- the layout depended on brittle fixed spacing instead of safe-area-aware composition

Safer pattern:
- use `safeAreaInset(edge: .top)` for persistent stage chrome
- use scrollable stage content instead of fixed spacer-driven vertical packing

### 2. Web parity drift
Symptom:
- initial shell implementation did not faithfully match the Hermes web information architecture

Root cause:
- implementation followed the earlier simplified mobile concept instead of the later parity-reset docs and actual `web/src/App.tsx`

Safer pattern:
- treat `web/src/App.tsx` + `docs/WEB_HERMES_MOBILE_PARITY_PLAN.md` as the V1 navigation contract
- keep docs updated when implementation changes

## Main execution path today

1. `HermesMobApp` boots SwiftUI app
2. `ContentView` decides between onboarding flow and app shell
3. onboarding advances through local state only
4. shell lands on Sessions-first mobile structure
5. all screens render static mock state for now

## Safe change zones
- copy changes in docs
- adding mock rows/items to an existing surface
- adding new view files if extracted from `ContentView.swift`

## Dangerous change zones
- changing onboarding layout without simulator verification
- changing tab/section IA without comparing to `web/src/App.tsx`
- editing project/build settings without rebuilding simulator target

## Debugging playbook

When the app looks wrong or fails:
1. rebuild with `xcodebuild` for simulator
2. launch in simulator via `simctl`
3. capture a screenshot
4. compare IA against `web/src/App.tsx` and `ios/Sources/FEATURE_MAP.md`
5. if issue is layout, inspect whether `overlay`/fixed spacers are causing brittle geometry

## Maintainer summary

HermesMob is still in scaffold-to-MVP transition. The biggest current engineering risk is not build failure — it is **information-architecture drift and layout brittleness inside one monolithic SwiftUI file**. Keep V1 grounded in Hermes web parity and favor safe-area-aware, scrollable native layouts.