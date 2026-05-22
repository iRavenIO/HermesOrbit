import SwiftUI

struct SkillDetailView: View {
    let skill: SkillEntry

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            StatusBadge(title: skill.category, tone: .neutral)
                            StatusBadge(title: "v\(skill.version)", tone: .positive)
                        }
                        Text(skill.name)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(skill.description)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Linked files")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        ForEach(skill.linkedFiles, id: \.self) { file in
                            HStack(spacing: 10) {
                                Image(systemName: file.hasSuffix(".md") ? "doc.text" : "doc")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundStyle(HermesPalette.accent)
                                    .frame(width: 20)
                                Text(file)
                                    .font(.system(size: 13, weight: .medium, design: .monospaced))
                                    .foregroundStyle(HermesPalette.textPrimary)
                                Spacer()
                            }
                            .padding(.vertical, 2)
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Details")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Category", detail: skill.category)
                        PolicyLine(title: "Version", detail: skill.version)
                        PolicyLine(title: "Files", detail: "\(skill.linkedFiles.count)")
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle(skill.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SkillDetailView(skill: Phase1Data.skills[0])
    }
}
