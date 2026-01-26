//
//  SwiftDataStack.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftData

@MainActor
final class SwiftDataStack {
    static let shared = SwiftDataStack()
    
    let container: ModelContainer
    let context: ModelContext
    @MainActor
    private init() {
        do {
            self.container = try ModelContainer(for: Profile.self)
            self.context = container.mainContext
        }catch{
            fatalError("Couldn't create SwiftData container: \(error)")
        }
        
    }
}
