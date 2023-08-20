//
//  ThemeProtocol.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 20.08.2023.
//

import Foundation
import UIKit

//MARK: - Protocol to create different themes
protocol ThemeProtocol: AnyObject {
    var backgroundColor: UIColor { get }
    var subViewsBackgroundColor: UIColor { get }
    var buttonTittleTextColor: UIColor { get }
    var primaryLabelTextColor: UIColor { get }
    var secondaryLabelTextColor: UIColor { get }
    var buttonBackgroundColor: UIColor { get }
    var labelBackgroundColor: UIColor { get }
}
