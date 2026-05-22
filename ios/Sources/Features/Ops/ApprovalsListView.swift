import SwiftUI

struct ApprovalsListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Approvals")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: "\(Phase1Data.approvals.count) pending", tone: .warning)
                        }
                        Text("High-signal queue of agent actions waiting for your decision. Approve, deny, or stop each request.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                ForEach(Phase1Data.approvals) { approval in
                    NavigationLink {
                        ApprovalDetailView(approval: approval)
                    } label: {
                        ApprovalCard(approval: approval)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(20)
        }
        .navigationTitle("Approvals")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ApprovalCard: View {
    let approval: ApprovalEntry

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(approval.title)
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(approval.instanceName)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textMuted)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(HermesPalette.textMuted)
                }
                Text(approval.subtitle)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
                HStack(spacing: 8) {
                    StatusBadge(title: approval.riskLevel, tone: approval.riskTone)
                    StatusBadge(title: approval.status, tone: approval.statusTone)
                    Spacer()
                    Text("Expires \(approval.expiresAt)")
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundStyle(HermesPalette.textMuted)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ApprovalsListView()
    }
}
