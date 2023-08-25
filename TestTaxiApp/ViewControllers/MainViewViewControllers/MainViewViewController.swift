//
//  MainViewViewController.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 07.08.2023.
//

import UIKit

final class MainViewViewController: UIViewController {
        
    private let viewModel: CollectionViewMethods = MainViewViewModel()
    
    // MARK: - Views
    
    private lazy var noInternetView = NoInterrnetView()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .label
        return refreshControl
    }()
        
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 14, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            MainViewCollectionViewCell.self,
            forCellWithReuseIdentifier: MainViewCollectionViewCell.Constants.cellID
        )
        return collectionView
    }()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        collectionView.backgroundColor = .selectedBackgroundColor
        navigationController?.navigationBar.barTintColor = .selectedBackgroundColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.primaryLabelTextColor]
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.startAnimating()
        setupUI()
        noInternetView.noInterrnetViewDelegate = self
        viewModel.delegate = self
        viewModel.fetchOrders()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.addSubviews(
            collectionView,
            activityIndicatorView,
            noInternetView
        )
        setUpCollectionView()
        addConstraints()
        setupRefresher()
        setupNavbarMenu()
    }
    
    // Constraints
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
            
            noInternetView.topAnchor.constraint(equalTo: view.topAnchor),
            noInternetView.leftAnchor.constraint(equalTo: view.leftAnchor),
            noInternetView.rightAnchor.constraint(equalTo: view.rightAnchor),
            noInternetView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupRefresher() {
        collectionView.addSubview(refreshControl)
        collectionView.refreshControl = refreshControl
        collectionView.refreshControl?.addTarget(
            self,
            action: #selector(didPullRefresh),
            for: .valueChanged
        )
    }
    
    @objc
    private func didPullRefresh() {
        viewModel.fetchOrders()
    }
    
    private func setupNavbarMenu() {
        title = "Taxi Order List"
        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title: NSLocalizedString("Change Theme", comment: "Смена темы")) {_ in
                let detailVC = ColorsViewController()
                detailVC.navigationItem.largeTitleDisplayMode = .always
                self.navigationController?.pushViewController(detailVC, animated: true)
            },
            UIAction(title: NSLocalizedString("Credentials", comment: "Реквизиты")) { _ in }
        ])
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "ellipsis.rectangle"), menu: barButtonMenu)
    }
}

// MARK: - Delegate

extension MainViewViewController: MainViewViewModelDelegate, NoInterrnetViewDelegate {
    
    func failToloadInitialOrders() {
        activityIndicatorView.stopAnimating()
        noInternetView.isHidden = false
    }
    
    func didLoadInitialOrders() {
        activityIndicatorView.stopAnimating()
        noInternetView.isHidden = true
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.5) {
            self.collectionView.alpha = 1
        }
        refreshControl.endRefreshing()
    }
    
    func refreshButtonTapped() {
        activityIndicatorView.startAnimating()
        noInternetView.isHidden = true
        viewModel.fetchOrders()
    }
}
 
// MARK: - CollectionView Delegate

extension MainViewViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = viewModel.getDetailViewModel(forItemAt: indexPath)
        let detailVC = OrderDetailsViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
    }
}

// MARK: - CollectionView DataSource

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
        cell.setupColors()
        return cell
    }
}

// MARK: - CollectionView FlowLayout

extension MainViewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width = bounds.width - 32
        
        return CGSize(width: width, height: 155)
    }
}
