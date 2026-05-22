import SwiftUI

struct ConfigDetailView: View {
    let entry: ConfigEntry

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            StatusBadge(title: entry.valueType, tone: .neutral)
                            if entry.restartRequired {
                                StatusBadge(title: "Restart required", tone: .warning)
                            }
                        }
                        Text(entry.key)
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(entry.description)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Current value")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(entry.value)
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundStyle(HermesPalette.textPrimary)
                            .padding(14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                    }
                }

                if entry.restartRequired {
                    GlassCard {
                        HStack(spacing: 12) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(HermesPalette.warning)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Restart required")
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                                    .foregroundStyle(HermesPalette.textPrimary)
                                Text("Changing this setting requires a gateway restart to take effect.")
                                    .font(.system(size: 13, weight: .medium, design: .rounded))
                                    .foregroundStyle(HermesPalette.textSecondary)
                            }
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Metadata")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Type", detail: entry.valueType)
                        PolicyLine(title: "Restart required", detail: entry.restartRequired ? "Yes" : "No")
                    }
                }

                SecondaryButton(title: "Edit value (read-only in Phase 1)", systemImage: "lock") {}
            }
            .padding(20)
        }
        .navigationTitle(entry.key.components(separatedBy: ".").last ?? entry.key)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ConfigDetailView(entry: Phase1Data.configEntries[0])
    }
}
