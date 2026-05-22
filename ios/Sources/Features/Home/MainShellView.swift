import SwiftUI

struct Phase1MainShellView: View {
    @Binding var appState: Phase1AppState

    var body: some View {
        TabView(selection: $appState.selectedShellTab) {
            HomeOverviewView(appState: $appState)
                .tabItem {
                    TabBarItemLabel(title: ShellTab.home.rawValue, imageName: ShellTab.home.icon)
                }
                .tag(ShellTab.home)

            SessionsOverviewView(appState: $appState)
                .tabItem {
                    TabBarItemLabel(title: ShellTab.sessions.rawValue, imageName: ShellTab.sessions.icon)
                }
                .tag(ShellTab.sessions)

            OpsOverviewView()
                .tabItem {
                    TabBarItemLabel(title: ShellTab.ops.rawValue, imageName: ShellTab.ops.icon)
                }
                .tag(ShellTab.ops)

            ManageOverviewView()
                .tabItem {
                    TabBarItemLabel(title: ShellTab.manage.rawValue, imageName: ShellTab.manage.icon)
                }
                .tag(ShellTab.manage)

            AccountOverviewView()
                .tabItem {
                    TabBarItemLabel(title: ShellTab.account.rawValue, imageName: ShellTab.account.icon)
                }
                .tag(ShellTab.account)
        }
        .tint(HermesPalette.accent)
    }
}

struct HomeOverviewView: View {
    @Binding var appState: Phase1AppState

    var selectedInstance: HermesInstance? {
        Phase1Data.instances.first(where: { $0.id == appState.selectedInstanceID })
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    GlassCard {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Operator home")
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textSecondary)

                            VStack(alignment: .leading, spacing: 8) {
                                Text(selectedInstance?.name ?? "Personal Hermes")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .foregroundStyle(HermesPalette.textPrimary)
                                Text("\((selectedInstance?.environment ?? "Private control plane")) · gateway healthy")
                                    .font(.system(size: 15, weight: .medium, design: .rounded))
                                    .foregroundStyle(HermesPalette.textSecondary)
                            }

                            HStack(spacing: 10) {
                                StatusBadge(title: selectedInstance?.trustLabel ?? "Trusted", tone: selectedInstance?.tone ?? .positive)
                                StatusBadge(title: "TLS valid", tone: .neutral)
                            }
                        }
                    }

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        MetricPanel(title: "Approvals", value: "2", note: "Need a decision soon", tone: .warning)
                        MetricPanel(title: "Sessions", value: "3", note: "Live conversations", tone: .positive)
                        MetricPanel(title: "Jobs", value: "7", note: "Cron + background work", tone: .neutral)
                        MetricPanel(title: "Trust events", value: "1", note: "Security-sensitive", tone: .critical)
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Priority now")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            NavigationLink {
                                ApprovalDetailView(approval: Phase1Data.approvals[0])
                            } label: {
                                ActionRow(action: QuickAction(title: "Review pending approval", subtitle: "Production Agent · restart gateway on expired token", icon: "checkmark.shield.fill"))
                            }
                            .buttonStyle(.plain)
                            NavigationLink {
                                SessionDetailView(session: Phase1Data.sessions[0])
                            } label: {
                                ActionRow(action: QuickAction(title: "Resume runtime", subtitle: "Chance billing triage · waiting on approval scope", icon: "play.circle.fill"))
                            }
                            .buttonStyle(.plain)
                            NavigationLink {
                                JobDetailView(job: Phase1Data.jobs[0])
                            } label: {
                                ActionRow(action: QuickAction(title: "Watch failing cron", subtitle: "nightly-reconcile · stale upstream context", icon: "clock.badge.exclamationmark"))
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Quick paths")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            NavigationLink {
                                ApprovalsListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Approvals inbox", subtitle: "Review all pending actions", icon: "checkmark.seal.fill"))
                            }
                            .buttonStyle(.plain)
                            NavigationLink {
                                GatewayStatusView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Gateway health", subtitle: "Telegram, Slack, local, API surfaces", icon: "waveform.path.ecg"))
                            }
                            .buttonStyle(.plain)
                            NavigationLink {
                                InstancesListView()
                            } label: {
                                ActionRow(action: QuickAction(title: "Switch Hermes instance", subtitle: "Personal, lab, production", icon: "server.rack"))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        ForEach(OnboardingStage.allCases.filter { $0 != .launch }, id: \.self) { stage in
                            Button(stage.title) {
                                withAnimation(.spring(response: 0.55, dampingFraction: 0.92)) {
                                    appState.hasEnteredShell = false
                                    appState.currentStage = stage
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "sparkles")
                            .foregroundStyle(HermesPalette.accent)
                    }
                }
            }
        }
    }
}

struct SessionsOverviewView: View {
    @Binding var appState: Phase1AppState

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Live work")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            Text("Every Hermes conversation is a recoverable runtime. Resume transcript, inspect tool state, and continue from exactly where work paused.")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundStyle(HermesPalette.textSecondary)
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Active sessions")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            ForEach(Phase1Data.sessions) { session in
                                NavigationLink {
                                    SessionDetailView(session: session)
                                } label: {
                                    SessionRow(session: session)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Session surfaces represented")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundStyle(HermesPalette.textPrimary)
                            PolicyLine(title: "Transcript resume", detail: "Read the latest operator and tool messages")
                            PolicyLine(title: "Tool progress", detail: "Inspect current runtime state")
                            PolicyLine(title: "Approval linkage", detail: "Jump to blocked approvals")
                            PolicyLine(title: "Artifact access", detail: "Preview latest evidence")
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Sessions")
        }
    }
}
