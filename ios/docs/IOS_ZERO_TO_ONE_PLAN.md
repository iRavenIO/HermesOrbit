# HermesOrbit Native iOS — Zero to One Plan

> **For Hermes:** build this as a real native SwiftUI app, not a placeholder shell.

**Goal:** Turn the current HermesOrbit scaffold into a real native iOS operator app that can connect to Hermes instances, show sessions, stream chat, expose system state, and manage approvals/config safely.

**Current reality:** `/Users/kousha/Sites/Local/Applications/HermesOrbit/ios` is only a scaffold. It has `project.yml`, `HermesOrbitApp.swift`, and one large `ContentView.swift`. It is not yet an MVP.

**Product direction:** pure native iOS, premium-simple, light mode, grounded in the approved prototype/reference and existing Hermes product behavior.

**North-star v1:** one app that lets Kousha restore/connect an instance, browse sessions, open a chat thread, see system health, and manage safe operator actions from phone.

---

## Phase 0 — Foundation reset
1. Freeze the scaffold mentally as non-authoritative UI.
2. Treat the existing `ContentView.swift` as throwaway reference, not architecture.
3. Keep XcodeGen as the source of truth.
4. Preserve the existing bundle/product identity unless explicitly renamed.

## Phase 1 — Real app shell
**Outcome:** simulator-runnable native shell with real navigation structure.

Planned structure:
- `Sources/App/` — app entry, router, root tabs
- `Sources/DesignSystem/` — colors, spacing, cards, buttons, typography
- `Sources/Features/Home/` — instance overview and recent sessions
- `Sources/Features/Chat/` — session list, thread view, composer
- `Sources/Features/Ops/` — system health, queue, alerts, approvals summary
- `Sources/Features/Manage/` — agent/instance management and safe actions
- `Sources/Networking/` — API client, auth, streaming, DTOs
- `Sources/Domain/` — models and protocols
- `Sources/Security/` — keychain, biometrics, trust state
- `Sources/Support/` — previews, fixtures, diagnostics, config

Milestones:
- onboarding/connect flow
- tab shell
- state container
- design tokens
- mock-backed feature screens split into files

## Phase 2 — Real data boundaries
**Outcome:** app can authenticate and load real instance/session data safely.

Add:
- environment config
- API client
- auth/session store
- keychain token persistence
- streaming chat transport
- health/status fetches

## Phase 3 — Operator workflows
**Outcome:** meaningful mobile utility, not just read-only browsing.

Add:
- approval inbox
- safe action confirmations
- config/status surfaces
- reconnect/retry logic
- offline/error states

## Phase 4 — Device readiness
**Outcome:** signed, device-runnable build.

Add:
- signing/team config
- app icons / launch polish
- test pass
- simulator verification
- device verification

---

## First implementation slice
Build the first real slice in this order:
1. Extract app shell out of `ContentView.swift`
2. Create `AppRootView` with native tab shell
3. Create `OnboardingFlowView` with connect / trust / ready stages
4. Add a lightweight `AppState` / `SessionStore` for mock-backed state
5. Split Sessions, Chat, System, and Manage surfaces into separate files
6. Make the simulator build clean again before any networking work

## Non-goals for the first slice
- no App Store packaging yet
- no push notifications yet
- no backend mutation without explicit review
- no pretending mocks are production

## Success criteria for the next checkpoint
- project still generates/builds
- root UI is modular, not one giant file
- app launches into a real native shell
- onboarding, sessions, chat preview, and system overview work with coherent mock state
- codebase is ready for API wiring instead of needing another reset
