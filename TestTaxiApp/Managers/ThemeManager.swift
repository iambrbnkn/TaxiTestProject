//
//  ThemeManager.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 17.08.2023.
//

import Foundation

final class Service {
    
    //MARK: - Static variable to user theme selection
    static var selectedTheme: ThemeProtocol = ThemeForKey.defaultTheme.appTheme
    
    private let userDefaults = UserDefaults.standard
    
    //MARK: - Internal method
    func selectTheme(withTag tag: Int) -> Void {
        guard let selection = ThemeForKey(rawValue: tag) else {
            Service.selectedTheme = ThemeForKey.defaultTheme.appTheme
            return
        }
        Service.selectedTheme = selection.appTheme
        setUserTheme(tag)
    }
    
    func getUserTheme() -> Void {
        let data = userDefaults.integer(forKey: "SelectedTheme")
        guard let theme = ThemeForKey(rawValue: data)?.appTheme else {
            Service.selectedTheme = ThemeForKey.defaultTheme.appTheme
            return
        }
        Service.selectedTheme = theme
    }
    
    //MARK: - Private Method
    private func setUserTheme(_ selection: Int) -> Void {
        userDefaults.setValue(selection, forKey: "SelectedTheme")
    }
    
    
    
    
}
