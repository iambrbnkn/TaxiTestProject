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
        return UIColor.init(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
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
        return UIColor.init(red: 54/255, green: 54/255, blue: 56/255, alpha: 1)
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
