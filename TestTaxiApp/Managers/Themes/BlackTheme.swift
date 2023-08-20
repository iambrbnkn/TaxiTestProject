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
        return UIColor.systemGray
    }
    
    var backgroundColor: UIColor {
        return UIColor.black
    }
    
    var buttonTittleTextColor: UIColor {
        return UIColor.label
    }
    
    var primaryLabelTextColor: UIColor {
        return UIColor.white
    }
    
    var secondaryLabelTextColor: UIColor  {
        return UIColor.init(white: 1, alpha: 0.9)
    }
    
    var buttonBackgroundColor: UIColor  {
        return UIColor.systemRed
    }
    
    var labelBackgroundColor: UIColor {
        return UIColor.black
    }
}

