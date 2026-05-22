---
version: alpha
name: HermesMobile Foundation
description: Hermes Agent website aesthetic translated into a trusted native iPhone and iPad operator console.
colors:
  primary: "#0A1715"
  "background.primary": "#061110"
  "background.secondary": "#0A1715"
  "surface.card": "#0D1B18"
  "surface.elevated": "#12231F"
  "border.subtle": "#3A5046"
  "border.strong": "#587867"
  "text.primary": "#F2EAD8"
  "text.secondary": "#C9D9CF"
  "text.muted": "#8FA79A"
  "accent.gold": "#B89B5E"
  "status.healthy": "#7FB08E"
  "status.warning": "#C8A96B"
  "status.critical": "#B9655A"
  "status.offline": "#5E6C66"
  "trust.trusted": "#79AB89"
  "trust.restricted": "#B89B5E"
  "trust.revoked": "#A35D56"
  "approval.pending": "#D0B978"
  "background.primary.light": "#F4EFE3"
  "background.secondary.light": "#EAE4D7"
  "surface.card.light": "#EEF1EA"
  "surface.elevated.light": "#E4EBE2"
  "border.subtle.light": "#B7C3BC"
  "border.strong.light": "#8FA296"
  "text.primary.light": "#13241F"
  "text.secondary.light": "#365045"
  "text.muted.light": "#6B7F75"
  "accent.gold.light": "#A7894E"
  "status.healthy.light": "#4E7B61"
  "status.warning.light": "#A98243"
  "status.critical.light": "#A35E56"
  "status.offline.light": "#88948E"
  "trust.trusted.light": "#557E66"
  "trust.restricted.light": "#9B7A46"
  "trust.revoked.light": "#955750"
  "approval.pending.light": "#B19356"
typography:
  display-xl:
    fontFamily: "-apple-system"
    fontSize: 2.125rem
    fontWeight: 680
    lineHeight: 0.96
    letterSpacing: "-0.03em"
  title-lg:
    fontFamily: "-apple-system"
    fontSize: 1.5rem
    fontWeight: 650
    lineHeight: 1.08
    letterSpacing: "-0.02em"
  body-md:
    fontFamily: "-apple-system"
    fontSize: 1rem
    fontWeight: 400
    lineHeight: 1.45
    letterSpacing: "0em"
  label-sm:
    fontFamily: "-apple-system"
    fontSize: 0.6875rem
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: "0.14em"
  mono-sm:
    fontFamily: "SF Mono"
    fontSize: 0.75rem
    fontWeight: 500
    lineHeight: 1.3
    letterSpacing: "0em"
rounded:
  sm: 10px
  md: 16px
  lg: 24px
spacing:
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
---

## Overview

HermesMobile should feel like **Hermes Agent condensed into a secure native operator console for iPhone and iPad**. It inherits the Hermes Agent website aesthetic: dark green and near-black foundations, warm ivory text, muted gold accents, thin structural borders, and a technical calm that feels premium rather than flashy.

The app must not read as a generic AI chat app, neon cyber product, hacker tool, remote shell wrapper, or WebView shell. It should feel trustworthy, infrastructural, composed, and immediately understandable to a normal iOS user.

The governing rule is:

> **Emotion in the shell, precision in the states.**

That means launch surfaces, branding, and high-level visual identity may carry the Hermes editorial mood, while loading, trust, approval, and failure states remain operational, explicit, and stable.

The companion usability rule is:

> **Minimum surface, maximum clarity.**

Show only what the user needs right now. Advanced details belong one tap deeper.

This foundation pass covers only:
- DESIGN.md foundation
- app icon concept direction
- launch/loading screen
- **Add Hermes Instance / Connect Agent** loading flow

It explicitly does **not** define the full app shell, chat UI, or complete screen system.

## Colors

### Dark mode

The primary theme is dark and green-forward.

- **`background.primary` — `#061110`:** The deepest Hermes canvas. Used for launch, loading, and root operator surfaces.
- **`background.secondary` — `#0A1715`:** Secondary dark layer for grouped areas and quieter sections.
- **`surface.card` — `#0D1B18`:** Default panel/card surface with subtle elevation from the background.
- **`surface.elevated` — `#12231F`:** Higher-emphasis surface for selected blocks, modal-adjacent layers, and focused states.
- **`border.subtle` — `rgba(92, 132, 112, 0.28)`:** Hairlines, card edges, soft grids, and quiet dividers.
- **`border.strong` — `rgba(123, 171, 137, 0.44)`:** Selected panels, trusted framing, and stronger surface separation.
- **`text.primary` — `#F2EAD8`:** Warm ivory for titles and body text. Never use pure white.
- **`text.secondary` — `#C9D9CF`:** Supportive copy, descriptions, and step detail.
- **`text.muted` — `#8FA79A`:** Quiet metadata, small labels, and passive status details.
- **`accent.gold` — `#B89B5E`:** A rare premium and approval accent. Never the dominant structural color.

### Status and trust tokens

- **`status.healthy` — `#7FB08E`:** Healthy, synced, and successful infrastructure state.
- **`status.warning` — `#C8A96B`:** Caution, degraded validation, or trust review state.
- **`status.critical` — `#B9655A`:** Failure or blocking issue. Muted, not neon.
- **`status.offline` — `#5E6C66`:** Disconnected, paused, or unavailable state.
- **`trust.trusted` — `#79AB89`:** Verified instance and device trust state.
- **`trust.restricted` — `#B89B5E`:** Restricted device, self-signed TLS, or limited trust posture.
- **`trust.revoked` — `#A35D56`:** Revoked, blocked, or denied trust state.
- **`approval.pending` — `#D0B978`:** Pending approval or gate awaiting operator confirmation.

### Light mode

Light mode should feel like Hermes in daylight, not like a generic white SaaS app.

- **`background.primary.light` — `#F4EFE3`:** Warm parchment-ivory base. Never use pure white.
- **`background.secondary.light` — `#EAE4D7`:** Secondary light canvas for grouped areas.
- **`surface.card.light` — `#EEF1EA`:** Light surface with a slight green cast.
- **`surface.elevated.light` — `#E4EBE2`:** Elevated panel for selected or emphasized content.
- **`border.subtle.light` — `rgba(70, 97, 84, 0.16)`:** Soft dividers and light structural borders.
- **`border.strong.light` — `rgba(70, 97, 84, 0.30)`:** Stronger framing for trusted or selected states.
- **`text.primary.light` — `#13241F`:** Dark green ink. Never use pure black.
- **`text.secondary.light` — `#365045`:** Supporting explanatory text.
- **`text.muted.light` — `#6B7F75`:** Metadata and subdued labels.
- **`accent.gold.light` — `#A7894E`:** Limited premium/trust accent.
- **`status.healthy.light` — `#4E7B61`**
- **`status.warning.light` — `#A98243`**
- **`status.critical.light` — `#A35E56`**
- **`status.offline.light` — `#88948E`**
- **`trust.trusted.light` — `#557E66`**
- **`trust.restricted.light` — `#9B7A46`**
- **`trust.revoked.light` — `#955750`**
- **`approval.pending.light` — `#B19356`**

### Color behavior rules

- Green is structural.
- Ivory is for reading.
- Gold is rare.
- Red stays muted and controlled.
- Warning and trust colors localize to badges, side rails, chips, borders, and micro-highlights rather than washing the whole screen.
- Light mode remains green-led and parchment-based rather than turning white or blue-gray.

## Typography

Typography should combine native iOS legibility with Hermes editorial weight.

### Roles

- **Display:** Used only on launch/loading hero surfaces and major connection milestones. Bold, compressed, slightly editorial.
- **Title:** Used for section titles, step titles, and high-priority headings. Clear and confident.
- **Body:** Used for status descriptions, helper copy, and instructional text.
- **Label:** Small uppercase labels with generous tracking. Used for trust, environment, or section metadata.
- **Mono:** Used sparingly for technical state details, URL fragments, validation traces, and log-summary snippets.

### Rules

- Prefer San Francisco system fonts for primary reading and native continuity.
- Use monospace only for truly technical content.
- Do not build the app out of terminal typography.
- Headings may feel slightly editorial, but state copy must stay operational.
- Small labels should use increased letter-spacing for control-plane precision.
- Avoid overly light font weights on dark backgrounds.

## Layout

Layout should feel like a compact operator surface, not a content feed.

### Grid and spacing

- Use a strong panel rhythm with visible boundaries.
- Favor vertically stacked cards and state modules.
- Use quiet internal spacing rather than oversized breathing room.
- Keep screen compositions symmetrical or deliberately centered when presenting trust/loading state.
- Prefer one dominant card or one dominant action per screen.
- Avoid dashboard density, multi-column metric walls, or exposing advanced diagnostics by default.

### Launch and loading composition

- Center the primary mark or icon.
- Keep the title concise and vertically dominant.
- Follow with one short muted status line.
- Support the screen with faint grid structure or border framing.
- Replace generic spinners with progress rails, scanning bars, pulsing dots, or step transitions that feel like a secure control plane coming online.

### Add-instance flow composition

- Present the flow as a sequence of trusted validation steps.
- Each step should feel inspectable and infrastructural.
- Use card-based progress rather than chat-style messages.
- The active step should have subtle emphasis, never a loud glow.
- Finish state should signal readiness, not celebration.
- Default to short labels and calm explanations; advanced detail should live in expandable secondary sections.

## Elevation & Depth

Depth should be restrained.

- Default surfaces are mostly flat with fine borders.
- Elevation comes from tonal separation before shadow.
- Use `surface.elevated` only when a panel needs clear focus.
- Prefer a thin border, subtle tint, or internal highlight over heavy shadow.
- The UI should feel machined and precise, not soft or floating.

## Shapes

Shapes should be calm and technical.

- Rounded corners should be moderate, never bubbly.
- Panels should feel engineered, not playful.
- Chips and badges may be pill-like if they communicate state clearly.
- Icons should be simple, geometric, and legible at small sizes.
- Avoid speech bubbles, mascot shapes, or aggressive shield clichés.

## Components

### Component rules

All components must be semantic-token-driven and support both light and dark mode through the same API.

### Foundation component list

- **OperatorCard:** Base panel for loading state, trust status, and summaries.
- **StatusBadge:** Healthy, warning, critical, offline, trusted, restricted, revoked, pending.
- **ProgressRail:** Quiet linear progress treatment for boot/loading flows.
- **StepStateRow:** Label, description, and status for each connection step.
- **TrustedDevicePanel:** Dedicated surface for device trust registration state.
- **ValidationNotice:** Inline card for TLS, version, capability, or authentication warnings.
- **PrimaryActionButton:** Used for `Add Hermes Instance`, `Connect Agent`, `Register Trusted Device`, and `Load Operator State`.
- **SecondaryActionButton:** Retry, inspect details, or continue in limited mode.
- **SectionLabel:** Small uppercase control-plane label.
- **MonoDetailLine:** Small technical line for URLs, versions, or capability hints.

### Safety UX rules

- A trust problem must never look visually similar to a healthy confirmation.
- TLS/self-signed warnings must be explicit and interruptible.
- Authentication failure must say what failed without leaking secrets.
- Restricted-device states must explain whether the operator can proceed in limited mode.
- Unsupported-version states must distinguish between unreachable server and reachable-but-incompatible Hermes.
- The user must always know whether they are validating identity, validating transport security, or loading operator state.
- Do not auto-hide warnings too quickly.

### Motion rules

- Motion should be subtle, infrastructural, and low-frequency.
- Use opacity shifts, progress fills, step advancement, gentle pulsing dots, or quiet scan-line motion.
- Avoid bouncing, springy celebration, neon glows, and chat-like typing indicators.
- Success transitions should resolve into stability, not applause.
- Failure transitions should halt clearly and preserve the current diagnostic context.

### App icon concept

Explore three directions:

1. **H monogram with wing/signal detail**
   - A compact capital H with one side softened into a wing or signal sweep.
   - Strong legibility at small iOS sizes.
   - Feels branded, premium, and controlled.

2. **Abstract Hermes wing + command node**
   - A minimal wing-like diagonal form intersecting a small node or terminal point.
   - More symbolic and elegant.
   - Higher risk of losing clarity at tiny sizes.

3. **Operator console glyph / agent beacon**
   - A geometric beacon or framed signal glyph implying an active control plane.
   - Strong technical meaning.
   - Higher risk of becoming too generic or infra-tool-like.

**Recommended direction:**

Choose **H monogram with wing/signal detail**.

Why:
- Most readable at iOS small sizes.
- Keeps a direct product anchor without requiring text.
- Can feel Hermes-like without literal mythology.
- Balances brand, trust, and native icon clarity.
- Avoids both chatbot bubble language and hacker-tool iconography.
- Best supports consumer-grade usability because it is recognizable in one glance and does not require symbolic interpretation.

Additional icon simplicity rules:
- Use one dominant silhouette, not layered symbolism.
- Preserve readability at notification and settings-list sizes.
- Avoid tiny technical detail, interior line noise, or dashboard-like complexity.
- The icon should feel premium and safe before it feels technical.

### Launch/loading screen spec

The launch/loading screen should communicate that HermesMobile is **establishing a secure operator console**.

#### Required elements

- dark green or near-black background
- centered icon or mark
- warm ivory title
- muted status line
- subtle border or grid detail
- quiet progress treatment
- no generic flashy spinner

#### Preferred copy rotation

- `Preparing secure operator console…`
- `Checking trusted device…`
- `Loading Hermes instance state…`
- `Syncing sessions and approvals…`

#### Visual behavior

- Start with the icon/mark and title stable on screen.
- Transition the status line or progress rail below.
- Let the grid or border detail remain faintly visible.
- Keep the screen emotionally calm and precise.
- Keep the composition simple enough to understand in under two seconds.
- Do not introduce multiple simultaneous status blocks, dense metadata, or technical jargon on first view.

### Add Hermes Instance / Connect Agent loading flow spec

Use this sequence for the initial connection flow.

First-level presentation rules:

- Show a simple step title first.
- Show a short human-readable explanation second.
- Hide raw technical detail behind an expandable disclosure or secondary sheet.
- Keep one active step visually dominant.
- Use reassuring language unless there is actual danger or a blocking failure.

#### 1. Read Instance URL
- **Label:** `Read Instance URL`
- **Description:** Check the address you entered and prepare it for connection.
- **Success:** URL accepted and normalized.
- **Warning:** URL includes unusual port or non-standard path; confirm before continuing.
- **Failure:** Invalid URL format or unsupported scheme.

#### 2. Check HTTPS/TLS Trust
- **Label:** `Check HTTPS/TLS Trust`
- **Description:** Confirm that the connection is secure and trusted.
- **Success:** Valid HTTPS endpoint with trusted certificate chain.
- **Warning:** Self-signed or otherwise untrusted certificate; operator may review and continue if policy allows.
- **Failure:** TLS handshake failed or certificate rejected.

#### 3. Validate Hermes Server
- **Label:** `Validate Hermes Server`
- **Description:** Confirm that this is a Hermes server and that it can respond correctly.
- **Success:** Hermes server detected and identity confirmed.
- **Warning:** Partial or unexpected response shape; continue only with explicit operator awareness.
- **Failure:** Endpoint reachable but not a Hermes server.

#### 4. Detect Capabilities
- **Label:** `Detect Capabilities`
- **Description:** Check which Hermes features are available on this instance.
- **Success:** Capability set loaded successfully.
- **Warning:** Capability limited; some surfaces may be unavailable.
- **Failure:** Capability handshake failed or response incompatible.

#### 5. Register Trusted Device
- **Label:** `Register Trusted Device`
- **Description:** Ask this Hermes instance to trust this iPhone or iPad.
- **Success:** Device registered and trusted.
- **Warning:** Device registered with restrictions or pending approval.
- **Failure:** Device registration denied or authentication failed.

#### 6. Sync Health / Status
- **Label:** `Sync Health / Status`
- **Description:** Load current health and connection state.
- **Success:** Current health loaded.
- **Warning:** Health data partially available or stale.
- **Failure:** Health endpoint unavailable.

#### 7. Load Operator State
- **Label:** `Load Operator State`
- **Description:** Load the most important approvals, sessions, and summaries for the app home.
- **Success:** Operator state loaded.
- **Warning:** Some summaries unavailable; continue with reduced context.
- **Failure:** Operator-state load failed.

#### 8. Instance Ready
- **Label:** `Instance Ready`
- **Description:** Your Hermes instance is ready.
- **Success:** Show ready state and primary next action.
- **Warning:** Ready in limited mode.
- **Failure:** Not applicable; failures should stop earlier and retain context.

### Failure examples

The flow must explicitly handle at least these cases:

- invalid URL
- server unreachable
- unsupported Hermes version
- TLS/self-signed certificate warning
- authentication failed
- device restricted
- capability limited

### Failure copy style

- State what failed.
- State whether the operator can retry, inspect, or continue with limitations.
- Never use vague “something went wrong” messaging.
- Never imply trust has been granted when it has not.

### SwiftUI implementation notes

- Use semantic color assets or a centralized `ThemeColors` layer.
- Do not hardcode `Color.black`, `Color.white`, or one-off hex values inside views.
- Keep the same component APIs across light and dark mode.
- Prefer reusable primitives such as `OperatorCard`, `StatusBadge`, `ProgressRail`, and `StepStateRow`.
- Launch/loading surfaces should be built natively in SwiftUI, not in a WebView.
- Use `colorScheme` switching rather than forcing a single appearance globally.
- Reserve monospace for technical details only.
- Prefer standard iOS patterns such as tab navigation, list/detail, cards, sheets, readable forms, and clear primary buttons.
- Keep advanced diagnostics in secondary screens, disclosures, or sheets rather than on first-level surfaces.

## Simplicity & Usability Principles

HermesMobile should feel inspired by Hermes while remaining simple, familiar, and friendly like a modern iOS product. The goal is not a complex admin dashboard. The goal is the smallest clear mobile control plane that feels premium and safe.

### Core rule

> **Hermes aesthetic + consumer-grade usability**

### 1. Familiar iOS patterns first

Use standard iOS mental models:
- tab navigation
- list/detail
- cards
- sheets
- clear primary buttons
- system-like settings
- readable forms
- simple progress steps

### 2. Progressive disclosure

Do not show all operator details immediately.

Reveal information in this order:
- simple status first
- explanation second
- technical detail third

Example:
Instead of showing raw logs on Home, show `1 failed job` and allow a tap to inspect logs.

### 3. Home must be simple

Home should show only:
- selected instance
- health status
- pending approvals
- active session/job summary
- recent important alert
- quick action to connect or add instance

Do not overload Home with logs, metrics, full diagnostics, config, or deep technical panels.

### 4. Copy must be human-readable

Prefer simple first-level labels such as:
- `Healthy`
- `Needs attention`
- `Waiting for approval`
- `Connection issue`
- `Trusted device`
- `Limited access`
- `Retry connection`

Avoid overly technical labels as the primary UI language, including:
- `capability negotiation failed`
- `token validation rejected`
- `transport unreachable`
- `TLS handshake error`

Technical details may appear in expandable sections, inspect views, or secondary sheets.

### 5. Trust UX should feel reassuring, not scary

Security should be visible but calm.

Prefer reassuring language such as:
- `Trusted device`
- `Limited access`
- `This action needs confirmation`
- `Face ID required to continue`

Avoid alarming wording unless there is real danger or a blocking failure.

### 6. Chat must not dominate

Chat should be easy to find, but it must not define the whole product. Frame it as one capability among several using language such as:
- `Continue session`
- `Ask Hermes`
- `Runtime`
- `Active session`

### 7. Operator features should be simplified

Approvals, logs, jobs, gateway, config, secrets, memory, and skills may exist, but each needs a simple first-level view.

Example for logs first view:
- error summary
- warning summary
- recent failure
- open detailed logs

Do not show a raw log stream by default.

### 8. Light and dark modes must both feel usable

Dark mode can carry more of the Hermes mood.
Light mode must feel warm, clean, and readable rather than like plain white SaaS.

### 9. Visual hierarchy must guide the user

Every screen needs one obvious primary action.
Avoid screens where everything has equal weight.

### 10. Design for first-time understanding

A new user should understand within ten seconds:
- what instance they are connected to
- whether it is healthy
- whether anything needs action
- where to approve something
- where to continue a session

### Review implications for current foundation

- **App icon:** prioritize instant recognition over symbolic cleverness.
- **Launch/loading screen:** keep one icon, one title, one calm status line, and one quiet progress treatment.
- **Add Hermes Instance flow:** present short labels and clear explanations by default, with technical diagnostics one tap deeper.
- **Trust and security language:** should reassure first and diagnose second.

## Do's and Don'ts

### Do

- Keep the product green-forward.
- Keep gold rare and meaningful.
- Use warm ivory rather than pure white.
- Present trust and loading state as operator-console workflows.
- Make connection, approval, and trust states highly legible.
- Preserve calmness even during failure.
- Make the app feel native to iPhone and iPad.
- Prefer minimum surface and progressive disclosure over dashboard density.
- Make first-level copy readable by normal users before exposing technical detail.

### Don't

- Do not design the full app shell yet.
- Do not design chat UI yet.
- Do not design sessions, logs, cron, analytics, or settings screens yet.
- Do not use chatbot bubbles, assistant avatars, or typing-indicator tropes.
- Do not use neon green, cyberpunk glow, or hacker visual clichés.
- Do not use gold as the dominant structural color.
- Do not ship a WebView-looking wrapper aesthetic.
- Do not make trust warnings look optional or decorative.
- Do not make the product feel like a complex admin dashboard or remote shell.
