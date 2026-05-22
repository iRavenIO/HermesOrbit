import SwiftUI

struct SecretsListView: View {
    var present: Int { Phase1Data.secrets.filter(\.present).count }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Secrets")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: "\(present)/\(Phase1Data.secrets.count) set", tone: present == Phase1Data.secrets.count ? .positive : .warning)
                        }
                        Text("Credential presence and health. Values are masked by default. Use gated reveal to inspect.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Phase1Data.secrets) { secret in
                            NavigationLink {
                                SecretDetailView(secret: secret)
                            } label: {
                                SecretRowView(secret: secret)
                            }
                            .buttonStyle(.plain)
                            if secret.id != Phase1Data.secrets.last?.id {
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
        .navigationTitle("Secrets")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SecretRowView: View {
    let secret: SecretEntry

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: secret.present ? "key.fill" : "key")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(secret.present ? HermesPalette.accent : HermesPalette.textMuted)
                .frame(width: 24)
            VStack(alignment: .leading, spacing: 4) {
                Text(secret.key)
                    .font(.system(size: 13, weight: .semibold, design: .monospaced))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text(secret.maskedHint)
                    .font(.system(size: 12, weight: .medium, design: .monospaced))
                    .foregroundStyle(HermesPalette.textMuted)
            }
            Spacer()
            StatusBadge(title: secret.present ? "Set" : "Missing", tone: secret.present ? .positive : .critical)
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(HermesPalette.textMuted)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationStack {
        SecretsListView()
    }
}
