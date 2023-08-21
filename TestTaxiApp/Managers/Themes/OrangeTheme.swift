//
//  OrangeTheme.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import Foundation
import UIKit

class OrangeTheme: ThemeProtocol {
    
    var subViewsBackgroundColor: UIColor {
        return UIColor.init(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    }
    
    var backgroundColor: UIColor {
        return UIColor.init(red: 255/255, green: 159/255, blue: 10/255, alpha: 1)
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
        return UIColor.init(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
    }
    
    var labelBackgroundColor: UIColor {
        return UIColor.clear
    }
    
    var iconColor: UIColor {
        return UIColor.black
    }
}
