//
//  MainViewCollectionViewHeader.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 08.08.2023.
//

import UIKit

class MainViewCollectionViewHeader: UICollectionReusableView {
    
    weak var viewModel: MainViewCollectionViewSectionHeaderViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            titleLabel.text = viewModel.dateSectionLabel
        }
    }
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textColor = .secondarySystemBackground.withAlphaComponent(0.8)
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension MainViewCollectionViewHeader {
    struct Constants {
        static let cellID = "mainViewCollectionViewHeader"
    }
}
