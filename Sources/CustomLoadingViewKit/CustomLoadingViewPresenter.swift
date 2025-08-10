//
//  CustomLoadingViewPresenter.swift
//  CustomLoadingViewKit
//
//  Created by Cakir, Faik on 10.08.2025.
//

import SwiftUI
import UIKit

public enum CustomLoadingViewPresenter {
    // main actor ile izole edilmiş statik window
    @MainActor private static var window: UIWindow?

    // start/stop'u main actor içinde çalıştırıyoruz
    public static func start() {
        Task { @MainActor in
            // zaten açıksa tekrar açma
            guard window == nil else { return }

            let hosting = UIHostingController(rootView: CustomLoadingView())
            hosting.view.backgroundColor = .clear

            // iOS 13+ scene uyumlu pencere oluşturma
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


