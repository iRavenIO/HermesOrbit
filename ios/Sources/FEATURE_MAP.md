# iOS Module Map — Web Parity Reset

## New rule

This file now tracks the **real Hermes web dashboard** as the primary UX reference.

If HermesMob and Hermes Web disagree, **Hermes Web wins for V1 structure** unless a mobile adaptation is clearly necessary.

## Real Hermes web navigation to mirror

From `~/.hermes/hermes-agent/web/src/App.tsx`:

- Chat
- Sessions
- Analytics
- Models
- Logs
- Cron
- Skills
- Plugins
- Profiles
- Config
- Keys
- Documentation

System sidebar block:

- Gateway Status
- Active Sessions

## Mobile app shell target

### iPhone

Use a mobile-native shell that still preserves web parity:

- default landing: **Sessions**
- persistent access to **Chat**
- clear **System** section for Logs / Cron / Analytics / gateway status
- clear **Manage** section for Models / Skills / Plugins / Profiles / Config / Keys
- **Docs** entry remains visible

### iPad

Mirror the web even more closely:

- left sidebar
- header actions
- list/detail content panes
- system status block
- chat side panel behavior

## Proposed V1 screen groups

### Sessions

- session list
- session search
- source badges (CLI / Telegram / Discord / Slack / WhatsApp / Cron)
- transcript detail
- tool call expansion
- session resume into Chat

### Chat

- runtime-first surface
- session continuation
- terminal-style / streaming experience
- model/tools sheet equivalent
- copy last output / quick runtime actions

### System

- gateway status
- active sessions summary
- logs viewer
- cron/jobs list
- analytics summary

### Manage

- models
- skills
- plugins
- profiles
- config
- keys

### Docs

- Hermes docs links
- product docs links

## Current scaffold problem

The old sample grouped the app around an invented mobile concept:

- Home
- Chat
- Ops
- Manage

That is too detached from the real Hermes web product.

## Replacement direction

For the next implementation pass, build these samples first:

1. Sessions-first landing shell
2. Web-like nav drawer / sidebar
3. System status strip
4. Sessions list + detail
5. Runtime-style Chat surface

## Do not optimize for this in V1

- invented operator dashboard as the primary first screen
- generic AI chat bubbles as the main identity
- mobile-only grouping that hides real Hermes web pages
