# HermesOrbit Prototype → Native SwiftUI Map

Source of truth inspected:
- `/Users/kousha/.hermes/hermes-agent/artifacts/hermesmob-web-prototype/app.js`
- `/Users/kousha/.hermes/hermes-agent/artifacts/hermesmob-web-prototype/SCREEN_INVENTORY.md`
- `/Users/kousha/.hermes/hermes-agent/artifacts/hermesmob-brand-direction/PRODUCT-IA.md`

## Top-level native tabs now aligned to prototype
- Home
- Sessions
- Ops
- Manage
- Account

## Prototype screen inventory
### Foundation
- `launch`
- `onboarding-welcome`
- `onboarding-connect`
- `onboarding-trust`
- `onboarding-ready`

### Home
- `home`

### Sessions
- `sessions`
- `session-detail`

### Ops
- `approvals`
- `approval-detail`
- `jobs`
- `job-detail`
- `logs`
- `diagnostics`
- `gateway`
- `background-processes`

### Manage
- `manage`
- `config`
- `secrets`
- `skills`
- `memory`
- `artifacts`

### Account
- `account`
- `instances`
- `security`
- `notifications`
- `audit-log`

## Native implementation status
### Already implemented in SwiftUI structure
- Launch / onboarding flow
- Home tab shell
- Sessions tab shell
- Ops tab shell
- Manage tab shell
- Account tab shell
- Shared design system and mock-backed state

### Next native screens to build in order
1. Session Detail
2. Approvals + Approval Detail
3. Jobs + Job Detail
4. Logs + Diagnostics + Gateway + Background Processes
5. Config + Secrets + Skills + Memory + Artifacts
6. Instances + Security + Notifications + Audit Log

## Current native file layout
- `Sources/App/HermesOrbitRootView.swift`
- `Sources/App/HermesOrbitAppState.swift`
- `Sources/Features/Home/OnboardingFlowView.swift`
- `Sources/Features/Home/MainShellView.swift`
- `Sources/Features/Ops/SystemOverviewView.swift`
- `Sources/Features/Manage/ManageOverviewView.swift`
- `Sources/DesignSystem/HermesDesignSystem.swift`
- `Sources/DesignSystem/MetricPanel.swift`
- `Sources/Domain/HermesMockModels.swift`

## Build status
- `xcodegen generate` succeeded
- `xcodebuild -project HermesOrbit.xcodeproj -scheme HermesOrbit -destination 'generic/platform=iOS Simulator' build` succeeded
