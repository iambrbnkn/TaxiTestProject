//
//  ThemeManager.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 17.08.2023.
//

import Foundation

final class ThemeManager {
    
    // MARK: - Static variable to user theme selection
    
    static var selectedTheme: ThemeProtocol = Themes.defaultTheme.theme
    
    // MARK: - Private
    
    private let userDefaults = UserDefaults.standard
    
    private enum Themes: Int {
        case defaultTheme = 1
        case black = 2
        case white = 3
        case orange = 4

        var theme: ThemeProtocol {
            switch self {
            case .defaultTheme:
                return DefaultTheme()
            case .black:
                return BlackTheme()
            case .white:
                return WhiteTheme()
            case .orange:
                return OrangeTheme()
            }
        }
    }
    
    // MARK: - Internal method
    
    func selectTheme(withTag tag: Int) {
        guard let selection = Themes(rawValue: tag) else {
            ThemeManager.selectedTheme = Themes.defaultTheme.theme
            return
        }
        ThemeManager.selectedTheme = selection.theme
        userDefaults.setValue(tag, forKey: "SelectedTheme")
    }
    
    /*
     Вызов производится в AppDelegate
     По ключу берем значение целочисленное из UserDefaults
     Если по ключу в перечислении нет значения - устанавливаем значение темы по умолчанию, в ином случае значение выбранной темы
     */
    func getThemeFromUserDefaults() {
        let data = userDefaults.integer(forKey: "SelectedTheme")
        guard let theme = Themes(rawValue: data)?.theme else {
            ThemeManager.selectedTheme = Themes.defaultTheme.theme
            return
        }
        ThemeManager.selectedTheme = theme
    }
}
