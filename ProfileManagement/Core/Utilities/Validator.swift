//
//  Validator.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import Foundation

struct Validator {

    static func validateFullName(_ name: String) -> String? {
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            return Strings.Validator.validateFullName
        }
        return nil
    }

    static func validatePhone(_ phone: String) -> String? {
        if phone.isEmpty {
            return Strings.Validator.validatePhone1
        }

        if !phone.allSatisfy({ $0.isNumber }) {
            return Strings.Validator.validatePhone2
        }

        return nil
    }
}
