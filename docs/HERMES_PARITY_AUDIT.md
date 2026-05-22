# Hermes Parity Audit

## Purpose

This document turns the product blueprint's parity ambition into a working audit artifact.

It maps the currently known Hermes control surfaces into one of these buckets:

- **Native in v1.0**
- **Native in v1.x follow-up**
- **Hosted-commercialization phase**
- **Fallback admin surface**
- **Not supported on mobile by design**

## Source inputs used for this audit

- Hermes web dashboard documentation
- Hermes API server documentation
- Hermes Open WebUI integration documentation
- Hermes CLI / gateway / config semantics summarized during project research
- `V1_SCOPE_DECISIONS.md` as the canonical launch-scope override when other documents drift

## Parity audit table

### 1. Dashboard home / status

- Agent version: **Native in v1.0**
- Gateway running/stopped state: **Native in v1.0**
- Connected platform states: **Native in v1.0**
- Active sessions count: **Native in v1.0**
- Recent sessions summary: **Native in v1.0**
- Recent jobs summary: **Native in v1.0**
- Error/health banner: **Native in v1.0**

### 2. Chat / interactive control

- Start a new session: **Native in v1.0**
- Continue existing session: **Native in v1.0**
- Streaming response output: **Native in v1.0**
- Tool activity visibility: **Native in v1.0**
- Attachments/images where supported: **Native in v1.0**
- Embedded full TUI terminal experience: **Fallback admin surface**
- Full keyboard-heavy slash-command fidelity: **Native in v1.x follow-up**

### 3. Sessions

- List sessions: **Native in v1.0**
- Search sessions: **Native in v1.0**
- Open transcript: **Native in v1.0**
- Resume from a session: **Native in v1.0**
- Export/share session artifacts: **Native in v1.x follow-up**

### 4. Config

- Search config values: **Native in v1.0**
- Edit typed settings: **Native in v1.0**
- Save config: **Native in v1.0**
- Reset-to-default compare flow: **Native in v1.x follow-up**
- JSON import/export: **Native in v1.x follow-up**

### 5. Secrets / environment

- Group secrets by category: **Native in v1.0**
- Show configured vs missing state: **Native in v1.0**
- Create/update secret: **Native in v1.0**
- Reveal raw secret value behind biometric gate: **Native in v1.0**
- Bulk secret import: **Fallback admin surface**

### 6. Jobs / cron

- List jobs: **Native in v1.0**
- View job details: **Native in v1.0**
- Create job: **Native in v1.0**
- Edit job: **Native in v1.0**
- Pause/resume job: **Native in v1.0**
- Run now: **Native in v1.0**
- Delete job: **Native in v1.0**
- Review latest output: **Native in v1.0**

### 7. Skills

- List installed skills: **Native in v1.0**
- Inspect skill metadata and content: **Native in v1.0**
- Inspect linked files: **Native in v1.0**
- Patch/edit skill content: **Native in v1.x follow-up**
- Install from skill hub: **Native in v1.x follow-up**
- Publish skill: **Fallback admin surface**

### 8. Memory / user profile

- View memory entries: **Native in v1.0**
- Add/replace/remove entry: **Native in v1.0**
- View audit/change history: **Native in v1.x follow-up**

### 9. Logs / diagnostics

- Gateway log tail: **Native in v1.0**
- Error feed: **Native in v1.0**
- API health: **Native in v1.0**
- Doctor-style summary: **Native in v1.0**
- Full low-level raw diagnostics bundle: **Fallback admin surface**

### 10. Messaging / gateway control

- View configured platforms: **Native in v1.0**
- Show connected/disconnected state: **Native in v1.0**
- Restart gateway: **Native in v1.0**
- View pending approvals: **Native in v1.0**
- Approve/deny actions: **Native in v1.0**
- Full platform setup wizard: **Native in v1.x follow-up**

### 11. Artifacts / outputs

- Recent screenshots/media outputs: **Native in v1.0**
- Cron output artifacts: **Native in v1.0**
- Share/open-in flow: **Native in v1.0**
- Arbitrary filesystem browsing: **Not supported on mobile by design**

### 12. Hosted future

- Self-hosted instance registration: **Native in v1.0**
- Managed-hosted instance list: **Hosted-commercialization phase**
- Provision a new hosted Hermes instance: **Hosted-commercialization phase**
- Billing/plan management: **Hosted-commercialization phase**

## Acceptance standard for parity claim

The product may claim **meaningful operator-parity MVP** only if these conditions are met:

1. every high-value operational surface above is either native in v1.0 or deliberately covered by a clearly labeled fallback admin path
2. every deferred surface is low-frequency or platform-constrained rather than core to everyday Hermes operation
3. the app supports at least one complete mobile workflow for:
   - chat
   - session management
   - cron/job management
   - config/secrets management
   - approvals
   - diagnostics

## Open validation tasks

- confirm current Hermes web dashboard implementation details against live running dashboard behavior
- map any undocumented admin flows discovered during implementation
- validate which surfaces require new backend work versus existing Hermes APIs
