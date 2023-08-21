//
//  DefaultTheme.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import Foundation
import UIKit

class DefaultTheme: ThemeProtocol{
    var subViewsBackgroundColor: UIColor {
        return UIColor.secondarySystemBackground
    }
    
    var backgroundColor: UIColor {
        return UIColor.systemBackground
    }
    
    var buttonTittleTextColor: UIColor {
        return UIColor.systemRed
    }
    
    var buttonBackgroundColor: UIColor {
        return UIColor.systemRed
    }
    
    var primaryLabelTextColor: UIColor {
        return UIColor.label
    }
    
    var secondaryLabelTextColor: UIColor {
        return UIColor.secondaryLabel
    }
    
    var labelBackgroundColor: UIColor {
        return UIColor.clear
    }
    
    var iconColor: UIColor {
        return UIColor.label
    }
}
