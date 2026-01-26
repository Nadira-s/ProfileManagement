//
//  ProfileViewModel.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {

    private let router: AppRouter
    private let persistenceService: PersistenceService

    @Published var profile: Profile
    @Published var avatarImage: UIImage?
  

    init(
        router: AppRouter,
        persistenceService: PersistenceService
    ) {
        self.router = router
        self.persistenceService = persistenceService
        self.profile = PreviewData.testProfile
    }

    @MainActor
    func onAppear() {
        do {
            if let storedProfile = try persistenceService.fetchProfile() {
                self.profile = storedProfile
                loadAvatar(from: storedProfile)
            }
        } catch {
            print("❌ Failed to fetch profile:", error)
        }
    }

    private func loadAvatar(from profile: Profile) {
        if let data = profile.avatarData {
            avatarImage = UIImage(data: data)
        } else {
            avatarImage = nil
        }
    }

    func editProfileTapped() {
        router.push(.editProfile(profile))
    }
}
