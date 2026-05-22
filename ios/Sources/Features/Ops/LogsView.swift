import SwiftUI

struct LogsView: View {
    @State private var filter: String = "All"
    let filters = ["All", "ERROR", "WARN", "INFO"]

    var filtered: [LogEntry] {
        filter == "All" ? Phase1Data.logs : Phase1Data.logs.filter { $0.level == filter }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Logs")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text("Recent actionable event stream. Errors and warnings surface first.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(filters, id: \.self) { f in
                                    Button {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                                            filter = f
                                        }
                                    } label: {
                                        Text(f)
                                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                                            .foregroundStyle(filter == f ? HermesPalette.accentForeground : HermesPalette.textPrimary)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 8)
                                            .background(filter == f ? HermesPalette.accent : HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.badge, style: .continuous))
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(filtered) { entry in
                            LogEntryRow(entry: entry)
                            if entry.id != filtered.last?.id {
                                Divider()
                                    .background(HermesPalette.stroke)
                            }
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("Logs")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct LogEntryRow: View {
    let entry: LogEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                StatusBadge(title: entry.level, tone: entry.levelTone)
                Text(entry.source)
                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                    .foregroundStyle(HermesPalette.textMuted)
                Spacer()
                Text(entry.timestamp)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textMuted)
            }
            Text(entry.message)
                .font(.system(size: 13, weight: .medium, design: .monospaced))
                .foregroundStyle(HermesPalette.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    NavigationStack {
        LogsView()
    }
}
