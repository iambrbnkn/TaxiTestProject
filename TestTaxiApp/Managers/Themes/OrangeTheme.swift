//
//  OrangeTheme.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import UIKit

class OrangeTheme: ThemeProtocol {
    var subViewsBackgroundColor: UIColor {
        return #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.862745098, alpha: 1)
    }
    
    var backgroundColor: UIColor {
        return #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
    }
    
    var buttonTittleTextColor: UIColor {
        return UIColor.black
    }
    
    var primaryLabelTextColor: UIColor {
        return UIColor.black
    }
    
    var secondaryLabelTextColor: UIColor {
        return UIColor.black
    }
    
    var buttonBackgroundColor: UIColor {
        return #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
    }
    
    var labelBackgroundColor: UIColor {
        return UIColor.clear
    }
    
    var iconColor: UIColor {
        return UIColor.black
    }
}
