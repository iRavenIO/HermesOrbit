import SwiftUI

struct MemoryDetailView: View {
    let entry: MemoryEntry
    @State private var editMode = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            StatusBadge(title: entry.category, tone: .neutral)
                        }
                        Text(entry.target)
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text("Last updated \(entry.updatedAt)")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textMuted)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Content")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        Text(entry.content)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Metadata")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Target", detail: entry.target)
                        PolicyLine(title: "Category", detail: entry.category)
                        PolicyLine(title: "Updated", detail: entry.updatedAt)
                    }
                }

                SecondaryButton(title: "Edit memory (read-only in Phase 1)", systemImage: "lock") {}
            }
            .padding(20)
        }
        .navigationTitle("Memory")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MemoryDetailView(entry: Phase1Data.memories[0])
    }
}
