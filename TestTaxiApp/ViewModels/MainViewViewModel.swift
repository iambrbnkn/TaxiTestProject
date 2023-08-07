//
//  MainViewViewModel.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import Foundation
import UIKit

protocol MainViewViewModelDelegate: AnyObject {
    func didLoadInitialOrders()
}

protocol CollectionViewMethods: AnyObject {
    var ordersCount: Int { get }
    var cellViewModels: [MainViewCollectionViewCellViewModel] { get }
    
}

final class MainViewViewModel: NSObject, CollectionViewMethods {
    
    public weak var delegate: MainViewViewModelDelegate?
    
    let url = "https://www.roxiemobile.ru/careers/test/orders.json"
    
    private var orders: [TaxiOrder] = [] {
        didSet {
            for order in orders {
                let viewModels = MainViewCollectionViewCellViewModel(startCityLabel: order.startAddress.city, startAddressLabel: order.startAddress.address)
                cellViewModels.append(viewModels)
            }
        }
    }
    
    public var ordersCount: Int {
        return orders.count
    }
    
    var cellViewModels: [MainViewCollectionViewCellViewModel] = []
    
    public func fetchOrders() {
        ApiService.apiService.execute(url, expecting: [TaxiOrder].self) { [unowned self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel
                self.orders = results
                DispatchQueue.main.async {
                    self.delegate?.didLoadInitialOrders()
                }
                print(result)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

