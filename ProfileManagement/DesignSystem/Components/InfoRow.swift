//
//  InfoRow.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 26.01.2026.
//
import SwiftUI

struct InfoRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(ColorTheme.avatar)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundColor(ColorTheme.textPrimary)
        }
    }
}
