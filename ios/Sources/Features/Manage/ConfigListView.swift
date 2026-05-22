import SwiftUI

struct ConfigListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Config")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text("Typed editable settings for the Hermes runtime. Changes take effect immediately unless a restart is required.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Phase1Data.configEntries) { entry in
                            NavigationLink {
                                ConfigDetailView(entry: entry)
                            } label: {
                                ConfigRowView(entry: entry)
                            }
                            .buttonStyle(.plain)
                            if entry.id != Phase1Data.configEntries.last?.id {
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
        .navigationTitle("Config")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct ConfigRowView: View {
    let entry: ConfigEntry

    var typeIcon: String {
        switch entry.valueType {
        case "bool": return "togglepower"
        case "int": return "number"
        default: return "text.quote"
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: typeIcon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(HermesPalette.accent)
                .frame(width: 24)
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.key)
                    .font(.system(size: 13, weight: .semibold, design: .monospaced))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text(entry.value)
                    .font(.system(size: 12, weight: .medium, design: .monospaced))
                    .foregroundStyle(HermesPalette.textSecondary)
            }
            Spacer()
            if entry.restartRequired {
                StatusBadge(title: "Restart", tone: .warning)
            }
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(HermesPalette.textMuted)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationStack {
        ConfigListView()
    }
}
