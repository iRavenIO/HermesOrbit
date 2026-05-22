import SwiftUI

struct ManageOverviewView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Manage")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Text("Prototype-aligned settings-style IA. Keep the root calm and move depth into dedicated surfaces.")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundStyle(HermesPalette.textSecondary)
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            NavigationLink {
                                ConfigListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Config", subtitle: "Typed editable settings with safe/gated boundaries", icon: "gearshape.2.fill"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                SecretsListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Secrets", subtitle: "Presence and health, masked by default", icon: "key.horizontal.fill"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                SkillsListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Skills", subtitle: "Browse installed procedural knowledge", icon: "square.stack.3d.up.fill"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                MemoryListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Memory", subtitle: "User facts and environment notes", icon: "brain.head.profile"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                ArtifactsListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Artifacts", subtitle: "Preview screenshots, markdown, and exports", icon: "photo.on.rectangle.angled"))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Manage")
        }
    }
}

struct AccountOverviewView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Trusted device")
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textSecondary)
                            Text("Kousha")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Text("iPhone · Face ID enrolled · critical-only alerts")
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundStyle(HermesPalette.textSecondary)
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            NavigationLink {
                                InstancesListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Instances", subtitle: "Switch, inspect, or add Hermes endpoints", icon: "server.rack"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                SecuritySettingsView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Security", subtitle: "Trust states, Face ID gating, revoke/re-pair", icon: "lock.shield.fill"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                NotificationSettingsView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Notifications", subtitle: "Critical alerts, quiet hours, push policy", icon: "bell.badge.fill"))
                            }
                            .buttonStyle(.plain)

                            NavigationLink {
                                AuditLogView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Audit Log", subtitle: "Recent trust and operator events", icon: "checklist.checked"))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Account")
        }
    }
}
