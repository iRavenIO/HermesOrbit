import SwiftUI

struct MemoryListView: View {
    var categories: [String] {
        Array(Set(Phase1Data.memories.map(\.category))).sorted()
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Memory")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Spacer()
                            StatusBadge(title: "\(Phase1Data.memories.count) entries", tone: .neutral)
                        }
                        Text("Persistent facts and environment notes that Hermes carries across conversations.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                    }
                }

                ForEach(categories, id: \.self) { category in
                    let entries = Phase1Data.memories.filter { $0.category == category }
                    GlassCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(category.uppercased())
                                .font(.system(size: 11, weight: .bold, design: .rounded))
                                .tracking(1.1)
                                .foregroundStyle(HermesPalette.accent)
                            ForEach(entries) { entry in
                                NavigationLink {
                                    MemoryDetailView(entry: entry)
                                } label: {
                                    MemoryRowView(entry: entry)
                                }
                                .buttonStyle(.plain)
                                if entry.id != entries.last?.id {
                                    Divider()
                                        .background(HermesPalette.stroke)
                                }
                            }
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("Memory")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MemoryRowView: View {
    let entry: MemoryEntry

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "brain.head.profile")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(HermesPalette.accent)
                .frame(width: 24)
                .padding(.top, 2)
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.target)
                    .font(.system(size: 13, weight: .semibold, design: .monospaced))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text(entry.content)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
                    .lineLimit(2)
                Text("Updated \(entry.updatedAt)")
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textMuted)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(HermesPalette.textMuted)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        MemoryListView()
    }
}
