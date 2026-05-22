import SwiftUI

struct JobsListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Jobs")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: "\(Phase1Data.jobs.count) total", tone: .neutral)
                        }
                        Text("Scheduled cron jobs and background tasks. Manage schedules, view output, and control execution.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                ForEach(Phase1Data.jobs) { job in
                    NavigationLink {
                        JobDetailView(job: job)
                    } label: {
                        GlassCard {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(job.name)
                                            .font(.system(size: 15, weight: .semibold, design: .monospaced))
                                            .foregroundStyle(HermesPalette.textPrimary)
                                        Text(job.schedule)
                                            .font(.system(size: 12, weight: .medium, design: .monospaced))
                                            .foregroundStyle(HermesPalette.textMuted)
                                    }
                                    Spacer()
                                    StatusBadge(title: job.status, tone: job.statusTone)
                                }
                                HStack(spacing: 16) {
                                    LabelValue(label: "Last run", value: job.lastRun)
                                    LabelValue(label: "Next run", value: job.nextRun)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundStyle(HermesPalette.textMuted)
                                }
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(20)
        }
        .navigationTitle("Jobs")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LabelValue: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .foregroundStyle(HermesPalette.textMuted)
            Text(value)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundStyle(HermesPalette.textSecondary)
        }
    }
}

#Preview {
    NavigationStack {
        JobsListView()
    }
}
