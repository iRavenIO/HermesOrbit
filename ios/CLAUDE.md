# HermesOrbit iOS — Phase 1 Build Context

## Project
- Native SwiftUI iOS app for Hermes AI agent control plane
- XcodeGen-based project: `project.yml` is source of truth
- Product direction: premium-simple, light mode, grounded in Hermes web dashboard parity
- Target: iPhone first, iPad later

## Build
```bash
cd /Users/kousha/Sites/Local/Applications/HermesMob/ios
xcodegen generate
xcodebuild -project HermesOrbit.xcodeproj -scheme HermesOrbit -destination 'id=8B20ECF1-97B2-4355-9A72-25E294993FBA' ONLY_ACTIVE_ARCH=YES CODE_SIGNING_ALLOWED=NO build
```

## Architecture (existing)
- `Sources/HermesOrbitApp.swift` — App entry point
- `Sources/App/` — HermesOrbitRootView.swift, HermesOrbitAppState.swift
- `Sources/DesignSystem/` — HermesDesignSystem.swift, MetricPanel.swift
- `Sources/Domain/` — HermesMockModels.swift
- `Sources/Features/Home/` — OnboardingFlowView.swift, MainShellView.swift
- `Sources/Features/Chat/` — RuntimeChatPreviewView.swift
- `Sources/Features/Ops/` — SystemOverviewView.swift
- `Sources/Features/Manage/` — ManageOverviewView.swift

## Design system tokens
- `HermesPalette` — textPrimary, textSecondary, textMuted, accent, cardBackground, etc.
- `GlassCard` — frosted card container
- `StatusBadge` — positive / warning / critical / neutral
- `ActionRow` — tappable row with icon, title, subtitle
- `HermesBackground` — animated gradient background
- `TabBarItemLabel` — custom tab bar labels using image assets (not SF Symbols for tabs)

## Current state
- App launches into onboarding → tab shell
- 5 tabs: Home, Sessions, Ops, Manage, Account
- All tabs are overview stubs with NO navigation depth
- No detail screens exist
- Mock data in `HermesMockModels.swift`
- No real networking yet (expected for Phase 1)

## Navigation target per tab
### Sessions tab
- Session list (exists) → Session Detail (transcript, tool calls, resume action, artifact preview)

### Ops tab
- Ops overview (exists) → Approvals list → Approval Detail (approve/deny/stop)
- Ops overview → Jobs list → Job Detail (run/pause/resume/delete, schedule, output)
- Ops overview → Logs viewer
- Ops overview → Diagnostics
- Ops overview → Gateway status
- Ops overview → Background Processes

### Manage tab
- Manage overview (exists) → Config list → Config detail/editor
- Manage overview → Secrets list → Secret detail (gated reveal)
- Manage overview → Skills list → Skill detail
- Manage overview → Memory list → Memory detail/editor
- Manage overview → Artifacts list → Artifact detail

### Account tab
- Account overview (exists) → Instances list → Instance detail
- Account overview → Security settings
- Account overview → Notifications settings
- Account overview → Audit Log
