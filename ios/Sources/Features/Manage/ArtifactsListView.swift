import SwiftUI

struct ArtifactsListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Artifacts")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: "\(Phase1Data.artifacts.count) total", tone: .neutral)
                        }
                        Text("Screenshots, exports, and generated files produced by Hermes sessions.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Phase1Data.artifacts) { artifact in
                            NavigationLink {
                                ArtifactDetailView(artifact: artifact)
                            } label: {
                                ArtifactListRow(artifact: artifact)
                            }
                            .buttonStyle(.plain)
                            if artifact.id != Phase1Data.artifacts.last?.id {
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
        .navigationTitle("Artifacts")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ArtifactListRow: View {
    let artifact: ArtifactEntry

    var icon: String {
        switch artifact.artifactType {
        case "Markdown": return "doc.text"
        case "Screenshot": return "photo"
        case "JSON": return "curlybraces"
        case "Log": return "terminal"
        default: return "doc"
        }
    }

    var sizeLabel: String {
        let kb = artifact.sizeBytes / 1024
        return kb > 1000 ? "\(kb / 1024) MB" : "\(kb) KB"
    }

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: HermesChrome.iconTile, style: .continuous)
                .fill(HermesPalette.cardSoft)
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: icon)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(HermesPalette.accent)
                }
            VStack(alignment: .leading, spacing: 4) {
                Text(artifact.name)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                    .lineLimit(1)
                Text("\(artifact.sessionTitle) · \(artifact.createdAt)")
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textMuted)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                StatusBadge(title: artifact.artifactType, tone: .neutral)
                Text(sizeLabel)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textMuted)
            }
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(HermesPalette.textMuted)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack {
        ArtifactsListView()
    }
}
