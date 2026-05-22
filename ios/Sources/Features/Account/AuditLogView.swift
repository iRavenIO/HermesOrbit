import SwiftUI

struct AuditLogView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Audit Log")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text("Recent trust and operator events. Actions taken by you or the system on this device.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Phase1Data.auditEntries) { entry in
                            AuditEntryRow(entry: entry)
                            if entry.id != Phase1Data.auditEntries.last?.id {
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
        .navigationTitle("Audit Log")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct AuditEntryRow: View {
    let entry: AuditEntry

    var actionIcon: String {
        if entry.action.contains("approved") { return "checkmark.circle.fill" }
        if entry.action.contains("denied") || entry.action.contains("revoked") { return "xmark.circle.fill" }
        if entry.action.contains("session") { return "bubble.left.fill" }
        if entry.action.contains("secret") { return "key.fill" }
        return "clock.fill"
    }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: actionIcon)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(entry.resultTone == .positive ? HermesPalette.accent : entry.resultTone == .critical ? HermesPalette.critical : HermesPalette.warning)
                .frame(width: 28)
                .padding(.top, 2)
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(entry.action)
                        .font(.system(size: 13, weight: .semibold, design: .monospaced))
                        .foregroundStyle(HermesPalette.textPrimary)
                    Spacer()
                    StatusBadge(title: entry.result, tone: entry.resultTone)
                }
                Text(entry.target)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
                HStack {
                    Text(entry.actor)
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundStyle(HermesPalette.textMuted)
                    Spacer()
                    Text(entry.timestamp)
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundStyle(HermesPalette.textMuted)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        AuditLogView()
    }
}
