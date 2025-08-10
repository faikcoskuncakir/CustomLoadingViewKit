//
//  CustomLoadingViewPresenter.swift
//  CustomLoadingViewKit
//
//  Created by Cakir, Faik on 10.08.2025.
//

import SwiftUI
import UIKit

public enum CustomLoadingViewPresenter {
    @MainActor private static var window: UIWindow?

    public static func start() {
        Task { @MainActor in
            guard window == nil else { return }

            let hosting = UIHostingController(rootView: CustomLoadingView())
            hosting.view.backgroundColor = .clear

            let newWindow: UIWindow
            if let scene = UIApplication.shared.connectedScenes
                        .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                newWindow = UIWindow(windowScene: scene)
                newWindow.frame = scene.coordinateSpace.bounds
            } else {
                newWindow = UIWindow(frame: UIScreen.main.bounds)
            }

            newWindow.rootViewController = hosting
            newWindow.windowLevel = .alert + 1
            newWindow.makeKeyAndVisible()

            window = newWindow
        }
    }

    public static func stop() {
        Task { @MainActor in
            window?.isHidden = true
            window = nil
        }
    }
}


