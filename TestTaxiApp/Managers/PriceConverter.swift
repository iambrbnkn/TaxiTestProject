//
//  PriceConverter.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 08.08.2023.
//

import Foundation

//MARK: - Protocol
protocol PriceConverterProtocol {
    func convertShityNumber(from priceInteger: Int, with code: String) -> String
}

final class PriceConverter: PriceConverterProtocol {

    func convertShityNumber(from priceInteger: Int, with code: String) -> String {
        let price = String(priceInteger)
        let lastDigits = price.suffix(from: price.index(price.endIndex, offsetBy: -2))
        let firstDigits = priceInteger / 100
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
