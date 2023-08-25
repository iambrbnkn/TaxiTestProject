//
//  WhiteTheme.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import UIKit

class WhiteTheme: ThemeProtocol {
    var subViewsBackgroundColor: UIColor {
        return #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
    }
    
    var backgroundColor: UIColor {
        return UIColor.white
    }
    
    var buttonTittleTextColor: UIColor {
        return UIColor.white
    }
    var primaryLabelTextColor: UIColor {
        return UIColor.black
    }
    var secondaryLabelTextColor: UIColor {
        return #colorLiteral(red: 0.2117647059, green: 0.2117647059, blue: 0.2196078431, alpha: 1)
    }
    var buttonBackgroundColor: UIColor {
        return UIColor.systemRed
    }
    var labelBackgroundColor: UIColor {
        return UIColor.clear
    }
    
    var iconColor: UIColor {
        return UIColor.black
    }
}
