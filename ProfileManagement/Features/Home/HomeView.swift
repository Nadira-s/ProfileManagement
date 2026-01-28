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

            Text(Strings.Home.title)
                .font(FontTheme.title)
                .foregroundColor(ColorTheme.textPrimary)

            PrimaryButton(title: Strings.Home.buttonTitle) {
                viewModel.goToProfile()
            }
        }
        .padding()
    }
}
