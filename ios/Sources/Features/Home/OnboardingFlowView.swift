import SwiftUI

struct Phase1OnboardingFlowView: View {
    @Binding var appState: Phase1AppState

    var body: some View {
        Group {
            switch appState.currentStage {
            case .launch:
                LaunchRestoreView()
                    .task {
                        guard !appState.launchTaskStarted else { return }
                        appState.launchTaskStarted = true
                        try? await Task.sleep(for: .seconds(1.5))
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.92)) {
                            appState.currentStage = .welcome
                        }
                    }
            case .welcome:
                WelcomeStageView(
                    continueAction: { advance(to: .connect) },
                    skipToShellAction: { enterShell() }
                )
            case .connect:
                ConnectStageView(
                    selectedInstanceID: $appState.selectedInstanceID,
                    backAction: { advance(to: .welcome) },
                    continueAction: { advance(to: .trust) }
                )
            case .trust:
                TrustStageView(
                    backAction: { advance(to: .connect) },
                    continueAction: { advance(to: .ready) }
                )
            case .ready:
                ReadyStageView(
                    enterAction: { enterShell() },
                    backAction: { advance(to: .trust) }
                )
            }
        }
        .animation(.spring(response: 0.55, dampingFraction: 0.9), value: appState.currentStage)
    }

    private func advance(to stage: OnboardingStage) {
        withAnimation(.spring(response: 0.58, dampingFraction: 0.9)) {
            appState.currentStage = stage
        }
    }

    private func enterShell() {
        withAnimation(.spring(response: 0.65, dampingFraction: 0.92)) {
            appState.hasEnteredShell = true
            appState.selectedShellTab = .sessions
        }
    }
}

struct OnboardingProgressHeader: View {
    let currentStage: OnboardingStage

    private let visibleStages: [OnboardingStage] = [.welcome, .connect, .trust, .ready]

    var body: some View {
        VStack(spacing: 14) {
            HStack {
                HStack(spacing: 12) {
                    AppGlyph(size: 46)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("HermesMob")
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                        Text(currentStage.title)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                    }
                }
                Spacer()
                Text("Phase 1 preview")
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.accent)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(HermesPalette.card, in: RoundedRectangle(cornerRadius: HermesChrome.badge, style: .continuous))
            }

            HStack(spacing: 10) {
                ForEach(visibleStages, id: \.self) { stage in
                    VStack(alignment: .leading, spacing: 6) {
                        Text("0\(stage.stepNumber)")
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .foregroundStyle(stage == currentStage ? HermesPalette.accentForeground : HermesPalette.textSecondary)
                        Text(stage.title)
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .foregroundStyle(stage == currentStage ? HermesPalette.accentForeground : HermesPalette.textPrimary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .background(stage == currentStage ? HermesPalette.accent : HermesPalette.card, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
                }
            }
        }
    }
}

struct LaunchRestoreView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            AppGlyph(size: 132)
            VStack(spacing: 10) {
                Text("Restoring operator state")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                    .multilineTextAlignment(.center)

                Text("Restoring trusted sessions and active workspace.")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
                    .multilineTextAlignment(.center)
            }
            GlassCard {
                VStack(alignment: .leading, spacing: 12) {
                    Label("Personal Hermes", systemImage: "checkmark.shield")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundStyle(HermesPalette.textPrimary)
                    ProgressView(value: 0.72)
                        .tint(HermesPalette.accent)
                    Text("Syncing sessions, approvals, and gateway state.")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundStyle(HermesPalette.textSecondary)
                }
            }
            .frame(maxWidth: 420)
            Spacer()
            Text("Trusted device • Face ID scoped • Local cache warm")
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .foregroundStyle(HermesPalette.textMuted)
        }
        .padding(.bottom, 32)
    }
}

struct WelcomeStageView: View {
    let continueAction: () -> Void
    let skipToShellAction: () -> Void

    var body: some View {
        StageScaffold(
            eyebrow: "Self-hosted operator console",
            title: "Keep Hermes in reach when you leave the desk.",
            subtitle: "HermesMob brings sessions, approvals, jobs, diagnostics, and trusted interventions into a native iPhone surface instead of a squeezed web dashboard.",
            currentStage: .welcome
        ) {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Phase 1 outcome")
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textSecondary)
                        FeatureBullet(icon: "rectangle.stack.badge.person.crop", title: "Multi-instance control", subtitle: "Switch between personal, lab, and production Hermes endpoints without losing trust context.")
                        FeatureBullet(icon: "bolt.badge.clock", title: "Push-led interventions", subtitle: "Approvals, failures, and critical job events reopen the exact flow that needs attention.")
                        FeatureBullet(icon: "waveform.path.ecg.text.page", title: "Native operator surfaces", subtitle: "Sessions, chat runtime, logs, cron, config, keys, and artifacts feel like iOS, not a tiny desktop.")
                    }
                }

                HStack(spacing: 12) {
                    PillStat(title: "V1 focus", value: "Operate")
                    PillStat(title: "Auth model", value: "Trusted device")
                    PillStat(title: "Default land", value: "Sessions")
                }
            }
        } footer: {
            VStack(spacing: 12) {
                PrimaryButton(title: "Continue to connection", systemImage: "arrow.right") {
                    continueAction()
                }
                SecondaryButton(title: "Skip into shell preview", systemImage: "rectangle.on.rectangle.angled") {
                    skipToShellAction()
                }
            }
        }
    }
}

struct ConnectStageView: View {
    @Binding var selectedInstanceID: UUID
    let backAction: () -> Void
    let continueAction: () -> Void

    var body: some View {
        StageScaffold(
            eyebrow: "Connected Hermes",
            title: "Pair the right instance, not just any endpoint.",
            subtitle: "Phase 1 starts self-hosted: connect a real Hermes environment, inspect trust posture, and make the active instance explicit before operating from mobile.",
            currentStage: .connect
        ) {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        ForEach(Phase1Data.instances) { instance in
                            Button {
                                selectedInstanceID = instance.id
                            } label: {
                                InstanceRow(instance: instance, isSelected: selectedInstanceID == instance.id)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Label("Add Hermes instance", systemImage: "plus.circle.fill")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)

                        ConnectionField(label: "Endpoint URL", value: "https://atlas.kousha.dev")
                        ConnectionField(label: "Pairing token", value: "hm_••••••••••••")
                        ConnectionField(label: "Requested scope", value: "operate + approvals")

                        HStack(spacing: 10) {
                            ScopeChip(title: "Observe")
                            ScopeChip(title: "Operate")
                            ScopeChip(title: "Admin", highlighted: true)
                        }
                    }
                }
            }
        } footer: {
            HStack(spacing: 12) {
                SecondaryButton(title: "Back", systemImage: "chevron.left") {
                    backAction()
                }
                PrimaryButton(title: "Continue to trust", systemImage: "shield.lefthalf.filled") {
                    continueAction()
                }
            }
        }
    }
}

struct TrustStageView: View {
    let backAction: () -> Void
    let continueAction: () -> Void

    var body: some View {
        StageScaffold(
            eyebrow: "Device trust",
            title: "Make powerful actions feel safe on phone.",
            subtitle: "HermesMob should never feel overpowered. Phase 1 uses Face ID, scoped device trust, and explicit write friction before secrets, approvals, or admin actions move.",
            currentStage: .trust
        ) {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Current device posture", systemImage: "faceid")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)

                        TrustMeter(title: "Biometric gate", detail: "Face ID required for admin + secrets", state: "Enabled")
                        TrustMeter(title: "Token scope", detail: "observe, operate, approvals", state: "Scoped")
                        TrustMeter(title: "Rotation posture", detail: "Revocation and re-pair available", state: "Ready")
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("High-risk action policy")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Secret reveal", detail: "Biometric + audit trail")
                        PolicyLine(title: "Cron delete", detail: "Two-step confirmation")
                        PolicyLine(title: "Gateway restart", detail: "Scoped write with rollback note")
                    }
                }
            }
        } footer: {
            HStack(spacing: 12) {
                SecondaryButton(title: "Back", systemImage: "chevron.left") {
                    backAction()
                }
                PrimaryButton(title: "Review readiness", systemImage: "checkmark.circle") {
                    continueAction()
                }
            }
        }
    }
}

struct ReadyStageView: View {
    let enterAction: () -> Void
    let backAction: () -> Void

    var body: some View {
        StageScaffold(
            eyebrow: "Phase 1 ready",
            title: "You’re cleared to operate from mobile.",
            subtitle: "This first batch proves the mobile control-plane loop: restore context, connect an instance, establish trust, and reopen the product into sessions-first operation.",
            currentStage: .ready
        ) {
            VStack(spacing: 16) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Label("What opens next", systemImage: "sparkles.rectangle.stack")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        FeatureBullet(icon: "rectangle.stack.person.crop", title: "Sessions landing", subtitle: "Recent sessions, source badges, and resume into runtime chat.")
                        FeatureBullet(icon: "bell.badge", title: "Approval re-entry", subtitle: "Push opens the exact pending approval instead of a generic inbox.")
                        FeatureBullet(icon: "tray.full", title: "System visibility", subtitle: "Cron, logs, gateway, artifacts, and config remain one tab away.")
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Immediate next implementation batches")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(HermesPalette.textPrimary)
                        PolicyLine(title: "Batch 2", detail: "Sessions list, detail, and runtime chat")
                        PolicyLine(title: "Batch 3", detail: "System tabs: logs, cron, analytics, gateway")
                        PolicyLine(title: "Batch 4", detail: "Manage tabs: config, keys, skills, plugins")
                    }
                }
            }
        } footer: {
            HStack(spacing: 12) {
                SecondaryButton(title: "Back", systemImage: "chevron.left") {
                    backAction()
                }
                PrimaryButton(title: "Enter HermesMob", systemImage: "arrow.right.circle.fill") {
                    enterAction()
                }
            }
        }
    }
}
