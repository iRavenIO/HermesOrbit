import SwiftUI

struct ArtifactDetailView: View {
    let artifact: ArtifactEntry

    var icon: String {
        switch artifact.artifactType {
        case "Markdown": return "doc.text.fill"
        case "Screenshot": return "photo.fill"
        case "JSON": return "curlybraces"
        case "Log": return "terminal.fill"
        default: return "doc.fill"
        }
    }

    var sizeLabel: String {
        let kb = artifact.sizeBytes / 1024
        return kb > 1000 ? "\(kb / 1024) MB" : "\(kb) KB"
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            RoundedRectangle(cornerRadius: HermesChrome.iconTile, style: .continuous)
                                .fill(HermesPalette.cardSoft)
                                .frame(width: 52, height: 52)
                                .overlay {
                                    Image(systemName: icon)
                                        .font(.system(size: 22, weight: .semibold))
                                        .foregroundStyle(HermesPalette.accent)
                                }
                            VStack(alignment: .leading, spacing: 4) {
                                Text(artifact.name)
                                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                                    .foregroundStyle(HermesPalette.textPrimary)
                                    .lineLimit(2)
                                Text(sizeLabel)
                                    .font(.system(size: 13, weight: .medium, design: .rounded))
                                    .foregroundStyle(HermesPalette.textMuted)
                            }
                            Spacer()
                        }
                        StatusBadge(title: artifact.artifactType, tone: .neutral)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Preview")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(artifact.previewNote)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Metadata")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Type", detail: artifact.artifactType)
                        PolicyLine(title: "Size", detail: sizeLabel)
                        PolicyLine(title: "Session", detail: artifact.sessionTitle)
                        PolicyLine(title: "Created", detail: artifact.createdAt)
                    }
                }

                SecondaryButton(title: "Share artifact", systemImage: "square.and.arrow.up") {}
            }
            .padding(20)
        }
        .navigationTitle("Artifact")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ArtifactDetailView(artifact: Phase1Data.artifacts[0])
    }
}
