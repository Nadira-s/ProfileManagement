//
//  AppSecureField.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI

struct AppSecureField: View {

    let title: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(FontTheme.caption())

            SecureField("", text: $text)
                .padding(10)
                .background(ColorTheme.cardBackground)
                .cornerRadius(8)
        }
    }
}
