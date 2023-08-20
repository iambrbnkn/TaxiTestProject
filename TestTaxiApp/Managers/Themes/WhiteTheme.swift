//
//  WhiteTheme.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import Foundation
import UIKit

class WhiteTheme: ThemeProtocol{
    var subViewsBackgroundColor: UIColor {
        return UIColor.init(white: 0.9, alpha: 1)
    }
    
    var backgroundColor: UIColor {
        return UIColor.white
    }
    
    var buttonTittleTextColor: UIColor {
        return UIColor.systemRed
    }
    var primaryLabelTextColor: UIColor {
        return UIColor.black
    }
    var secondaryLabelTextColor: UIColor {
        return UIColor.init(white: 0.95, alpha: 1)
    }
    var buttonBackgroundColor: UIColor {
        return UIColor.systemRed
    }
    var labelBackgroundColor: UIColor {
        return UIColor.init(white: 0.9, alpha: 1)
    }
}
