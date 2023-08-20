//
//  UIColor+extension.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import Foundation
import UIKit

extension UIColor {
    
    static var selectedBackgroundColor:  UIColor {
        return Service.selectedTheme.backgroundColor
    }
    
    static var subviewBackgroundColor:  UIColor {
        return Service.selectedTheme.subViewsBackgroundColor
    }
    
    static var buttonTittleTextColor: UIColor {
        return Service.selectedTheme.buttonTittleTextColor
    }
    
    static var primaryLabelTextColor: UIColor {
        return Service.selectedTheme.primaryLabelTextColor
    }
    
    static var secondaryLabelTextColor: UIColor {
        return Service.selectedTheme.secondaryLabelTextColor
    }
    
    static var buttonBackgroundColor: UIColor {
        return Service.selectedTheme.buttonBackgroundColor
    }
    
    static var labelBackgroundColor: UIColor {
        return Service.selectedTheme.labelBackgroundColor
    }
}

