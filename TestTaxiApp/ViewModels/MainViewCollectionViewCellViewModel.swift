//
//  MainViewCollectionViewCellViewModel.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import Foundation

final class MainViewCollectionViewCellViewModel {
    public let startCityLabel: String
    public let startAddressLabel: String
    
    init(startCityLabel: String, startAddressLabel: String ) {
        self.startCityLabel = startCityLabel
        self.startAddressLabel = startAddressLabel
    }

}
