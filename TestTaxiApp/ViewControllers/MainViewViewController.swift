//
//  MainViewViewController.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 07.08.2023.
//

import UIKit

class MainViewViewController: UIViewController {
    
    private let viewModel = MainViewViewModel()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainViewCollectionViewCell.self, forCellWithReuseIdentifier: MainViewCollectionViewCell.cellID)
        return collectionView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubviews(collectionView, spinner)
        addConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Taxi Order List"
        viewModel.delegate = self
        viewModel.fetchOrders()
        setUpCollectionView()
    }
    
    //Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension MainViewViewController: CollectionViewMethods {
    var ordersCount: Int {
        return viewModel.ordersCount
    }
    
    var cellViewModels: [MainViewCollectionViewCellViewModel] {
        return viewModel.cellViewModels
    }
    
    
}

//MARK: - ViewCallback
extension MainViewViewController: MainViewViewModelDelegate {
    func didLoadInitialOrders() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
    }
}
 
//MARK: - UICollectionViewDelegate
extension MainViewViewController: UICollectionViewDelegate {
    
    
}

//MARK: - UICollectionViewDataSource
extension MainViewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // get TaxiOrders count from viewModel
        return ordersCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewCollectionViewCell.cellID, for: indexPath) as? MainViewCollectionViewCell else {
            fatalError()
        }
        // Need to get array of cellViewModels or
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
}

extension MainViewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width = bounds.width - 32
        
        return CGSize(width: width, height: 150)
    }
}
