# HermesOrbit

Native iOS control plane for [Hermes Agent](https://github.com/iRavenIO/HermesOrbit).

> **Status:** Phase 1 scaffold complete. Building toward MVP with full Hermes web-dashboard parity.

---

## What it is

HermesOrbit is a premium iPhone (and eventually iPad) app for operating Hermes AI agents on the go. It is not a simple chat wrapper — it is an **operator console** for managing sessions, approvals, jobs, system config, secrets, skills, memory, and artifacts natively.

## Current state

| Layer | Status |
|-------|--------|
| App scaffold (SwiftUI + XcodeGen) | Done |
| Design system (tokens, components, backgrounds) | Done |
| Tab shell (Home / Sessions / Ops / Manage / Account) | Done |
| Detail screens (Sessions, Ops, Manage, Account) | Phase 1 done |
| Mock data + preview | Done |
| Real networking layer | Not started |
| Push notifications | Not started |
| Physical device deployment | Blocked — needs Xcode Apple ID |

## Quick start

```bash
cd /Users/kousha/Sites/Local/Applications/HermesOrbit/ios
xcodegen generate
xcodebuild -project HermesOrbit.xcodeproj -scheme HermesOrbit \
  -destination 'id=8B20ECF1-97B2-4355-9A72-25E294993FBA' \
  ONLY_ACTIVE_ARCH=YES CODE_SIGNING_ALLOWED=NO build
```

Open `HermesOrbit.xcodeproj` in Xcode to run on simulator.

## Repository layout

```
HermesOrbit/
├── docs/                          # Investor + product docs
│   ├── PRODUCT_BLUEPRINT.md
│   ├── BUSINESS_PLAN.md
│   ├── DELIVERY_ROADMAP.md
│   ├── FEATURE_SYSTEM_AND_REQUIREMENTS.md
│   └── ...
├── ios/                           # Native iOS project
│   ├── Sources/
│   │   ├── App/                   # Root view + app state
│   │   ├── DesignSystem/          # Tokens, components, backgrounds
│   │   ├── Domain/                # Models + mock data
│   │   ├── Features/
│   │   │   ├── Home/              # Onboarding + main shell
│   │   │   ├── Chat/              # Runtime chat preview
│   │   │   ├── Sessions/          # Session list + detail
│   │   │   ├── Ops/               # Approvals, jobs, logs, diagnostics
│   │   │   ├── Manage/            # Config, secrets, skills, memory, artifacts
│   │   │   └── Account/           # Instances, security, settings
│   │   ├── Networking/            # API client (stub)
│   │   ├── Security/              # Auth + trust
│   │   └── Resources/             # Assets, icons, fonts
│   ├── HermesOrbit.xcodeproj      # Generated — do not edit directly
│   └── project.yml                # XcodeGen source of truth
├── artifacts/                     # Design assets (overlays, logos)
├── .superpowers/brainstorm/       # HTML prototype for design direction
└── DESIGN.md                      # Design system specification
```

## Design direction

- **Palette:** Dark green foundations (`#0A1715`), warm ivory text (`#F2EAD8`), muted gold accents (`#B89B5E`)
- **Mood:** Technical calm, premium, trustworthy
- **Light mode:** Cream/ivory surfaces for forms and modals
- **Prototype:** `.superpowers/brainstorm/mobile-prototype/` — open `index.html` in browser

## Naming

| Context | Name |
|---------|------|
| Project / repo | `HermesOrbit` |
| iOS app | `HermesOrbit` |
| Bundle ID | `com.kousha.hermesorbit` |
| GitHub | `iRavenIO/HermesOrbit` |

## Key decisions

1. **Self-hosted first** — connects to user's own Hermes instance
2. **Hosted-ready from day one** — architecture supports multi-tenancy later
3. **iPhone first, iPad later** — not a universal app initially
4. **SwiftUI + XcodeGen** — `project.yml` is source of truth
5. **No external dependencies** in Phase 1 — pure SwiftUI + Foundation

## Next steps

- [ ] Add Apple ID to Xcode for physical device builds
- [ ] Implement real networking layer against Hermes API
- [ ] Add push notification support for approvals/alerts
- [ ] Build hosted identity + tenancy flow
- [ ] App Store submission prep

## Links

- **GitHub:** https://github.com/iRavenIO/HermesOrbit
- **Prototype:** http://localhost:8900 (run `python3 -m http.server 8900` in `.superpowers/brainstorm/mobile-prototype/`)
