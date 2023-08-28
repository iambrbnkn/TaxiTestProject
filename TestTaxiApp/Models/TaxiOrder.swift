//
//  TaxiOrder.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import Foundation

struct TaxiOrder: Codable {
    let id: Int
    let startAddress: StartAddress
    let endAddress: EndAddress
    let price: Price
    let orderTime: Date
    let vehicle: Vehicle
}

struct StartAddress: Codable {
    let city: String
    let address: String
}

struct EndAddress: Codable {
    let city: String
    let address: String
}

struct Vehicle: Codable {
    let regNumber: String
    let modelName: String
    let photo: String
    let driverName: String
}

struct Price: Codable {
    let amount: Int
    let currency: String
}
