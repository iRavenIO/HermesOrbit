# Delivery Roadmap

## 1. Roadmap goal

This roadmap turns the HermesMob thesis into a staged delivery story that is credible to investors, product leadership, and engineering.

The sequencing principle is:

> **Ship the smallest product that still feels like a real operator console, then expand into a hosted business on top of the same control surface.**

## 2. Release philosophy

The roadmap is intentionally not:
- “build everything at once”
- “launch a chat-only app and hope to catch up later”
- “hosted-first before the operator truth exists”

Instead:
- **Phase 1 proves product truth**
- **Phase 2 proves operational depth**
- **Phase 3 proves commercial expansion**

## 3. Phase breakdown

## Phase 0 — Documentation and proof framing

Objective:
- make the opportunity legible and credible before full implementation

Outputs:
- product blueprint
- business plan
- naming research
- parity audit
- API façade draft
- market and competitor docs
- investor narrative
- iOS scaffold

Exit criteria:
- coherent package exists for investor and implementation conversations
- launch thesis, positioning, and roadmap are internally consistent

## Phase 1 — Core self-hosted MVP

Objective:
- ship the first real iOS operator console for Hermes users

Product outcomes:
- multi-instance connectivity
- dashboard and monitoring
- session creation and continuation
- streaming chat with tool activity
- jobs and cron control
- config and secret management basics
- push-driven approvals and interventions
- skills inspection and memory CRUD basics
- artifact access and background-process visibility summary

Technical workstreams:
- mobile app architecture
- auth and device trust model
- mobile API façade minimum contract
- push notification pipeline
- local cache and reconnection model
- App Review-safe demo path

Success criteria:
- power users can operate Hermes meaningfully from phone without opening the web dashboard for routine actions
- app demonstrates clear native advantage over mobile web

## Phase 2 — Operator-depth expansion

Objective:
- deepen the app until it becomes the default off-desktop control plane

Product outcomes:
- richer logs and diagnostics
- better artifact handling
- better approval flows and audit surfaces
- stronger widgets and shortcuts
- better process visibility
- saved filters and environment views

Technical workstreams:
- richer event and stream model
- artifact and diff viewers
- stronger diagnostic packaging
- stronger notification routing and deep links

Success criteria:
- users trust HermesMob for day-to-day oversight and rapid intervention
- app becomes sticky beyond novelty

## Phase 3 — Hosted readiness and account layer

Objective:
- add the commercial layer that turns the app into the control surface for managed Hermes

Product outcomes:
- hosted account login
- hosted provisioning flow
- entitlements
- plan awareness
- support flows
- account-level instance management

Technical workstreams:
- account identity system
- tenancy model
- plan and entitlement service
- hosted fleet lifecycle APIs
- support and diagnostics APIs

Success criteria:
- hosted customers can onboard without self-hosting
- self-hosted and hosted users can coexist cleanly in one app

## Phase 4 — Team and enterprise expansion

Objective:
- support collaborative and higher-trust operational environments

Potential outcomes:
- shared environments
- RBAC
- approval delegation
- audit exports
- environment policies
- incident and escalation flows
- team notifications

This phase should not block the product thesis, but it can expand the business significantly.

## 4. Milestone narrative for investors

### Milestone A — “The product is real”
Evidence:
- native iOS app scaffold exists
- product and business docs are consistent
- first integration targets are defined
- clear App Store path exists

### Milestone B — “The wedge works”
Evidence:
- self-hosted users can connect real Hermes environments
- notifications and approvals work
- jobs, status, and sessions are controllable on mobile

### Milestone C — “Users trust it”
Evidence:
- repeat weekly usage for monitoring and intervention
- support burden remains manageable
- operator workflows happen off desktop without confidence loss

### Milestone D — “Commercial expansion is credible”
Evidence:
- hosted-ready architecture proven
- entitlement boundaries defined
- same app can sell a managed service later

## 5. Release gating criteria

## 5.1 MVP release gate
Before public launch, the team should be able to say:
- the app is not a demo shell
- reviewer can experience it without hidden setup dead-ends
- major write operations are protected and auditable
- push-driven workflows are understandable
- mobile advantage is obvious

## 5.2 Post-launch gate
Before expanding scope aggressively, confirm:
- which surfaces users actually touch most
- which mobile interruptions matter most
- whether config/secrets/admin are used frequently enough to deepen further
- whether hosted demand justifies account-layer acceleration

## 6. Delivery assumptions

### 6.1 Team assumptions for credible execution
A realistic delivery plan assumes at minimum:
- 1 iOS engineer
- 1 backend/platform engineer
- 1 product/design owner
- part-time security/review support for App Store, auth, and trust-sensitive flows

The package does not yet claim that this staffing is final. It is a planning assumption to keep the roadmap believable.

### 6.2 Illustrative duration ranges
These are planning ranges, not commitments:
- Phase 1: roughly `10–16 weeks` depending on mobile API readiness and push pipeline complexity
- Phase 2: roughly `6–10 weeks`
- Phase 3: roughly `8–14 weeks` depending on identity, tenancy, and entitlement scope
- Phase 4: highly variable and should begin only after product wedge proof

### 6.3 Critical dependencies
Phase 1 depends on:
- stable mobile API façade contracts
- device trust and auth model
- APNs registration and event routing
- review-safe demo or staging environment
- stable connection and reconnection behavior under iOS lifecycle constraints

## 7. Explicit MVP exclusions
To keep the first release credible, the following should not block launch unless user research proves they are essential:
- full team collaboration and RBAC
- enterprise audit export workflows
- large hosted billing surface
- advanced incident-management layers
- broad desktop-style diagnostics that do not fit mobile attention patterns

## 8. Measurement and “done” definitions

### Phase 1 is done when
- a real Hermes instance can be connected from iPhone
- sessions, jobs, status, and approvals can be managed without falling back to the web dashboard for routine operator actions
- critical write actions are scoped, auditable, and understandable
- review/demo environment is good enough for App Review and external demos

### Phase 2 is done when
- users repeatedly rely on HermesMob for off-desktop oversight and intervention
- artifacts, logs, and diagnostics are good enough to reduce laptop fallback for operator tasks

### Phase 3 is done when
- hosted account identity, entitlement boundaries, and instance lifecycle flows are defined and shippable
- self-hosted and hosted users can coexist in one coherent app model

## 9. Roadmap principles

### Principle 1 — Preserve product identity
Do not drift into a generic AI chat product.

### Principle 2 — Preserve operator trust
When in doubt, reduce surprise and increase explicitness.

### Principle 3 — Preserve hosted option value
Avoid self-hosted shortcuts that make hosted evolution impossible.

### Principle 4 — Preserve reviewability
Do not design a launch that only works for insiders.

## 10. What not to do

- do not launch as a thin wrapper around existing web views
- do not overload the first release with team/enterprise abstractions before core operator truth exists
- do not claim complete hosted readiness without identity, tenancy, and entitlement design
- do not treat security and trust as a polish layer

## 11. Summary

The roadmap is strongest when told simply:

1. **Start with self-hosted operators**
2. **Win mobile control and trust**
3. **Deepen operational stickiness**
4. **Expand into managed-hosted revenue**
5. **Add team and enterprise controls when the wedge is proven**

That sequence preserves speed, credibility, and strategic upside.
