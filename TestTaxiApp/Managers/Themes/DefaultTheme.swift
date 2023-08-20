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
        return UIColor.systemBackground
    }
    
    var backgroundColor: UIColor {
        return UIColor.secondarySystemBackground
    }
    
    var buttonTittleTextColor: UIColor {
        return UIColor.label
    }
    
    var primaryLabelTextColor: UIColor {
        return UIColor.label
    }
    
    var secondaryLabelTextColor: UIColor {
        return UIColor.secondaryLabel
    }
    
    var buttonBackgroundColor: UIColor {
        return UIColor.systemRed
    }
    
    var labelBackgroundColor: UIColor {
        return UIColor.secondarySystemBackground
    }
}
