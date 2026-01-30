//
//  ContentView.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.white 
                .ignoresSafeArea()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    SplashScreen()
}
