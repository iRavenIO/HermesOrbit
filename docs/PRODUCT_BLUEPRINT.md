# HermesMob Product Blueprint

## 1. Executive Summary

HermesMob is a native iOS control plane for Hermes Agent.

The product goal is not to create another chat client. The goal is to build the best mobile interface for operating Hermes Agent across self-hosted and future managed-hosted deployments.

The blueprint deliberately targets:

- **MVP with meaningful Hermes operator-workflow parity**
- **native iPhone and iPad UX** instead of a thin WebView wrapper
- **self-hosted first** for speed and credibility
- **hosted-readiness from day one** so the same app can evolve into the mobile control plane for a managed Hermes cloud
- **App Store-safe positioning** through original branding, explicit disclosure, and meaningful native functionality

## 2. Product Thesis

### Core claim

**Not just chat with AI. Operate AI agents.**

### User promise

From an iPhone or iPad, a user should be able to:

- connect to one or more Hermes instances
- chat with an agent
- monitor activity and runtime health
- inspect sessions, jobs, logs, skills, and memory-related surfaces
- review and manage configuration
- trigger workflows and jobs
- approve or interrupt remote actions
- move seamlessly from self-hosted Hermes to future managed Hermes hosting

### Strategic wedge

HermesMob wins if it becomes the most trustworthy and most operator-grade mobile surface in the Hermes ecosystem.

The wedge is not generic AI chat. The wedge is:

- control
- visibility
- remote action
- async operations
- infra-aware mobile workflows

## 3. Product Scope Principle

The user explicitly wants the MVP to include **all meaningful high-frequency operator capabilities currently represented in the Hermes web experience**.

That means the MVP is not a reduced chat-only mobile app.

It is a **parity MVP** with the following rule:

> If a Hermes power user expects to manage or inspect it from the web dashboard or the practical Hermes control surface today, the mobile app should expose it in the MVP **when it is high-frequency, mobile-safe, and trust-preserving**. Low-frequency or risky admin surfaces may ship as fallback or follow-up features instead of day-one native coverage.

## 4. User Types

### 4.1 Self-hosted operator

Runs Hermes on a Mac, Linux host, VPS, homelab, or container.

Needs:

- mobile access
- observability
- remote control
- confidence in what the agent is doing
- quick intervention when away from desktop

### 4.2 Power user / founder / engineer

Uses Hermes for:

- coding and debugging
- research
- cron jobs
- workflows
- gateway messaging
- multiple projects and instances

Needs:

- multiple environments
- activity visibility
- fast actions
- strong information hierarchy

### 4.3 Future managed-hosting customer

Does not want to install or maintain Hermes manually.

Needs:

- account-based onboarding
- hosted environment provisioning
- clear plans and limits
- trust and operational clarity

## 5. MVP Definition: Full Web-Parity Mobile Control Plane

## 5.1 MVP pillars

The MVP must include these pillars:

1. **Conversation and control**
2. **Ops visibility**
3. **Configuration and credentials management**
4. **Automation and scheduling**
5. **Knowledge and skill management**
6. **Deployment and connection management**
7. **Mobile-native notifications and approvals**

## 5.2 MVP modules

### A. Instance management

Users can add and manage multiple Hermes targets.

Support in MVP:

- self-hosted local/LAN Hermes
- self-hosted remote Hermes via HTTPS
- profile-aware connection entries
- named environments: personal, lab, work, staging, production
- health check per instance
- version display per instance
- capability detection per instance

### B. Native chat and session runtime

Parity target with Hermes chat surfaces.

Support in MVP:

- create session
- resume session
- switch model/provider if server exposes it
- streaming responses
- display tool activity inline
- display reasoning/tool progress cards when available
- send text, images, voice note, file references where supported
- slash-command-inspired quick actions via native command palette
- background-safe reconnection behavior
- pin/favorite sessions
- branch/fork-style session actions if server surface supports them

### C. Session browser

Support in MVP:

- recent sessions list
- search sessions
- filter by instance, date, model, activity
- inspect session metadata
- jump into transcript
- continue session
- export/share transcript link or artifact where available

### D. Status and health dashboard

Native equivalent of the Hermes status/dashboard home.

Support in MVP:

- agent version
- gateway status
- active sessions count
- recent jobs
- connected platforms
- background process visibility
- scheduler health
- memory/tool availability summary
- last error snapshot

### E. Job and cron management

Support in MVP:

- list jobs
- inspect prompt, schedule, destination, model, tools
- create job
- edit job
- pause/resume job
- run now
- delete job
- review latest output
- receive mobile notifications for completion/failure

### F. Config management

Parity target with the web config editor.

Support in MVP:

- categorized config browser
- typed controls for known booleans/enums/strings/numbers
- search settings
- edit and save config
- restart-required warnings

Future follow-up if backend maturity justifies it:
- compare current vs default
- import/export config JSON or YAML snapshots where safe

### G. Secrets / environment management

Support in MVP:

- view presence/absence of keys without exposing raw values by default
- create/update secret values
- show provider/tool/platform grouping
- rotate values
- track last-updated metadata if supported
- require biometric confirmation before showing or changing sensitive entries

### H. Skills management

Support in MVP:

- list installed skills
- inspect skill details
- inspect linked files
- patch/edit skill content in v1.x once the mobile API and trust model are mature enough
- install skill from hub in future hosted mode or when backend supports it

### I. Memory and user context surfaces

Support in MVP:

- inspect memory items and user-profile entries if exposed safely
- add/replace/remove entries
- show where the item belongs: user vs memory

Future follow-up if backend maturity justifies it:
- audit recent changes

### J. Logs and diagnostics

Support in MVP:

- gateway log tail
- error feed
- API server health
- last failing task or background process
- doctor-style checklist view
- red/yellow/green diagnostics summary

### K. Messaging / gateway management

Support in MVP:

- view configured platforms
- platform connection state
- pairing/authorization visibility
- restart gateway
- approve/deny pending actions
- view pending confirmations and dangerous-command approvals

### L. Files and artifacts surface

MVP should expose Hermes-generated artifacts, not full arbitrary filesystem browsing unless safely scoped.

Support in MVP:

- recent exports
- screenshots/media outputs
- cron outputs
- generated artifacts
- download/share open-in support

### M. Notifications and interruptibility

This is a core mobile differentiator.

Support in MVP:

- job completed
- job failed
- approval required
- gateway disconnected
- agent waiting on user decision
- deployment health degraded
- long-running task finished

### N. Command palette / quick actions

Support in MVP:

- ask Hermes
- start a job
- run saved prompt
- restart gateway
- check health
- open logs
- open session by recent history
- create instance
- switch environment

## 5.3 Hermes Web-Parity Matrix

This matrix turns the parity requirement into a verifiable inventory.

- **Must ship** means the surface is required in v1.0.
- **Deferred parity** means the capability matters, but the first release may represent it through a narrower native flow.
- **Out of scope** means it is intentionally excluded from the mobile product for safety or focus reasons.

- Status / health overview: **Must ship**
- Chat / session runtime: **Must ship**
- Session browser and resume flows: **Must ship**
- Cron jobs: **Must ship**
- Logs and diagnostics: **Must ship**
- Config editor: **Must ship**
- Secrets / `.env` management: **Must ship**
- Skills management: **Must ship**
- Memory surfaces: **Must ship**
- Gateway / platforms state: **Must ship**
- Artifacts / outputs: **Must ship**
- Background process visibility: **Must ship**
- Embedded in-browser TUI fallback: **Deferred parity**
- Full arbitrary filesystem browsing: **Out of scope**
- Dashboard theme/plugin authoring: **Deferred parity**

## 5.4 Strict Launch Cut

The user wants a parity-grade MVP. To keep that credible, the launch cut must still separate **ship-blocking parity** from **post-launch parity deepening**.

### Must ship in v1.0

- Canonical scope note: if this section drifts from `V1_SCOPE_DECISIONS.md`, that file wins for launch decisions.

- instance management
- native chat and sessions
- health/status dashboard
- jobs / cron management
- logs and diagnostics
- config editor
- secrets management
- skills list + inspect flows
- gateway/platform status
- approvals and notifications
- artifact browsing
- limited-native launch support for memory entry management, current device trust-state visibility, and background-process visibility summary

### Can land in v1.1–v1.3 without violating the parity thesis

- advanced memory auditing UI
- richer skill authoring templates
- full background-process terminal-like interactions
- embedded fallback admin WebView for rare unsupported screens
- widgets and Siri Shortcuts if they threaten launch quality

Rule: **v1.0 must cover all high-value operational surfaces; v1.1+ can deepen lower-frequency or platform-constrained parity edges.**

## 6. What Makes the Product Native Instead of a Web Wrapper

The app should not be a single embedded dashboard.

It should feel like a first-class iOS product by using:

- SwiftUI navigation split views
- tab-based operator information architecture
- push notifications
- widgets for health/job status
- Siri Shortcuts for key actions
- biometric protection for secrets and destructive actions
- native share sheet for exporting artifacts and transcripts
- background refresh for health and job states where feasible
- deep links into sessions, jobs, and approvals

A WebView may still be allowed as a fallback for rare admin surfaces, but it must not define the product.

## 7. Recommended Information Architecture

### Primary tabs

1. **Home**
   - instance switcher
   - health summary
   - active jobs
   - pending approvals
   - recent sessions

2. **Chat**
   - sessions list
   - active session
   - command palette
   - attachments

3. **Ops**
   - jobs
   - logs
   - diagnostics
   - platform status
   - background processes

4. **Manage**
   - config
   - secrets
   - skills
   - memory
   - environments

5. **Account**
   - hosted future entry point
   - app settings
   - notification settings
   - security
   - diagnostics bundle export

## 8. Architecture Blueprint

## 8.1 Product architecture phases

### Phase 1: Self-hosted-first mobile control plane

- app connects to Hermes API and operator endpoints
- user brings their own Hermes instance
- app stores connection definitions securely in Keychain / secure local store
- app reads and writes to Hermes through authenticated APIs

### Phase 2: Hosted-ready abstraction layer

Introduce a server capability abstraction:

- self-hosted connection
- managed-hosted connection
- hybrid customer-owned deployment managed by your platform

The app should not hardcode assumptions that every instance is a raw local box.

### Phase 3: Managed-hosted Hermes

Your future server layer adds:

- account auth
- instance provisioning
- plan entitlements
- telemetry aggregation
- billing
- deployment orchestration
- shared fleet dashboard

## 8.2 Backend/API implication

Hermes today already has useful APIs and dashboard semantics, but a polished mobile app will benefit from a dedicated **mobile control API façade**.

Recommended direction:

- do **not** make the iOS app parse raw dashboard internals
- do **not** depend only on ad hoc CLI-shaped responses long term
- create a stable API contract for mobile surfaces

Recommended mobile API groups:

- `/mobile/v1/instances/*`
- `/mobile/v1/status/*`
- `/mobile/v1/sessions/*`
- `/mobile/v1/jobs/*`
- `/mobile/v1/config/*`
- `/mobile/v1/secrets/*`
- `/mobile/v1/skills/*`
- `/mobile/v1/memory/*`
- `/mobile/v1/logs/*`
- `/mobile/v1/approvals/*`

For self-hosted V1, this façade can be implemented as a small companion service or plugin in front of Hermes primitives.
The route groups above are conceptual; `MOBILE_API_CONTRACT_DRAFT.md` is the authoritative contract draft for concrete endpoint shapes and versioning.

## 8.3 Security model

Required principles:

- HTTPS only for remote access
- token-based auth or signed session auth
- optional local-network mode with explicit trust banner
- biometric gate for secrets and dangerous actions
- per-instance scoped credentials
- no default plaintext secret display
- audit log for destructive actions
- app-side caching should exclude raw secret values unless explicitly needed

## 8.4 Mobile API façade requirements

To make the app buildable, the backend workstream must explicitly define what is already provided by Hermes versus what the mobile façade must add.

### Backend responsibilities

- normalize Hermes status/config/job/session/log outputs into stable mobile-friendly schemas
- enforce auth, scopes, and audit logging
- expose notification hooks for approvals, job completion, and failures
- provide capability discovery so the app can degrade gracefully across Hermes versions

### Minimum contract groups

This list is the minimum launch-oriented surface map, not the exhaustive contract. `MOBILE_API_CONTRACT_DRAFT.md` remains the authoritative endpoint draft.

- `POST /mobile/v1/devices/register`, `POST /mobile/v1/auth/refresh`, `GET /mobile/v1/auth/session`
- `GET /mobile/v1/capabilities`
- `GET /mobile/v1/status`
- `GET /mobile/v1/sessions`, `GET /mobile/v1/sessions/:id`, `POST /mobile/v1/sessions/:id/continue`
- `GET /mobile/v1/artifacts/*`
- `GET/POST/PATCH /mobile/v1/jobs/*`
- `GET/PUT /mobile/v1/config/*`
- `GET/PUT /mobile/v1/secrets/*`
- `GET /mobile/v1/skills/*` in launch scope, with skill patch/edit endpoints deferred to v1.x
- `GET/POST/PATCH /mobile/v1/memory/*`
- `GET /mobile/v1/logs/*`, `GET /mobile/v1/processes`, `GET /mobile/v1/audit`
- `GET/POST /mobile/v1/approvals/*`
- `GET /mobile/v1/gateway`, `GET /mobile/v1/platforms`
- `POST /mobile/v1/push/register`

### Ownership recommendation

- HermesMob app team owns the client contracts and UX
- Hermes companion/mobile API layer owns compatibility mapping and notification hooks
- future hosted platform owns tenancy, billing state, and fleet-aware capabilities

## 8.5 Threat model and trust model

The product controls remote systems, so the security model must be explicit.

### Primary threats

- stolen phone with active session
- leaked access token
- MITM on poorly configured self-hosted endpoint
- accidental destructive action from mobile quick flows
- unsafe secret editing or overbroad admin privileges

### Required mitigations

- short-lived access tokens with refresh or device-bound session renewal
- remote revocation per device
- optional certificate pinning or trust-on-first-use mode for advanced self-hosters
- least-privilege scopes: observe, operate, admin, secrets_admin
- biometric gate before:
  - revealing secret values
  - editing secrets
  - restarting gateway
  - executing destructive job/config actions
- clear lost-device recovery flow in server settings
- audit log entries for every destructive admin action from mobile

### Device trust model

Backend trust states:
- `pending`
- `trusted`
- `restricted`
- `revoked`

Example device classes for UX framing:
- personal admin device
- observer-only device
- temporary session device

## 9. Design Direction

### Visual tone

The app should feel:

- technical
- premium
- calm
- trustworthy
- high signal, low noise

### UX metaphors

Preferred metaphors:

- operator console
- mission control
- async command center
- agent fleet cockpit

Avoid:

- toy chatbot styling
- neon gimmicks
- “AI magic” vagueness
- cluttered dashboard density without hierarchy

### Mobile UI patterns

- dense but readable cards
- timeline-based activity streams
- collapsible detail views
- status chips and severity colors
- bottom sheet quick actions
- large-title overview screens for readability
- split-view support on iPad

## 10. App Store-Safe Product Framing

Public framing should be:

- a client for user-controlled Hermes environments or hosted customer environments
- an original product with independent branding
- clear disclosures about remote execution and AI-provider usage
- meaningful native functionality beyond a wrapped website

Avoid public framing that implies:

- official Nous ownership without permission
- unsafe or hidden system behavior
- misleading “fully local” claims when actions happen on remote Hermes hosts

## 10.1 App Review readiness checklist

The launch package should include:

- a review-safe demo environment
- a reviewer account or test instance with non-destructive capabilities
- in-app disclosure that remote actions execute on the connected Hermes host
- privacy explanation for prompts, files, third-party model providers, and notifications
- explicit consent before enabling high-risk features
- support URL and documentation page explaining self-hosted vs hosted behavior

## 11. MVP Delivery Strategy

## 11.1 Recommended milestone split

### Milestone A — Foundation and connection layer

- app shell
- auth/instance model
- health check
- capability detection
- secure storage
- design system

### Milestone B — Chat and sessions

- streaming chat
- session browser
- recent sessions
- quick actions
- transcript UX

### Milestone C — Ops parity

- status dashboard
- jobs
- logs
- approvals
- gateway/platform visibility

### Milestone D — Management parity

- config editor
- secrets management
- skills
- memory
- exports/artifacts

### Milestone E — Native premium layer

- widgets
- Siri Shortcuts
- richer deep links and notification categories
- faster approval-entry UX
- premium mobile convenience flows

Note: baseline push notifications and approval handling belong to the core MVP. This milestone deepens the native layer rather than introducing the first approval capability.

## 11.2 Non-goals for initial MVP

To preserve schedule, avoid in MVP:

- on-device full Hermes runtime
- arbitrary local shell execution on the iPhone itself
- visual workflow builder
- social/community marketplace
- team RBAC unless needed by hosted alpha
- complex multi-tenant billing inside the app

## 11.3 iOS platform constraint notes

The product must respect iOS background limits.

- persistent long-running background execution is not assumed
- approval and completion awareness should rely on server-originated push notifications
- widgets must use cached summary state, not live arbitrary polling
- Siri Shortcuts should trigger bounded server actions, not open-ended local automation
- when the app is suspended, the server remains the source of truth for jobs and runtime state

## 12. Hosted Evolution Path

The blueprint must support a future in which users can install Hermes on your infrastructure.

That future should evolve in three steps:

### Step 1 — Bring your own Hermes

User connects their own instance.

### Step 2 — Managed deployment assistant

Your platform helps deploy Hermes to customer-selected targets.

### Step 3 — Fully managed Hermes cloud

Your platform provisions and runs Hermes for the user.

The same mobile app should still work, with the connection target simply becoming one of:

- personal self-hosted
- company-managed dedicated instance
- shared hosted control plane

## 13. Success Criteria

### Product success

- users can perform meaningful Hermes operations entirely from mobile
- users trust the app for monitoring and intervention
- the app feels like a control product, not a novelty client

### Technical success

- stable multi-instance connectivity
- secure secrets handling
- resilient chat streaming and reconnection
- API abstraction suitable for both self-hosted and hosted futures

### Business success

- clear differentiation from generic AI chat apps
- App Store approval without deceptive branding risk
- strong conversion path from self-hosted power users to managed hosting customers

## 14. Conclusion

HermesMob can be a credible and valuable product if it is built as a **meaningful operator-parity native iOS control plane for Hermes**, not as a chat clone or wrapped dashboard.

The strongest path is:

- self-hosted first
- hosted-ready architecture
- meaningful operator-workflow parity MVP
- original branding
- premium operator UX
