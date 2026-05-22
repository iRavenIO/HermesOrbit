# App Store Naming Research

## 1. Goal

Evaluate whether a public product name close to **Hermes** can be used for an iOS app and what the safest naming strategy is.

## 1.1 Research scope and confidence

- Research date: `2026-05-21`
- Storefront basis: public US storefront sample during research
- Search method: public iTunes Search API / App Store discovery checks, **not** App Store Connect ownership verification
- Confidence: good for early conflict detection, not final reservation or legal clearance

## 2. What Apple Allows in Practice

Based on Apple documentation and App Store Connect guidance:

- app names are effectively claimed by creating an app record in App Store Connect if the name is currently available
- if another developer already uses the name, the name is unavailable unless a trademark claim succeeds
- Apple also rejects copycat or impersonating branding
- using another developer’s brand or product name in the app name or icon can create App Review and legal risk

Implication:

- **availability** is not the same thing as **safety**
- a technically available name can still be a risky choice if it creates confusion with another product or service

## 3. Public App Store Search Findings (US storefront sample)

The following names were checked against the public iTunes Search API as an early signal.

### High-risk / clearly conflicted

- **Hermes**
  - highly generic and already crowded
  - public storefront already contains multiple Hermes-branded apps and services
  - not recommended

- **Hermes Mobile**
  - exact public listing found: `Hermes Mobile`
  - not usable as a safe primary product name

- **Hermes Agent**
  - near-conflict surface exists with multiple Hermes-agent-related apps
  - examples found include:
    - `Claw - Hermes Agent`
    - `Hermes Agent - Mind Buddy`
    - `Hermes-cli-手机 AI 智能体 Agent 指挥部`
  - very risky from both confusion and originality standpoints

### Medium-risk / still too close

- **HermesPilot**
  - already found publicly as `HermesPilot - For Hermes Users`
  - not recommended

- **Hermes One**
  - near-conflicts exist, including `EFG Hermes-ONE`
  - not recommended

### Lower-conflict early signals, but still brand-risk if used as the primary name

- **Hermes Console**
- **Hermes Ops**
- **Hermes Command**
- **Pocket Hermes**
- **Hermes Relay**
- **Hermes Control**

These did not show strong exact public conflicts in the quick check, but they still carry these risks:

- “Hermes” remains a crowded and non-distinct term
- users may assume official affiliation with Hermes Agent / Nous Research
- App Review may still question potential impersonation depending on metadata and visuals

## 4. Recommendation

### Best strategy

Use:

- an **original standalone public brand** as the app name
- a compatibility subtitle or description referencing Hermes carefully

Example pattern:

- App name: `RelayOps`
- Subtitle: `Mobile control for Hermes Agent`

or:

- App name: `PocketOps`
- Subtitle: `Operate your Hermes agents`

or:

- App name: `Agent Console`
- Subtitle: `For self-hosted Hermes environments`

### Why this is strongest

This approach:

- reduces impersonation risk
- improves App Store safety
- gives room to evolve beyond Hermes if desired
- creates a stronger premium product identity
- preserves Hermes compatibility in metadata and onboarding

## 5. Internal vs Public Naming

Current project decision:

- **repo / project name**: `HermesOrbit`
- **iOS app name**: `HermesOrbit`
- **App Store reservation target**: `HermesOrbit`

This keeps the mobile product, Xcode project, and App Store target aligned.

## 6. Can We Reserve the Name?

### Practical answer

Yes, **if** the name is available, the normal way to reserve it is to create an app record in App Store Connect.

### Important caveats

- public search is only an early signal
- App Store Connect is the real source of truth for claimability
- a name may be unavailable even if it is not obviously visible in public search because it may already be reserved by another developer
- reserving a name does not remove trademark or impersonation risk

## 7. Recommended next-step shortlist for App Store Connect checks

Do final App Store Connect checks for names in this style:

### Direction A — operator / control-plane naming

- RelayOps
- Agent Console
- Control Plane Mobile
- PocketOps
- Runbook Mobile
- Ops Relay

### Direction B — Hermes-compatible but safer metadata-based strategy

- RelayOps — Mobile control for Hermes Agent
- PocketOps — Hermes control plane
- Agent Console — Self-hosted Hermes operations

### Direction C — premium founder/operator product naming

- Mission Relay
- QuietOps
- StackPilot
- Operator One
- Fleet Pocket

## 8.1 Ranked shortlist direction

### Highest-confidence direction
- `RelayOps`
- `PocketOps`
- `Mission Relay`

### Medium-confidence direction
- `Agent Console`
- `QuietOps`
- `StackPilot`

### Use with caution
- any name using `Hermes` directly in the primary App Store title

## 9. Final Naming Recommendation

Do **not** plan the public App Store launch around the primary name `Hermes`, `Hermes Mobile`, or `Hermes Agent`.

Use a standalone brand and position it as:

- compatible with Hermes Agent
- built for self-hosted and future hosted Hermes environments
- not affiliated with Nous Research unless explicit permission is obtained

## 10. Source Notes

This document is based on:

- Apple App Store Connect documentation about app records and naming availability
- Apple App Review anti-copycat and anti-impersonation rules
- public App Store search results retrieved through the iTunes Search API as an early signal
