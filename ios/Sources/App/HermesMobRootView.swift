import SwiftUI

struct HermesMobRootView: View {
    @State private var appState = Phase1AppState()

    var body: some View {
        ZStack {
            HermesBackground(
                placement: appState.hasEnteredShell
                    ? appState.selectedShellTab.backgroundPlacement
                    : .top
            )
            .ignoresSafeArea()

            if appState.hasEnteredShell {
                Phase1MainShellView(appState: $appState)
                    .transition(.opacity.combined(with: .scale(scale: 0.98)))
            } else {
                Phase1OnboardingFlowView(appState: $appState)
                    .transition(.opacity)
            }
        }
    }
}
