//
//  ColorsViewController.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 16.08.2023.
//

import UIKit


class ColorsViewController: UIViewController {
    
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .primaryLabelTextColor
        titleLabel.text = "Here u can change app theme"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        return titleLabel
    }()
    
    let systemColorThemeButton: UIButton = {
        let systemColorThemeButton = UIButton()
        systemColorThemeButton.tag = 1
        systemColorThemeButton.translatesAutoresizingMaskIntoConstraints = false
        systemColorThemeButton.layer.borderColor = UIColor.gray.cgColor
        systemColorThemeButton.layer.borderWidth = 2
        systemColorThemeButton.layer.cornerRadius = 30
        return systemColorThemeButton
    }()
    
    let blackColorThemeButton: UIButton = {
        let blackColorThemeButton = UIButton()
        blackColorThemeButton.tag = 2
        blackColorThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blackColorThemeButton.backgroundColor = .black
        blackColorThemeButton.layer.borderColor = UIColor.gray.cgColor
        blackColorThemeButton.layer.borderWidth = 2
        blackColorThemeButton.layer.cornerRadius = 30
        return blackColorThemeButton
    }()
    
    let whiteColorThemeButton: UIButton = {
        let whiteColorThemeButton = UIButton()
        whiteColorThemeButton.translatesAutoresizingMaskIntoConstraints = false
        whiteColorThemeButton.tag = 3
        whiteColorThemeButton.backgroundColor = .white
        whiteColorThemeButton.layer.borderColor = UIColor.gray.cgColor
        whiteColorThemeButton.layer.borderWidth = 2
        whiteColorThemeButton.layer.cornerRadius = 30
        return whiteColorThemeButton
    }()
    
    let orangeColorThemeButton: UIButton = {
        let orangeColorThemeButton = UIButton()
        orangeColorThemeButton.translatesAutoresizingMaskIntoConstraints = false
        orangeColorThemeButton.layer.borderColor = UIColor.gray.cgColor
        orangeColorThemeButton.tag = 4
        orangeColorThemeButton.backgroundColor = .systemOrange
        orangeColorThemeButton.layer.borderWidth = 2
        orangeColorThemeButton.layer.cornerRadius = 30
        return orangeColorThemeButton
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .selectedBackgroundColor
        title = NSLocalizedString("Themes", comment: "Темы")
        view.addSubviews(
            titleLabel,
            systemColorThemeButton,
            blackColorThemeButton,
            whiteColorThemeButton,
            orangeColorThemeButton
        )
        configureButtons()
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            systemColorThemeButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 30),
            systemColorThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            systemColorThemeButton.widthAnchor.constraint(equalToConstant: 60),
            systemColorThemeButton.heightAnchor.constraint(equalToConstant: 60),
            
            blackColorThemeButton.topAnchor.constraint(equalTo: systemColorThemeButton.topAnchor, constant: 30),
            blackColorThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            blackColorThemeButton.widthAnchor.constraint(equalToConstant: 60),
            blackColorThemeButton.heightAnchor.constraint(equalToConstant: 60),
            
            whiteColorThemeButton.topAnchor.constraint(equalTo: blackColorThemeButton.topAnchor, constant: 30),
            whiteColorThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            whiteColorThemeButton.widthAnchor.constraint(equalToConstant: 60),
            whiteColorThemeButton.heightAnchor.constraint(equalToConstant: 60),
            
            orangeColorThemeButton.topAnchor.constraint(equalTo: whiteColorThemeButton.topAnchor, constant: 30),
            orangeColorThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            orangeColorThemeButton.widthAnchor.constraint(equalToConstant: 60),
            orangeColorThemeButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        Service().selectTheme(withTag: sender.tag)
        sender.layer.borderColor = UIColor.systemGreen.cgColor
//        UIView.animate(withDuration: 0.2){
//            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//        }
        self.viewDidLoad()
    }
    
    
  
    private func configureButtons() {
        systemColorThemeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        blackColorThemeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        whiteColorThemeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        orangeColorThemeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

}
