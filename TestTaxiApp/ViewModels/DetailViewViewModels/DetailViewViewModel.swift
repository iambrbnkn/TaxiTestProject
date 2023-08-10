//
//  DetailViewViewModel.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 09.08.2023.
//

import Foundation

protocol DetailViewViewModelProtocol {
    var regNumber: String { get }
    var modelName: String { get }
    var driverName: String { get }
    var startCity: String { get }
    var startAddress: String { get }
    var endCity: String { get }
    var endAddress: String { get }
    var date: String { get }
    var time: String { get }
    var price: String { get }
//    var carImage: UIImage? { get }
}


final class DetailViewViewModel: DetailViewViewModelProtocol {
    
    //MARK: - Model
    private var order: TaxiOrder
    
    //MARK: - Initial Variables
    var modelName: String {
        return order.vehicle.modelName
    }
    
    var imageUrl: String {
        return Constants.carImageBaseUrl + order.vehicle.photo
    }
    
    var regNumber: String {
        return order.vehicle.regNumber
    }
    
    var driverName: String {
        return order.vehicle.driverName
    }
    
    var startCity: String {
        return order.startAddress.city
    }
    
    var startAddress: String {
        return order.startAddress.address
    }
    
    var endCity: String {
        return order.endAddress.city
    }
    
    var endAddress: String {
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
    
    //MARK: - LifeCycle
    init(order: TaxiOrder) {
        self.order = order
    }
}

//MARK: - Constants
extension DetailViewViewModel {
     fileprivate struct Constants {
        static let carImageBaseUrl = "https://www.roxiemobile.ru/careers/test/images/"
    }
}
