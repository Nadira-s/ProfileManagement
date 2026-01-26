//
//  PersistenceService.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//
import SwiftData

class PersistenceService {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    
    func fetchProfile() throws -> Profile? {
        let profiles: [Profile] = try context.fetch(FetchDescriptor<Profile>())
        return profiles.first
    }
    
    func save(_ profile: Profile) throws {
        context.insert(profile)
        try context.save()
    }
}
