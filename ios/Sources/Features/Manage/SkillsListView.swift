import SwiftUI

struct SkillsListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Skills")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: "\(Phase1Data.skills.count) installed", tone: .positive)
                        }
                        Text("Procedural knowledge packs installed on this Hermes instance. Each skill extends agent capabilities.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                ForEach(Phase1Data.skills) { skill in
                    NavigationLink {
                        SkillDetailView(skill: skill)
                    } label: {
                        GlassCard {
                            HStack(alignment: .top, spacing: 14) {
                                RoundedRectangle(cornerRadius: HermesChrome.iconTile, style: .continuous)
                                    .fill(HermesPalette.cardSoft)
                                    .frame(width: 44, height: 44)
                                    .overlay {
                                        Image(systemName: "square.stack.3d.up.fill")
                                            .font(.system(size: 18, weight: .semibold))
                                            .foregroundStyle(HermesPalette.accent)
                                    }
                                VStack(alignment: .leading, spacing: 6) {
                                    HStack {
                                        Text(skill.name)
                                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                                            .foregroundStyle(HermesPalette.textPrimary)
                                        Spacer()
                                        StatusBadge(title: skill.category, tone: .neutral)
                                    }
                                    Text(skill.description)
                                        .font(.system(size: 13, weight: .medium, design: .rounded))
                                        .foregroundStyle(HermesPalette.textSecondary)
                                        .lineLimit(2)
                                    Text("v\(skill.version) · \(skill.linkedFiles.count) file\(skill.linkedFiles.count == 1 ? "" : "s")")
                                        .font(.system(size: 11, weight: .medium, design: .rounded))
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
        .navigationTitle("Skills")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SkillsListView()
    }
}
