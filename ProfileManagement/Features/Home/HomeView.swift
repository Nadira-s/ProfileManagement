//
//  HomeView.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI


struct HomeView: View {

    @StateObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 24) {

            Text("Profile Management")
                .font(FontTheme.title)
                .foregroundColor(ColorTheme.textPrimary)

            PrimaryButton(title: "Go to Profile") {
                viewModel.goToProfile()
            }
        }
        .padding()
    }
}
