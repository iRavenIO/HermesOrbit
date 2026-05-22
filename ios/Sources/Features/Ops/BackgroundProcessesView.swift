import SwiftUI

struct BackgroundProcessesView: View {
    var running: Int { Phase1Data.backgroundProcesses.filter { $0.statusTone == .positive }.count }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Processes")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: "\(running) running", tone: .positive)
                        }
                        Text("Long-running background tasks managed by the Hermes runtime.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    let totalMem = Phase1Data.backgroundProcesses.map(\.memoryMB).reduce(0, +)
                    MetricPanel(title: "Running", value: "\(running)", note: "of \(Phase1Data.backgroundProcesses.count) processes", tone: .positive)
                    MetricPanel(title: "Memory", value: "\(totalMem) MB", note: "total resident", tone: .neutral)
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Phase1Data.backgroundProcesses) { process in
                            ProcessRow(process: process)
                            if process.id != Phase1Data.backgroundProcesses.last?.id {
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
        .navigationTitle("Background Processes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct ProcessRow: View {
    let process: BackgroundProcess

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(process.name)
                        .font(.system(size: 14, weight: .semibold, design: .monospaced))
                        .foregroundStyle(HermesPalette.textPrimary)
                    Spacer()
                    StatusBadge(title: process.status, tone: process.statusTone)
                }
                HStack(spacing: 14) {
                    LabelValue(label: "PID", value: process.pid)
                    LabelValue(label: "Uptime", value: process.uptime)
                    LabelValue(label: "Memory", value: "\(process.memoryMB) MB")
                }
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack {
        BackgroundProcessesView()
    }
}
