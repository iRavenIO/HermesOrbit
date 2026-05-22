import SwiftUI

struct SecuritySettingsView: View {
    @State private var faceIDEnabled = true
    @State private var strictMode = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Security")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text("Trust states, Face ID gating for sensitive operations, and instance pairing controls.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                        StatusBadge(title: "Device trusted", tone: .positive)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Biometric gating")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        ToggleRow(
                            title: "Face ID for approvals",
                            subtitle: "Require biometric confirmation before approving any agent action",
                            icon: "faceid",
                            isOn: $faceIDEnabled
                        )
                        Divider().background(HermesPalette.stroke)
                        ToggleRow(
                            title: "Face ID for secret reveal",
                            subtitle: "Gate the 'reveal value' action behind biometric",
                            icon: "eye.slash.fill",
                            isOn: $faceIDEnabled
                        )
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Trust policy")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        ToggleRow(
                            title: "Strict TLS mode",
                            subtitle: "Reject any instance with a changed or unverified certificate",
                            icon: "lock.shield.fill",
                            isOn: $strictMode
                        )
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Trust states")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        ForEach(Phase1Data.instanceDetails) { detail in
                            TrustMeter(title: detail.name, detail: detail.environment, state: detail.trustLabel)
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("Security")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct ToggleRow: View {
    let title: String
    let subtitle: String
    let icon: String
    @Binding var isOn: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(HermesPalette.accent)
                .frame(width: 28)
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
        SecuritySettingsView()
    }
}
