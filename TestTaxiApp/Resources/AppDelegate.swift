//
//  AppDelegate.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        ThemeManager().getThemeFromUserDefaults()
        return true
    }
}
