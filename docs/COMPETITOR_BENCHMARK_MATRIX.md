# Competitor Benchmark Matrix

## 1. Purpose

This matrix gives a practical side-by-side benchmark of the closest adjacent products discovered during research.

It is directional and qualitative. It is not a substitute for hands-on product teardown.

## 2. Comparison scale

- **Strong** — clearly present or central to positioning
- **Partial** — present in some form or likely present, but not positioned as a core strength
- **Weak/Unknown** — not clearly visible in public materials reviewed

## 3. Matrix

### HermesMob target position
- Product identity: native iOS operator console for Hermes Agent
- Core wedge: self-hosted-first mobile control plane with hosted-ready path

### Benchmark table

- **HermesMob (target)**
  - Chat/session control: Strong
  - Jobs/cron management: Strong
  - Approvals/interventions: Strong
  - Multi-instance support: Strong
  - Config/secrets/admin: Strong
  - Self-hosted compatibility: Strong
  - Native mobile trust model: Strong
  - Hosted expansion path: Strong
  - Notes: Most complete Hermes-native scope if executed well

- **AgentsRoom**
  - Chat/session control: Strong
  - Jobs/cron management: Partial
  - Approvals/interventions: Partial
  - Multi-instance support: Partial to Strong
  - Config/secrets/admin: Weak/Unknown
  - Self-hosted compatibility: Partial
  - Native mobile trust model: Partial
  - Hosted expansion path: Unknown
  - Notes: Strongest visible benchmark for mobile command-center UX around coding agents

- **Onepilot**
  - Chat/session control: Partial
  - Jobs/cron management: Strong
  - Approvals/interventions: Partial
  - Multi-instance support: Strong
  - Config/secrets/admin: Partial
  - Self-hosted compatibility: Strong
  - Native mobile trust model: Partial
  - Hosted expansion path: Weak/Unknown
  - Notes: Strong mobile SSH/ops + deployment story, but less dedicated Hermes-native control-plane identity

- **Open Minis**
  - Chat/session control: Strong
  - Jobs/cron management: Partial
  - Approvals/interventions: Weak/Unknown
  - Multi-instance support: Partial
  - Config/secrets/admin: Partial
  - Self-hosted compatibility: Weak for Hermes-specific remote-control use case
  - Native mobile trust model: Strong
  - Hosted expansion path: Weak/Unknown
  - Notes: Excellent proof for native private AI, but different job-to-be-done than HermesMob

- **Marmy / CcCompanion**
  - Chat/session control: Strong
  - Jobs/cron management: Partial
  - Approvals/interventions: Partial
  - Multi-instance support: Partial
  - Config/secrets/admin: Weak
  - Self-hosted compatibility: Strong
  - Native mobile trust model: Partial
  - Hosted expansion path: Weak
  - Notes: Strong validation for self-hosted companion demand, but narrower and less platform-like

- **Termius / Blink Shell**
  - Chat/session control: Weak
  - Jobs/cron management: Partial via terminal
  - Approvals/interventions: Weak via raw terminal only
  - Multi-instance support: Strong
  - Config/secrets/admin: Partial via raw terminal only
  - Self-hosted compatibility: Strong
  - Native mobile trust model: Strong at connection layer, weak at workflow layer
  - Hosted expansion path: Weak
  - Notes: Substitute tools for experts, not a product-level Hermes operator console

## 4. Competitive takeaway

HermesMob wins if it combines four things in one coherent product:
- Hermes-native workflow parity
- strong mobile approvals and interventions
- self-hosted credibility
- a clean future hosted account layer

Most adjacent products validate pieces of this thesis.
Very few appear to unify all four.
