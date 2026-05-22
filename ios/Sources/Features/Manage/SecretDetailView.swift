import SwiftUI

struct SecretDetailView: View {
    let secret: SecretEntry
    @State private var revealed = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            StatusBadge(title: secret.present ? "Set" : "Missing", tone: secret.present ? .positive : .critical)
                            StatusBadge(title: secret.scope, tone: .neutral)
                        }
                        Text(secret.key)
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .foregroundStyle(HermesPalette.textPrimary)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Value")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        HStack(spacing: 12) {
                            Text(revealed ? "••••••• (value hidden in Phase 1)" : secret.maskedHint)
                                .font(.system(size: 14, weight: .medium, design: .monospaced))
                                .foregroundStyle(HermesPalette.textSecondary)
                                .padding(12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                        }
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                                revealed.toggle()
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: revealed ? "eye.slash" : "eye")
                                    .font(.system(size: 13, weight: .semibold))
                                Text(revealed ? "Hide value" : "Reveal (Face ID gated)")
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                            }
                            .foregroundStyle(HermesPalette.accent)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(HermesPalette.accent.opacity(0.1), in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Details")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Scope", detail: secret.scope)
                        PolicyLine(title: "Last rotated", detail: secret.lastRotated)
                        PolicyLine(title: "Present", detail: secret.present ? "Yes" : "No")
                    }
                }

                if !secret.present {
                    GlassCard {
                        HStack(spacing: 12) {
                            Image(systemName: "exclamationmark.circle.fill")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(HermesPalette.critical)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Secret not set")
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                                    .foregroundStyle(HermesPalette.textPrimary)
                                Text("This credential is required for the '\(secret.scope)' surface to function.")
                                    .font(.system(size: 13, weight: .medium, design: .rounded))
                                    .foregroundStyle(HermesPalette.textSecondary)
                            }
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle(secret.key)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SecretDetailView(secret: Phase1Data.secrets[0])
    }
}
