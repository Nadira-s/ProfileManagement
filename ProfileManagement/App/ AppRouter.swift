//
//   AppRouter.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI

final class AppRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
     func push(_ route: AppRoute) {
        path.append(route)
    }
    func pop() {
        path.removeLast()
    }
    func popToRoot() {
        path.removeLast(path.count)
    }
}
