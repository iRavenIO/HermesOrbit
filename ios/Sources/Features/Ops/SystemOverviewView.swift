import SwiftUI

struct OpsOverviewView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Ops")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Text("Prototype-aligned operational surfaces: approvals, jobs, logs, diagnostics, gateway, and background processes.")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundStyle(HermesPalette.textSecondary)
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            NavigationLink {
                                ApprovalsListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Approvals", subtitle: "High-signal queue for pending approvals", icon: "checkmark.seal.fill"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                JobsListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Jobs", subtitle: "Scheduled jobs overview and controls", icon: "clock.arrow.trianglehead.counterclockwise.rotate.90"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                LogsView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Logs", subtitle: "Recent actionable event stream", icon: "doc.text.magnifyingglass"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                DiagnosticsView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Diagnostics", subtitle: "Health probes and process summaries", icon: "waveform.path.ecg.rectangle"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                GatewayStatusView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Gateway", subtitle: "Delivery surface health across platforms", icon: "antenna.radiowaves.left.and.right"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                BackgroundProcessesView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Background Processes", subtitle: "Visibility into long-running tasks", icon: "bolt.horizontal.circle"))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Ops")
        }
    }
}
