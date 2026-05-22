import SwiftUI

struct JobDetailView: View {
    let job: JobEntry
    @State private var jobAction: JobAction?

    enum JobAction: String {
        case run = "Run triggered"
        case pause = "Paused"
        case resume = "Resumed"
        case delete = "Deleted"
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            StatusBadge(title: job.status, tone: job.statusTone)
                            if let action = jobAction {
                                StatusBadge(title: action.rawValue, tone: .neutral)
                            }
                        }
                        Text(job.name)
                            .font(.system(size: 22, weight: .bold, design: .monospaced))
                            .foregroundStyle(HermesPalette.textPrimary)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Schedule")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Cron expression", detail: job.schedule)
                        PolicyLine(title: "Last run", detail: job.lastRun)
                        PolicyLine(title: "Next run", detail: job.nextRun)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Last output")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(job.outputPreview)
                            .font(.system(size: 13, weight: .medium, design: .monospaced))
                            .foregroundStyle(HermesPalette.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Controls")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        HStack(spacing: 10) {
                            ControlButton(title: "Run", icon: "play.fill", tone: .positive) {
                                withAnimation { jobAction = .run }
                            }
                            ControlButton(title: "Pause", icon: "pause.fill", tone: .warning) {
                                withAnimation { jobAction = .pause }
                            }
                            ControlButton(title: "Resume", icon: "arrow.clockwise", tone: .neutral) {
                                withAnimation { jobAction = .resume }
                            }
                        }
                        ControlButton(title: "Delete Job", icon: "trash", tone: .critical) {
                            withAnimation { jobAction = .delete }
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle(job.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct ControlButton: View {
    let title: String
    let icon: String
    let tone: StatusBadge.Tone
    let action: () -> Void

    var toneColor: Color {
        switch tone {
        case .positive: return HermesPalette.accent
        case .warning: return HermesPalette.warning
        case .critical: return HermesPalette.critical
        case .neutral: return HermesPalette.textSecondary
        }
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 13, weight: .semibold))
                Text(title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            }
            .foregroundStyle(tone == .neutral ? HermesPalette.textPrimary : toneColor)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(toneColor.opacity(tone == .neutral ? 0 : 0.12), in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous)
                    .stroke(toneColor.opacity(0.3), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        JobDetailView(job: Phase1Data.jobs[0])
    }
}
