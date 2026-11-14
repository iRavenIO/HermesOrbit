# Docs index

## Current docs

### Scope and product
- `docs/V1_SCOPE_DECISIONS.md`: canonical v1.0 launch scope; wins over other docs.
- `docs/PRODUCT_BLUEPRINT.md`: master product thesis, modules, security model, architecture.
- `docs/FEATURE_SYSTEM_AND_REQUIREMENTS.md`: feature layers, launch tiers, screens, requirements.
- `docs/HERMES_PARITY_AUDIT.md`: Hermes surfaces mapped to native, deferred or fallback.
- `docs/DELIVERY_ROADMAP.md`: phases 0 to 4, gates, planning duration ranges.
- `docs/RISKS_AND_MITIGATIONS.md`: product, technical, security, store and commercial risks.

### Navigation and parity (newest direction)
- `docs/WEB_HERMES_MOBILE_PARITY_PLAN.md`: reset plan: mirror real Hermes web dashboard navigation.
- `ios/Sources/FEATURE_MAP.md`: iOS module map following the web-parity reset.
- `docs/project-operating-map.md`: repo layers, risky files, safe change zones, debugging steps.
- `docs/phase1-deep-dive-findings.md`: onboarding overlap bug, parity drift, fixes applied.

### API
- `docs/MOBILE_API_CONTRACT_DRAFT.md`: draft `/mobile/v1` endpoints, scopes, trust, errors.

### Design
- `DESIGN.md`: color tokens, typography, trust UX, onboarding flow, icon direction.
- `docs/hermes-background-overlay-usage.md`: background overlay asset opacity and crop guidance.

### iOS app
- `ios/docs/PHASE1_BUILD_CONTEXT.md`: iOS build command, architecture list, per-tab navigation targets.
- `ios/README.md`: scaffold intent, intended stack, modules, xcodegen command.
- `ios/docs/IOS_ZERO_TO_ONE_PLAN.md`: phased plan from scaffold to device-ready app.
- `ios/docs/PROTOTYPE_TO_NATIVE_MAP.md`: prototype screen inventory and native build order.

### Business and market (investor package)
- `docs/DOCUMENTATION_INDEX.md`: older index of the investor and build doc package.
- `docs/BUSINESS_PLAN.md`: thesis, segments, revenue model, go-to-market.
- `docs/COMMERCIAL_MODEL_APPENDIX.md`: monetization stages, pricing bands, validation milestones.
- `docs/INVESTOR_NARRATIVE.md`: pitch, moat, business model direction.
- `docs/MARKET_LANDSCAPE.md`: category framing, demand signals, segments.
- `docs/COMPETITIVE_LANDSCAPE.md`: competitor groups and differentiation axes.
- `docs/COMPETITOR_BENCHMARK_MATRIX.md`: qualitative competitor comparison table.
- `docs/EVIDENCE_AND_ASSUMPTIONS_APPENDIX.md`: what is evidenced versus assumed.
- `docs/RESEARCH_REFERENCES.md`: public sources and interpretation caveats.
- `docs/APP_STORE_NAMING_RESEARCH.md`: App Store name conflicts and naming strategy.

### Generated
- `graphify-out/GRAPH_REPORT.md`: generated knowledge graph of the repo (2026-05-23).
- `ios/graphify-out/GRAPH_REPORT.md`: generated graph of iOS sources; shows networking and store code.

## Superseded or historical
- `docs/DOCUMENTATION_INDEX.md`: does not list the parity plan, operating map or iOS docs.
- `ios/docs/IOS_ZERO_TO_ONE_PLAN.md`: Phase 1 layout and the "scaffold only" description are old.
- `ios/docs/PROTOTYPE_TO_NATIVE_MAP.md`: Home/Sessions/Ops/Manage/Account tabs; replaced by the web-parity reset.
- `ios/README.md`: calls the iOS code a minimal scaffold with a sample `ContentView`.
- `docs/phase1-deep-dive-findings.md`, `docs/project-operating-map.md`: written when the app was mock-only and in one file.
- Both `graphify-out` reports: partly describe removed tooling (root report) and are point-in-time.

## Open questions for the owner
- Tabs: Home/Sessions/Ops/Manage/Account (`ios/docs/PHASE1_BUILD_CONTEXT.md`, `ios/docs/PROTOTYPE_TO_NATIVE_MAP.md`) vs Sessions/Chat/System/Manage/Docs (`docs/WEB_HERMES_MOBILE_PARITY_PLAN.md`, `ios/Sources/FEATURE_MAP.md`). Which is current?
- "No real networking yet" and "mock data only" (`ios/docs/PHASE1_BUILD_CONTEXT.md`, `docs/project-operating-map.md`) vs networking, Keychain and push code in `ios/graphify-out/GRAPH_REPORT.md`. What is the real state?
- Is `ContentView.swift` still one large file (`docs/project-operating-map.md`), or split into `App/`, `Features/` (`ios/docs/PHASE1_BUILD_CONTEXT.md`)?
- Light mode (`ios/docs/PHASE1_BUILD_CONTEXT.md`, `ios/docs/IOS_ZERO_TO_ONE_PLAN.md`) vs dark primary (`DESIGN.md`). Overlay doc says "light blue" background; `DESIGN.md` says parchment ivory.
- `DESIGN.md` says do not design the full shell, chat or sessions yet and names the app "HermesOrbitile". Is it still scoped to the foundation pass only?
- `docs/PRODUCT_BLUEPRINT.md` requires HTTPS only for remote access; `ios/project.yml` sets `NSAllowsArbitraryLoads: true`. Intended for dev only?
- `docs/APP_STORE_NAMING_RESEARCH.md` advises against a Hermes-based public name but records `HermesOrbit` as the App Store target. Is the name final?
- Is the mobile API facade built, or does the app call the Hermes web API directly? Sources: `docs/MOBILE_API_CONTRACT_DRAFT.md`, `docs/WEB_HERMES_MOBILE_PARITY_PLAN.md`.
- `ios/docs/PHASE1_BUILD_CONTEXT.md` and `ios/docs/IOS_ZERO_TO_ONE_PLAN.md` use the path `~/Sites/Local/Applications/HermesOrbit`; the repo is now under `IRavenIO/Applications`. Update the paths and the fixed simulator UDID?
- Docs cite `.superpowers/` prototypes and `~/.hermes/hermes-agent/...` sources (`docs/project-operating-map.md`). Are they still available? Not checked.
- The docs point at the Hermes web app under `~/.hermes/hermes-agent/web/`, which no longer exists on this Mac. Where is the web dashboard source now? (`docs/WEB_HERMES_MOBILE_PARITY_PLAN.md`)
