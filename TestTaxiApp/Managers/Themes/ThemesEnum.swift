import UIKit

//MARK: - Theme switcher
//Add here new theme was created
enum ThemeForKey: Int {
    case defaultTheme = 1
    case black = 2
    case white = 3
    case orange = 4

    var appTheme: ThemeProtocol {
        switch self {
        case .defaultTheme:
            return DefaultTheme()
        case .black:
            return BlackTheme()
        case .white:
            return WhiteTheme()
        case .orange:
            return OrangeTheme()
        }
    }
}
