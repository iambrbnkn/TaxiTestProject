//
//  MainViewCollectionViewCell.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import UIKit

final class MainViewCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Views
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .secondaryLabel
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    private let startIconImage: UIImageView = {
        let startIconImage = UIImageView()
        startIconImage.image = UIImage(systemName: "s.circle")
        startIconImage.contentMode = .scaleAspectFit
        startIconImage.backgroundColor = .clear
        startIconImage.translatesAutoresizingMaskIntoConstraints = false
        return startIconImage
    }()
    
    private let endIconImage: UIImageView = {
        let endIconImage = UIImageView()
        endIconImage.image = UIImage(systemName: "e.circle")
        endIconImage.contentMode = .scaleAspectFit
        endIconImage.backgroundColor = .clear
        endIconImage.translatesAutoresizingMaskIntoConstraints = false
        return endIconImage
    }()
    
    private let startCityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startAddressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let endCityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let endAddressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 1
        label.textColor = .label
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - viewModel
    weak var viewModel: MainViewCollectionViewCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            startCityLabel.text = viewModel.startCityLabel
            startAddressLabel.text = viewModel.startAddressLabel
            endCityLabel.text = viewModel.endCityLabel
            endAddressLabel.text = viewModel.endAddressLabel
            dateLabel.text = "Поездка \(viewModel.date) в \(viewModel.time)"
            priceLabel.text = viewModel.price
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
    
    //MARK: - Private Methods
    private func setupUI() {
        contentView.addSubviews(
            dateLabel,
            separatorView,
            startIconImage,
            endIconImage,
            startCityLabel,
            startAddressLabel,
            endCityLabel,
            endAddressLabel,
            priceLabel
        )
        addConstraint()
        setUpLayer()
    }
    
    private func setUpLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = 4
                contentView.layer.shadowOffset = CGSize(width: -2, height: -3)
        contentView.layer.shadowOpacity = 0.3
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    //MARK: - Constraints
    private func addConstraint() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            
            separatorView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 2),
            
            startIconImage.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 12),
            startIconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            startIconImage.heightAnchor.constraint(equalToConstant: 30),
            startIconImage.widthAnchor.constraint(equalTo: startIconImage.heightAnchor),
            
            endIconImage.topAnchor.constraint(equalTo: startIconImage.bottomAnchor, constant: 25),
            endIconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            endIconImage.heightAnchor.constraint(equalToConstant: 30),
            endIconImage.widthAnchor.constraint(equalTo: startIconImage.heightAnchor),
            
            startCityLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 12),
            startCityLabel.leadingAnchor.constraint(equalTo: startIconImage.trailingAnchor, constant: 8),
            startCityLabel.heightAnchor.constraint(equalToConstant: 15),
            
            startAddressLabel.topAnchor.constraint(equalTo: startCityLabel.bottomAnchor),
            startAddressLabel.leadingAnchor.constraint(equalTo: startIconImage.trailingAnchor, constant: 8),
            startAddressLabel.heightAnchor.constraint(equalToConstant: 15),
            
            endCityLabel.topAnchor.constraint(equalTo: startAddressLabel.bottomAnchor, constant: 25),
            endCityLabel.leadingAnchor.constraint(equalTo: startIconImage.trailingAnchor, constant: 8),
            endCityLabel.heightAnchor.constraint(equalToConstant: 15),
            
            endAddressLabel.topAnchor.constraint(equalTo: endCityLabel.bottomAnchor),
            endAddressLabel.leadingAnchor.constraint(equalTo: startIconImage.trailingAnchor, constant: 8),
            endAddressLabel.heightAnchor.constraint(equalToConstant: 15),
            
            priceLabel.heightAnchor.constraint(equalToConstant: 85),
            priceLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 12),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6)
        ])
    }
}

//MARK: - Constants
extension MainViewCollectionViewCell {
    struct Constants {
        static let cellID = "mainViewTableViewCell"
    }
}
