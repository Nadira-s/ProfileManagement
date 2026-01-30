//
//  HomeViewModel.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {

    private let router: AppRouter

    init(router: AppRouter) {
        self.router = router
    }

    func goToProfile() {
        router.push(.profile)
    }
}

