//
//  ProfileModel.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//
import SwiftData
import Foundation

@Model
class Profile {
    @Attribute(.unique) var email: String
    @Attribute var fullName: String
    @Attribute var phoneNumber: String
    @Attribute var avatarData : Data?
    
    init(fullName: String,email: String,phoneNumber: String, avatarData: Data? = nil) {
        self.fullName = fullName
        self.email = email
        self.phoneNumber = phoneNumber
        self.avatarData = avatarData
    }
}
