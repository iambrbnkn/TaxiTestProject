//
//  MainViewCollectionViewCell.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import UIKit

final class MainViewCollectionViewCell: UICollectionViewCell {
    static let cellID = "mainViewTableViewCell"
    
    
    private let startCityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(startCityLabel)
        contentView.addSubview(startAddressLabel)
        contentView.backgroundColor = .blue
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addConstraint() {
        NSLayoutConstraint.activate([
            startCityLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            startCityLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6),
            startAddressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            startAddressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6),
            
            startCityLabel.heightAnchor.constraint(equalToConstant: 30),
            startAddressLabel.heightAnchor.constraint(equalToConstant: 30),
            
 
            startCityLabel.bottomAnchor.constraint(equalTo: startAddressLabel.topAnchor),
            startAddressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }
    
    public func configure(with viewModel: MainViewCollectionViewCellViewModel) {
        startCityLabel.text = viewModel.startCityLabel
        startAddressLabel.text = viewModel.startAddressLabel
        
    }

}
