# Mobile API Contract Draft

## Goal

Define the minimum backend contract needed to make HermesMob implementable.

This is a draft contract for the future Hermes mobile companion/API façade.
It is meant to be stable enough for app development while remaining tolerant of Hermes version differences.

## Principles

- stable JSON contracts
- mobile-friendly summaries first, deep detail on demand
- explicit capability discovery
- scoped auth
- auditability for writes and destructive actions
- version tolerance across Hermes releases
- server remains source of truth when iOS is suspended
- additive versioning wherever possible

## 1. Auth and device trust

### Recommended model
- device registers against an instance
- device receives scoped access token + refresh/session renewal mechanism
- server records:
  - device name
  - device ID
  - scope level
  - last seen
  - trust state
  - push token presence

### Suggested scopes
- `observe`
- `operate`
- `admin`
- `secrets_admin`

### Trust states
- `pending`
- `trusted`
- `restricted`
- `revoked`

### Trust lifecycle expectations
- `pending` → created at registration time before an operator approves the device or pairing flow
- `trusted` → device can use its granted scopes normally
- `restricted` → device remains visible but high-risk writes are blocked until re-approved
- `revoked` → refresh fails, pushes should be disabled, and the app must force re-enrollment
- every trust-state transition should create an audit event and return a reason code when available

### Required auth endpoints
- `POST /mobile/v1/devices/register`
- `POST /mobile/v1/auth/refresh`
- `GET /mobile/v1/auth/session`

Optional admin/device-management endpoints for v1.x or advanced self-hosted deployments:
- `POST /mobile/v1/devices/:deviceId/revoke`
- `GET /mobile/v1/devices`

### Example session payload
```json
{
  "instanceId": "personal-lab",
  "device": {
    "id": "dev_123",
    "name": "Kousha iPhone",
    "trustState": "trusted",
    "scopes": ["observe", "operate", "admin"]
  },
  "session": {
    "accessTokenExpiresAt": "2026-05-21T21:30:00Z",
    "refreshAllowed": true
  }
}
```

### Launch-scope permission matrix

- `observe`
  - read status, sessions, logs, artifacts, jobs, approvals, and capability state
  - cannot approve requests, mutate config, edit jobs, restart gateway, or reveal secrets
- `operate`
  - everything in `observe`
  - can continue/interrupt sessions, run/pause/resume jobs, and act on approvals
  - cannot change config, rotate/reveal secrets, or manage trusted devices
- `admin`
  - everything in `operate`
  - can edit config, restart gateway, and reconnect platforms
  - device-management endpoints may be added in v1.x or advanced self-hosted mode
  - cannot reveal or rotate raw secrets unless `secrets_admin` is also present
- `secrets_admin`
  - additive scope for secret reveal/change/rotation flows behind biometric + explicit confirmation

Launch note: v1.0 should expose read-first skill inspection only; skill patch/edit endpoints remain a v1.x follow-up even if the server later supports them.

## 2. Capability discovery

### `GET /mobile/v1/capabilities`
Returns what the connected Hermes instance supports.

```json
{
  "instanceId": "personal-lab",
  "hermesVersion": "2026.5.16",
  "contractVersion": "mobile.v1",
  "capabilities": {
    "chat": true,
    "sessions": true,
    "jobs": true,
    "config": true,
    "secrets": true,
    "skills": true,
    "memory": true,
    "logs": true,
    "gateway": true,
    "backgroundProcesses": true,
    "artifacts": true,
    "approvals": true,
    "deviceTrust": true,
    "auditLogs": true,
    "embeddedTUIFallback": false,
    "skillEditing": false
  },
  "compatibility": {
    "minimumSupportedHermesVersion": "2026.5.0",
    "unsupportedReasons": []
  }
}
```

Required behavior when capability is unsupported:
- return capability flags before the app renders write controls
- prefer `200` with `supported: false` or `403/409` with machine-readable error codes rather than vague failures
- include fallback hints where relevant, for example `fallback: "desktop_web"` or `fallback: "admin_webview"`
- preserve stable object shapes where possible so unsupported flows degrade rather than crash

## 3. Instance and dashboard state

### `GET /mobile/v1/instances`
Lists known instances available to the current device/account.

### `GET /mobile/v1/instances/:instanceId`
Returns instance detail, capability snapshot, trust state, and summary health.

### `GET /mobile/v1/status`
Returns the mobile home dashboard payload.

```json
{
  "instance": {
    "id": "personal-lab",
    "name": "Personal Lab",
    "version": "2026.5.16",
    "environment": "self-hosted"
  },
  "gateway": {
    "running": true,
    "platforms": [
      {"name": "telegram", "status": "connected"},
      {"name": "slack", "status": "connected"}
    ]
  },
  "summary": {
    "activeSessions": 2,
    "pendingApprovals": 1,
    "runningJobs": 3,
    "lastError": null
  }
}
```

## 4. Sessions and chat streams

### `GET /mobile/v1/sessions`
List sessions with filters.

Recommended query parameters:
- `instanceId`
- `cursor`
- `limit`
- `query`
- `status`
- `from`
- `to`

### `GET /mobile/v1/sessions/:id`
Returns transcript metadata and recent messages.

### `POST /mobile/v1/sessions`
Creates a new session.

### `POST /mobile/v1/sessions/:id/continue`
Continues a session.

### `POST /mobile/v1/sessions/:id/interrupt`
Interrupts a running session or current tool flow.

### `POST /mobile/v1/chat`
Starts or continues an active mobile chat stream.

Transport recommendation:
- SSE for streamed assistant output
- event types:
  - `message_delta`
  - `tool_call_started`
  - `tool_call_completed`
  - `status`
  - `artifact_created`
  - `approval_required`
  - `error`
  - `done`

## 5. Artifacts

### `GET /mobile/v1/artifacts`
Lists artifacts by session, type, or date.

### `GET /mobile/v1/artifacts/:artifactId`
Returns metadata and authorized download URLs or content references.

Required metadata fields:
- `artifactId`
- `type`
- `sessionId`
- `createdAt`
- `sizeBytes`
- `mimeType`
- `previewAvailable`

## 6. Jobs / cron

### `GET /mobile/v1/jobs`
### `POST /mobile/v1/jobs`
### `PATCH /mobile/v1/jobs/:id`
### `POST /mobile/v1/jobs/:id/run`
### `POST /mobile/v1/jobs/:id/pause`
### `POST /mobile/v1/jobs/:id/resume`
### `DELETE /mobile/v1/jobs/:id`
### `GET /mobile/v1/jobs/:id/output`

Recommended filters:
- `status`
- `cursor`
- `limit`
- `instanceId`
- `search`

## 7. Config

### `GET /mobile/v1/config/schema`
Returns typed config metadata for building the editor.

### `GET /mobile/v1/config/values`
### `PUT /mobile/v1/config/values`

Write responses should include:
- changed keys
- restart required flag
- validation warnings
- audit event ID

## 8. Secrets

### `GET /mobile/v1/secrets`
Returns category + configured state, not raw values by default.

### `GET /mobile/v1/secrets/:key`
Requires biometric-gated client flow and `secrets_admin` scope.

### `PUT /mobile/v1/secrets/:key`
Updates a secret value.

### `POST /mobile/v1/secrets/:key/rotate`
Optional helper endpoint when rotation is explicitly modeled.

## 9. Skills

### `GET /mobile/v1/skills`
### `GET /mobile/v1/skills/:name`

Launch scope:
- list installed skills
- inspect skill metadata/content
- inspect linked files

Deferred to v1.x follow-up:
- `PATCH /mobile/v1/skills/:name`
- `PUT /mobile/v1/skills/:name/file`

## 10. Memory

### `GET /mobile/v1/memory`
### `POST /mobile/v1/memory`
### `PATCH /mobile/v1/memory/:id`
### `DELETE /mobile/v1/memory/:id`

## 11. Logs, diagnostics, and audit

### `GET /mobile/v1/logs/gateway`
### `GET /mobile/v1/logs/errors`
### `GET /mobile/v1/doctor`
### `GET /mobile/v1/processes`
### `GET /mobile/v1/audit`

Audit entries should include:
- actor device ID
- target instance
- action type
- object type
- object ID
- timestamp
- result

## 12. Gateway and platform control

### `GET /mobile/v1/gateway`
### `POST /mobile/v1/gateway/restart`
### `GET /mobile/v1/platforms`
### `POST /mobile/v1/platforms/:platform/reconnect`

These endpoints should be strongly scope-gated and highly auditable.

## 13. Approvals

### `GET /mobile/v1/approvals`
### `GET /mobile/v1/approvals/:id`
### `POST /mobile/v1/approvals/:id/approve`
### `POST /mobile/v1/approvals/:id/deny`
### `POST /mobile/v1/approvals/:id/stop`

Approval payload should identify:
- action being requested
- environment target
- risk level
- expiration
- fallback action if unhandled

Required approval state machine:
- `pending` → newly created, actionable in inbox and push deep links
- `approved` → write accepted and forwarded to Hermes
- `denied` → request explicitly rejected
- `stopped` → user halted the parent action/session/job
- `expired` → deadline passed with no response
- `superseded` → request no longer relevant because the underlying job/session changed

For every terminal state, the response should include:
- `resolvedAt`
- `resolvedBy` (device/user identifier when known)
- `auditEventId`
- `nextState` or `serverActionTaken`

Timeout/fallback rules must be explicit per approval type:
- safe read-only approvals may auto-expire with no side effect
- dangerous writes must fail closed by default
- if a backend action can continue without approval, the payload must say so clearly with `fallbackAction`

## 14. Notifications and APNs registration

### `POST /mobile/v1/push/register`
Registers or refreshes APNs token and notification preferences.

### `DELETE /mobile/v1/push/register/:deviceId`
Removes push registration.

Server should emit push-worthy events for:
- approval required
- job failed
- job completed
- gateway disconnected
- instance unhealthy
- session needs input

Payload must contain:
- instance ID
- object type
- object ID
- title
- body
- deep link target
- notification category

## 15. Error model

Recommended shared error shape:
```json
{
  "error": {
    "code": "INSUFFICIENT_SCOPE",
    "message": "This device cannot rotate secrets.",
    "retryable": false,
    "auditEventId": "aud_123"
  }
}
```

## 16. Pagination and search conventions

Recommended conventions:
- cursor-based pagination for changing lists
- `limit` default 20, max 100
- free-text `query` or `search` parameters where relevant
- stable sort order per endpoint

## 17. Destructive action and idempotency rules

- destructive actions must return audit event IDs
- repeated `pause`, `resume`, and `run` calls should be idempotent or clearly conflict-coded
- restart or revoke endpoints must require explicit confirmation fields when feasible

## 18. Versioning strategy

Recommended:
- `/mobile/v1/*`
- additive changes only within version
- capability flags for partial support across Hermes versions
- deprecation windows for breaking changes

## 18.1 Compatibility mapping expectations

The façade must explicitly document, per major mobile surface, whether the behavior is:
- backed directly by an existing Hermes primitive
- normalized from an unstable Hermes/internal shape
- newly implemented in the mobile companion layer

At minimum, maintain a compatibility matrix for:
- sessions/chat
- jobs/cron
- config editing
- secrets handling
- approvals
- device trust
- push registration and deep links

If a connected Hermes version lacks a capability required by the app:
- expose that absence via `GET /mobile/v1/capabilities`
- hide or downgrade the mobile action
- return a structured error with upgrade/fallback guidance if the client still attempts the call

## 19. Failure-mode expectations

The app must be able to distinguish:
- auth expired
- trust revoked
- instance offline
- gateway degraded
- capability unsupported
- write blocked by scope
- transient retry-safe backend error

## 20. Implementation note

This contract can begin as a thin compatibility layer in front of Hermes, but it should be treated as a product surface, not a temporary afterthought.

If HermesMob is meant to be a serious operator console, this API is part of the product itself.
