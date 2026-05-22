import SwiftUI

struct Phase1AppState {
    var currentStage: OnboardingStage = .launch
    var hasEnteredShell = false
    var selectedShellTab: ShellTab = .home
    var selectedInstanceID = Phase1Data.instances.first?.id ?? UUID()
    var launchTaskStarted = false
}

enum OnboardingStage: Int, CaseIterable {
    case launch
    case welcome
    case connect
    case trust
    case ready

    var title: String {
        switch self {
        case .launch: return "Launch"
        case .welcome: return "Welcome"
        case .connect: return "Connect"
        case .trust: return "Trust"
        case .ready: return "Ready"
        }
    }

    var stepNumber: Int {
        switch self {
        case .launch: return 0
        case .welcome: return 1
        case .connect: return 2
        case .trust: return 3
        case .ready: return 4
        }
    }
}

enum ShellTab: String, CaseIterable, Identifiable {
    case home = "Home"
    case sessions = "Sessions"
    case ops = "Ops"
    case manage = "Manage"
    case account = "Account"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .home: return "tab_home"
        case .sessions: return "tab_sessions"
        case .ops: return "tab_dashboard"
        case .manage: return "tab_notifications"
        case .account: return "tab_account"
        }
    }

    var backgroundPlacement: HermesBackgroundPlacement {
        switch self {
        case .home, .sessions: return .middle
        case .ops, .manage, .account: return .lower
        }
    }
}

enum HermesBackgroundPlacement {
    case top
    case middle
    case lower

    var verticalOffset: CGFloat {
        switch self {
        case .top: return -360
        case .middle: return -60
        case .lower: return 320
        }
    }
}
