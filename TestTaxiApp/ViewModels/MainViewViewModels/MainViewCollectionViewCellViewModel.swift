//
//  MainViewCollectionViewCellViewModel.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import Foundation

protocol MainViewCollectionViewCellViewModelProtocol: AnyObject {
    var startCityLabel: String { get }
    var startAddressLabel: String { get }
    var endCityLabel: String { get }
    var endAddressLabel: String { get }
    var date: String { get }
    var price: String { get }
}

final class MainViewCollectionViewCellViewModel: MainViewCollectionViewCellViewModelProtocol {
    
    private var order: TaxiOrder
    
    var startCityLabel: String {
        return order.startAddress.city
    }
    
    var startAddressLabel: String {
        return order.startAddress.address
    }
    
    var endCityLabel: String {
        return order.endAddress.city }
    
    var endAddressLabel: String {
        return order.endAddress.address
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let orderDate = dateFormatter.string(from: order.orderTime)
        return orderDate
    }
    
    var price: String {
        return "\(order.price.amount) \(order.price.currency)"
    }
    
    init(order: TaxiOrder) {
        self.order = order
    }
}
