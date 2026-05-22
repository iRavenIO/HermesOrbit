import SwiftUI

struct SessionDetailView: View {
    let session: SessionSummary
    @State private var expandedToolCall: UUID?

    private var messages: [TranscriptMessage] { Phase1Data.transcriptMessages(for: session) }
    private var toolCalls: [ToolCallEntry] { Phase1Data.toolCalls(for: session) }
    private var artifacts: [ArtifactEntry] {
        Phase1Data.artifacts.filter { $0.sessionTitle == session.title }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            RoundedRectangle(cornerRadius: HermesChrome.iconTile, style: .continuous)
                                .fill(HermesPalette.cardSoft)
                                .frame(width: 44, height: 44)
                                .overlay {
                                    Image(systemName: session.icon)
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundStyle(HermesPalette.accent)
                                }
                            VStack(alignment: .leading, spacing: 3) {
                                Text(session.title)
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .foregroundStyle(HermesPalette.textPrimary)
                                Text(session.subtitle)
                                    .font(.system(size: 13, weight: .medium, design: .rounded))
                                    .foregroundStyle(HermesPalette.textSecondary)
                            }
                            Spacer()
                        }
                        HStack(spacing: 8) {
                            StatusBadge(title: session.source, tone: .neutral)
                            StatusBadge(title: "Active", tone: .positive)
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Transcript")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        ForEach(messages) { msg in
                            TranscriptBubble(message: msg)
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Tool calls")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        ForEach(toolCalls) { call in
                            ToolCallBlock(
                                entry: call,
                                isExpanded: expandedToolCall == call.id,
                                onTap: {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                                        expandedToolCall = expandedToolCall == call.id ? nil : call.id
                                    }
                                }
                            )
                        }
                    }
                }

                if !artifacts.isEmpty {
                    GlassCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Artifacts")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            ForEach(artifacts) { artifact in
                                ArtifactRow(artifact: artifact)
                            }
                        }
                    }
                }

                PrimaryButton(title: "Resume Session", systemImage: "play.fill") {}
            }
            .padding(20)
        }
        .navigationTitle(session.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct TranscriptBubble: View {
    let message: TranscriptMessage

    var roleLabel: String {
        switch message.role {
        case "user": return "You"
        case "assistant": return "Hermes"
        case "tool": return "Tool"
        default: return message.role
        }
    }

    var roleTone: Color {
        switch message.role {
        case "assistant": return HermesPalette.accent
        case "tool": return HermesPalette.accentSecondary
        default: return HermesPalette.textMuted
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(roleLabel)
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundStyle(roleTone)
                Spacer()
                Text(message.timestamp)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textMuted)
            }
            Text(message.content)
                .font(.system(size: message.role == "tool" ? 13 : 14, weight: .medium, design: message.role == "tool" ? .monospaced : .rounded))
                .foregroundStyle(HermesPalette.textPrimary)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(message.isHighlighted ? HermesPalette.cardSoft : HermesPalette.card, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous)
                .stroke(message.isHighlighted ? HermesPalette.accent.opacity(0.3) : HermesPalette.stroke, lineWidth: 1)
        )
    }
}

private struct ToolCallBlock: View {
    let entry: ToolCallEntry
    let isExpanded: Bool
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: onTap) {
                HStack(spacing: 10) {
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(HermesPalette.accentSecondary)
                    Text(entry.tool)
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundStyle(HermesPalette.textPrimary)
                    Spacer()
                    Text(entry.duration)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundStyle(HermesPalette.textMuted)
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(HermesPalette.textMuted)
                }
                .padding(12)
            }
            .buttonStyle(.plain)

            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    DetailLine(label: "Input", value: entry.input)
                    DetailLine(label: "Output", value: entry.output)
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
            }
        }
        .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
    }
}

private struct DetailLine: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(label)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .foregroundStyle(HermesPalette.textMuted)
            Text(value)
                .font(.system(size: 12, weight: .medium, design: .monospaced))
                .foregroundStyle(HermesPalette.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

private struct ArtifactRow: View {
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
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(HermesPalette.accent)
                .frame(width: 28)
            VStack(alignment: .leading, spacing: 3) {
                Text(artifact.name)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text("\(artifact.artifactType) · \(sizeLabel)")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textMuted)
            }
            Spacer()
            StatusBadge(title: artifact.artifactType, tone: .neutral)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    NavigationStack {
        SessionDetailView(session: Phase1Data.sessions[0])
    }
}
