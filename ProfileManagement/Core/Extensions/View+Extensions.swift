//
//  View+Extensions.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import UIKit
import SwiftUICore


extension View {
    func cardStyle() -> some View {
        modifier(CardModifier())
    }
    func appShadow() -> some View {
        modifier(ShadowModifier())
    }
    func AppFont(_ font: Font) -> some View {
        self.modifier(AppFontModifier(font: font))
    }
}
extension UIApplication {
    var rootViewController: UIViewController? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .rootViewController
    }
}

