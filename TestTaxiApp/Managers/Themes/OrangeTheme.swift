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
        return UIColor.init(red: 255, green: 204, blue: 153, alpha: 1)
    }
    
    var backgroundColor: UIColor {
        return UIColor.init(red: 255, green: 102, blue: 0, alpha: 1)
    }
    
    var buttonTittleTextColor: UIColor {
        return UIColor.white
    }
    
    var primaryLabelTextColor: UIColor {
        return UIColor.white
    }
    
    var secondaryLabelTextColor: UIColor {
        return UIColor.init(white: 1, alpha: 0.9)
    }
    
    var buttonBackgroundColor: UIColor {
        return UIColor.init(red: 255, green: 79, blue: 0, alpha: 1)
    }
    
    var labelBackgroundColor: UIColor {
        return UIColor.init(red: 255, green: 204, blue: 153, alpha: 1)
    }
    
    
   
}
