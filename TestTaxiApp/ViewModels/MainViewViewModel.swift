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

protocol MainViewViewModelProtocol {
    var orders: [TaxiOrder] { get }
    func fetchOrders(completion: @escaping() -> Void)
}

final class MainViewViewModel: NSObject {
    
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
    
    private var cellViewModels: [MainViewCollectionViewCellViewModel] = []
    
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

extension MainViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewCollectionViewCell.cellID, for: indexPath) as? MainViewCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width = bounds.width - 32
        
        return CGSize(width: width, height: 150)
    }
}
