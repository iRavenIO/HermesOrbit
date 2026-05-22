import SwiftUI

struct InstanceDetailView: View {
    let detail: InstanceDetail

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            StatusBadge(title: detail.trustLabel, tone: detail.tone)
                            StatusBadge(title: detail.shortStatus, tone: detail.tone)
                        }
                        HStack(alignment: .top, spacing: 14) {
                            RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous)
                                .fill(HermesPalette.cardSoft)
                                .frame(width: 52, height: 52)
                                .overlay {
                                    Image(systemName: detail.symbol)
                                        .font(.system(size: 22, weight: .semibold))
                                        .foregroundStyle(HermesPalette.accent)
                                }
                            VStack(alignment: .leading, spacing: 4) {
                                Text(detail.name)
                                    .font(.system(size: 22, weight: .bold, design: .rounded))
                                    .foregroundStyle(HermesPalette.textPrimary)
                                Text(detail.environment)
                                    .font(.system(size: 14, weight: .medium, design: .rounded))
                                    .foregroundStyle(HermesPalette.textSecondary)
                            }
                        }
                        Text(detail.statusSentence)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textMuted)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Connection")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        ConnectionField(label: "URL", value: detail.url)
                        ConnectionField(label: "Version", value: detail.version)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Platforms")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        FlowLayout(items: detail.platforms) { platform in
                            ScopeChip(title: platform, highlighted: true)
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Scopes")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        FlowLayout(items: detail.scopes) { scope in
                            ScopeChip(title: scope)
                        }
                    }
                }

                SecondaryButton(title: "Revoke trust for this instance", systemImage: "xmark.shield") {}
            }
            .padding(20)
        }
        .navigationTitle(detail.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct FlowLayout<Item: Hashable, Content: View>: View {
    let items: [Item]
    @ViewBuilder let content: (Item) -> Content

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), alignment: .leading)], alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                content(item)
            }
        }
    }
}

#Preview {
    NavigationStack {
        InstanceDetailView(detail: Phase1Data.instanceDetails[0])
    }
}
