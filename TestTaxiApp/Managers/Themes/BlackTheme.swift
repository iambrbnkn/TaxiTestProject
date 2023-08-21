//
//  BlackTheme.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import Foundation
import UIKit

class BlackTheme: ThemeProtocol{
    
    var subViewsBackgroundColor: UIColor {
        return UIColor.init(red: 84/255, green: 84/255, blue: 86/255, alpha: 1)
    }
    
    var backgroundColor: UIColor {
        return UIColor.black
    }
    
    var buttonTittleTextColor: UIColor {
        return UIColor.black
    }
    
    var primaryLabelTextColor: UIColor {
        return UIColor.white
    }
    
    var secondaryLabelTextColor: UIColor  {
        return UIColor.init(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
    }
    
    var buttonBackgroundColor: UIColor  {
        return UIColor.systemRed
    }
    
    var labelBackgroundColor: UIColor {
        return UIColor.clear
    }
    
    var iconColor: UIColor {
        return UIColor.white
    }

}

