import SwiftUI

struct InstancesListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Instances")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text("All Hermes endpoints paired with this device. Tap to inspect, switch, or manage trust.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                ForEach(Phase1Data.instanceDetails) { detail in
                    NavigationLink {
                        InstanceDetailView(detail: detail)
                    } label: {
                        GlassCard {
                            InstanceDetailRow(detail: detail)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(20)
        }
        .navigationTitle("Instances")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InstanceDetailRow: View {
    let detail: InstanceDetail

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous)
                .fill(HermesPalette.cardSoft)
                .frame(width: 52, height: 52)
                .overlay {
                    Image(systemName: detail.symbol)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(HermesPalette.accent)
                }
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(detail.name)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundStyle(HermesPalette.textPrimary)
                    Spacer()
                    StatusBadge(title: detail.trustLabel, tone: detail.tone)
                }
                Text(detail.environment)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
                Text(detail.url)
                    .font(.system(size: 12, weight: .medium, design: .monospaced))
                    .foregroundStyle(HermesPalette.textMuted)
            }
        }
    }
}

#Preview {
    NavigationStack {
        InstancesListView()
    }
}
