import SwiftUI

struct DiagnosticsView: View {
    var overallTone: StatusBadge.Tone {
        if Phase1Data.diagnostics.contains(where: { $0.statusTone == .critical }) { return .critical }
        if Phase1Data.diagnostics.contains(where: { $0.statusTone == .warning }) { return .warning }
        return .positive
    }

    var overallLabel: String {
        switch overallTone {
        case .critical: return "Degraded"
        case .warning: return "Warning"
        default: return "Healthy"
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Diagnostics")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: overallLabel, tone: overallTone)
                        }
                        Text("Health probes for all core system components. Run-time checks for database, cache, TLS, cron, and session store.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    let healthy = Phase1Data.diagnostics.filter { $0.statusTone == .positive }.count
                    let total = Phase1Data.diagnostics.count
                    MetricPanel(title: "Healthy", value: "\(healthy)", note: "of \(total) probes", tone: .positive)
                    MetricPanel(title: "Issues", value: "\(total - healthy)", note: "require attention", tone: total - healthy > 0 ? .warning : .positive)
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Phase1Data.diagnostics) { probe in
                            DiagnosticProbeRow(probe: probe)
                            if probe.id != Phase1Data.diagnostics.last?.id {
                                Divider()
                                    .background(HermesPalette.stroke)
                                    .padding(.vertical, 4)
                            }
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("Diagnostics")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct DiagnosticProbeRow: View {
    let probe: DiagnosticProbe

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Circle()
                .fill(statusColor)
                .frame(width: 8, height: 8)
                .padding(.top, 5)
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(probe.name)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundStyle(HermesPalette.textPrimary)
                    Spacer()
                    if probe.latency != "—" {
                        Text(probe.latency)
                            .font(.system(size: 12, weight: .medium, design: .monospaced))
                            .foregroundStyle(HermesPalette.textMuted)
                    }
                    StatusBadge(title: probe.status, tone: probe.statusTone)
                }
                Text(probe.detail)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
            }
        }
        .padding(.vertical, 6)
    }

    var statusColor: Color {
        switch probe.statusTone {
        case .positive: return HermesPalette.accent
        case .warning: return HermesPalette.warning
        case .critical: return HermesPalette.critical
        case .neutral: return HermesPalette.textMuted
        }
    }
}

#Preview {
    NavigationStack {
        DiagnosticsView()
    }
}
