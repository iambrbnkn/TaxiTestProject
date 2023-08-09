//
//  MainViewCollectionViewCell.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import UIKit

final class MainViewCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Add subviews
    
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .secondarySystemBackground
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    private let startAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 1
        label.textColor = .label
        return label
    }()
    
    private let priceLabel: UILabel = {
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
    
    //MARK: - Private func
    private func setupUI() {
        contentView.addSubviews(dateLabel, separatorView)
        addConstraint()
        setUpLayer()
    }
    
    private func setUpLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = 4
//        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    

    private func addConstraint() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -6),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 6),
            dateLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height / 10),
            
            separatorView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 6),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 2),
            
            startIconImage.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 8),
            startIconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            startIconImage.heightAnchor.constraint(equalToConstant: 25),
            startIconImage.widthAnchor.constraint(equalTo: startIconImage.heightAnchor),
            startIconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 6)
        ])
    }
}

//MARK: - Constants extension
extension MainViewCollectionViewCell {
    struct Constants {
        static let cellID = "mainViewTableViewCell"
    }
}
