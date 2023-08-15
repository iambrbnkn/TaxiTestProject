//
//  MainViewViewModel.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import UIKit

protocol MainViewViewModelDelegate: AnyObject {
    func didLoadInitialOrders()
    func failToloadInitialOrders()
}

protocol CollectionViewMethods: AnyObject {
    var delegate: MainViewViewModelDelegate? { get set }
    
    func numberOfItems() -> Int
    func fetchOrders() -> Void
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainViewCollectionViewCellViewModel?
    func getDetailViewModel(forItemAt indexPath: IndexPath) -> DetailViewViewModelProtocol
}

// TODO: - Нейминг
final class MainViewViewModel: CollectionViewMethods {
    
    //MARK: - Delegate MainViewViewModelDelegate
    weak var delegate: MainViewViewModelDelegate?
    
    //MARK: - Private
    private var apiService: ApiServiceProtocol = ApiService()
    
    private var orders: [TaxiOrder] = []
    
    //MARK: - Methods
    func numberOfItems() -> Int {
        return orders.count
    }

    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainViewCollectionViewCellViewModel? {
        let order = orders[indexPath.row]
        return MainViewCollectionViewCellViewModel(order: order)
    }
    
    func getDetailViewModel(forItemAt indexPath: IndexPath) -> DetailViewViewModelProtocol {
        return DetailViewViewModel(order: orders[indexPath.row])
    }
        
    func fetchOrders() {
        apiService.execute(Constants.ordersUrl, expecting: [TaxiOrder].self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                self?.orders = responseModel.sorted {
                    $0.orderTime > $1.orderTime
                }
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialOrders()
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.delegate?.failToloadInitialOrders()
                }
            }
        }
    }
}

//MARK: - Constants
private extension MainViewViewModel {
    struct Constants {
       static let ordersUrl = "https://www.roxiemobile.ru/careers/test/orders.json"
    }
}
