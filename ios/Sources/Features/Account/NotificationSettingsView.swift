import SwiftUI

struct NotificationSettingsView: View {
    @State private var criticalAlerts = true
    @State private var approvalAlerts = true
    @State private var sessionAlerts = false
    @State private var jobAlerts = false
    @State private var quietHoursEnabled = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Notifications")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text("Control which Hermes events push alerts to this device. Default: critical-only.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Alert types")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        NotifToggle(title: "Critical alerts", subtitle: "System failures, revoked trust, cert changes", icon: "exclamationmark.triangle.fill", tone: .critical, isOn: $criticalAlerts)
                        Divider().background(HermesPalette.stroke)
                        NotifToggle(title: "Approval requests", subtitle: "New items in your approval queue", icon: "checkmark.seal.fill", tone: .warning, isOn: $approvalAlerts)
                        Divider().background(HermesPalette.stroke)
                        NotifToggle(title: "Session events", subtitle: "Session started, paused, or completed", icon: "bubble.left.and.bubble.right.fill", tone: .neutral, isOn: $sessionAlerts)
                        Divider().background(HermesPalette.stroke)
                        NotifToggle(title: "Job failures", subtitle: "Cron jobs that exit with errors", icon: "clock.badge.exclamationmark", tone: .warning, isOn: $jobAlerts)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Quiet hours")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        NotifToggle(title: "Enable quiet hours", subtitle: "Suppress non-critical alerts from 22:00 to 08:00", icon: "moon.fill", tone: .neutral, isOn: $quietHoursEnabled)
                        if quietHoursEnabled {
                            HStack(spacing: 16) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Start")
                                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                                        .foregroundStyle(HermesPalette.textMuted)
                                    Text("22:00")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundStyle(HermesPalette.textPrimary)
                                }
                                .padding(12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("End")
                                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                                        .foregroundStyle(HermesPalette.textMuted)
                                    Text("08:00")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundStyle(HermesPalette.textPrimary)
                                }
                                .padding(12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                            }
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct NotifToggle: View {
    let title: String
    let subtitle: String
    let icon: String
    let tone: StatusBadge.Tone
    @Binding var isOn: Bool

    var iconColor: Color {
        switch tone {
        case .positive: return HermesPalette.accent
        case .warning: return HermesPalette.warning
        case .critical: return HermesPalette.critical
        case .neutral: return HermesPalette.textSecondary
        }
    }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(iconColor)
                .frame(width: 24)
                .padding(.top, 2)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text(subtitle)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
            }
            Spacer()
            Toggle("", isOn: $isOn)
                .tint(HermesPalette.accent)
                .labelsHidden()
        }
    }
}

#Preview {
    NavigationStack {
        NotificationSettingsView()
    }
}
