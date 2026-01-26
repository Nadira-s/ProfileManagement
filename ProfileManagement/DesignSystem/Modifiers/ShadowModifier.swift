//
//  ShadowModifier.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1),
                    radius: 4,
                    x: 0,
                    y: 2)
    }
}

extension View {
    func appShadow() -> some View {
        modifier(ShadowModifier())
    }
}
