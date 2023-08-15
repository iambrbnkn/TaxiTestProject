//
//  Int+Extension.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 09.08.2023.
//

import Foundation

extension Int {
    func convertIntToString(with code: String) -> String {
        let price = String(self)
        let lastDigits = price.suffix(from: price.index(price.endIndex, offsetBy: -2))
        let firstDigits = self / 100
        let newPrice = "\(firstDigits).\(lastDigits)"
        guard let convertedPrice = Double(newPrice) else {
            return "0"
        }
        //NumberFormatter
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = code
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: convertedPrice)
        return formatter.string(from: number)!
    }
}
