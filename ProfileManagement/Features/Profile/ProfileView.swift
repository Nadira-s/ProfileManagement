//
//  ProfileView.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//
import SwiftUI

import SwiftUI

struct ProfileView: View {

    @StateObject var viewModel: ProfileViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {

                AvatarView(
                    image: viewModel.profile.avatarData.flatMap { UIImage(data: $0) },
                    size: 120
                )

                VStack(spacing: 25) {
                    InfoRow(title: Strings.Profile.fullName, value: viewModel.profile.fullName)
                    InfoRow(title: Strings.Profile.email, value: viewModel.profile.email)
                    InfoRow(title: Strings.Profile.phone, value: viewModel.profile.phoneNumber)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                

                PrimaryButton(title: Strings.Profile.button) {
                    viewModel.editProfileTapped()
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(Strings.Profile.title)
        .onAppear {
            viewModel.onAppear()
        }
    }
}
