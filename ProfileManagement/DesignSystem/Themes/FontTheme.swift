//
//  FontTheme.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI

enum FontTheme {
    static func title(weight: Font.Weight = .bold) -> Font {
        .system(size: 16, weight: weight)
    }
    static func body(weight: Font.Weight = .regular) -> Font {
        .system(size: 16, weight: weight)
    }
    static func caption(weight: Font.Weight = .regular) -> Font {
        .system(size: 13, weight:weight)
    }
}
