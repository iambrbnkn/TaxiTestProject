//
//  MainViewViewController.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 07.08.2023.
//

import UIKit

class MainViewViewController: UIViewController {
    
    private let viewModel: CollectionViewMethods = MainViewViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 14, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainViewCollectionViewCell.self, forCellWithReuseIdentifier: MainViewCollectionViewCell.Constants.cellID)
        return collectionView
    }()
    

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.startAnimating()
        setupUI()
        viewModel.delegate = self
        viewModel.fetchOrders()
    }
    
    //MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Taxi Order List"
        view.addSubviews(collectionView, activityIndicatorView)
        setUpCollectionView()
        addConstraints()
    }
    
    //Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            activityIndicatorView.widthAnchor.constraint(equalToConstant: 100),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 100),
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - MainViewViewModelDelegate
extension MainViewViewController: MainViewViewModelDelegate {
    func didLoadInitialOrders() {
        activityIndicatorView.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
    }
}
 
//MARK: - Delegate
extension MainViewViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = viewModel.getDetailViewModel(forItemAt: indexPath)
        let detailVC = OrderDetailsViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - DataSource
extension MainViewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainViewCollectionViewCell.Constants.cellID,
            for: indexPath
        ) as? MainViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "cell", for: indexPath) as? MainViewCollectionViewHeader else {
            return UICollectionReusableView()
        }
        return headerView
    }
}

//MARK: - FlowLayout
extension MainViewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width = bounds.width - 32
        
        return CGSize(width: width, height: 155)
    }
}
