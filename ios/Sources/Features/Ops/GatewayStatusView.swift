import SwiftUI

struct GatewayStatusView: View {
    var connected: Int { Phase1Data.gatewayPlatforms.filter { $0.statusTone == .positive }.count }
    var total: Int { Phase1Data.gatewayPlatforms.count }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Gateway")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: "\(connected)/\(total) connected", tone: connected == total ? .positive : .warning)
                        }
                        Text("Platform delivery health across all connected gateway surfaces.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    MetricPanel(title: "Connected", value: "\(connected)", note: "platforms online", tone: .positive)
                    MetricPanel(title: "Active sessions", value: "\(Phase1Data.gatewayPlatforms.map(\.activeSessions).reduce(0, +))", note: "across all platforms", tone: .neutral)
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Phase1Data.gatewayPlatforms) { platform in
                            GatewayPlatformRow(platform: platform)
                            if platform.id != Phase1Data.gatewayPlatforms.last?.id {
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
        .navigationTitle("Gateway Status")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct GatewayPlatformRow: View {
    let platform: GatewayPlatform

    var icon: String {
        switch platform.name {
        case "Telegram": return "paperplane.fill"
        case "Slack": return "number"
        case "Local CLI": return "terminal.fill"
        case "REST API": return "network"
        default: return "antenna.radiowaves.left.and.right"
        }
    }

    var body: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: HermesChrome.iconTile, style: .continuous)
                .fill(HermesPalette.cardSoft)
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(HermesPalette.accent)
                }
            VStack(alignment: .leading, spacing: 4) {
                Text(platform.name)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                HStack(spacing: 8) {
                    Text("Last seen \(platform.lastSeen)")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundStyle(HermesPalette.textMuted)
                    if platform.activeSessions > 0 {
                        Text("· \(platform.activeSessions) session\(platform.activeSessions > 1 ? "s" : "")")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.accent)
                    }
                }
            }
            Spacer()
            StatusBadge(title: platform.status, tone: platform.statusTone)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack {
        GatewayStatusView()
    }
}
