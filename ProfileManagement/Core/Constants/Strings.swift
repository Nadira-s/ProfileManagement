//
//  Strings.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 29.01.2026.
//


struct Strings {
    struct Home {
        static let title = "Profile Management"
        static let buttonTitle = "Go to Profile"
    }
    struct Profile {
        static let fullName = "Full Name"
        static let email = "Email"
        static let phone = "Phone"
        static let button = "Edit Profile"
        static let title = "Profile"
    }
    struct EditProfile {
        static let button1 = "Choose from gallery"
        static let button2 = "Take photo"
        static let save = "Save"
        static let cancel = "Cancel"
    }
    struct Validator {
        static let validateFullName = "Full name cannot be empty"
        static let validatePhone1 = "Phone is required"
        static let validatePhone2 = "Phone must contain only numbers"
        static let validateEmail = "Failed to save profile"
        static let fetchProfile = "❌ Failed to fetch profile:"
        static let errorSwiftData = "Couldn't create SwiftData container:"
        
    }
    struct PreviewData {
        static let fullName = "Alex Morty"
        static let email = "alex@mail.com"
        static let phone = "89001234567"
    }
}
