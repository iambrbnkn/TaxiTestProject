//
//  NoInterrnetView.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 15.08.2023.
//

import UIKit

protocol NoInterrnetViewDelegate: AnyObject {
    func refreshButtonTapped() -> Void
}

final class NoInterrnetView: UIView {
    
    public weak var noInterrnetViewDelegate: NoInterrnetViewDelegate?
    
    private let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .systemBlue
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let refreshButton: UIButton = {
       let refreshButton = UIButton()
        refreshButton.backgroundColor = .systemOrange
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.layer.cornerRadius = 10
        refreshButton.setTitle("Refresh", for: .normal)
        return refreshButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
        refreshButton.addTarget(self, action: #selector(refreshView), for: .touchUpInside)
        addSubviews(label, iconView, refreshButton)
        addConstraints()
        configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 90),
            iconView.heightAnchor.constraint(equalToConstant: 90),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),

            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
            
            refreshButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            refreshButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            refreshButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configure() {
        label.text = "Something goes wrong"
        iconView.image = UIImage(systemName: "exclamationmark.triangle")
    }
    
    @objc
    private func refreshView() {
        self.noInterrnetViewDelegate?.refreshButtonTapped()
    }
}
