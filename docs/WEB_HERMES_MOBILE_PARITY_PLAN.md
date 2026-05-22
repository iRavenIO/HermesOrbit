# HermesOrbit Web-Parity Reset Plan

## Why this reset exists

The current HermesOrbit concept drifted away from the **actual Hermes web dashboard**. After reviewing the real web app source in `~/.hermes/hermes-agent/web/src`, the right baseline for the iOS MVP is **not** an invented mobile IA first. It is a **mobile-native adaptation of the real Hermes web information architecture and interaction model**.

This means HermesOrbit V1 should feel like **Hermes Web on iPhone/iPad**, not a separate product concept with unrelated tabs.

## Source of truth reviewed

Primary web references inspected:

- `web/src/App.tsx`
- `web/src/pages/ChatPage.tsx`
- `web/src/pages/SessionsPage.tsx`
- `web/src/components/SidebarStatusStrip.tsx`
- `web/src/i18n/en.ts`

## What the real Hermes web app actually looks like

## Core navigation

The real sidebar nav is currently:

1. Chat
2. Sessions
3. Analytics
4. Models
5. Logs
6. Cron
7. Skills
8. Plugins
9. Profiles
10. Config
11. Keys
12. Documentation

It also has a **System status block** showing:

- Gateway Status
- Active Sessions

Important: the web app root redirects to **`/sessions`**, not to a dashboard home screen.

## Real page model

### Chat

The real web Chat page is **not message bubbles first**.
It is an embedded Hermes runtime / terminal experience:

- xterm-based terminal surface
- persistent PTY session
- session resume via URL params
- mobile side panel for model/tools
- copy last output controls

For mobile parity, the iOS app should treat Chat as a **runtime surface**, not a generic chatbot screen.

### Sessions

Sessions is one of the main operational pages and currently acts like the practical landing area:

- session list
- search
- source badges (CLI / Telegram / Discord / Slack / WhatsApp / Cron)
- transcript/detail view
- tool call blocks
- platform/status context

### Logs

Logs is a first-class system page, not buried admin overflow.

### Cron

Cron/jobs is a first-class page.

### Skills / Profiles / Config / Keys

These are first-class management surfaces in the real web dashboard and must stay visible in the mobile parity plan.

## What this means for HermesOrbit

The earlier mobile IA is too abstracted. For V1 parity, HermesOrbit should mirror the web dashboard much more directly.

## Correct HermesOrbit V1 IA

### Primary tabs on iPhone

Use 5 mobile tabs, but map them directly to real web surfaces:

1. **Sessions**
   - default landing tab
   - session list
   - search
   - transcript/detail
   - platform/source badges

2. **Chat**
   - runtime session
   - resume session
   - tool activity
   - model/tools side sheet equivalent

3. **System**
   - gateway status
   - active sessions
   - logs
   - cron
   - analytics

4. **Manage**
   - models
   - skills
   - plugins
   - profiles
   - config
   - keys

5. **Docs**
   - documentation links / in-app doc browser

### iPad layout

On iPad, the app should look even closer to web:

- left sidebar navigation
- top header actions
- list/detail layout for Sessions
- side panel for Chat model/tools
- persistent system status block

## What should be removed or deprioritized from the current mobile concept

These ideas should **not** drive V1 anymore:

- invented Home dashboard as the main first screen
- separate Ops abstraction if it diverges from real web routes
- overly productized mobile-only grouping that hides real Hermes surfaces
- chat bubble framing that ignores the real terminal/runtime model

## Exact product rule going forward

When there is a conflict between:

- previous HermesOrbit design documents, and
- the current real Hermes web dashboard,

**the real Hermes web dashboard wins for V1 UX structure**, unless there is a strong mobile usability reason to adapt it.

## Build order for the new MVP

1. **App shell parity**
   - mobile header
   - sidebar/drawer navigation
   - status strip
   - tab/section structure matching web

2. **Sessions parity**
   - default landing screen
   - session list
   - detail transcript
   - source badges

3. **Chat parity**
   - runtime-first chat surface
   - resume support
   - tool activity / session linkage

4. **System parity**
   - gateway status
   - logs
   - cron
   - analytics summary

5. **Manage parity**
   - models
   - skills
   - plugins
   - profiles
   - config
   - keys

## Immediate implementation implication

The current iOS scaffold should be rebuilt around:

- **Sessions-first landing**
- **web-like nav structure**
- **system status strip**
- **runtime-style Chat**

not around the earlier Home / Chat / Ops / Manage concept as the primary organizing truth.
