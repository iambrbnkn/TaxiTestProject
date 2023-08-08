//
//  MainViewViewModel.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import UIKit

protocol MainViewViewModelDelegate: AnyObject {
    func didLoadInitialOrders()
}

protocol CollectionViewMethods: AnyObject {
    var delegate: MainViewViewModelDelegate? { get set }
    
    func numberOfItems() -> Int
    func fetchOrders() -> Void
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainViewCollectionViewCellViewModelProtocol?
}

// TODO: - Разобраться с уровнями доступа +
// TODO: - Нарушен порядок уровней доступа
// TODO: - Нейминг
// TODO: - Зачем NSObject +
final class MainViewViewModel: CollectionViewMethods {
    
    weak var delegate: MainViewViewModelDelegate?
    
    private var orders: [TaxiOrder] = []
    
    private var apiService: ApiServiceProtocol = ApiService()
    
    //MARK: - Methods
    func numberOfItems() -> Int {
        return orders.count
    }

    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainViewCollectionViewCellViewModelProtocol? {
        let order = orders[indexPath.row]
        return MainViewCollectionViewCellViewModel(order: order)
    }
        
    func fetchOrders() {
        apiService.execute(Constants.ordersUrl, expecting: [TaxiOrder].self) { [unowned self] result in
            switch result {
            case .success(let responseModel):
                self.orders = responseModel.sorted {
                    $0.orderTime > $1.orderTime
                }
                DispatchQueue.main.async {
                    self.delegate?.didLoadInitialOrders()
                }
            case .failure(let error):
                // TODO: - Добавить обработку ошибок
                print(String(describing: error))
            }
        }
    }
}

//MARK: - Constants extension
private extension MainViewViewModel {
    struct Constants {
       static let ordersUrl = "https://www.roxiemobile.ru/careers/test/orders.json"
    }
}
