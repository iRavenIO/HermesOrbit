import SwiftUI

struct RuntimeChatPreviewView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ShellStatusStrip()

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Chat")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Text("Web parity means a runtime-first surface: persistent session context, tool activity, and fast resume from Sessions instead of a generic bubble chat.")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundStyle(HermesPalette.textSecondary)
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Label("Live runtime", systemImage: "terminal.fill")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            TerminalLine(prefix: "$", text: "hermes session resume sess_chance_billing")
                            TerminalLine(prefix: ">", text: "Checking nightly cron failures and pending approvals…", highlight: true)
                            TerminalLine(prefix: "•", text: "Production Agent approval APR-190 still pending")
                            TerminalLine(prefix: "•", text: "nightly-reconcile failed after stale upstream context")
                            TerminalLine(prefix: "•", text: "next action: inspect cron logs or approve intervention")
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Attached runtime context")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            ForEach(Phase1Data.runtimeContext) { item in
                                ActionRow(action: item)
                            }
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Chat")
        }
    }
}
