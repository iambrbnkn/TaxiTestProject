//
//  BlackTheme.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import UIKit

final class BlackTheme: ThemeProtocol {
    var subViewsBackgroundColor: UIColor {
        return #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.337254902, alpha: 1)
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
    var secondaryLabelTextColor: UIColor {
        return #colorLiteral(red: 0.9490196078, green: 0.968627451, blue: 0.968627451, alpha: 1)
    }
    var buttonBackgroundColor: UIColor {
        return UIColor.systemRed
    }
    var labelBackgroundColor: UIColor {
        return UIColor.clear
    }
    var iconColor: UIColor {
        return UIColor.white
    }
}
