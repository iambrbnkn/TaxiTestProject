//
//  UIColor+extension.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import UIKit

extension UIColor {
    
    static var selectedBackgroundColor: UIColor {
        return ThemeManager.selectedTheme.backgroundColor
    }
    
    static var subviewBackgroundColor: UIColor {
        return ThemeManager.selectedTheme.subViewsBackgroundColor
    }
    
    static var buttonTittleTextColor: UIColor {
        return ThemeManager.selectedTheme.buttonTittleTextColor
    }
    
    static var primaryLabelTextColor: UIColor {
        return ThemeManager.selectedTheme.primaryLabelTextColor
    }
    
    static var secondaryLabelTextColor: UIColor {
        return ThemeManager.selectedTheme.secondaryLabelTextColor
    }
    
    static var buttonBackgroundColor: UIColor {
        return ThemeManager.selectedTheme.buttonBackgroundColor
    }
    
    static var labelBackgroundColor: UIColor {
        return ThemeManager.selectedTheme.labelBackgroundColor
    }
    
    static var iconColor: UIColor {
        return ThemeManager.selectedTheme.iconColor
    }
}
