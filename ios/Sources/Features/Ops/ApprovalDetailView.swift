import SwiftUI

struct ApprovalDetailView: View {
    let approval: ApprovalEntry
    @State private var actionTaken: ApprovalAction?
    @State private var showConfirm = false

    enum ApprovalAction {
        case approved, denied, stopped
        var label: String {
            switch self {
            case .approved: return "Approved"
            case .denied: return "Denied"
            case .stopped: return "Stopped"
            }
        }
        var tone: StatusBadge.Tone {
            switch self {
            case .approved: return .positive
            case .denied: return .critical
            case .stopped: return .warning
            }
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            StatusBadge(title: approval.riskLevel, tone: approval.riskTone)
                            StatusBadge(title: approval.status, tone: approval.statusTone)
                            if let action = actionTaken {
                                StatusBadge(title: action.label, tone: action.tone)
                            }
                        }
                        Text(approval.title)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(approval.subtitle)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Request details")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Instance", detail: approval.instanceName)
                        PolicyLine(title: "Requested", detail: approval.requestedAt)
                        PolicyLine(title: "Expires", detail: approval.expiresAt)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("What will happen")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(approval.detail)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }

                if actionTaken == nil {
                    VStack(spacing: 10) {
                        PrimaryButton(title: "Approve", systemImage: "checkmark.circle.fill") {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                                actionTaken = .approved
                            }
                        }
                        SecondaryButton(title: "Deny", systemImage: "xmark.circle") {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                                actionTaken = .denied
                            }
                        }
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                                actionTaken = .stopped
                            }
                        } label: {
                            HStack {
                                Text("Stop Agent")
                                Spacer()
                                Image(systemName: "stop.circle")
                            }
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.critical)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .background(HermesPalette.critical.opacity(0.12), in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                } else {
                    GlassCard {
                        HStack(spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(HermesPalette.accent)
                            Text("Action recorded: \(actionTaken!.label)")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("Approval")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ApprovalDetailView(approval: Phase1Data.approvals[0])
    }
}
