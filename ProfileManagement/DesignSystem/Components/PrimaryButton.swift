//
//  PrimaryButton.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI

struct PrimaryButton: View {

    let title: String
    let action: () -> Void
    var isDisabled: Bool = false

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(FontTheme.body)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isDisabled ? Color.gray : ColorTheme.primary)
                .cornerRadius(10)
        }
        .disabled(isDisabled)
    }
}
