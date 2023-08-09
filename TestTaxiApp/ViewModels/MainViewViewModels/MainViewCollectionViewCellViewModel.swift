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
    var time: String { get }
    var price: String { get }
}

final class MainViewCollectionViewCellViewModel: MainViewCollectionViewCellViewModelProtocol {
    
    private var order: TaxiOrder
    
    private var converter: PriceConverterProtocol = PriceConverter()
        
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
        converter.convertShityNumber(from: order.price.amount, with: order.price.currency)
    }
    
    init(order: TaxiOrder) {
        self.order = order
    }
}
