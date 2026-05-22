# Feature System and Requirements

## 1. Purpose

This document converts the HermesMob thesis into a structured feature system that can support:
- investor discussions
- product scoping
- design prioritization
- implementation planning
- App Store readiness review

It complements `PRODUCT_BLUEPRINT.md` by being more explicit about what the product must contain and why.

## 2. Product promise

From an iPhone or iPad, a HermesMob user should be able to:
- connect to one or more Hermes environments
- understand current state quickly
- chat and operate with low friction
- receive notifications when something important happens
- approve, interrupt, or redirect workflows safely
- manage the configuration surfaces that matter
- trust what the app can and cannot do

## 3. Feature architecture

HermesMob features fall into six layers.

### Layer 1 — Connectivity and identity
- add instance
- pair device
- manage environment list
- validate connectivity
- discover capabilities
- show trust state
- manage auth tokens
- show current device/session trust visibility

### Layer 2 — Runtime operations
- create session
- resume session
- stream assistant output
- display tool activity
- interrupt or stop a task
- send follow-up instruction
- inspect transcript and artifacts
- branch or continue previous work where supported

### Layer 3 — Operator visibility
- home dashboard
- active sessions
- background processes
- job and cron history
- error and warning summaries
- gateway status
- platform connection state
- model/provider status where available

### Layer 4 — Administration
- config browser and editor
- secrets presence and rotation
- skills browser and inspect surface
- memory browser and update surface
- job creation and schedule management
- approval queue
- logs and diagnostics

### Layer 5 — Native mobile workflows
- push notifications
- deeplinks into tasks, sessions, approvals, and failures
- biometric confirmation for sensitive actions
- widgets with summary state
- Siri Shortcuts for bounded actions
- local cached snapshots for last-known status

### Layer 6 — Future hosted account layer
- sign in to hosted Hermes account
- provision hosted instance
- upgrade plan
- team and role management
- billing visibility
- managed support surfaces

## 4. Launch-tier model

## 4.1 V1.0 must-have tier

These are the features required to make the product feel like a real control plane instead of a companion demo.

For any ambiguity between this file and other product docs, `V1_SCOPE_DECISIONS.md` is the canonical launch-scope source of truth.

### Environment management
- add multiple Hermes instances
- name and tag environments
- capability detection
- health check and status summary
- environment switcher

### Chat and sessions
- create and resume sessions
- stream responses
- show tool activity inline
- session history list
- search sessions
- continue a session from history

### Dashboard and monitoring
- home dashboard with active counts and last errors
- active session summary
- recent jobs summary
- scheduler status
- gateway/platform status
- high-priority alerts

### Job and cron operations
- list jobs
- inspect job configuration
- create basic job
- edit schedule and prompt
- pause/resume
- run now
- delete job
- inspect latest output

### Config and secrets
- config search and typed editing for supported values
- secret presence visibility
- create/update secret values
- biometric gate before reveal/change
- restart-required warning states

### Skills and memory
- list skills
- inspect skill content and linked files
- list memory entries
- add/replace/remove memory entries

### Approvals and intervention
- receive notification when decision required
- open approval detail
- approve / deny / stop
- interrupt long-running tasks

### Security and trust basics
- keychain-backed credential storage
- current device trust-state visibility
- write-action confirmation
- audit entries for sensitive operations

## 4.2 V1.1 strong follow-up tier
- richer transcript artifacts
- advanced log filtering
- saved views and custom filters
- better diff viewers
- share/export packages
- widget set expansion
- Siri/Shortcuts library
- richer process controls

## 4.3 V1.2 hosted-commercialization tier
- hosted account login
- hosted provisioning
- entitlements and plan gating
- billing awareness
- upgrade prompts
- support and diagnostic bundles

## 5. Feature list by screen family

### 5.1 Onboarding and connections
Goals:
- connect user to a real Hermes environment quickly
- make trust and permissions explicit

Required screens:
- welcome and product framing
- add instance
- connection test
- capability summary
- current trust-state display
- environment list
- environment detail

### 5.2 Home dashboard
Goals:
- answer “what needs my attention?” in seconds

Required sections:
- environment switcher
- health card
- active tasks card
- jobs card
- approvals card
- recent failures card
- platform/gateway card

### 5.3 Sessions
Goals:
- provide reliable mobile conversation and intervention

Required screens:
- session list
- session detail
- compose/input panel
- transcript search or jump tools
- artifacts panel
- stop/redirect controls

### 5.4 Jobs
Goals:
- make automation visible and controllable

Required screens:
- job list
- job detail
- run history
- create/edit job form
- schedule editor
- recent output viewer

### 5.5 Admin
Goals:
- expose the important Hermes control surfaces safely

Required subsections:
- config
- secrets
- skills
- memory
- logs
- approvals

### 5.6 Notifications and inbox
Goals:
- centralize action-requiring events

Required event types:
- job failed
- job completed
- approval required
- connection lost
- secret/config change outcome
- platform disconnected

## 6. Non-functional requirements

### 6.1 Trust and safety
- destructive actions must be clearly labeled
- biometric re-auth required for sensitive reads/writes
- audit trail should be visible or retrievable
- permissions must be scoped by instance and action class where possible

### 6.2 Performance
- dashboard should render from cached summary state quickly
- streaming sessions should reconnect cleanly after backgrounding
- critical lists should remain usable on unstable mobile networks

### 6.3 Explainability
- the app must show what operation is happening, not only that something is “loading”
- remote actions should show environment and object target clearly

### 6.4 Reviewability
- app should support a clean demo environment for App Review
- features should not depend on hidden setup the reviewer cannot complete

## 7. Feature prioritization principles

When deciding whether something belongs in launch, ask:

1. Does this help the user operate Hermes away from desktop?
2. Does this reduce uncertainty or increase control?
3. Does this materially differentiate the app from a mobile web wrapper?
4. Can it be made trustworthy on iOS?
5. Does it support the self-hosted-first but hosted-ready strategy?

If the answer is no to most of these, it is likely a follow-up feature.

## 8. Product conclusion

The feature system should create one feeling:

> **Hermes is not trapped on the desktop anymore.**

If users can monitor, decide, intervene, and administer with confidence from the phone, the product succeeds.
If the app only lets them “chat from mobile,” it fails the thesis.
