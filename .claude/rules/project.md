# HermesOrbit

Native iOS control plane for Hermes Agent. Self-hosted operators, founders and power users run Hermes on their own hosts and operate it from iPhone: sessions, chat, jobs, approvals, config, secrets. Managed hosting comes later.

## Layout
- Root (one git repo): `docs/` product docs, `DESIGN.md`, `ARCHITECTURE.html`, `VERSION`.
- `ios/` (separate local git repo): SwiftUI app. `ios/project.yml` is the source of truth. `HermesOrbit.xcodeproj` is generated.
- Stack: Swift 6, SwiftUI, iOS 18.0 minimum, URLSession with SSE, Keychain. Bundle ID `com.kousha.hermesorbit`. No test targets in `project.yml`.
- Build, from `ios/`: `xcodegen generate`, then `xcodebuild -project HermesOrbit.xcodeproj -scheme HermesOrbit -destination 'generic/platform=iOS Simulator' build`

## Rules for working here
- If docs disagree on v1 scope, `docs/V1_SCOPE_DECISIONS.md` wins.
- v1 navigation mirrors the real Hermes web dashboard. Web wins over older HermesOrbit docs. Sessions is the landing tab. Chat is a runtime surface, not chat bubbles.
- Native SwiftUI only. A WebView is allowed only as a fallback for rare admin screens.
- The app calls a `/mobile/v1/*` facade, never raw dashboard internals. The contract is a draft. Read capabilities before showing write controls.
- Scopes: observe, operate, admin, secrets_admin. Require a biometric check before revealing or changing secrets, restarting the gateway, or other destructive actions. Never show or cache raw secrets by default.
- Push notifications and approvals are core v1, not paid extras.
- Out of scope: arbitrary filesystem browsing, on-device Hermes runtime. Deferred to v1.x: skill editing.
- Every write screen shows instance, environment and target before confirmation.
- Design: green-forward, warm ivory text, rare gold, no pure white or black. Use semantic color tokens, not hardcoded colors. One primary action per screen. Technical detail one tap deeper. A trust warning must never look like success.
- When tabs or IA change, compare with the web app and update the docs.

## Known pitfalls
- An `.overlay` header with a fixed `Spacer` broke onboarding. Use `safeAreaInset` and scrollable content.
- Docs record `ios/Sources/ContentView.swift` as one large file mixing state, views, mock data and theme. Split new work into separate files.
- Changing tabs or IA without checking the web app caused parity drift.
- Changing project or build settings without a simulator rebuild is risky.
- Paths and the simulator UDID in `ios/docs/PHASE1_BUILD_CONTEXT.md` are machine specific. Do not copy them.
- `project.yml` allows arbitrary HTTP loads (`NSAllowsArbitraryLoads`) and sets `aps-environment: development`.

## Secrets
- No credentials were found in the docs read. Never print or quote a secret if one appears.

## Read more
- `docs/INDEX.md` (all docs, open questions)
- `docs/V1_SCOPE_DECISIONS.md`: canonical v1 launch scope
- `docs/WEB_HERMES_MOBILE_PARITY_PLAN.md`: web-parity navigation rules
- `docs/MOBILE_API_CONTRACT_DRAFT.md`: draft endpoints, scopes, errors
- `ios/docs/PHASE1_BUILD_CONTEXT.md`: build and navigation targets
- `docs/project-operating-map.md`: risks, safe change zones
- `DESIGN.md`: color tokens, trust UX
