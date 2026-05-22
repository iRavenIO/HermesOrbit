import SwiftUI
import UIKit

struct StageScaffold<Content: View, Footer: View>: View {
    let eyebrow: String
    let title: String
    let subtitle: String
    let currentStage: OnboardingStage
    @ViewBuilder let content: Content
    @ViewBuilder let footer: Footer

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 22) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(eyebrow.uppercased())
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .tracking(1.2)
                        .foregroundStyle(HermesPalette.accent)
                    Text(title)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(HermesPalette.textPrimary)
                    Text(subtitle)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(HermesPalette.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                content
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 120)
        }
        .safeAreaInset(edge: .top) {
            OnboardingProgressHeader(currentStage: currentStage)
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 12)
                .background(.ultraThinMaterial)
        }
        .safeAreaInset(edge: .bottom) {
            footer
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 10)
                .background(.ultraThinMaterial)
        }
    }
}

struct GlassCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            content
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: HermesChrome.card, style: .continuous)
                .fill(HermesPalette.card)
        )
        .overlay(
            RoundedRectangle(cornerRadius: HermesChrome.card, style: .continuous)
                .stroke(HermesPalette.stroke, lineWidth: 1)
        )
    }
}

struct PrimaryButton: View {
    let title: String
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: systemImage)
            }
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundStyle(HermesPalette.accentForeground)
            .padding(.horizontal, 18)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(HermesPalette.accent, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

struct SecondaryButton: View {
    let title: String
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: systemImage)
            }
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundStyle(HermesPalette.textPrimary)
            .padding(.horizontal, 18)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(HermesPalette.card, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous)
                    .stroke(HermesPalette.stroke, lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

struct AppGlyph: View {
    let size: CGFloat

    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: HermesChrome.appGlyph, style: .continuous))
            .shadow(color: HermesPalette.accent.opacity(0.35), radius: 22, y: 12)
    }
}

struct HermesBackground: View {
    @Environment(\.colorScheme) private var colorScheme

    let placement: HermesBackgroundPlacement

    private var overlayOpacity: Double {
        colorScheme == .dark ? 0.14 : 0.06
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [HermesPalette.backgroundTop, HermesPalette.backgroundBottom],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Image("hermes-atmosphere-overlay")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .offset(y: placement.verticalOffset)
                .opacity(overlayOpacity)
                .allowsHitTesting(false)
        }
        .clipped()
    }
}

struct ShellStatusStrip: View {
    var body: some View {
        GlassCard {
            HStack(spacing: 10) {
                PillStat(title: "Landing", value: "Sessions")
                PillStat(title: "Gateway", value: "Healthy")
                PillStat(title: "Active", value: "3 sessions")
            }
        }
    }
}

struct TabBarItemLabel: View {
    let title: String
    let imageName: String

    var body: some View {
        VStack(spacing: 5) {
            Image(imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
            Text(title)
                .font(.system(size: 12, weight: .bold, design: .rounded))
        }
    }
}

struct TerminalLine: View {
    let prefix: String
    let text: String
    var highlight = false

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text(prefix)
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundStyle(highlight ? HermesPalette.accent : HermesPalette.textMuted)
                .frame(width: 14, alignment: .leading)
            Text(text)
                .font(.system(size: 13, weight: .medium, design: .monospaced))
                .foregroundStyle(HermesPalette.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(highlight ? HermesPalette.cardSoft : HermesPalette.card, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
    }
}

struct FeatureBullet: View {
    let icon: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(HermesPalette.accent)
                .frame(width: 36)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text(subtitle)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
            }
        }
    }
}

struct PillStat: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .foregroundStyle(HermesPalette.textMuted)
            Text(value)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .foregroundStyle(HermesPalette.textPrimary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
    }
}

struct ConnectionField: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.system(size: 12, weight: .semibold, design: .rounded))
                .foregroundStyle(HermesPalette.textMuted)
            Text(value)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(HermesPalette.textPrimary)
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
        }
    }
}

struct ScopeChip: View {
    let title: String
    var highlighted = false

    var body: some View {
        Text(title)
            .font(.system(size: 12, weight: .semibold, design: .rounded))
            .foregroundStyle(highlighted ? HermesPalette.accentForeground : HermesPalette.textPrimary)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(highlighted ? HermesPalette.accent : HermesPalette.cardSoft, in: RoundedRectangle(cornerRadius: HermesChrome.badge, style: .continuous))
    }
}

struct TrustMeter: View {
    let title: String
    let detail: String
    let state: String

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text(detail)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
            }
            Spacer()
            StatusBadge(title: state, tone: .positive)
        }
    }
}

struct PolicyLine: View {
    let title: String
    let detail: String

    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundStyle(HermesPalette.textPrimary)
            Spacer(minLength: 12)
            Text(detail)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundStyle(HermesPalette.textSecondary)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct InstanceRow: View {
    let instance: HermesInstance
    let isSelected: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous)
                .fill(isSelected ? HermesPalette.accent : HermesPalette.cardSoft)
                .frame(width: 52, height: 52)
                .overlay {
                    Image(systemName: instance.symbol)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(isSelected ? HermesPalette.accentForeground : HermesPalette.accent)
                }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(instance.name)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundStyle(HermesPalette.textPrimary)
                    Spacer()
                    StatusBadge(title: instance.trustLabel, tone: instance.tone)
                }
                Text(instance.environment)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
                Text(instance.statusSentence)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textMuted)
            }
        }
        .padding(14)
        .background(isSelected ? HermesPalette.cardSoft : Color.clear, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
    }
}

struct SessionRow: View {
    let session: SessionSummary

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            RoundedRectangle(cornerRadius: HermesChrome.iconTile, style: .continuous)
                .fill(HermesPalette.cardSoft)
                .frame(width: 48, height: 48)
                .overlay {
                    Image(systemName: session.icon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(HermesPalette.accent)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(session.title)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text(session.subtitle)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
            }
            Spacer()
            StatusBadge(title: session.source, tone: .neutral)
        }
        .padding(.vertical, 2)
    }
}

struct ActionRow: View {
    let action: QuickAction

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: action.icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(HermesPalette.accent)
                .frame(width: 32)
            VStack(alignment: .leading, spacing: 4) {
                Text(action.title)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundStyle(HermesPalette.textPrimary)
                Text(action.subtitle)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(HermesPalette.textSecondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(HermesPalette.textMuted)
        }
        .padding(.vertical, 2)
    }
}

struct ChatBubble: View {
    let role: String
    let message: String
    let highlighted: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(role)
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .foregroundStyle(highlighted ? HermesPalette.accent : HermesPalette.textMuted)
            Text(message)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(HermesPalette.textPrimary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(highlighted ? HermesPalette.cardSoft : HermesPalette.card, in: RoundedRectangle(cornerRadius: HermesChrome.control, style: .continuous))
    }
}

struct StatusBadge: View {
    enum Tone {
        case positive
        case warning
        case critical
        case neutral
    }

    let title: String
    let tone: Tone

    var foreground: Color {
        switch tone {
        case .positive: return HermesPalette.accentForeground
        case .warning: return Color.black.opacity(0.84)
        case .critical: return .white
        case .neutral: return HermesPalette.textPrimary
        }
    }

    var background: Color {
        switch tone {
        case .positive: return HermesPalette.accent
        case .warning: return HermesPalette.warning
        case .critical: return HermesPalette.critical
        case .neutral: return HermesPalette.cardSoft
        }
    }

    var body: some View {
        Text(title)
            .font(.system(size: 11, weight: .bold, design: .rounded))
            .foregroundStyle(foreground)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(background, in: RoundedRectangle(cornerRadius: HermesChrome.badge, style: .continuous))
    }
}

enum HermesChrome {
    static let card: CGFloat = 10
    static let control: CGFloat = 8
    static let badge: CGFloat = 6
    static let iconTile: CGFloat = 8
    static let appGlyph: CGFloat = 18
}

enum HermesPalette {
    private static func adaptive(light: UIColor, dark: UIColor) -> Color {
        Color(uiColor: UIColor { trait in
            trait.userInterfaceStyle == .dark ? dark : light
        })
    }

    static let backgroundTop = adaptive(
        light: UIColor(red: 0.973, green: 0.980, blue: 1.000, alpha: 1),
        dark: UIColor(red: 0.031, green: 0.082, blue: 0.071, alpha: 1)
    )
    static let backgroundBottom = adaptive(
        light: UIColor(red: 0.930, green: 0.953, blue: 0.988, alpha: 1),
        dark: UIColor(red: 0.020, green: 0.043, blue: 0.039, alpha: 1)
    )
    static let background = adaptive(
        light: UIColor(red: 0.922, green: 0.949, blue: 0.988, alpha: 1),
        dark: UIColor(red: 0.031, green: 0.071, blue: 0.059, alpha: 1)
    )
    static let card = adaptive(
        light: UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.84),
        dark: UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.07)
    )
    static let cardSoft = adaptive(
        light: UIColor(red: 0.925, green: 0.949, blue: 0.988, alpha: 0.94),
        dark: UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.10)
    )
    static let stroke = adaptive(
        light: UIColor(red: 0.208, green: 0.471, blue: 0.898, alpha: 0.18),
        dark: UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.08)
    )
    static let textPrimary = adaptive(
        light: UIColor(red: 0.063, green: 0.141, blue: 0.271, alpha: 1),
        dark: UIColor(red: 0.960, green: 0.970, blue: 0.930, alpha: 1)
    )
    static let textSecondary = adaptive(
        light: UIColor(red: 0.220, green: 0.318, blue: 0.498, alpha: 1),
        dark: UIColor(red: 0.720, green: 0.780, blue: 0.730, alpha: 1)
    )
    static let textMuted = adaptive(
        light: UIColor(red: 0.380, green: 0.455, blue: 0.580, alpha: 1),
        dark: UIColor(red: 0.530, green: 0.610, blue: 0.570, alpha: 1)
    )
    static let accent = adaptive(
        light: UIColor(red: 0.208, green: 0.471, blue: 0.898, alpha: 1),
        dark: UIColor(red: 0.630, green: 0.930, blue: 0.630, alpha: 1)
    )
    static let accentSecondary = adaptive(
        light: UIColor(red: 0.447, green: 0.631, blue: 0.929, alpha: 1),
        dark: UIColor(red: 0.830, green: 0.740, blue: 0.470, alpha: 1)
    )
    static let accentForeground = adaptive(
        light: .white,
        dark: UIColor(red: 0.031, green: 0.071, blue: 0.059, alpha: 1)
    )
    static let warning = adaptive(
        light: UIColor(red: 1.000, green: 0.729, blue: 0.000, alpha: 1),
        dark: UIColor(red: 0.960, green: 0.790, blue: 0.400, alpha: 1)
    )
    static let critical = adaptive(
        light: UIColor(red: 0.980, green: 0.220, blue: 0.243, alpha: 1),
        dark: UIColor(red: 0.860, green: 0.350, blue: 0.350, alpha: 1)
    )
}
