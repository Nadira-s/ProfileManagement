import SwiftUI

struct RootView: View {

    @StateObject private var router = AppRouter()
    @State private var showSplash = true

    var body: some View {
        ZStack {
            NavigationStack(path: $router.path) {
                HomeView(viewModel: HomeViewModel(router: router))
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .home:
                            HomeView(viewModel: HomeViewModel(router: router))
                        case .profile:
                            ProfileView(
                                viewModel: ProfileViewModel(
                                    router: router,
                                    persistenceService: PersistenceService(
                                        context: SwiftDataStack.shared.context
                                    )
                                )
                            )
                        case .editProfile(let profile):
                            EditProfileView(
                                viewModel: EditProfileViewModel(
                                    profile: profile,
                                    persistenceService: PersistenceService(
                                        context: SwiftDataStack.shared.context
                                    ),
                                    router: router,
                                    pickerService: ImagePickerService(),
                                    cropService: ImageCropService()
                                )
                            )
                        }
                    }
            }
            if showSplash {
                SplashScreen()
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

