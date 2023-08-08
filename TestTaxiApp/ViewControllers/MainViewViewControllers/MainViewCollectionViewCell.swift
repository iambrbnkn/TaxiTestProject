//
//  MainViewCollectionViewCell.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import UIKit

final class MainViewCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Add subviews
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
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - viewModel
    weak var viewModel: MainViewCollectionViewCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            startCityLabel.text = viewModel.startCityLabel
            startAddressLabel.text = viewModel.startAddressLabel
            dateLabel.text = viewModel.date
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Private func
    private func setupUI() {
        contentView.addSubviews(startCityLabel, startAddressLabel, dateLabel)
        addConstraint()
        contentView.backgroundColor = .blue
    }

    private func addConstraint() {
        NSLayoutConstraint.activate([
            startCityLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            startCityLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6),
            startAddressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            startAddressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6),
            dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            
            startCityLabel.heightAnchor.constraint(equalToConstant: 30),
            startAddressLabel.heightAnchor.constraint(equalToConstant: 30),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dateLabel.bottomAnchor.constraint(equalTo: startCityLabel.topAnchor),
            startCityLabel.bottomAnchor.constraint(equalTo: startAddressLabel.topAnchor),
            startAddressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
        ])
    }
}

//MARK: - Constants extension
extension MainViewCollectionViewCell {
    struct Constants {
        static let cellID = "mainViewTableViewCell"
    }
}
