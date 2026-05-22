import SwiftUI

struct MetricPanel: View {
    let title: String
    let value: String
    let note: String
    let tone: StatusBadge.Tone

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textMuted)
                Text(value)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                HStack {
                    Text(note)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundStyle(HermesPalette.textSecondary)
                    Spacer(minLength: 8)
                    StatusBadge(title: badgeTitle, tone: tone)
                }
            }
        }
    }

    private var badgeTitle: String {
        switch tone {
        case .positive: return "Healthy"
        case .warning: return "Watch"
        case .critical: return "Risk"
        case .neutral: return "Info"
        }
    }
}
