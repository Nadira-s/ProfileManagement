//
//  AppTextField.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI

struct AppTextField: View {

    let title: String
    @Binding var text: String
    var isDisabled: Bool = false
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(FontTheme.caption())
                .foregroundColor(ColorTheme.textSecondary)

            TextField("", text: $text)
                .keyboardType(keyboardType)
                .disabled(isDisabled)
                .padding(10)
                .background(ColorTheme.cardBackground)
                .cornerRadius(8)
        }
    }
}
