//
//  AvatarView.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 27.01.2026.
//

import SwiftUI

struct AvatarView: View {
    let image: UIImage?
    let size: CGFloat

    var body: some View {
        Group {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                    )
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}

