//
//  AppDelegate.swift
//  Looper
//
//  Created by Vitaly Berg on 7/20/21.
//  Copyright © 2021 Vitaly Berg. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }
    
    private func showUI() {
        window?.rootViewController = HomeViewController()
    }

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        showUI()
        return true
    }
}
