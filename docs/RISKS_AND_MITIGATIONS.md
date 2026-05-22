# Risks and Mitigations

## 1. Purpose

This document consolidates the major risks facing HermesOrbit and the mitigation strategy already built into the project direction.

## 2. Product risks

### Risk: the scope collapses under parity ambition
Why it matters:
- “full parity” can become an unbounded promise

Mitigation:
- maintain a strict launch cut
- keep parity defined as meaningful operator parity, not every web detail
- use `V1_SCOPE_DECISIONS.md` as the canonical launch-scope source of truth, with `HERMES_PARITY_AUDIT.md` as the supporting reference for native vs deferred vs unsupported surfaces

### Risk: the app becomes just a chat shell
Why it matters:
- then the product loses differentiation and pricing power

Mitigation:
- prioritize dashboarding, jobs, config, approvals, alerts, and multi-instance workflows
- preserve operator-console identity in every milestone

## 3. Technical risks

### Risk: raw Hermes surfaces are not stable enough for mobile consumption
Why it matters:
- mobile clients are brittle if they parse desktop-oriented or CLI-shaped responses

Mitigation:
- use a dedicated mobile API façade
- capability-discover features instead of assuming server shape
- version response contracts early

### Risk: realtime behavior breaks on iOS lifecycle constraints
Why it matters:
- iOS suspends apps aggressively and does not allow always-on desktop behavior

Mitigation:
- make server the source of truth
- use push notifications for re-entry moments
- design bounded reconnection flows
- rely on cached summaries rather than pretending the app is always live

### Risk: sensitive admin workflows are unsafe on phone
Why it matters:
- config and secret changes carry real operational impact

Mitigation:
- biometric gates
- explicit destructive-action confirmation
- auditability for sensitive writes
- device trust state model

## 4. Security risks

### Risk: credential exposure
Mitigation:
- keychain-backed storage
- no default raw-secret reveal
- rotation-friendly UX
- environment-scoped auth

### Risk: overpowered paired device
Mitigation:
- device trust states plus scoped permissions by device or token
- scopes such as observe, operate, admin, and secrets_admin
- device revocation and token rotation

### Risk: unclear action target
Mitigation:
- every write surface must show instance, environment, and object target clearly before confirmation

## 5. App Store and policy risks

### Risk: branding confusion or impersonation
Mitigation:
- avoid relying on “Hermes” as public primary brand
- use a distinct public brand with compatibility language where appropriate

### Risk: reviewer cannot test the app properly
Mitigation:
- provide review-safe demo environment
- include test credentials or review flow
- explain remote-control mechanics clearly in review notes

### Risk: monetization policy ambiguity
Mitigation:
- keep the first commercial story simple
- review IAP vs external-service boundaries before launch
- avoid mixed entitlement logic in early releases

## 6. Commercial risks

### Risk: the initial market is too narrow
Mitigation:
- start with a high-intent wedge rather than chasing mass market
- use self-hosted users as credibility base
- expand later into hosted and team plans

### Risk: users do not pay for control alone
Mitigation:
- ensure the app does more than monitor
- tie value to time saved, incidents prevented, and workflow continuity
- make push-driven approvals and interventions central to the product

## 7. Execution risks

### Risk: build team gets lost between investor story and implementation reality
Mitigation:
- separate investor docs, product blueprint, and implementation planning artifacts cleanly
- maintain exact source-of-truth docs per domain

### Risk: hosted-readiness remains hand-wavy
Mitigation:
- define identity, tenancy, RBAC, and entitlement workstreams explicitly before claiming hosted maturity

## 8. Summary

The most important meta-risk is vagueness.

HermesOrbit becomes risky when it is framed as a vague “AI app” or a vague “companion app.”
It becomes stronger when it is framed and built as a precise product:

> **a trustworthy mobile operator console for Hermes workflows, starting self-hosted and expanding into managed-hosted service.**
