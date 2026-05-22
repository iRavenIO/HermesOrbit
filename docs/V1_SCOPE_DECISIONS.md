# V1 Scope Decisions

## Purpose

This document is the canonical launch-scope decision for HermesOrbit v1.0.

Its purpose is to stop scope drift across the blueprint, parity audit, feature system, and roadmap.

## Scope labels

- **V1.0 native** — must ship as a first-class native surface
- **V1.0 limited native** — ships in v1, but in a narrowed or safer form
- **V1.x follow-up** — important, but not a launch blocker
- **Fallback-only** — available through a constrained admin fallback if needed, not full native treatment at launch

## Canonical V1.0 decisions

### Core operator surfaces — V1.0 native
- multi-instance connection and health summary
- home dashboard
- sessions list and session detail
- streaming chat and tool activity
- jobs list, run, pause, resume, delete
- basic job create/edit
- approvals inbox and approve/deny/stop flows
- push notifications for approvals, failures, completions, and connection issues
- gateway/platform status visibility
- artifact list and basic artifact viewing/downloading
- config browser and typed config editing for supported values
- secret presence, create/update, and gated reveal/change
- background-process visibility summary

### Knowledge/admin surfaces — V1.0 limited native
- skills: list, inspect, inspect linked files
- memory: list, add, replace, remove
- logs/errors: summary-first with drill-down for common diagnostics
- device trust: current device/session visibility and scoped trust state display

### Deferred to V1.x follow-up
- skill patch/edit flows
- advanced memory audit history
- full gateway/platform setup wizard
- richer process controls beyond visibility summary
- advanced artifact viewers and diff-heavy tooling
- widgets expansion beyond a minimal summary widget
- larger Siri/Shortcuts library beyond bounded launch actions

### Fallback-only if needed
- low-frequency or high-risk admin flows that are not yet safe enough for polished native UX
- deeply technical diagnostics that do not fit mobile attention patterns
- complex setup flows better served by desktop/web until simplified

## Product rule

If another document implies a different V1.0 scope than this file, this file wins until explicitly revised.

## Notes

- Push notifications and approval handling are **core V1.0**, not premium extras.
- Widgets and richer Shortcuts are **native differentiators**, but broad expansion belongs to V1.x.
- The goal is meaningful operator parity, not literal screen-for-screen parity with every Hermes surface.
