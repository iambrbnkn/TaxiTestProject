//
//  MainViewCollectionViewCellViewModel.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import Foundation

final class MainViewCollectionViewCellViewModel {
    
    // MARK: - Model
    
    private var order: TaxiOrder
            
    // MARK: - Initial variables
    
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
        dateFormatter.timeStyle = .none
        let orderDate = dateFormatter.string(from: order.orderTime)
        return orderDate
    }
    
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let time = dateFormatter.string(from: order.orderTime)
        return time
    }
    
    var price: String {
        order.price.amount.convertIntToString(with: order.price.currency)
    }
    
    // MARK: - Init
    
    init(order: TaxiOrder) {
        self.order = order
    }
}
