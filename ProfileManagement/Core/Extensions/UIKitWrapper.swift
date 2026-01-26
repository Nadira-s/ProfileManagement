//
//  IKitWrapper.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 27.01.2026.
//

import SwiftUI
import UIKit

struct UIKitWrapper: UIViewControllerRepresentable {

    let controller: UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        controller
    }

    func updateUIViewController(
        _ uiViewController: UIViewController,
        context: Context
    ) {

    }
}
