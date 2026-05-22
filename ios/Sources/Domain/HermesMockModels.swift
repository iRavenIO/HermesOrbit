import SwiftUI

struct HermesInstance: Identifiable {
    let id = UUID()
    let name: String
    let environment: String
    let statusSentence: String
    let trustLabel: String
    let shortStatus: String
    let symbol: String
    let tone: StatusBadge.Tone
}

struct SessionSummary: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let source: String
    let icon: String
}

struct QuickAction: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
}

// MARK: - Ops Models

struct ApprovalEntry: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let riskLevel: String
    let riskTone: StatusBadge.Tone
    let status: String
    let statusTone: StatusBadge.Tone
    let instanceName: String
    let requestedAt: String
    let expiresAt: String
    let detail: String
}

struct JobEntry: Identifiable {
    let id = UUID()
    let name: String
    let schedule: String
    let status: String
    let statusTone: StatusBadge.Tone
    let lastRun: String
    let nextRun: String
    let outputPreview: String
}

struct LogEntry: Identifiable {
    let id = UUID()
    let level: String
    let levelTone: StatusBadge.Tone
    let message: String
    let timestamp: String
    let source: String
}

struct DiagnosticProbe: Identifiable {
    let id = UUID()
    let name: String
    let status: String
    let statusTone: StatusBadge.Tone
    let detail: String
    let latency: String
}

struct GatewayPlatform: Identifiable {
    let id = UUID()
    let name: String
    let status: String
    let statusTone: StatusBadge.Tone
    let lastSeen: String
    let activeSessions: Int
}

struct BackgroundProcess: Identifiable {
    let id = UUID()
    let name: String
    let status: String
    let statusTone: StatusBadge.Tone
    let pid: String
    let uptime: String
    let memoryMB: Int
}

// MARK: - Manage Models

struct ConfigEntry: Identifiable {
    let id = UUID()
    let key: String
    let value: String
    let valueType: String
    let restartRequired: Bool
    let description: String
}

struct SecretEntry: Identifiable {
    let id = UUID()
    let key: String
    let present: Bool
    let lastRotated: String
    let scope: String
    let maskedHint: String
}

struct SkillEntry: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: String
    let linkedFiles: [String]
    let version: String
}

struct MemoryEntry: Identifiable {
    let id = UUID()
    let target: String
    let content: String
    let category: String
    let updatedAt: String
}

struct ArtifactEntry: Identifiable {
    let id = UUID()
    let name: String
    let artifactType: String
    let sizeBytes: Int
    let sessionTitle: String
    let createdAt: String
    let previewNote: String
}

// MARK: - Account Models

struct InstanceDetail: Identifiable {
    let id = UUID()
    let name: String
    let environment: String
    let statusSentence: String
    let trustLabel: String
    let shortStatus: String
    let symbol: String
    let tone: StatusBadge.Tone
    let url: String
    let version: String
    let platforms: [String]
    let scopes: [String]
}

struct AuditEntry: Identifiable {
    let id = UUID()
    let action: String
    let target: String
    let actor: String
    let timestamp: String
    let result: String
    let resultTone: StatusBadge.Tone
}

// MARK: - Sessions Models

struct TranscriptMessage: Identifiable {
    let id = UUID()
    let role: String
    let content: String
    let timestamp: String
    let isHighlighted: Bool
}

struct ToolCallEntry: Identifiable {
    let id = UUID()
    let tool: String
    let input: String
    let output: String
    let duration: String
}

// MARK: - Phase1Data

enum Phase1Data {
    static let instances: [HermesInstance] = [
        HermesInstance(
            name: "Personal Hermes",
            environment: "Private control plane",
            statusSentence: "Trusted • Healthy • TLS valid • 2 sessions • 1 approval",
            trustLabel: "Trusted",
            shortStatus: "Healthy",
            symbol: "person.crop.square.filled.and.at.rectangle",
            tone: .positive
        ),
        HermesInstance(
            name: "Lab Agent",
            environment: "R&D sandbox",
            statusSentence: "Pending review • Restricted • Cert changed • 1 warning",
            trustLabel: "Review",
            shortStatus: "Restricted",
            symbol: "flask.fill",
            tone: .warning
        ),
        HermesInstance(
            name: "Production Agent",
            environment: "Shared production fleet",
            statusSentence: "Revoked on this device • Read-only • Degraded",
            trustLabel: "Revoked",
            shortStatus: "Degraded",
            symbol: "server.rack",
            tone: .critical
        )
    ]

    static let sessions: [SessionSummary] = [
        SessionSummary(title: "Chance billing triage", subtitle: "Production Agent • last active 2m ago", source: "Telegram", icon: "dollarsign.circle"),
        SessionSummary(title: "HermesOrbit visual QA", subtitle: "Personal Hermes • reviewing overnight passes", source: "CLI", icon: "paintbrush.pointed"),
        SessionSummary(title: "Infrastructure read-only audit", subtitle: "Lab Agent • tailscale / gateway posture", source: "Cron", icon: "antenna.radiowaves.left.and.right")
    ]

    static let quickActions: [QuickAction] = [
        QuickAction(title: "Resume active session", subtitle: "Reopen the current runtime with streaming output", icon: "play.circle.fill"),
        QuickAction(title: "Open approvals", subtitle: "1 production approval and 1 cron intervention waiting", icon: "checkmark.seal.fill"),
        QuickAction(title: "Inspect failed cron", subtitle: "Jump straight into the failed nightly reconcile job", icon: "clock.badge.exclamationmark")
    ]

    static let runtimeContext: [QuickAction] = [
        QuickAction(title: "Attached session", subtitle: "Chance billing triage • Production Agent", icon: "link.circle.fill"),
        QuickAction(title: "Tools sheet", subtitle: "Model + tool permissions available from side sheet", icon: "slider.horizontal.3"),
        QuickAction(title: "Last output", subtitle: "Copy final response or reopen source session", icon: "doc.on.doc.fill")
    ]

    static let systemSurfaces: [QuickAction] = [
        QuickAction(title: "Logs", subtitle: "Summary-first diagnostics with drill-down", icon: "doc.text.magnifyingglass"),
        QuickAction(title: "Cron", subtitle: "7 jobs • 1 failed • 1 queued", icon: "clock.arrow.trianglehead.counterclockwise.rotate.90"),
        QuickAction(title: "Analytics", subtitle: "Usage and health snapshots", icon: "chart.bar.xaxis"),
        QuickAction(title: "Gateway status", subtitle: "Platform health and active session strip", icon: "waveform.path.ecg")
    ]

    static let manageSurfaces: [QuickAction] = [
        QuickAction(title: "Models", subtitle: "Inspect configured models and providers", icon: "cpu.fill"),
        QuickAction(title: "Skills", subtitle: "Browse installed skills and linked files", icon: "square.stack.3d.up.fill"),
        QuickAction(title: "Plugins", subtitle: "Check extensions and injected surfaces", icon: "puzzlepiece.extension.fill"),
        QuickAction(title: "Profiles", subtitle: "Read profile posture and switch safely", icon: "person.2.crop.square.stack.fill"),
        QuickAction(title: "Config", subtitle: "Typed settings editor for supported values", icon: "gearshape.2.fill"),
        QuickAction(title: "Keys", subtitle: "Presence, scope, gated reveal and update", icon: "key.horizontal.fill")
    ]

    static let docsSurfaces: [QuickAction] = [
        QuickAction(title: "Hermes Web parity notes", subtitle: "Why Sessions-first and runtime Chat are the V1 baseline", icon: "safari.fill"),
        QuickAction(title: "Mobile API contract", subtitle: "Draft contract for native app surfaces", icon: "network"),
        QuickAction(title: "Delivery roadmap", subtitle: "Phase 1 → Phase 4 rollout and exclusions", icon: "map.fill")
    ]

    // MARK: - Approvals Mock Data

    static let approvals: [ApprovalEntry] = [
        ApprovalEntry(
            title: "Restart gateway on expired token",
            subtitle: "Production Agent requests system restart after auth token expiry",
            riskLevel: "High",
            riskTone: .critical,
            status: "Pending",
            statusTone: .warning,
            instanceName: "Production Agent",
            requestedAt: "Today 09:14",
            expiresAt: "Today 11:14",
            detail: "The production gateway auth token expired at 09:12. The agent has requested permission to restart the gateway service and re-authenticate using the stored refresh credential. This will cause a brief interruption (est. 30s) to all connected sessions."
        ),
        ApprovalEntry(
            title: "Write invoice summary to Notion",
            subtitle: "Personal Hermes wants to export billing data to workspace",
            riskLevel: "Medium",
            riskTone: .warning,
            status: "Pending",
            statusTone: .warning,
            instanceName: "Personal Hermes",
            requestedAt: "Today 08:47",
            expiresAt: "Today 20:47",
            detail: "Session 'Chance billing triage' completed invoice analysis and requests approval to write the summary markdown to the linked Notion workspace under the Finance / Billing section. Data includes invoice IDs, amounts, and anomaly notes."
        ),
        ApprovalEntry(
            title: "Delete stale cron output logs",
            subtitle: "Lab Agent cleanup of logs older than 30 days",
            riskLevel: "Low",
            riskTone: .neutral,
            status: "Pending",
            statusTone: .warning,
            instanceName: "Lab Agent",
            requestedAt: "Yesterday 22:00",
            expiresAt: "Tomorrow 22:00",
            detail: "Routine maintenance: the lab agent has identified 847 MB of cron output logs older than 30 days. These are safe to delete according to the configured retention policy. No active sessions reference these logs."
        )
    ]

    // MARK: - Jobs Mock Data

    static let jobs: [JobEntry] = [
        JobEntry(
            name: "nightly-reconcile",
            schedule: "0 2 * * *",
            status: "Failed",
            statusTone: .critical,
            lastRun: "Today 02:00",
            nextRun: "Tomorrow 02:00",
            outputPreview: "ERROR: upstream context stale — could not fetch invoice delta from Chance API (timeout after 30s)"
        ),
        JobEntry(
            name: "gateway-health-check",
            schedule: "*/5 * * * *",
            status: "Healthy",
            statusTone: .positive,
            lastRun: "5 min ago",
            nextRun: "In 5 min",
            outputPreview: "All 4 platforms reachable. Telegram: 12ms. Slack: 28ms. API: 9ms. CLI: local."
        ),
        JobEntry(
            name: "log-export",
            schedule: "0 6 * * *",
            status: "Queued",
            statusTone: .warning,
            lastRun: "Yesterday 06:00",
            nextRun: "Today 06:00",
            outputPreview: "Waiting for slot. Previous run exported 1,204 log entries to archive."
        ),
        JobEntry(
            name: "trust-cert-audit",
            schedule: "0 0 * * 1",
            status: "Healthy",
            statusTone: .positive,
            lastRun: "Last Monday",
            nextRun: "This Monday",
            outputPreview: "3 instances audited. Personal Hermes: TLS valid 89d. Lab Agent: cert changed — flagged. Production: revoked."
        ),
        JobEntry(
            name: "session-archiver",
            schedule: "0 3 * * *",
            status: "Healthy",
            statusTone: .positive,
            lastRun: "Today 03:00",
            nextRun: "Tomorrow 03:00",
            outputPreview: "Archived 2 completed sessions. Total archive: 47 sessions, 1.2 GB."
        )
    ]

    // MARK: - Log Entries Mock Data

    static let logs: [LogEntry] = [
        LogEntry(level: "ERROR", levelTone: .critical, message: "nightly-reconcile failed: upstream timeout after 30s", timestamp: "Today 02:00:14", source: "cron"),
        LogEntry(level: "WARN", levelTone: .warning, message: "Lab Agent cert fingerprint changed — trust review required", timestamp: "Yesterday 18:33:01", source: "trust"),
        LogEntry(level: "INFO", levelTone: .neutral, message: "Gateway health check passed: 4/4 platforms reachable", timestamp: "5 min ago", source: "gateway"),
        LogEntry(level: "INFO", levelTone: .neutral, message: "Session archived: sess_infra_audit (completed)", timestamp: "Today 03:00:02", source: "sessions"),
        LogEntry(level: "WARN", levelTone: .warning, message: "Approval APR-190 expiring in 2 hours — no action taken", timestamp: "Today 09:14:30", source: "approvals"),
        LogEntry(level: "INFO", levelTone: .positive, message: "Production Agent token refreshed via stored credential", timestamp: "Today 07:00:00", source: "auth"),
        LogEntry(level: "ERROR", levelTone: .critical, message: "Session sess_chance_billing: tool call timeout (bash, 45s)", timestamp: "Today 08:44:11", source: "sessions")
    ]

    // MARK: - Diagnostic Probes Mock Data

    static let diagnostics: [DiagnosticProbe] = [
        DiagnosticProbe(name: "Database connectivity", status: "Healthy", statusTone: .positive, detail: "PostgreSQL reachable via Supabase pooler", latency: "8ms"),
        DiagnosticProbe(name: "Redis cache", status: "Healthy", statusTone: .positive, detail: "Connected to localhost:6379, 43MB used", latency: "1ms"),
        DiagnosticProbe(name: "TLS certificate", status: "Warning", statusTone: .warning, detail: "Lab Agent cert changed — manual review pending", latency: "—"),
        DiagnosticProbe(name: "Cron scheduler", status: "Degraded", statusTone: .critical, detail: "1 of 5 jobs in failed state: nightly-reconcile", latency: "—"),
        DiagnosticProbe(name: "Session store", status: "Healthy", statusTone: .positive, detail: "3 active, 44 archived sessions on disk", latency: "3ms")
    ]

    // MARK: - Gateway Platforms Mock Data

    static let gatewayPlatforms: [GatewayPlatform] = [
        GatewayPlatform(name: "Telegram", status: "Connected", statusTone: .positive, lastSeen: "12s ago", activeSessions: 1),
        GatewayPlatform(name: "Slack", status: "Connected", statusTone: .positive, lastSeen: "28s ago", activeSessions: 0),
        GatewayPlatform(name: "Local CLI", status: "Connected", statusTone: .positive, lastSeen: "2s ago", activeSessions: 2),
        GatewayPlatform(name: "REST API", status: "Degraded", statusTone: .warning, lastSeen: "4m ago", activeSessions: 0)
    ]

    // MARK: - Background Processes Mock Data

    static let backgroundProcesses: [BackgroundProcess] = [
        BackgroundProcess(name: "hermes-gateway", status: "Running", statusTone: .positive, pid: "1842", uptime: "6h 14m", memoryMB: 128),
        BackgroundProcess(name: "session-watcher", status: "Running", statusTone: .positive, pid: "1843", uptime: "6h 14m", memoryMB: 42),
        BackgroundProcess(name: "cron-runner", status: "Idle", statusTone: .neutral, pid: "1844", uptime: "6h 14m", memoryMB: 18),
        BackgroundProcess(name: "log-streamer", status: "Running", statusTone: .positive, pid: "1845", uptime: "6h 14m", memoryMB: 31),
        BackgroundProcess(name: "trust-monitor", status: "Warning", statusTone: .warning, pid: "1847", uptime: "2h 05m", memoryMB: 22)
    ]

    // MARK: - Config Entries Mock Data

    static let configEntries: [ConfigEntry] = [
        ConfigEntry(key: "hermes.model.default", value: "claude-sonnet-4-6", valueType: "string", restartRequired: false, description: "Default model used for new sessions when not overridden by profile or skill."),
        ConfigEntry(key: "hermes.session.timeout_seconds", value: "3600", valueType: "int", restartRequired: false, description: "Idle session timeout in seconds before archival."),
        ConfigEntry(key: "hermes.gateway.auto_reconnect", value: "true", valueType: "bool", restartRequired: false, description: "Automatically reconnect gateway platforms after transient failures."),
        ConfigEntry(key: "hermes.approvals.expiry_hours", value: "12", valueType: "int", restartRequired: false, description: "Default approval TTL in hours. Expired approvals are auto-denied."),
        ConfigEntry(key: "hermes.trust.strict_mode", value: "true", valueType: "bool", restartRequired: true, description: "Reject any instance with a changed or unverified certificate. Restart required to apply.")
    ]

    // MARK: - Secrets Mock Data

    static let secrets: [SecretEntry] = [
        SecretEntry(key: "ANTHROPIC_API_KEY", present: true, lastRotated: "14 days ago", scope: "model-inference", maskedHint: "sk-ant-•••••••KQZR"),
        SecretEntry(key: "TELEGRAM_BOT_TOKEN", present: true, lastRotated: "42 days ago", scope: "gateway-telegram", maskedHint: "7281•••••:AAH•••••qW4"),
        SecretEntry(key: "SLACK_APP_TOKEN", present: true, lastRotated: "7 days ago", scope: "gateway-slack", maskedHint: "xapp-1-•••••••-•••••"),
        SecretEntry(key: "SUPABASE_SERVICE_KEY", present: true, lastRotated: "90 days ago", scope: "database", maskedHint: "eyJh•••••••••••eyJyb"),
        SecretEntry(key: "NOTION_TOKEN", present: false, lastRotated: "—", scope: "integrations", maskedHint: "Not set")
    ]

    // MARK: - Skills Mock Data

    static let skills: [SkillEntry] = [
        SkillEntry(name: "brainstorming", description: "Explores user intent and requirements before implementation. Use before any creative or build task.", category: "Workflow", linkedFiles: ["SKILL.md", "brainstorm-template.md"], version: "1.2.0"),
        SkillEntry(name: "simplify", description: "Reviews changed code for reuse, quality, and efficiency. Fixes issues found.", category: "Code Quality", linkedFiles: ["SKILL.md"], version: "1.0.3"),
        SkillEntry(name: "firecrawl", description: "Web scraping, search, crawling, and page interaction via the Firecrawl CLI.", category: "Integrations", linkedFiles: ["SKILL.md", "crawl-config.json"], version: "2.1.0"),
        SkillEntry(name: "security-review", description: "Comprehensive security audit of code changes. Checks OWASP top 10 and secrets exposure.", category: "Security", linkedFiles: ["SKILL.md", "security-checklist.md"], version: "1.1.0"),
        SkillEntry(name: "graphify", description: "Converts any input to a knowledge graph with clustered communities.", category: "Analysis", linkedFiles: ["SKILL.md", "graph-config.yml"], version: "3.0.1")
    ]

    // MARK: - Memory Entries Mock Data

    static let memories: [MemoryEntry] = [
        MemoryEntry(target: "user_profile", content: "Kousha is a platform engineer. Concise operational style. K3s/ArgoCD/Terraform/Go expert.", category: "user", updatedAt: "2 days ago"),
        MemoryEntry(target: "feedback_responses", content: "No trailing summaries. No 'here is what I did' narration. Terse responses preferred.", category: "feedback", updatedAt: "5 days ago"),
        MemoryEntry(target: "project_infrastructure", content: "Two K3s clusters (k3s-ha00, k3s-ha01). ArgoCD at ha01-argocd.kousha.dev. Vault auto-unseal via CronJob.", category: "project", updatedAt: "1 week ago"),
        MemoryEntry(target: "project_hermesorbit", content: "HermesOrbit iOS is Phase 1 — native Swift control plane for Hermes AI agents. Sessions-first, light mode, XcodeGen build.", category: "project", updatedAt: "Today")
    ]

    // MARK: - Artifacts Mock Data

    static let artifacts: [ArtifactEntry] = [
        ArtifactEntry(name: "invoice-analysis-2026-05.md", artifactType: "Markdown", sizeBytes: 12_480, sessionTitle: "Chance billing triage", createdAt: "Today 09:11", previewNote: "Invoice anomaly report with line items and recommended actions."),
        ArtifactEntry(name: "hermes-orbit-qa-pass.png", artifactType: "Screenshot", sizeBytes: 842_100, sessionTitle: "HermesOrbit visual QA", createdAt: "Today 07:30", previewNote: "Full-screen capture of QA pass on iPhone 16 simulator."),
        ArtifactEntry(name: "gateway-posture-report.json", artifactType: "JSON", sizeBytes: 4_320, sessionTitle: "Infrastructure read-only audit", createdAt: "Yesterday 22:44", previewNote: "Structured gateway and TLS posture for all 4 platforms."),
        ArtifactEntry(name: "cron-failure-trace.log", artifactType: "Log", sizeBytes: 28_900, sessionTitle: "Chance billing triage", createdAt: "Today 02:01", previewNote: "Full stack trace from nightly-reconcile failure at 02:00.")
    ]

    // MARK: - Instance Details Mock Data

    static let instanceDetails: [InstanceDetail] = [
        InstanceDetail(
            name: "Personal Hermes",
            environment: "Private control plane",
            statusSentence: "Trusted • Healthy • TLS valid • 2 sessions • 1 approval",
            trustLabel: "Trusted",
            shortStatus: "Healthy",
            symbol: "person.crop.square.filled.and.at.rectangle",
            tone: .positive,
            url: "https://hermes.kousha.dev",
            version: "2.4.1",
            platforms: ["Telegram", "CLI", "API"],
            scopes: ["sessions", "approvals", "jobs", "manage", "trust"]
        ),
        InstanceDetail(
            name: "Lab Agent",
            environment: "R&D sandbox",
            statusSentence: "Pending review • Restricted • Cert changed • 1 warning",
            trustLabel: "Review",
            shortStatus: "Restricted",
            symbol: "flask.fill",
            tone: .warning,
            url: "https://lab.hermes.kousha.dev",
            version: "2.5.0-beta",
            platforms: ["CLI"],
            scopes: ["sessions", "jobs"]
        ),
        InstanceDetail(
            name: "Production Agent",
            environment: "Shared production fleet",
            statusSentence: "Revoked on this device • Read-only • Degraded",
            trustLabel: "Revoked",
            shortStatus: "Degraded",
            symbol: "server.rack",
            tone: .critical,
            url: "https://prod-agent.iraven.io",
            version: "2.3.8",
            platforms: ["Telegram", "Slack", "API"],
            scopes: ["sessions:read"]
        )
    ]

    // MARK: - Audit Log Mock Data

    static let auditEntries: [AuditEntry] = [
        AuditEntry(action: "approval:denied", target: "APR-188 (cert-reissue)", actor: "Kousha / iPhone", timestamp: "Yesterday 18:34", result: "Denied", resultTone: .critical),
        AuditEntry(action: "approval:approved", target: "APR-187 (log-export)", actor: "Kousha / iPhone", timestamp: "Yesterday 14:02", result: "Approved", resultTone: .positive),
        AuditEntry(action: "instance:trust-revoked", target: "Production Agent", actor: "system / cert-monitor", timestamp: "3 days ago", result: "Revoked", resultTone: .critical),
        AuditEntry(action: "session:resumed", target: "sess_chance_billing", actor: "Kousha / Telegram", timestamp: "Today 08:44", result: "Success", resultTone: .positive),
        AuditEntry(action: "secret:rotated", target: "SLACK_APP_TOKEN", actor: "Kousha / CLI", timestamp: "7 days ago", result: "Success", resultTone: .positive)
    ]

    // MARK: - Transcript Mock Data

    static func transcriptMessages(for session: SessionSummary) -> [TranscriptMessage] {
        [
            TranscriptMessage(role: "user", content: "Check the latest invoice anomalies from Chance and summarize billing discrepancies.", timestamp: "08:44", isHighlighted: false),
            TranscriptMessage(role: "assistant", content: "I'll start by pulling the invoice delta from the Chance API and cross-referencing with the local ledger.", timestamp: "08:44", isHighlighted: true),
            TranscriptMessage(role: "tool", content: "bash: hermes invoice-fetch --since 2026-05-01 --format json\n→ 14 invoices fetched, 3 anomalies flagged", timestamp: "08:44", isHighlighted: false),
            TranscriptMessage(role: "assistant", content: "Found 3 anomalies: INV-2041 has a $240 line item with no matching purchase order. INV-2038 shows a duplicate charge for workspace seats. INV-2036 is overdue by 12 days.", timestamp: "08:45", isHighlighted: false),
            TranscriptMessage(role: "user", content: "Write the summary to a markdown artifact and request approval to push it to Notion.", timestamp: "08:46", isHighlighted: false),
            TranscriptMessage(role: "assistant", content: "Summary written to artifact 'invoice-analysis-2026-05.md'. Approval request APR-190 submitted for Notion export.", timestamp: "08:47", isHighlighted: true)
        ]
    }

    static func toolCalls(for session: SessionSummary) -> [ToolCallEntry] {
        [
            ToolCallEntry(tool: "bash", input: "hermes invoice-fetch --since 2026-05-01 --format json", output: "14 invoices fetched, 3 anomalies flagged (INV-2041, INV-2038, INV-2036)", duration: "2.1s"),
            ToolCallEntry(tool: "write_file", input: "invoice-analysis-2026-05.md (1.2 KB)", output: "Artifact created: arts_invoice_may26", duration: "0.3s"),
            ToolCallEntry(tool: "approval_request", input: "Write to Notion workspace /Finance/Billing", output: "APR-190 created, pending operator approval", duration: "0.8s")
        ]
    }
}
