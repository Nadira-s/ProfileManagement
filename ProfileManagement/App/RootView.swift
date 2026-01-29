import SwiftUI

struct RootView: View {

    @StateObject private var router = AppRouter()
    @State private var showSplash = true

    var body: some View {
        NavigationStack(path: $router.path) {
            Group {
                if showSplash {
                    SplashScreen()
                } else {
                    HomeView(viewModel: HomeViewModel(router: router))
                }
            }
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
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showSplash = false
            }
        }
    }
}


