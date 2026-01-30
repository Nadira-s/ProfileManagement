//
//  FontModifier.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 29.01.2026.
//
import SwiftUI

struct AppFontModifier: ViewModifier{
    let font: Font
    
    func body(content: Content) -> some View {
        content.font(font)
    }
}
