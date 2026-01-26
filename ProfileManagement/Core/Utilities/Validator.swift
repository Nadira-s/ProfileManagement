//
//  Validator.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import Foundation

enum Validator {

    static func validateFullName(_ name: String) -> String? {
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            return "Full name cannot be empty"
        }
        return nil
    }

    static func validatePhone(_ phone: String) -> String? {
        if phone.isEmpty {
            return "Phone is required"
        }

        if !phone.allSatisfy({ $0.isNumber }) {
            return "Phone must contain only numbers"
        }

        return nil
    }
}
