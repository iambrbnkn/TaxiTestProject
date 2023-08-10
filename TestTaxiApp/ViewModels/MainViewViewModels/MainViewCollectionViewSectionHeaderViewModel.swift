//
//  MainViewCollectionViewSectionHeaderViewModel.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 08.08.2023.
//

import Foundation

protocol MainViewCollectionViewSectionHeaderViewModelProtocol: AnyObject {
    var dateSectionLabel: String { get }
}

final class MainViewCollectionViewSectionHeaderViewModel: MainViewCollectionViewSectionHeaderViewModelProtocol {
    
    private var order: TaxiOrder
    
    var dateSectionLabel: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let orderDate = dateFormatter.string(from: order.orderTime)
        return orderDate
    }
    
    init(order: TaxiOrder) {
        self.order = order
    }
}
