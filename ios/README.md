# iOS Scaffold

This directory contains a **blueprint scaffold** for the future native iOS app.

It is intentionally minimal and exists to:

- lock in the intended app/module structure
- give Xcode/XcodeGen a clear starting point
- provide sample files for the first implementation pass

## Intended stack

- Swift 6+
- SwiftUI
- Observation
- URLSession + SSE streaming
- Keychain-backed secure credential storage
- XcodeGen for reproducible project generation

## Proposed high-level modules

- `App/` — app lifecycle and root navigation
- `DesignSystem/` — tokens, components, status colors, cards
- `Features/Home/`
- `Features/Chat/`
- `Features/Ops/`
- `Features/Manage/`
- `Networking/` — API clients and event streaming
- `Domain/` — models and capability definitions
- `Security/` — Keychain, biometrics, secrets gating
- `Support/` — diagnostics, configuration, previews

## Current files

- `project.yml` — XcodeGen project definition
- `Sources/HermesOrbitApp.swift` — sample app entry point
- `Sources/ContentView.swift` — sample shell view

## Generate an Xcode project later

```bash
cd ios
xcodegen generate
```
