//
//  OrderDetailsViewController.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import UIKit

final class OrderDetailsViewController: UIViewController {
    
    private var viewModel: DetailViewViewModelProtocol
    
    // MARK: - Views
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private lazy var firstSubView: UIView = {
        let firstSubView = UIView()
        firstSubView.translatesAutoresizingMaskIntoConstraints = false
        firstSubView.layer.cornerRadius = 8
        firstSubView.backgroundColor = .subviewBackgroundColor
        return firstSubView
    }()
    
    private lazy var secondSubView: UIView = {
        let secondSubView = UIView()
        secondSubView.translatesAutoresizingMaskIntoConstraints = false
        secondSubView.layer.cornerRadius = 8
        secondSubView.backgroundColor = .subviewBackgroundColor
        return secondSubView
    }()
    
    private lazy var directionIconView: UIImageView = {
        let directionIconView = UIImageView()
        directionIconView.image = UIImage(systemName: "arrow.down")
        directionIconView.contentMode = .scaleAspectFit
        directionIconView.backgroundColor = .clear
        directionIconView.tintColor = .iconColor
        directionIconView.translatesAutoresizingMaskIntoConstraints = false
        return directionIconView
    }()
    
    private lazy var carImageView: UIImageView = {
        let carImageView = UIImageView()
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.clipsToBounds = true
        carImageView.layer.cornerRadius = 8
        carImageView.contentMode = .scaleAspectFill
        return carImageView
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .selectedBackgroundColor
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    private lazy var startCityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var startAddressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var endCityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var endAddressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var regNumber: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var modelName: UILabel = {
        let label = UILabel()
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var driverName: UILabel = {
        let label = UILabel()
        label.textColor = .primaryLabelTextColor
        label.backgroundColor = .labelBackgroundColor
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCycle
    
    init(viewModel: DetailViewViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchImage()
        setupUI()
        configure(with: viewModel)
        viewModel.delegate = self
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Детали заказа"
        view.backgroundColor = .selectedBackgroundColor
        activityIndicator.startAnimating()
        view.addSubviews(firstSubView, secondSubView)
        firstSubView.addSubviews(
            dateLabel,
            startCityLabel,
            startAddressLabel,
            endCityLabel,
            endAddressLabel,
            priceLabel,
            directionIconView
        )
        secondSubView.addSubviews(
            driverName,
            modelName,
            regNumber,
            carImageView,
            activityIndicator
        )
        addConstraints()
        setupLayer()
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            firstSubView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            firstSubView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            firstSubView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            firstSubView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),

            secondSubView.topAnchor.constraint(equalTo: firstSubView.bottomAnchor, constant: 6),
            secondSubView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            secondSubView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            secondSubView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: firstSubView.topAnchor, constant: 14),
            dateLabel.leadingAnchor.constraint(equalTo: firstSubView.leadingAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: -8),

            startCityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            startCityLabel.leadingAnchor.constraint(equalTo: firstSubView.leadingAnchor, constant: 8),
            startCityLabel.trailingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: -8),
            
            startAddressLabel.topAnchor.constraint(equalTo: startCityLabel.bottomAnchor, constant: 6),
            startAddressLabel.leadingAnchor.constraint(equalTo: firstSubView.leadingAnchor, constant: 8),
            startAddressLabel.trailingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: -8),
            
            directionIconView.topAnchor.constraint(equalTo: startAddressLabel.bottomAnchor, constant: 8),
            directionIconView.centerXAnchor.constraint(equalTo: firstSubView.centerXAnchor),
            directionIconView.heightAnchor.constraint(equalToConstant: 25),
            directionIconView.widthAnchor.constraint(equalTo: directionIconView.heightAnchor),
            
            endCityLabel.topAnchor.constraint(equalTo: directionIconView.bottomAnchor, constant: 8),
            endCityLabel.leadingAnchor.constraint(equalTo: firstSubView.leadingAnchor, constant: 8),
            endCityLabel.trailingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: -8),
            
            endAddressLabel.topAnchor.constraint(equalTo: endCityLabel.bottomAnchor, constant: 6),
            endAddressLabel.leadingAnchor.constraint(equalTo: firstSubView.leadingAnchor, constant: 8),
            endAddressLabel.trailingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: -8),
            
            priceLabel.topAnchor.constraint(equalTo: endAddressLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: firstSubView.leadingAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: firstSubView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            driverName.topAnchor.constraint(equalTo: secondSubView.topAnchor, constant: 14),
            driverName.leadingAnchor.constraint(equalTo: secondSubView.leadingAnchor, constant: 8),
            driverName.trailingAnchor.constraint(equalTo: secondSubView.trailingAnchor, constant: -8),
            
            modelName.topAnchor.constraint(equalTo: driverName.bottomAnchor, constant: 6),
            modelName.leadingAnchor.constraint(equalTo: secondSubView.leadingAnchor, constant: 8),
            modelName.trailingAnchor.constraint(equalTo: secondSubView.trailingAnchor, constant: -8),
            
            regNumber.topAnchor.constraint(equalTo: modelName.bottomAnchor, constant: 8),
            regNumber.leadingAnchor.constraint(equalTo: secondSubView.leadingAnchor, constant: 8),
            regNumber.trailingAnchor.constraint(equalTo: secondSubView.trailingAnchor, constant: -8),
            
            carImageView.topAnchor.constraint(equalTo: regNumber.bottomAnchor, constant: 14),
            carImageView.leadingAnchor.constraint(equalTo: secondSubView.leadingAnchor, constant: 8),
            carImageView.trailingAnchor.constraint(equalTo: secondSubView.trailingAnchor, constant: -8),
            carImageView.bottomAnchor.constraint(equalTo: secondSubView.bottomAnchor, constant: -16),
            
            activityIndicator.centerXAnchor.constraint(equalTo: carImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: carImageView.centerYAnchor)
        ])
    }
    
    private func setupLayer() {
        firstSubView.layer.shadowColor = UIColor.label.cgColor
        firstSubView.layer.cornerRadius = 4
        firstSubView.layer.shadowOffset = CGSize(width: -2, height: -3)
        firstSubView.layer.shadowOpacity = 0.3

        secondSubView.layer.shadowColor = UIColor.label.cgColor
        secondSubView.layer.cornerRadius = 4
        secondSubView.layer.shadowOffset = CGSize(width: -2, height: -3)
        secondSubView.layer.shadowOpacity = 0.3
    }

    // MARK: - Configure with viewModel
    
    private func configure(with viewModel: DetailViewViewModelProtocol) {
        let viewModel = viewModel 
        self.dateLabel.text = "Заказ \(viewModel.date) в \(viewModel.time)"
        self.startCityLabel.text = viewModel.startCity
        self.startAddressLabel.text = viewModel.startAddress
        self.endCityLabel.text = viewModel.endCity
        self.endAddressLabel.text = viewModel.endAddress
        self.priceLabel.text = viewModel.price
        
        self.driverName.text = "Водитель: \(viewModel.driverName)"
        self.modelName.text = "Марка авто: \(viewModel.modelName)"
        self.regNumber.text = "Регистрационный номер: \(viewModel.regNumber.uppercased())"
    }
}

// MARK: - Delegate Extension

extension OrderDetailsViewController: DetailViewViewModelDelegate {
    func setImage(_ image: UIImage) {
        self.carImageView.image = image
        activityIndicator.stopAnimating()
    }
}
